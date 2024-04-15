# called by simondmc:mechanics/tnt/sys, creates the fake explosion

# creeper is retextured to be invisible as i found that to be the cleanest way to hide it
summon creeper ~ ~ ~ {Fuse:0,ignited:1b,Silent:1b}
particle explosion ~ ~ ~ 1 1 1 0 10
# make sure the player doesnt die haha
effect give @a[tag=playing] resistance 1 4 true
# enhanced launching (only in first zone so the player can't enter the chase without arrows)
execute as @a[tag=playing,distance=...8] if predicate simondmc:tnt-1-zone run effect give @s levitation 1 30 true
# let player jump
execute positioned ~ ~1 ~ as @a[tag=playing,distance=...5] if predicate simondmc:tnt-1-zone run effect give @s levitation 1 30 true
schedule function simondmc:mechanics/tnt/clear-levitation 2t
# but deal a little damage
execute as @a[tag=playing,distance=..2] run damage @s 5 out_of_world
execute as @a[tag=playing,distance=..2] run damage @s 5 explosion by @s
# break wall if near
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run fill 3 97 -13 5 99 -13 air destroy
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run fill 2 98 -13 2 99 -13 air destroy
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run setblock 5 100 -13 air destroy
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run setblock 6 98 -13 air destroy
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run setblock 4 96 -13 air destroy
# and set spawnpoint for hall ambush
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run spawnpoint @a[tag=playing] 4 97 -17 0
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run scoreboard players set $exploded-wall story 1
# start boss animation
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run scoreboard players set $security-anim presentation 0
# spawn guards to prevent escaping
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall unless entity @e[tag=tnt-vent-guard] run function simondmc:mechanics/tnt/spawn-guards
# snap player back to tnt if they're trying to escape
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run tp @a[tag=playing,distance=10..] @s
# advance story phase
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run scoreboard players set $phase story 6
# play hall segment of track 6
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run scoreboard players set $track music 61
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall as @a[tag=playing] at @s run playsound music.floating-away-hall ambient @s 
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall as @a[tag=playing] at @s run tellraw @a[tag=playing,tag=music-debug] "starting 6-1"
# start hall guard animation
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run scoreboard players set $hall-anim guards 0
execute at @s run kill @s