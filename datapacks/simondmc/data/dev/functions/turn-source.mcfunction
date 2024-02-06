scoreboard players set 4 DEV-lever 4

scoreboard players add global DEV-lever 1
scoreboard players operation global DEV-lever %= 4 DEV-lever

execute if score global DEV-lever matches 1 as @e[tag=power-source] run data merge entity @s {start_interpolation:0,interpolation_duration:10,transformation:{right_rotation:[0f,0f,0.707f,0.707f]}}
execute if score global DEV-lever matches 2 as @e[tag=power-source] run data merge entity @s {start_interpolation:0,interpolation_duration:10,transformation:{right_rotation:[0f,0f,1f,0f]}}
execute if score global DEV-lever matches 3 as @e[tag=power-source] run data merge entity @s {start_interpolation:0,interpolation_duration:10,transformation:{right_rotation:[0f,0f,-0.707f,0.707f]}}
execute if score global DEV-lever matches 0 as @e[tag=power-source] run data merge entity @s {start_interpolation:0,interpolation_duration:10,transformation:{right_rotation:[0f,0f,0f,1f]}}