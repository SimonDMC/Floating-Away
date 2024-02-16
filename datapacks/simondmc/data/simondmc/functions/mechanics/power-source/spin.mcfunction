# called by simondmc:mechanics/power-source/sys, spins the backup power source

scoreboard players set $4 powersource 4

# keep a total spins var as well as phase
# phase used for transformations, total used for progress
scoreboard players add $total powersource 1
scoreboard players operation $phase powersource = $total powersource
scoreboard players operation $phase powersource %= $4 powersource

# rotate lever with animation
execute if score $phase powersource matches 1 as @e[tag=power-source] run data merge entity @s {start_interpolation:0,interpolation_duration:5,transformation:{right_rotation:[0f,0f,-0.707f,0.707f]}}
execute if score $phase powersource matches 2 as @e[tag=power-source] run data merge entity @s {start_interpolation:0,interpolation_duration:5,transformation:{right_rotation:[0f,0f,0f,1f]}}
execute if score $phase powersource matches 3 as @e[tag=power-source] run data merge entity @s {start_interpolation:0,interpolation_duration:5,transformation:{right_rotation:[0f,0f,0.707f,0.707f]}}
execute if score $phase powersource matches 0 as @e[tag=power-source] run data merge entity @s {start_interpolation:0,interpolation_duration:5,transformation:{right_rotation:[0f,0f,1f,0f]}}

# adjust interaction entity with animation
execute if score $phase powersource matches 0 run tp @s 49.5 86.25 -27.0 
execute if score $phase powersource matches 0 run data merge entity @s {width:0.375f,height:0.5f}
execute if score $phase powersource matches 2 run tp @s 49.5 86.25 -27.0
execute if score $phase powersource matches 2 run data merge entity @s {width:0.375f,height:0.5f}
execute if score $phase powersource matches 1 run tp @s 49.5 86.3125 -27.0625
execute if score $phase powersource matches 1 run data merge entity @s {width:0.5f,height:0.375f}
execute if score $phase powersource matches 3 run tp @s 49.5 86.3125 -27.0625
execute if score $phase powersource matches 3 run data merge entity @s {width:0.5f,height:0.375f}

# disable spinning for a few ticks
scoreboard players set $disabled powersource 1
schedule function simondmc:mechanics/power-source/enable 5t

# cosmetic
execute as @a at @s run playsound item.flintandsteel.use master @s ~ ~ ~
particle dust_plume 49.5 86.5 -27.0 0 0 0 .01 5 normal

# reset interaction
data remove entity @s interaction

# start light animation if turned over threshold
execute if score $total powersource matches 15 run scoreboard players set $anim powersource 0