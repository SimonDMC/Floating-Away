execute unless score $cached timewarper matches 1 run tellraw @s "Enter the map to use dev warps"
execute unless score $cached timewarper matches 1 run return 0
clear @a[tag=playing]
title @a[tag=playing] title ""
stopsound @a[tag=playing]
execute as @a[tag=playing] at @s run playsound music.ground-level ambient @s
tp @a[tag=playing] 68.29 85.00 -76.32 55.16 6.02
scoreboard players set $track music 3
scoreboard players set $phase story 5
give @s spyglass
summon minecraft:item_display 7.5 88.0315 -8.125 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[0.7010574f,0.09229595f,-0.09229595f,0.7010574f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.5999997f,0.5999997f],translation:[0.0f,0.0f,0.0f]}}
summon minecraft:item_display 7.0 88.0 -8.5 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[-0.09841033f,-0.7002252f,0.7002252f,-0.09841033f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.59999937f,0.59999937f],translation:[0.0f,0.0f,0.0f]}}
fill 3 103 14 15 88 -10 light replace structure_void