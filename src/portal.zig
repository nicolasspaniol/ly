// Typewriter related types

pub const TwSentence = struct {
    text: []const u8 = "",
    chd: u16 = 1, // Char duration, abbreviated to reduce noise
    nl: u16 = 2,
};

pub const TwActionTag = enum {
    roll_credits,
    change_art,
    delay,
    write,
    clear_screen,
};

pub const TwAction = union(TwActionTag) {
    roll_credits: void,
    change_art: u8,
    delay: u16,
    write: TwSentence,
    clear_screen: void,
};

pub const ascii_arts = [_][]const u8{
    "", // Zero index -> no art
    \\              .,-:;//;:=,
    \\          . :H@@@MM@M#H/.,+%;,
    \\       ,/X+ +M@@M@MM%=,-%HMMM@X/,
    \\     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-
    \\    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.
    \\  ,%MM@@MH ,@%=             .---=-=:=,.
    \\  =@#@@@MX.,                -%HX$$%%%:;
    \\ =-./@M@M$                   .;@MMMM@MM:
    \\ X@/ -$MM/                    . +MM@@@M$
    \\,@M@H: :@:                    . =X#@@@@-
    \\,@@@MMX, .                    /H- ;@M@M=
    \\.H@@@@M@+,                    %MM+..%#$.
    \\ /MMMM@MMH/.                  XM@MH; =;
    \\  /%+%$XHH@$=              , .H@@@@MX,
    \\   .=--------.           -%H.,@@@@@MX,
    \\   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.
    \\     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=
    \\       =%@M@M#@$-.=$@MM@@@M; %M%=
    \\         ,:+$+-,/H#MMMMMMM@= =,
    \\               =++%%%%+/:-.
    \\
    ,
    \\             =+$HM####@H%;,
    \\          /H###############M$,
    \\          ,@################+
    \\           .H##############+
    \\             X############/
    \\              $##########/
    \\               %########/
    \\                /X/;;+X/
    \\
    \\                 -XHHX-
    \\                ,######,
    \\#############X  .M####M.  X#############
    \\##############-   -//-   -##############
    \\X##############%,      ,+##############X
    \\-##############X        X##############-
    \\ %############%          %############%
    \\  %##########;            ;##########%
    \\   ;#######M=              =M#######;
    \\    .+M###@,                ,@###M+.
    \\       :XH.                  .HX:
    ,
    \\                 =/;;/-
    \\                +:    //
    \\               /;      /;
    \\              -X        H.
    \\.//;;;:;;-,   X=        :+   .-;:=;:;%;.
    \\M-       ,=;;;#:,      ,:#;;:=,       ,@
    \\:%           :%.=/++++/=.$=           %=
    \\ ,%;         %/:+/;,,/++:+/         ;+.
    \\   ,+/.    ,;@+,        ,%H;,    ,/+,
    \\      ;+;;/= @.  .H##X   -X :///+;
    \\      ;+=;;;.@,  .XM@$.  =X.//;=%/.
    \\   ,;:      :@%=        =$H:     .+%-
    \\ ,%=         %;-///==///-//         =%,
    \\;+           :%-;;;;;;;;-X-           +:
    \\@-      .-;;;;M-        =M/;;;-.      -X
    \\ :;;::;;-.    %-        :+    ,-;;-;:==
    \\              ,X        H.
    \\               ;/      %=
    \\                \//    +;
    \\                 ,////,
    ,
    \\                          .,---.
    \\                        ,/XM#MMMX;,
    \\                      -%##########M%,
    \\                     -@######%  $###@=
    \\      .,--,         -H#######$   $###M:
    \\   ,;$M###MMX;     .;##########$;HM###X=
    \\,/@###########H=      ;################+
    \\-+#############M/,      %##############+
    \\%M###############=      /##############:
    \\H################      .M#############;.
    \\@###############M      ,@###########M:.
    \\X################,      -$=X#######@:
    \\/@##################%-     +######$-
    \\.;##################X     .X#####+,
    \\ .;H################/     -X####+.
    \\   ,;X##############,       .MM/
    \\      ,:+$H@M#######M#$-    .$$=
    \\           .,-=;+$@###X:    ;/=.
    \\                  .,/X$;   .::,
    \\                      .,    ..
    ,
    \\
    \\                     -$-
    \\                    .H##H,
    \\                   +######+
    \\                .+#########H.
    \\              -$############@.
    \\            =H###############@  -X:
    \\          .$##################:  @#@-
    \\     ,;  .M###################;  H###;
    \\   ;@#:  @###################@  ,#####:
    \\ -M###.  M#################@.  ;######H
    \\ M####-  +###############$   =@#######X
    \\ H####$   -M###########+   :#########M,
    \\  /####X-   =########%   :M########@/.
    \\    ,;%H@X;   .$###X   :##MM@%+;:-
    \\                 ..
    \\  -/;:-,.              ,,-==+M########H
    \\ -##################@HX%%+%%$%%%+:,,
    \\    .-/H%%%+%%$H@###############M@+=:/+:
    \\/XHX%:#####MH%=    ,---:;;;;/&&XHM,:###$
    \\$@#MX %+;-                           .
    ,
    \\                                     :X-
    \\                                  :X###
    \\                                ;@####@
    \\                              ;M######X
    \\                            -@########$
    \\                          .$##########@
    \\                         =M############-
    \\                        +##############$
    \\                      .H############$=.
    \\         ,/:         ,M##########M;.
    \\      -+@###;       =##########M;
    \\   =%M#######;     :#########M/
    \\-$M###########;   :########/
    \\ ,;X###########; =#######$.
    \\     ;H#########+######M=
    \\       ,+#############+
    \\          /M########@-
    \\            ;M#####%
    \\              +####:
    \\               ,$M-
    ,
    \\            .+
    \\             /M;
    \\              H#@:              ;,
    \\              -###H-          -@/
    \\               %####$.  -;  .%#X
    \\                M#####+;#H :M#M.
    \\..          .+/;%#############-
    \\ -/%H%+;-,    +##############/
    \\    .:$M###MH$%+############X  ,--=;-
    \\        -/H#####################H+=.
    \\           .+#################X.
    \\         =%M####################H;.
    \\            /@###############+;;/%%;,
    \\         -%###################$
    \\       ;H######################M=
    \\    ,%#####MH$%;+#####M###-/@####%
    \\  :$H%+;=-      -####X.,H#   -+M##@-
    \\ .              ,###;    ;      =$##+
    \\                .#H,               :XH,
    \\                 +                   .;-
    ,
    \\           .-;+$XHHHHHHX$+;-.
    \\        ,;X@@X%/;=----=:/%X@@X/,
    \\      =$@@%=.              .=+H@X:
    \\    -XMX:                      =XMX=
    \\   /@@:                          =H@+
    \\  %@X,                            .$@$
    \\ +@X.                               $@%
    \\-@@,                                .@@=
    \\%@%                                  +@$
    \\H@:                                  :@H
    \\H@:         :HHHHHHHHHHHHHHHHHHX,    =@H
    \\%@%         ;@M@@@@@@@@@@@@@@@@@H-   +@$
    \\=@@,        :@@@@@@@@@@@@@@@@@@@@@= .@@:
    \\ +@X        :@@@@@@@@@@@@@@@M@@@@@@:%@%
    \\  $@$,      ;@@@@@@@@@@@@@@@@@M@@@@@@$.
    \\   +@@HHHHHHH@@@@@@@@@@@@@@@@@@@@@@@+
    \\    =X@@@@@@@@@@@@@@@@@@@@@@@@@@@@X=
    \\      :$@@@@@@@@@@@@@@@@@@@M@@@@$:
    \\        ,;$@@@@@@@@@@@@@@@@@@X/-
    \\           .-;+$XXHHHHHX$+;-.
    ,
    \\            ,:/+/-
    \\            /M/              .,-=;//;-
    \\       .:/= ;MH/,    ,=/+%$XH@MM#@:
    \\      -$##@+$###@H@MMM#######H:.    -/H#
    \\ .,H@H@ X######@ -H#####@+-     -+H###@X
    \\  .,@##H;      +XM##M/,     =%@###@X;-
    \\X%-  :M##########$.    .:%M###@%:
    \\M##H,   +H@@@$/-.  ,;$M###@%,          -
    \\M####M=,,---,.-%%H####M$:          ,+@##
    \\@##################@/.         :%H##@$-
    \\M###############H,         ;HM##M$=
    \\#################.    .=$M##M$=
    \\################H..;XM##M$=          .:+
    \\M###################@%=           =+@MH%
    \\@#################M/.         =+H#X%=
    \\=+M###############M,      ,/X#H+:,
    \\  .;XM###########H=   ,/X#H+:;
    \\     .=+HM#######M+/+HM@+=.
    \\         ,:/%XM####H/.
    \\              ,.:=-.
    ,
    \\       #+ @      # #              M#@
    \\ .    .X  X.%##@;# #   +@#######X. @H%
    \\   ,==.   ,######M+  -#####%M####M-    #
    \\  :H##M%:=##+ .M##M,;#####/+#######% ,M#
    \\ .M########=  =@#@.=#####M=M#######=  X#
    \\ :@@MMM##M.  -##M.,#######M#######. =  M
    \\             @##..###:.    .H####. @@ X,
    \\   ############: ###,/####;  /##= @#. M
    \\           ,M## ;##,@#M;/M#M  @# X#% X#
    \\.%=   ######M## ##.M#:   ./#M ,M #M ,#$
    \\##/         $## #+;#: #### ;#/ M M- @# :
    \\#+ #M@MM###M-;M #:$#-##$H# .#X @ + $#. #
    \\      ######/.: #%=# M#:MM./#.-#  @#: H#
    \\+,.=   @###: /@ %#,@  ##@X #,-#@.##% .@#
    \\#####+;/##/ @##  @#,+       /#M    . X,
    \\   ;###M#@ M###H .#M-     ,##M  ;@@; ###
    \\   .M#M##H ;####X ,@#######M/ -M###$  -H
    \\    .M###%  X####H  .@@MM@;  ;@#M@
    \\      H#M    /@####/      ,++.  / ==-,
    \\               ,=/:, .+X@MMH@#H  #####$=
};

