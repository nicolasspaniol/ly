const std = @import("std");
const Allocator = std.mem.Allocator;
const Random = std.rand.Random;
const TerminalBuffer = @import("../tui/TerminalBuffer.zig");

const interop = @import("../interop.zig");
const termbox = interop.termbox;

const portal = @import("../portal.zig");

const Matrix = @This();

terminal_buffer: *TerminalBuffer,
frame: u64,
ascii_art: u8 = 0,
skip_actions: u16 = 0,
skip_frames: u64 = 0,
credits_start_frame: u64 = std.math.maxInt(u64),

pub fn init(allocator: Allocator, terminal_buffer: *TerminalBuffer, fg_ini: u16) !Matrix {
    _ = fg_ini;
    _ = allocator;

    // Generates a random start position for the song
    var seed: u64 = undefined;
    std.posix.getrandom(std.mem.asBytes(&seed)) catch unreachable;
    var prng = std.rand.DefaultPrng.init(seed);
    // Uses the credit's duration as an approximation for the song length
    var start_frame = prng.random().uintLessThan(u64, duration(.{ .write = portal.credits }));

    // Forces the start position to be at the beginning of an action, except by
    // "delay" actions
    var frame = start_frame;
    for (portal.still_alive) |action| {
        const d = duration(action);

        if (frame > d) {
            frame -= d;
        } else {
            switch (action) {
                .delay => |delay| start_frame = frame + delay,
                else => start_frame -= frame,
            }
            break;
        }
    }

    return .{
        .terminal_buffer = terminal_buffer,
        .frame = start_frame,
    };
}

pub fn deinit(self: Matrix) void {
    _ = self;
}

// Runs when the resolution changes
pub fn realloc(self: *Matrix) !void {
    _ = self;
}

pub fn draw(self: *Matrix) void {
    self.terminal_buffer.fg = 20; // Yellow

    draw_portal_box(self, 42, 7, 50, 52);
    draw_left_typewriter(self, 45, 9);
    draw_portal_box(self, 94, 7, 50, 52);
    draw_portal_box(self, 146, 7, 50, 31);
    draw_right_typewriter(self, 149, 36, 27);
    draw_ascii_art(self, 151, 39);

    self.terminal_buffer.fg = 0; // Reset color

    self.frame += 1;
}

fn draw_portal_box(self: *Matrix, x: u16, y: u16, w: u16, h: u16) void {
    self.terminal_buffer.drawCharMultiple('-', x, y, w + 1);
    self.terminal_buffer.drawCharMultiple('-', x, y + h, w + 1);

    for ((y + 1)..(y + h)) |cy| {
        if (cy % 2 == 0) {
            self.terminal_buffer.drawCharMultiple('|', x, cy, 1);
            self.terminal_buffer.drawCharMultiple('|', x + w, cy, 1);
        }
    }
}

fn draw_left_typewriter(self: *Matrix, x: u16, y: u16) void {
    var frame = self.frame - self.skip_frames;

    // Cursor coordinates
    var cx = x;
    var cy = y;

    it: for (self.skip_actions.., portal.still_alive[self.skip_actions..]) |i, action| {
        const d = duration(action);

        switch (action) {
            .roll_credits => {
                self.credits_start_frame = self.frame - frame;
            },
            .change_art => |art| self.ascii_art = art,
            .clear_screen => {
                self.skip_actions = @intCast(i + 1);
                self.skip_frames = self.frame - frame;
            },
            .write => |sentence| {
                if (frame > d) {
                    self.terminal_buffer.drawLabel(sentence.text, cx, cy);
                    cy += sentence.nl;
                    cx += @intCast(sentence.text.len);
                    if (sentence.nl != 0) cx = x;
                } else {
                    const index: u16 = @truncate(frame / sentence.chd);
                    self.terminal_buffer.drawLabel(sentence.text[0..index], cx, cy);
                    cx += index;
                }
            },
            .delay => {},
        }

        if (frame <= d) break :it;
        frame -= d;
    }

    const cursor_symbol: u8 = if ((self.frame / 45) % 2 == 0) '_' else ' ';
    self.terminal_buffer.drawCharMultiple(cursor_symbol, cx, cy, 1);
}

fn draw_right_typewriter(self: *Matrix, x: u16, y: u16, max_height: u16) void {
    const cursor_symbol: u8 = if ((self.frame / 45) % 2 == 0) ' ' else '_';
    const sentence = portal.credits;

    // The amount of frames passed since the credits started, clamped between
    // 0 and the duration of the sequence
    const progress: u64 = blk: {
        const f: i128 = @as(i128, self.frame) - self.credits_start_frame;
        break :blk @min(@max(f, 0), duration(.{ .write = sentence }));
    };

    const index: u64 = progress / sentence.chd;
    var dy: u16 = 0;
    var nl_index: usize = index;
    var cursor_drawn = false;

    for (1..index + 1) |i| {
        const ri = index - i;

        if (sentence.text[ri] == '\n' or ri == 0) {
            const nl_compensation: u16 = blk: {
                if (ri == 0) break :blk 0;
                break :blk 1;
            };
            self.terminal_buffer.drawLabel(sentence.text[ri + nl_compensation .. nl_index], x, y - dy);
            nl_index = ri;
            dy += 2;

            if (dy > max_height) break;

            if (!cursor_drawn) {
                self.terminal_buffer.drawCharMultiple(cursor_symbol, x + index - ri - 1, y, 1);
                cursor_drawn = true;
            }
        }
    }

    if (!cursor_drawn) {
        self.terminal_buffer.drawCharMultiple(cursor_symbol, x, y, 1);
    }
}

fn draw_ascii_art(self: *Matrix, x: u16, y: u16) void {
    const art = portal.ascii_arts[self.ascii_art];

    var last_nl: usize = 0;
    var line: u16 = 0;

    for (0.., art) |i, c| {
        if (c == '\n') {
            self.terminal_buffer.drawLabel(art[last_nl..i], x, y + line);
            line += 1;
            last_nl = i + 1;
        }
    }

    self.terminal_buffer.drawLabel(art[last_nl..], x, y + line);
}

pub fn duration(action: portal.TwAction) u16 {
    return switch (action) {
        .delay => |len| len,
        .write => |sentence| @intCast(sentence.text.len * sentence.chd),
        else => 0,
    };
}
