# ran by the player by clicking the tellraw from simondmc:start/click-start, starts the map :D
# has to be ran directly by the player to cache time warper tick rate commands

# mark map as started
scoreboard players set $started start 1
# fade from black
title @a times 0 40 20
title @a title "\u2304"
scoreboard players set $phase story 1
scoreboard players set $start-anim story 0
# get in position
tp @a 17.5 86 -56.5 90 0
ride @r mount @e[tag=interview-chair,limit=1]