pub const still_alive = [_]TwAction{
    .{ .write = .{ .text = "Forms FORM-29827281-12:", .chd = 10 } },
    .{ .write = .{ .text = "Test Assessment Report", .chd = 10, .nl = 6 } },
    .{ .delay = 200 },
    .{ .write = .{ .text = "This was a triumph.", .chd = 10 } },
    .roll_credits,
    .{ .delay = 350 },
    .{ .write = .{ .text = "I'm making a note here:", .chd = 10 } },
    .{ .write = .{ .text = "HUGE SUCCESS.", .chd = 25 } },
    .{ .delay = 200 },
    .{ .write = .{ .text = "It's hard to overstate", .chd = 15 } },
    .{ .write = .{ .text = "my satisfaction.", .chd = 25 } },
    .{ .delay = 300 },
    .{ .change_art = 1 },
    .{ .write = .{ .text = "Aperture Science", .chd = 15 } },
    .{ .delay = 250 },
    .{ .write = .{ .text = "We do what we must", .chd = 15 } },
    .{ .delay = 30 },
    .{ .write = .{ .text = "because we can.", .chd = 15 } },
    .{ .delay = 250 },
    .{ .write = .{ .text = "For the good of all of us.", .chd = 15 } },
    .{ .change_art = 2 },
    .{ .write = .{ .text = "Except the ones who are dead.", .chd = 10, .nl = 4 } },
    .{ .change_art = 1 },
    .{ .delay = 30 },
    .{ .write = .{ .text = "But there's no sense crying", .chd = 10 } },
    .{ .write = .{ .text = "over every mistake.", .chd = 10 } },
    .{ .delay = 50 },
    .{ .write = .{ .text = "You just keep on trying", .chd = 10 } },
    .{ .write = .{ .text = "till you run out of cake.", .chd = 10 } },
    .{ .change_art = 3 },
    .{ .write = .{ .text = "And the science gets done.", .chd = 10 } },
    .{ .write = .{ .text = "And you make a neat gun.", .chd = 10 } },
    .{ .change_art = 1 },
    .{ .write = .{ .text = "For the people who are", .chd = 10 } },
    .{ .write = .{ .text = "still alive.", .chd = 20 } },
    .{ .delay = 100 },

    .clear_screen,

    .{ .write = .{ .text = "Forms FORM-55551-5:", .chd = 5 } },
    .{ .write = .{ .text = "Personnel File Addendum:", .chd = 5, .nl = 4 } },
    .{ .delay = 180 },
    .{ .write = .{ .text = "Dear <<Subject Name Here>>,", .chd = 8, .nl = 4 } },
    .{ .write = .{ .text = "I'm not even angry.", .chd = 10 } },
    .{ .delay = 300 },
    .{ .write = .{ .text = "I'm being so sincere right now.", .chd = 10 } },
    .{ .write = .{ .text = "Even though you", .chd = 10, .nl = 0 } },
    .{ .change_art = 4 },
    .{ .write = .{ .text = " broke my heart.", .chd = 10 } },
    .{ .write = .{ .text = "And killed me.", .chd = 10 } },
    .{ .delay = 300 },
    .{ .change_art = 7 },
    .{ .write = .{ .text = "And tore me to pieces.", .chd = 10 } },
    .{ .write = .{ .text = "And threw every piece", .chd = 8, .nl = 0 } },
    .{ .delay = 60 },
    .{ .write = .{ .text = " into", .chd = 15, .nl = 0 } },
    .{ .delay = 40 },
    .{ .change_art = 5 },
    .{ .write = .{ .text = " a fire.", .chd = 10 } },
    .{ .write = .{ .text = "As they burned it hurt because", .chd = 10 } },
    .{ .change_art = 6 },
    .{ .write = .{ .text = "I was so happy for you!", .chd = 10 } },
    .{ .write = .{ .text = "Now these points of data", .chd = 10 } },
    .{ .write = .{ .text = "make a beautiful line.", .chd = 10 } },
    .{ .write = .{ .text = "And we're out of beta.", .chd = 10 } },
    .{ .write = .{ .text = "We're releasing on time.", .chd = 10 } },
    .{ .change_art = 7 },
    .{ .write = .{ .text = "So I'm GLaD. I got burned.", .chd = 10 } },
    .{ .change_art = 3 },
    .{ .write = .{ .text = "Think of all the things we learned", .chd = 7 } },
    .{ .change_art = 1 },
    .{ .write = .{ .text = "for the people who are", .chd = 10 } },
    .{ .write = .{ .text = "still alive.", .chd = 25 } },
    .{ .delay = 200 },

    .clear_screen,

    .{ .write = .{ .text = "Forms FORM-55551-6", .chd = 10 } },
    .{ .write = .{ .text = "Personnel File Addendum Addendum:", .chd = 10, .nl = 4 } },
    .{ .write = .{ .text = "One last thing:", .chd = 20, .nl = 4 } },
    .{ .write = .{ .text = "Go ahead and leave me.", .chd = 8 } },
    .{ .delay = 310 },
    .{ .write = .{ .text = "I think I", .chd = 10, .nl = 0 } },
    .{ .write = .{ .text = " prefer to stay inside.", .chd = 15 } },
    .{ .delay = 270 },
    .{ .write = .{ .text = "Maybe you'll find someone else", .chd = 15 } },
    .{ .write = .{ .text = "to help you.", .chd = 10 } },
    .{ .delay = 350 },
    .{ .write = .{ .text = "Maybe ", .chd = 10, .nl = 0 } },
    .{ .change_art = 8 },
    .{ .write = .{ .text = "Black ", .chd = 10, .nl = 0 } },
    .{ .write = .{ .text = "Mesa...", .chd = 30 } },
    .{ .delay = 150 },
    .{ .write = .{ .text = "THAT WAS A JOKE.", .chd = 10, .nl = 0 } },
    .{ .delay = 150 },
    .{ .write = .{ .text = " FAT CHANCE.", .chd = 10 } },
    .{ .delay = 230 },
    .{ .write = .{ .text = "Anyway,", .chd = 20, .nl = 0 } },
    .{ .change_art = 9 },
    .{ .write = .{ .text = " this cake is great.", .chd = 10 } },
    .{ .write = .{ .text = "It's so delicious and moist.", .chd = 8 } },
    .{ .change_art = 10 },
    .{ .delay = 50 },
    .{ .write = .{ .text = "Look at me still talking", .chd = 10 } },
    .{ .change_art = 2 },
    .{ .write = .{ .text = "when there's Science to do.", .chd = 10 } },
    .{ .change_art = 1 },
    .{ .write = .{ .text = "When I look out there,", .chd = 10 } },
    .{ .write = .{ .text = "it makes me GLaD I'm not you.", .chd = 10 } },
    .{ .change_art = 3 },
    .{ .write = .{ .text = "I've experiments to run.", .chd = 10 } },
    .{ .change_art = 7 },
    .{ .write = .{ .text = "There is research to be done.", .chd = 10 } },
    .{ .change_art = 1 },
    .{ .write = .{ .text = "On the people who are", .chd = 10 } },
    .{ .write = .{ .text = "still", .chd = 10, .nl = 0 } },
    .{ .write = .{ .text = " alive.", .chd = 20 } },

    .clear_screen,

    .{ .write = .{ .text = "", .chd = 10, .nl = 6 } },
    .{ .write = .{ .text = "PS: And believe me I am", .chd = 10 } },
    .{ .write = .{ .text = "still alive.", .chd = 10 } },
    .{ .delay = 150 },
    .{ .write = .{ .text = "PPS: ", .chd = 3, .nl = 0 } },
    .{ .write = .{ .text = "I'm doing Science and I'm", .chd = 10 } },
    .{ .write = .{ .text = "still alive.", .chd = 10 } },
    .{ .delay = 150 },
    .{ .write = .{ .text = "PPPS: ", .chd = 3, .nl = 0 } },
    .{ .write = .{ .text = "I feel FANTASTIC and I'm", .chd = 10 } },
    .{ .write = .{ .text = "still alive.", .chd = 10, .nl = 4 } },
    .{ .delay = 100 },
    .{ .write = .{ .text = "FINAL THOUGHT:", .chd = 5 } },
    .{ .write = .{ .text = "While you're dying I'll be", .chd = 10 } },
    .{ .write = .{ .text = "still alive.", .chd = 10, .nl = 4 } },
    .{ .delay = 100 },
    .{ .write = .{ .text = "FINAL THOUGHT PS:", .chd = 5 } },
    .{ .write = .{ .text = "And when you're dead I will be", .chd = 10 } },
    .{ .write = .{ .text = "still alive.", .chd = 10, .nl = 4 } },
    .{ .delay = 100 },
    .{ .write = .{ .text = "", .chd = 10 } },
    .{ .write = .{ .text = "STILL ALIVE", .chd = 10, .nl = 0 } },

    .clear_screen,
};

