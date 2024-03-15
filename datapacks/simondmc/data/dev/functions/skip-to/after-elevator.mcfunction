execute unless score $cached timewarper matches 1 run tellraw @s "Enter the map to use dev warps"
execute unless score $cached timewarper matches 1 run return 0
clear @a
title @a title ""
stopsound @a
tp @a 68.29 85.00 -76.32 55.16 6.02
scoreboard players set $phase story 5
give @s spyglass