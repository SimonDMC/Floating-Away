# called by simondmc:story/chase/guards, makes guards move based on predefined paths

# i kid you not just this guard moving framework alone took me like 3 hours to get right
# basically deepslate coal ore just moves the guard forward wherever its looking
# when its above or below magenta glazed terracotta it centers itself, turns in the direction of the block,
# and waits a few ticks before continuing (otherwise it goes in the non-full angle direction and ruins the centering)

# turning
execute if block ~ ~5.9 ~ magenta_glazed_terracotta unless entity @s[tag=rotated] run function simondmc:story/chase/center
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta unless entity @s[tag=rotated] run function simondmc:story/chase/center
execute if block ~ ~9.9 ~ magenta_glazed_terracotta unless entity @s[tag=rotated] run function simondmc:story/chase/center
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta[facing=south] run data merge entity @s {Rotation:[0f,0f]}
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta[facing=west] run data merge entity @s {Rotation:[90f,0f]}
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta[facing=north] run data merge entity @s {Rotation:[180f,0f]}
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta[facing=east] run data merge entity @s {Rotation:[-90f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta[facing=north] run data merge entity @s {Rotation:[0f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta[facing=east] run data merge entity @s {Rotation:[90f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta[facing=south] run data merge entity @s {Rotation:[180f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta[facing=west] run data merge entity @s {Rotation:[-90f,0f]}
execute if block ~ ~9.9 ~ magenta_glazed_terracotta[facing=north] run data merge entity @s {Rotation:[0f,0f]}
execute if block ~ ~9.9 ~ magenta_glazed_terracotta[facing=east] run data merge entity @s {Rotation:[90f,0f]}
execute if block ~ ~9.9 ~ magenta_glazed_terracotta[facing=south] run data merge entity @s {Rotation:[180f,0f]}
execute if block ~ ~9.9 ~ magenta_glazed_terracotta[facing=west] run data merge entity @s {Rotation:[-90f,0f]}
execute if block ~ ~9.9 ~ magenta_glazed_terracotta run tag @s add rotated
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta run tag @s add rotated
execute if block ~ ~5.9 ~ magenta_glazed_terracotta run tag @s add rotated
execute unless block ~ ~5.9 ~ magenta_glazed_terracotta unless block ~ ~-2.1 ~ magenta_glazed_terracotta unless block ~ ~9.9 ~ magenta_glazed_terracotta run tag @s remove rotated
# in hindsight i probably should have done this with an absolute y coordinate but then gravity would have been an issue
# also some regions are below each other
# why am i having a whole discussion here as if anyone else works on this code

# move via tp
execute unless score @s guards matches 1.. if block ~ ~-1.1 ~ deepslate_coal_ore run tp @s ^ ^ ^.3
execute unless score @s guards matches 1.. if block ~ ~4.9 ~ deepslate_coal_ore run tp @s ^ ^ ^.3
execute unless score @s guards matches 1.. if block ~ ~8.9 ~ deepslate_coal_ore run tp @s ^ ^ ^.3

# move with gravity
# basically when a guard is moved using a tp its y-momentum is reset so it doesn't respect gravity at all
execute if block ~ ~8 ~ nether_gold_ore if block ~ ~ ~.3 air unless block ~ ~-2 ~.3 air store result score $guard.z guards run data get entity @s Pos[2] 1000
execute if block ~ ~8 ~ nether_gold_ore if block ~ ~ ~.3 air unless block ~ ~-2 ~.3 air run scoreboard players add $guard.z guards 300
execute if block ~ ~8 ~ nether_gold_ore if block ~ ~ ~.3 air unless block ~ ~-2 ~.3 air run execute store result entity @s Pos[2] double 0.001 run scoreboard players get $guard.z guards
execute if block ~ ~9 ~ nether_gold_ore if block ~ ~ ~.3 air unless block ~ ~-2 ~.3 air store result score $guard.z guards run data get entity @s Pos[2] 1000
execute if block ~ ~9 ~ nether_gold_ore if block ~ ~ ~.3 air unless block ~ ~-2 ~.3 air run scoreboard players add $guard.z guards 300
execute if block ~ ~9 ~ nether_gold_ore if block ~ ~ ~.3 air unless block ~ ~-2 ~.3 air run execute store result entity @s Pos[2] double 0.001 run scoreboard players get $guard.z guards
# this whole movement thing could maybe have been made easier if i just used four blocks and had everything adhere to gravity
# but maybe not idk im writing this gravity-based system about a week later so maybe i knew what i was doing (unlikely)

# step up
execute unless entity @s[tag=elevated] if block ~ ~10 ~ deepslate_emerald_ore run tp @s ~ ~1.25 ~
execute if block ~ 65 ~ deepslate_emerald_ore run tag @s add elevated

# advance stun timer
execute if score @s guards matches 1.. run scoreboard players remove @s guards 1