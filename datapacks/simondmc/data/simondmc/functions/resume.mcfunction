# ran by the player by clicking the tellraw from simondmc:mechanics/time-warper/force-setup, resumes the game. 
# necessary for caching purposes

execute as @a[tag=paused-1] run tp @s @e[tag=paused-1-placeholder,limit=1]
execute as @a[tag=paused-2] run tp @s @e[tag=paused-2-placeholder,limit=1]
execute as @a[tag=paused-3] run tp @s @e[tag=paused-3-placeholder,limit=1]
execute as @a[tag=paused-4] run tp @s @e[tag=paused-4-placeholder,limit=1]
execute as @a[tag=paused-5] run tp @s @e[tag=paused-5-placeholder,limit=1]
execute as @a[tag=paused-6] run tp @s @e[tag=paused-6-placeholder,limit=1]
execute as @a[tag=paused-7] run tp @s @e[tag=paused-7-placeholder,limit=1]
execute as @a[tag=paused-8] run tp @s @e[tag=paused-8-placeholder,limit=1]
kill @e[tag=paused-placeholder]
tag @a remove paused-1
tag @a remove paused-2
tag @a remove paused-3
tag @a remove paused-4
tag @a remove paused-5
tag @a remove paused-6
tag @a remove paused-7
tag @a remove paused-8
gamemode adventure @a
scoreboard players reset $paused start
function simondmc:mechanics/time-warper/setup