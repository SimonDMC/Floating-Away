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
execute unless score @s guards matches 1.. unless score $on timewarper matches 1 if block ~ ~-1.1 ~ deepslate_coal_ore run tp @s ^ ^ ^.25
execute unless score @s guards matches 1.. unless score $on timewarper matches 1 if block ~ ~4.9 ~ deepslate_coal_ore run tp @s ^ ^ ^.25
execute unless score @s guards matches 1.. unless score $on timewarper matches 1 if block ~ ~8.9 ~ deepslate_coal_ore run tp @s ^ ^ ^.25
# move slower if timewarper is on
execute unless score @s guards matches 1.. if score $on timewarper matches 1 if block ~ ~-1.1 ~ deepslate_coal_ore run tp @s ^ ^ ^.15
execute unless score @s guards matches 1.. if score $on timewarper matches 1 if block ~ ~4.9 ~ deepslate_coal_ore run tp @s ^ ^ ^.15
execute unless score @s guards matches 1.. if score $on timewarper matches 1 if block ~ ~8.9 ~ deepslate_coal_ore run tp @s ^ ^ ^.15

# move with gravity
# basically when a guard is moved using a tp its y-momentum is reset so it doesn't respect gravity at all
execute if block ~ ~8 ~ nether_gold_ore store result score $guard.z guards run data get entity @s Pos[2] 1000
execute if block ~ ~8 ~ nether_gold_ore run scoreboard players add $guard.z guards 250
execute if block ~ ~8 ~ nether_gold_ore run execute store result entity @s Pos[2] double 0.001 run scoreboard players get $guard.z guards
execute if block ~ ~9 ~ nether_gold_ore store result score $guard.z guards run data get entity @s Pos[2] 1000
execute if block ~ ~9 ~ nether_gold_ore run scoreboard players add $guard.z guards 250
execute if block ~ ~9 ~ nether_gold_ore run execute store result entity @s Pos[2] double 0.001 run scoreboard players get $guard.z guards
# this whole movement thing could maybe have been made easier if i just used four blocks and had everything adhere to gravity
# but maybe not idk im writing this gravity-based system about a week later so maybe i knew what i was doing (unlikely)

# step up
execute unless entity @s[tag=elevated] if block ~ ~10 ~-.25 deepslate_emerald_ore run tp @s ~ ~1.25 ~
execute if block ~ 65 ~-.25 deepslate_emerald_ore run tag @s add elevated

# advance stun timer
execute if score @s guards matches 1.. run scoreboard players remove @s guards 1

# walking model animation (steps)
scoreboard players reset $moving guard-walk-anim
execute if score $override guard-walk-anim matches 1 run scoreboard players set $moving guard-walk-anim 1
execute if block ~ ~-1.1 ~ deepslate_coal_ore run scoreboard players set $moving guard-walk-anim 1
execute if block ~ ~4.9 ~ deepslate_coal_ore run scoreboard players set $moving guard-walk-anim 1
execute if block ~ ~8.9 ~ deepslate_coal_ore run scoreboard players set $moving guard-walk-anim 1
execute if block ~ ~8 ~ nether_gold_ore run scoreboard players set $moving guard-walk-anim 1
execute if block ~ ~9 ~ nether_gold_ore run scoreboard players set $moving guard-walk-anim 1
execute if score $moving guard-walk-anim matches 1 run scoreboard players add @s guard-walk-anim 1
# system explained in simondmc:story/intro/interview
execute if score $moving guard-walk-anim matches 1 run scoreboard players operation $walk-phase guard-walk-anim = @s guard-walk-anim
execute if score $moving guard-walk-anim matches 1 run scoreboard players operation $walk-phase guard-walk-anim -= $CONST_1 story
execute if score $moving guard-walk-anim matches 1 run scoreboard players operation $walk-phase guard-walk-anim /= $CONST_2 story
execute if score $moving guard-walk-anim matches 1 run scoreboard players operation $walk-phase guard-walk-anim %= $CONST_8 story
execute if score $moving guard-walk-anim matches 1 if score $walk-phase guard-walk-anim matches 0 run item replace entity @s armor.head with black_candle{CustomModelData:4}
execute if score $moving guard-walk-anim matches 1 if score $walk-phase guard-walk-anim matches 1 run item replace entity @s armor.head with black_candle{CustomModelData:5}
execute if score $moving guard-walk-anim matches 1 if score $walk-phase guard-walk-anim matches 2 run item replace entity @s armor.head with black_candle{CustomModelData:4}
execute if score $moving guard-walk-anim matches 1 if score $walk-phase guard-walk-anim matches 3 run item replace entity @s armor.head with black_candle{CustomModelData:1}
execute if score $moving guard-walk-anim matches 1 if score $walk-phase guard-walk-anim matches 4 run item replace entity @s armor.head with black_candle{CustomModelData:2}
execute if score $moving guard-walk-anim matches 1 if score $walk-phase guard-walk-anim matches 5 run item replace entity @s armor.head with black_candle{CustomModelData:3}
execute if score $moving guard-walk-anim matches 1 if score $walk-phase guard-walk-anim matches 6 run item replace entity @s armor.head with black_candle{CustomModelData:2}
execute if score $moving guard-walk-anim matches 1 if score $walk-phase guard-walk-anim matches 7 run item replace entity @s armor.head with black_candle{CustomModelData:1}
# force stationary if not moving
execute unless score $moving guard-walk-anim matches 1 run item replace entity @s armor.head with black_candle{CustomModelData:1}