pub const credits = TwSentence{
    .text =
    \\>LIST PERSONNEL
    \\
    \\
    \\Gautam Babbar
    \\Ted Backman
    \\Kelly Bailey
    \\Jeff Ballinger
    \\Aaron Barber
    \\Jeep Barnett
    \\Jeremy Bennett
    \\Dan Berger
    \\Yahn Bernier
    \\Ken Birdwell
    \\Derrick BirumMike Blaszczak
    \\Iestyn Bleasdale-Shepherd
    \\Chris Bokitch
    \\Steve Bond
    \\Matt Boone
    \\Antoine Bourdon
    \\Jamaal Bradley
    \\Jason Brashill
    \\Charlie Brown
    \\Charlie Burgin
    \\Andrew Burke
    \\Augusta Butlin
    \\Julie Caldwell
    \\Dario Casali
    \\Chris Chin
    \\Jess Cliffe
    \\Phil Co
    \\John Cook
    \\Christen Coomer
    \\Greg Coomer
    \\Scott Dalton
    \\Kerry Davis
    \\Jason Deakins
    \\Joe Demers
    \\Ariel Diaz
    \\Quintin Doroquez
    \\Jim Dose
    \\Chris Douglass
    \\Laura Dubuk
    \\Mike Dunkle
    \\Mike Durand
    \\Mike Dussault
    \\Dhabih Eng
    \\Katie Engel
    \\Chet Faliszek
    \\Adrian Finol
    \\Bill Fletcher
    \\Moby Francke
    \\Stephane Gaudette
    \\Kathy Gehrig
    \\Vitaliy Genkin
    \\Paul Graham
    \\Chris Green
    \\Chris Grinstead
    \\John Guthrie
    \\Aaron Halifax
    \\Reagan Halifax
    \\Leslie Hall
    \\Jeff Hameluck
    \\Joe Han
    \\Don Holden
    \\Jason Holtman
    \\Gray Horsfield
    \\Keith Huggins
    \\Jim Hughes
    \\Jon Huisingh
    \\Brian Jacobson
    \\Lars Jensvold
    \\Erik Johnson
    \\Jakob Jungels
    \\Rich Kaethler
    \\Steve Kalning
    \\Aaron Kearly
    \\Iikka Keranen
    \\David Kircher
    \\Eric Kirchmer
    \\Scott Klintworth
    \\Alden Kroll
    \\Marc Laidlaw
    \\Jeff Lane
    \\Tim Larkin
    \\Dan LeFree
    \\Isabelle LeMay
    \\Tom Leonard
    \\Jeff Lind
    \\Doug Lombardi
    \\Bianca Loomis
    \\Richard Lord
    \\Realm Lovejoy
    \\Randy Lundeen
    \\Scott Lynch
    \\Ido Magal
    \\Nick Maggiore
    \\John McCaskey
    \\Patrick McClard
    \\Steve McClure
    \\Hamish McKenzie
    \\Gary McTaggart
    \\Jason Mitchell
    \\Mike Morasky
    \\John Morello II
    \\Bryn Moslow
    \\Arsenio Navarro
    \\Gabe Newell
    \\Milton Ngan
    \\Jake Nicholson
    \\Martin Otten
    \\Nick Papineau
    \\Karen Prell
    \\Bay Raitt
    \\Tristan Reidford
    \\Alfred Reynolds
    \\Matt Rhoten
    \\Garret Rickey
    \\Dave Riller
    \\Elan Ruskin
    \\Matthew Russell
    \\Jason Ruymen
    \\David Sawyer
    \\Marc Scaparro
    \\Wade Schin
    \\Matthew Scott
    \\Aaron Seeler
    \\Jennifer Seeley
    \\Taylor Sherman
    \\Eric Smith
    \\Jeff Sorensen
    \\David Speyrer
    \\Jay Stelly
    \\Jeremy Stone
    \\Eric Strand
    \\Kim Swift
    \\Kelly Thornton
    \\Eric Twelker
    \\Carl Uhlman
    \\Doug Valente
    \\Bill Van Buren
    \\Gabe Van Engel
    \\Alex Vlachos
    \\Robin Walker
    \\Joshua Weier
    \\Andrea Wicklund
    \\Greg Winkler
    \\Erik Wolpaw
    \\Doug Wood
    \\Matt T. Wood
    \\Danika Wright
    \\Matt Wright
    \\Shawn Zabecki
    \\Torsten Zabka 
    \\
    \\
    \\'Still Alive' by:
    \\Jonathan Coulton
    \\
    \\Voices:
    \\Ellen McLain - GlaDOS, Turrets
    \\Mike Patton - THE ANGER SPHERE
    \\
    \\Voice Casting:
    \\Shana Landsburg\Teri Fiddleman
    \\
    \\Voice Recording:
    \\Pure Audio, Seattle, WA
    \\
    \\Voice recording
    \\scheduling and logistics:
    \\Pat Cockburn, Pure Audio
    \\
    \\Translations:
    \\SDL
    \\
    \\Crack Legal Team:
    \\Liam Lavery
    \\Karl Quackenbush
    \\Kristen Boraas
    \\Kevin Rosenfield
    \\Alan Bruggeman
    \\Dennis Tessier
    \\
    \\Thanks for the use of their face:
    \\Alesia Glidewell - Chell
    \\
    \\Special thanks to everyone at:
    \\Alienware
    \\ATI
    \\Dell
    \\Falcon Northwest
    \\Havok
    \\SOFTIMAGE
    \\and Don Kemmis, SLK Technologies
    \\
    \\
    \\
    \\
    \\
    \\
    \\
    \\
    \\THANK YOU FOR PARTICIPATING
    \\IN THIS
    \\ENRICHMENT CENTER ACTIVITY!!
    \\
    \\
    \\
    \\
    \\
    \\
    ,
    .chd = 8,
};
