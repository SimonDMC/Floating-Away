# ticking function, handles all the guards in the corridors and the vents/connectors between them

# vent guards
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -18 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -17 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run summon armor_stand 1 108 -16 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
# slow down shooting again
execute as @a if predicate simondmc:vent-guards unless score $vent-guards guards matches 1 run scoreboard players set $SHOOT-PERIOD guards 10
execute as @a if predicate simondmc:vent-guards run scoreboard players set $vent-guards guards 1
# start shooting once they hit the bottom of the vent
execute as @e[tag=vent-guard] at @s if block ~ ~-1.1 ~ deepslate_coal_ore run tag @s add shooting-guard
