hiiiiii welcome to the datapack of the map!
feel free to explore how stuff works, or if you want me to explain something specific, message me on discord! (@simondmc)

most of the code is commented (at least the important bits) and every function has what it does and whether its ticking 
(called every tick by simondmc:tick) or what its called by. so that should hopefully guide you through.

the datapack is split into two namespaces, dev:* and simondmc:*. simondmc:* is used for the actual map and everything that
gets called is in there, while dev:* stuff is for setting things up, refreshing displays, skipping some cutscenes, etc. just
generally utility stuff that never gets called and is just for me.

then simondmc:* is split up further into the "story" portion, which contains the work sequence, presentation and chase, and
then the "mechanics" portion which contains all the little separate bits that happen between the presentation and the chase.
then theres also start/ and music/ and other things, those are pretty self explanatory

some stuff worth explaining here are the time warper and chase music i suppose. the time warper uses the new /tick command
but since you usually can't call that from a function it exploits MC-266135 to get the player to cache all the tick commands
while starting the map and then calls them via function macros. pretty cool stuff honestly but im not sure if it was worth
version-locking the entire map for this one mechanic. at least its unique! theres more information about it somewhere in
simondmc:mechanics/time-warper/sys.

and then for the chase music, its split up into 7 sections (+ the bit at the beginning) which loop by running a scoreboard
timer for the exact duration of the portion and whenever you enter a new section it queues up the next portion. then at the
half-way point and end of the playing portion it checks if the next one is queued up, and if so switches to it. not sure if
i explained it properly here but its basically a system that makes the song play with no gaps while also adapting to the
part of the chase you're in.

if you like the inner workings of map check out the technical breakdown i made for my map placeholder!! https://youtu.be/aFx5sc36744
i might make one for this map too but probably not, who knows.

thanks for reading allat :D

- SimonDMC