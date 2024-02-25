# ticking function, handles all the guards in the corridors and the vents/connectors between them

# vent guards
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -18 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -17 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -16 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
# slow down shooting again
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run scoreboard players set $SHOOT-PERIOD guards 10
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run scoreboard players set $DAMAGE guards 3
execute as @a if predicate simondmc:vent-guards run scoreboard players set $vent-guards guards 1
# start shooting once they hit the bottom of the vent
execute as @e[tag=vent-guard] at @s if block ~ ~-1.1 ~ deepslate_coal_ore run tag @s add shooting-guard

# vent exit
execute as @a if predicate simondmc:vent-exit run scoreboard players set $phase story 7
execute as @a if predicate simondmc:vent-exit run spawnpoint @a -8 80 -3 90
# skip respawn waiting period
execute as @a if predicate simondmc:vent-exit unless score $corridor-anim-1 guards matches 0.. run scoreboard players set $corridor-anim-1 guards 40

# 1->2 door
execute if block -45 73 20 minecraft:lever[powered=true] run setblock -46 70 19 minecraft:deepslate_coal_ore
execute if block -45 73 20 minecraft:lever[powered=false] run setblock -46 70 19 air

# first corridor
execute if score $corridor-anim-1 guards matches 0.. run scoreboard players add $corridor-anim-1 guards 1
# open 1->2 door
execute if score $corridor-anim-1 guards matches 2 run setblock -45 71 19 air
# open guard door
execute if score $corridor-anim-1 guards matches 41 run setblock -19 71 2 minecraft:redstone_torch
execute if score $corridor-anim-1 guards matches 41 run setblock -16 71 2 minecraft:redstone_torch
# spawn guards
execute if score $corridor-anim-1 guards matches 41 run summon armor_stand -18 72 3 {Tags:["character","guard","corridor-guard"],Rotation:[180f,0f],Invulnerable:1b}
execute if score $corridor-anim-1 guards matches 41 run summon armor_stand -17 72 4 {Tags:["character","guard","corridor-guard","middle-guard"],Rotation:[180f,0f],Invulnerable:1b}
execute if score $corridor-anim-1 guards matches 41 run summon armor_stand -18 72 5 {Tags:["character","guard","corridor-guard"],Rotation:[180f,0f],Invulnerable:1b}
# turn the third guard
execute if score $corridor-anim-1 guards matches 58 run setblock -18 69 -1 minecraft:magenta_glazed_terracotta[facing=west]
# break wood block once they get there and allow passthrough
execute if score $corridor-anim-1 guards matches 138 run fill -39 72 -1 -44 73 -3 air destroy
execute if score $corridor-anim-1 guards matches 138 run fill -38 70 -5 -38 70 1 deepslate_coal_ore
execute if score $corridor-anim-1 guards matches 138 run setblock -37 70 -2 deepslate_coal_ore
# activate machine gun when player passes door
execute if entity @a[x=-45.5,y=72,z=20.5,distance=..1] run scoreboard players set $machine-gun guards 1
execute if entity @a[x=-45.5,y=72,z=20.5,distance=..1] run scoreboard players set $SHOOT-PERIOD guards 3
execute if entity @a[x=-45.5,y=72,z=20.5,distance=..1] run tag @e[tag=middle-guard] add machine-gun-guard
execute if block -45 73 20 lever[powered=false] run scoreboard players reset $machine-gun
execute if block -45 73 20 lever[powered=false] run scoreboard players set $SHOOT-PERIOD guards 10
execute if block -45 73 20 lever[powered=false] run tag @e[tag=machine-gun-guard] remove machine-gun-guard

# second corridor
execute as @a if predicate simondmc:corridor-2 unless score $corridor-anim-2 guards matches 0.. run scoreboard players set $corridor-anim-2 guards 0
execute if score $corridor-anim-2 guards matches 0.. run scoreboard players add $corridor-anim-2 guards 1
# open guard door
execute if score $corridor-anim-2 guards matches 1 run setblock -42 71 35 minecraft:redstone_torch
execute if score $corridor-anim-2 guards matches 1 run setblock -39 71 35 minecraft:redstone_torch
# spawn shooting guards
execute if score $corridor-anim-2 guards matches 1 run summon armor_stand -40 72 36 {Tags:["character","guard","corridor-2-guard","shooting-guard"],Rotation:[180f,0f],Invulnerable:1b}
execute if score $corridor-anim-2 guards matches 1 run summon armor_stand -41 72 37 {Tags:["character","guard","corridor-2-guard","shooting-guard"],Rotation:[180f,0f],Invulnerable:1b}
execute if score $corridor-anim-2 guards matches 1 run summon armor_stand -40 72 38 {Tags:["character","guard","corridor-2-guard","shooting-guard"],Rotation:[180f,0f],Invulnerable:1b}
execute if score $corridor-anim-2 guards matches 18 run setblock -40 69 32 minecraft:magenta_glazed_terracotta[facing=east]
execute if score $corridor-anim-2 guards matches 118 as @a if predicate simondmc:corridor-2 run damage @s 100 mob_attack by @e[tag=corridor-2-guard,limit=1]