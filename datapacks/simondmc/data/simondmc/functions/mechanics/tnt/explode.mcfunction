# called by simondmc:mechanics/tnt/sys, creates the fake explosion

# creeper is retextured to be invisible as i found that to be the cleanest way to hide it
summon creeper ~ ~ ~ {Fuse:0,ignited:1b,Silent:1b,ExplosionRadius:8b}
particle explosion ~ ~ ~ 1 1 1 0 10
# make sure the player doesnt die haha
effect give @a resistance 1 4 true
# enhanced launching (only in first zone so the player can't enter the chase without arrows)
execute as @a[distance=...3] if predicate simondmc:tnt-1-zone run effect give @s levitation 1 30 true
schedule function simondmc:mechanics/tnt/clear-levitation 2t
# but deal a little damage
execute as @a[distance=..2] run damage @s 5 out_of_world
execute as @a[distance=..2] run damage @s 5 explosion by @s
# break wall if near
execute if predicate simondmc:tnt-wall run fill 3 97 -13 5 99 -13 air destroy
execute if predicate simondmc:tnt-wall run fill 2 98 -13 2 99 -13 air destroy
execute if predicate simondmc:tnt-wall run setblock 5 100 -13 air destroy
execute if predicate simondmc:tnt-wall run setblock 6 98 -13 air destroy
execute if predicate simondmc:tnt-wall run setblock 4 96 -13 air destroy
# and set spawnpoint for hall ambush
execute if predicate simondmc:tnt-wall run spawnpoint @a 4 97 -17 0
# start hall guard animation
execute if predicate simondmc:tnt-wall run scoreboard players set $hall-anim guards 0
# start boss animation
execute if predicate simondmc:tnt-wall run scoreboard players set $security-anim presentation 0
# advance story phase
execute if predicate simondmc:tnt-wall run scoreboard players set $phase story 6
execute at @s run kill @s