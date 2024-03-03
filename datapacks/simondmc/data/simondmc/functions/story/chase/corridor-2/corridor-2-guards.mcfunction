# ticking function, controls the guards in the second corridor

# animation
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
# instakill if there for too long like just go down man
execute if score $corridor-anim-2 guards matches 120.. as @a if predicate simondmc:corridor-2 run damage @s 100 mob_attack by @e[tag=corridor-2-guard,limit=1]
# drop down into underground corridor unless trapdoor closed
execute if score $corridor-anim-2 guards matches 120..190 unless score $closed trapdoor matches 1 as @e[tag=corridor-2-guard] run function simondmc:story/chase/corridor-2/move-forward
# activate machine gun if guards fall down
execute if score $corridor-anim-2 guards matches 180 unless score $closed trapdoor matches 1 run scoreboard players set $machine-gun guards 1
execute if score $corridor-anim-2 guards matches 180 unless score $closed trapdoor matches 1 run scoreboard players set $SHOOT-PERIOD guards 3

# insta-kill if contact while falling
execute as @a if predicate simondmc:underground at @s as @e[tag=corridor-2-guard,distance=..2] run damage @p 100 mob_attack by @s