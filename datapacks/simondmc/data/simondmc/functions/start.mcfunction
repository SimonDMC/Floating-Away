# ran by the player by clicking the tellraw from simondmc:start/click-start, starts the map :D
# has to be ran directly by the player to cache time warper tick rate commands

# refuse to start if the map has already started
execute if score $phase story matches 1.. run return 0

# mark everyone as playing
tag @a add playing

# cache
function simondmc:mechanics/time-warper/setup

# fade from black
title @a[tag=playing] times 0 40 20
title @a[tag=playing] title "\u2304"

scoreboard players set $phase story 1
scoreboard players set $start-anim story 0

# get in position
tp @a[tag=playing] 17.5 86 -56.5 90 0
execute as @a[tag=playing] run ride @s mount @e[tag=interview-chair,limit=1]

# clear chat
tellraw @a[tag=playing] "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

# initialize stats
scoreboard players set $seconds stats 0
scoreboard players set $minutes stats 0
scoreboard players set $hours stats 0
scoreboard players set $deaths stats 0

# play first track
execute as @a[tag=playing] at @s run playsound music.welcome-to-folio ambient @s
scoreboard players set $track music 1

# count players
scoreboard players reset $players stats
scoreboard players reset $multiplayer stats
execute as @a[tag=playing] run scoreboard players add $players stats 1
execute if score $players stats matches 2.. run scoreboard players set $multiplayer stats 1
# was multiplayer at some point (for doors closing behind you)
execute if score $players stats matches 2.. run scoreboard players set $was-multiplayer stats 1

# if multiplayer, give invis for interview cutscene
execute if score $multiplayer stats matches 1 run effect give @a[tag=playing] invisibility 18 0 true

# don't let further players start the map anymore
execute as @e[tag=start-text] run data merge entity @s {text:"'The map has\\nalready started!'"}
kill @e[tag=start-int]