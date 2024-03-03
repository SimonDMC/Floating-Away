# ran by the player by clicking the tellraw from simondmc:start/click-start, starts the map :D
# has to be ran directly by the player to cache time warper tick rate commands

# cache
function simondmc:mechanics/time-warper/setup
# fade from black
title @a times 0 40 20
title @a title "\u2304"
scoreboard players set $phase story 1
scoreboard players set $start-anim story 0
# get in position
tp @a 17.5 86 -56.5 90 0
ride @r mount @e[tag=interview-chair,limit=1]
# suit
item replace entity @a armor.chest with minecraft:leather_chestplate{display:{color:0},Unbreakable:true,HideFlags:4}
item replace entity @a armor.legs with minecraft:leather_leggings{display:{color:0},Unbreakable:true,HideFlags:4}
item replace entity @a armor.feet with minecraft:leather_boots{display:{color:0},Unbreakable:true,HideFlags:4}
execute as @a at @s run playsound minecraft:block.fire.extinguish master @s ~ ~ ~ 1 2