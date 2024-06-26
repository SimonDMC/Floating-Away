# ticking function, controls the guards in the third corridor

# animation
execute as @a[tag=playing] if predicate simondmc:corridor-3 unless score $corridor-anim-3 guards matches 0.. run scoreboard players set $corridor-anim-3 guards 0
execute if score $corridor-anim-3 guards matches 0.. run scoreboard players add $corridor-anim-3 guards 1
# open guard door
execute if score $corridor-anim-3 guards matches 60 run setblock 8 55 30 minecraft:redstone_torch
execute if score $corridor-anim-3 guards matches 60 run setblock 8 55 27 minecraft:redstone_torch
# spawn shooting guards
execute if score $corridor-anim-3 guards matches 60 run summon armor_stand 9 56 29 {Tags:["character","guard","corridor-3-guard","shooting-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
execute if score $corridor-anim-3 guards matches 60 run summon armor_stand 10 56 28 {Tags:["character","guard","corridor-3-guard","shooting-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
execute if score $corridor-anim-3 guards matches 60 run summon armor_stand 11 56 29 {Tags:["character","guard","corridor-3-guard","shooting-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
execute if score $corridor-anim-3 guards matches 81 run setblock 5 65 29 minecraft:magenta_glazed_terracotta