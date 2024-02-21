# called by simondmc:story/chase/guard-movement, centers a guard on the block theyre on

# get block coordinates
execute store result score $guard.x guards run data get entity @s Pos[0]
execute store result score $guard.z guards run data get entity @s Pos[2]

# center up by adding .5
# done by upscaling x10, adding 5 and reapplying x1/10
scoreboard players set $CONST-10 guards 10
scoreboard players operation $guard.x guards *= $CONST-10 guards
scoreboard players operation $guard.z guards *= $CONST-10 guards
scoreboard players add $guard.x guards 5
scoreboard players add $guard.z guards 5

# reapply position
execute store result entity @s Pos[0] double 0.1 run scoreboard players get $guard.x guards
execute store result entity @s Pos[2] double 0.1 run scoreboard players get $guard.z guards

# stun for 5 ticks until it centers properly
scoreboard players set @s guards 5