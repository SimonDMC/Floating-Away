# ticking function, controls the guards in the first corridor

# animation
execute if score $corridor-anim-1 guards matches 0.. run scoreboard players add $corridor-anim-1 guards 1
# open 1->2 door
execute if score $corridor-anim-1 guards matches 2 run setblock -45 71 19 air
# open guard door
execute if score $corridor-anim-1 guards matches 41 run setblock -19 71 2 minecraft:redstone_torch
execute if score $corridor-anim-1 guards matches 41 run setblock -16 71 2 minecraft:redstone_torch
# spawn guards
execute if score $corridor-anim-1 guards matches 41 run summon armor_stand -18 72 3 {Tags:["character","guard","corridor-guard"],Rotation:[180f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
execute if score $corridor-anim-1 guards matches 41 run summon armor_stand -17 72 4 {Tags:["character","guard","corridor-guard","middle-guard"],Rotation:[180f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
execute if score $corridor-anim-1 guards matches 41 run summon armor_stand -18 72 5 {Tags:["character","guard","corridor-guard"],Rotation:[180f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
# turn the third guard
execute if score $corridor-anim-1 guards matches 61 run setblock -18 69 -1 minecraft:magenta_glazed_terracotta[facing=west]
# break wood block once they get there and allow passthrough
execute if score $corridor-anim-1 guards matches 158 run fill -39 72 -1 -44 73 -3 air destroy
execute if score $corridor-anim-1 guards matches 158 run fill -38 70 -5 -38 70 1 deepslate_coal_ore
execute if score $corridor-anim-1 guards matches 158 run setblock -37 70 -2 deepslate_coal_ore
# activate machine gun when player passes door
tag @a[tag=playing,x=-45.5,y=72,z=20.5,distance=..1] add passed-c1-door
execute if block -45 73 20 lever[powered=true] unless entity @a[tag=playing,tag=!passed-c1-door] run scoreboard players set $machine-gun guards 1
execute if block -45 73 20 lever[powered=true] unless entity @a[tag=playing,tag=!passed-c1-door] run scoreboard players set $SHOOT-PERIOD guards 3
execute if block -45 73 20 lever[powered=true] unless entity @a[tag=playing,tag=!passed-c1-door] run tag @e[tag=middle-guard] add machine-gun-guard
execute if block -45 73 20 lever[powered=true] unless entity @a[tag=playing,tag=!passed-c1-door] as @e[tag=middle-guard] run item replace entity @s weapon.mainhand with bow
# mark the player as not having flicked lever for glow clue
execute if block -45 73 20 lever[powered=true] unless entity @a[tag=playing,tag=!passed-c1-door] run scoreboard players set $missed-lever guards 1
# remove mark if lever flicked
execute if block -45 73 20 lever[powered=false] run scoreboard players reset $missed-lever guards
# also remove glowing hint if lever flicked
execute if block -45 73 20 lever[powered=false] run kill @e[tag=corridor-lever]
execute if block -45 73 20 lever[powered=false] run scoreboard players reset $lever-misses story
# stop shooting once door closed
execute if block -45 73 20 lever[powered=false] if entity @a[tag=playing,x=-45.5,y=72,z=20.5,distance=..4] run scoreboard players reset $machine-gun
execute if block -45 73 20 lever[powered=false] if entity @a[tag=playing,x=-45.5,y=72,z=20.5,distance=..4] run scoreboard players set $SHOOT-PERIOD guards 10
execute if block -45 73 20 lever[powered=false] if entity @a[tag=playing,x=-45.5,y=72,z=20.5,distance=..4] run tag @e[tag=machine-gun-guard] remove machine-gun-guard

# 1->2 door
# allow guard passthrough if open
execute if block -45 73 20 minecraft:lever[powered=true] run setblock -46 70 19 minecraft:deepslate_coal_ore
# block guard passthrough if closed
execute if block -45 73 20 minecraft:lever[powered=false] run setblock -46 70 19 air