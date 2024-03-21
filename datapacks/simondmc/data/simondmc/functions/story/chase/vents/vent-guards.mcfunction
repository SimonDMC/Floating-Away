# ticking function, controls the vent guards

execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -18 {Tags:["character","guard","vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -17 {Tags:["character","guard","vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -16 {Tags:["character","guard","vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
# stationary guards not letting you return past the vent
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand -5 108 -18 {Tags:["character","guard","stationary-vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand -5 108 -17 {Tags:["character","guard","stationary-vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand -5 108 -16 {Tags:["character","guard","stationary-vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
# slow down shooting again
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run scoreboard players set $SHOOT-PERIOD guards 10
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run scoreboard players set $DAMAGE guards 2
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run scoreboard players reset $machine-gun guards
execute if score $phase story matches 6 as @a if predicate simondmc:vent-guards run scoreboard players set $vent-guards guards 1
# start shooting once they hit the bottom of the vent
execute as @e[tag=vent-guard] at @s if block ~ ~-1.1 ~ deepslate_coal_ore run tag @s add shooting-guard
# vent exit
execute as @a if predicate simondmc:vent-exit run scoreboard players set $phase story 7
execute as @a if predicate simondmc:vent-exit run spawnpoint @a -8 80 -3 90
# less waiting period
execute as @a if predicate simondmc:vent-exit unless score $corridor-anim-1 guards matches 0.. run scoreboard players set $corridor-anim-1 guards 20