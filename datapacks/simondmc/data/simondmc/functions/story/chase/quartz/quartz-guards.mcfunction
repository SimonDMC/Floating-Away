# ticking functions, controls the whole quartz tunnel leading to the end of the map

# animations
execute as @a[x=4,y=38,z=48,distance=..2] unless score $quartz-anim-1 guards matches 0.. run scoreboard players set $quartz-anim-1 guards 0
execute as @a[x=17,y=38,z=21,distance=..2] unless score $quartz-anim-2 guards matches 0.. run scoreboard players set $quartz-anim-2 guards 0
execute as @a[x=36,y=38,z=12,distance=..2] unless score $quartz-anim-3 guards matches 0.. run scoreboard players set $quartz-anim-3 guards 0
execute as @a[x=27,y=38,z=-7,distance=..2] unless score $quartz-anim-4 guards matches 0.. run scoreboard players set $quartz-anim-4 guards 0

execute if score $quartz-anim-1 guards matches 0.. run scoreboard players add $quartz-anim-1 guards 1
execute if score $quartz-anim-2 guards matches 0.. run scoreboard players add $quartz-anim-2 guards 1
execute if score $quartz-anim-3 guards matches 0.. run scoreboard players add $quartz-anim-3 guards 1
execute if score $quartz-anim-4 guards matches 0.. run scoreboard players add $quartz-anim-4 guards 1

# quartz 1
# close 1->2 door
execute if score $quartz-anim-1 guards matches 1 run setblock 15 36 21 air
# close 3->4 door
execute if score $quartz-anim-1 guards matches 1 run setblock 30 36 -7 air
# open doors
execute if score $quartz-anim-1 guards matches 30 run setblock 2 37 39 redstone_torch
execute if score $quartz-anim-1 guards matches 30 run setblock 2 37 42 redstone_torch
# spawn guards
execute if score $quartz-anim-1 guards matches 30 run summon armor_stand 1 38 40 {Tags:["character","guard","quartz-guard"],Rotation:[-90f,0f],Invulnerable:1b}
execute if score $quartz-anim-1 guards matches 30 run summon armor_stand 0 38 41 {Tags:["character","guard","quartz-guard"],Rotation:[-90f,0f],Invulnerable:1b}
execute if score $quartz-anim-1 guards matches 30 run summon armor_stand -1 38 40 {Tags:["character","guard","quartz-guard"],Rotation:[-90f,0f],Invulnerable:1b}
# turn the third guard
execute if score $quartz-anim-1 guards matches 43 run setblock 3 35 40 minecraft:magenta_glazed_terracotta[facing=north]

# door 1->2 passthrough
execute if block 14 39 20 lever[powered=true] run setblock 15 42 21 minecraft:deepslate_coal_ore
execute if block 14 39 20 lever[powered=false] run setblock 15 42 21 air

# quartz 2
# open doors
execute if score $quartz-anim-2 guards matches 30 run setblock 23 37 19 redstone_torch
execute if score $quartz-anim-2 guards matches 30 run setblock 20 37 19 redstone_torch
# spawn guards
execute if score $quartz-anim-2 guards matches 30 run summon armor_stand 22 38 18 {Tags:["character","guard","quartz-guard"],Rotation:[0f,0f],Invulnerable:1b}
execute if score $quartz-anim-2 guards matches 30 run summon armor_stand 21 38 17 {Tags:["character","guard","quartz-guard"],Rotation:[0f,0f],Invulnerable:1b}
execute if score $quartz-anim-2 guards matches 30 run summon armor_stand 22 38 16 {Tags:["character","guard","quartz-guard"],Rotation:[0f,0f],Invulnerable:1b}
# turn the third guard
execute if score $quartz-anim-2 guards matches 43 run setblock 22 35 20 minecraft:magenta_glazed_terracotta[facing=east]

# door 2->3 passthrough
execute if block 36 36 15 redstone_torch run setblock 36 42 15 minecraft:deepslate_coal_ore
execute unless block 36 36 15 redstone_torch run setblock 36 42 15 air

# quartz 3
# open doors
execute if score $quartz-anim-3 guards matches 25 run setblock 38 37 10 redstone_torch
execute if score $quartz-anim-3 guards matches 25 run setblock 38 37 7 redstone_torch
# spawn guards
execute if score $quartz-anim-3 guards matches 25 run summon armor_stand 39 38 8 {Tags:["character","guard","quartz-guard"],Rotation:[90f,0f],Invulnerable:1b}
execute if score $quartz-anim-3 guards matches 25 run summon armor_stand 40 38 9 {Tags:["character","guard","quartz-guard"],Rotation:[90f,0f],Invulnerable:1b}
execute if score $quartz-anim-3 guards matches 25 run summon armor_stand 41 38 8 {Tags:["character","guard","quartz-guard"],Rotation:[90f,0f],Invulnerable:1b}
# turn the third guard
execute if score $quartz-anim-3 guards matches 38 run setblock 37 35 8 minecraft:magenta_glazed_terracotta[facing=north]

# door 3->4 passthrough
execute if block 31 39 -6 lever[powered=true] run setblock 30 42 -7 minecraft:deepslate_coal_ore
execute if block 31 39 -6 lever[powered=false] run setblock 30 42 -7 air

# quartz 4
# open doors
execute if score $quartz-anim-4 guards matches 30 run setblock 17 37 -5 redstone_torch
execute if score $quartz-anim-4 guards matches 30 run setblock 20 37 -5 redstone_torch
# spawn guards
execute if score $quartz-anim-4 guards matches 30 run summon armor_stand 18 38 -4 {Tags:["character","guard","quartz-guard"],Rotation:[-180f,0f],Invulnerable:1b}
execute if score $quartz-anim-4 guards matches 30 run summon armor_stand 19 38 -3 {Tags:["character","guard","quartz-guard"],Rotation:[-180f,0f],Invulnerable:1b}
execute if score $quartz-anim-4 guards matches 30 run summon armor_stand 18 38 -2 {Tags:["character","guard","quartz-guard"],Rotation:[-180f,0f],Invulnerable:1b}
# turn the third guard
execute if score $quartz-anim-4 guards matches 43 run setblock 18 35 -6 minecraft:magenta_glazed_terracotta[facing=west]