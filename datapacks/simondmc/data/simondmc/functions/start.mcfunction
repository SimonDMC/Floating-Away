# ran by the player by clicking the tellraw from simondmc:start/click-start, starts the map :D
# has to be ran directly by the player to cache time warper tick rate commands

# refuse to start if the map has already started
execute if score $phase story matches 1.. run return 0

# cache
function simondmc:mechanics/time-warper/setup

# fade from black
title @a times 0 40 20
title @a title "\u2304"

scoreboard players set $phase story 1
scoreboard players set $start-anim story 0

# get in position
tp @a 17.5 86 -56.5 90 0
execute as @a run ride @s mount @e[tag=interview-chair,limit=1]

# clear chat
tellraw @a "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

# initialize stats
scoreboard players set $seconds stats 0
scoreboard players set $minutes stats 0
scoreboard players set $hours stats 0
scoreboard players set $deaths stats 0

# play first track
execute as @a at @s run playsound music.welcome-to-folio ambient @s
scoreboard players set $track music 1

# count players
execute as @a run scoreboard players add $players stats 1
execute if score $players stats matches 2.. run scoreboard players set $multiplayer stats 1

# if multiplayer, give invis for interview cutscene
execute if score $multiplayer stats matches 1 run effect give @a invisibility 18 0 true