# called by simondmc:story/chase/general-guards, makes guards move based on predefined paths

# only turn when in the ~middle of a block
execute if block ~ ~5.9 ~ magenta_glazed_terracotta unless entity @s[tag=rotated] run function simondmc:story/chase/center
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta unless entity @s[tag=rotated] run function simondmc:story/chase/center
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta[facing=south] run data merge entity @s {Rotation:[0f,0f]}
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta[facing=west] run data merge entity @s {Rotation:[90f,0f]}
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta[facing=north] run data merge entity @s {Rotation:[180f,0f]}
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta[facing=east] run data merge entity @s {Rotation:[-90f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta[facing=north] run data merge entity @s {Rotation:[0f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta[facing=east] run data merge entity @s {Rotation:[90f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta[facing=south] run data merge entity @s {Rotation:[180f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta[facing=west] run data merge entity @s {Rotation:[-90f,0f]}
execute if block ~ ~5.9 ~ magenta_glazed_terracotta run tag @s add rotated
execute if block ~ ~-2.1 ~ magenta_glazed_terracotta run tag @s add rotated
execute unless block ~ ~5.9 ~ magenta_glazed_terracotta unless block ~ ~-2.1 ~ magenta_glazed_terracotta run tag @s remove rotated

# move
execute unless score @s guards matches 1.. if block ~ ~-1.1 ~ deepslate_coal_ore run tp @s ^ ^ ^.3
execute unless score @s guards matches 1.. if block ~ ~4.9 ~ deepslate_coal_ore run tp @s ^ ^ ^.3

# advance stun timer
execute if score @s guards matches 1.. run scoreboard players remove @s guards 1

# i kid you not just this guard moving framework alone took me like 3 hours to get right
# basically deepslate coal ore just moves the guard forward wherever its looking
# when its above or below magenta glazed terracotta it centers itself, turns in the direction of the block,
# and waits a few ticks before continuing (otherwise it goes in the non-full angle direction and ruins the centering)
# i think its pretty reusable so if you wanna use this code for your own project go for it