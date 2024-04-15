# ran by the player by clicking the tellraw from simondmc:mechanics/time-warper/force-setup, resumes the game. 
# necessary for caching purposes

# don't let player resume if already resumed
execute if score $cached timewarper matches 1 run return 0

execute as @a[tag=playing,tag=paused-1] run tp @s @e[tag=paused-1-placeholder,limit=1]
execute as @a[tag=playing,tag=paused-2] run tp @s @e[tag=paused-2-placeholder,limit=1]
execute as @a[tag=playing,tag=paused-3] run tp @s @e[tag=paused-3-placeholder,limit=1]
execute as @a[tag=playing,tag=paused-4] run tp @s @e[tag=paused-4-placeholder,limit=1]
execute as @a[tag=playing,tag=paused-5] run tp @s @e[tag=paused-5-placeholder,limit=1]
execute as @a[tag=playing,tag=paused-6] run tp @s @e[tag=paused-6-placeholder,limit=1]
execute as @a[tag=playing,tag=paused-7] run tp @s @e[tag=paused-7-placeholder,limit=1]
execute as @a[tag=playing,tag=paused-8] run tp @s @e[tag=paused-8-placeholder,limit=1]
kill @e[tag=paused-placeholder]
tag @a[tag=playing] remove paused-1
tag @a[tag=playing] remove paused-2
tag @a[tag=playing] remove paused-3
tag @a[tag=playing] remove paused-4
tag @a[tag=playing] remove paused-5
tag @a[tag=playing] remove paused-6
tag @a[tag=playing] remove paused-7
tag @a[tag=playing] remove paused-8
gamemode adventure @a[tag=playing]
scoreboard players reset $paused start
function simondmc:mechanics/time-warper/setup
# start playing music again
execute if score $track music matches 1 as @a[tag=playing] at @s run playsound music.welcome-to-folio ambient @s
execute if score $track music matches 2 as @a[tag=playing] at @s run playsound music.stronger-than-gravity ambient @s
execute if score $track music matches 3 as @a[tag=playing] at @s run playsound music.ground-level ambient @s
execute if score $track music matches 4 as @a[tag=playing] at @s run playsound music.out-of-order ambient @s
execute if score $track music matches 5 as @a[tag=playing] at @s run playsound music.sneaking-around ambient @s
execute if score $track music matches 61 as @a[tag=playing] at @s run playsound music.floating-away-hall ambient @s
execute if score $track music matches 62 as @a[tag=playing] at @s run playsound music.floating-away-vents ambient @s
execute if score $track music matches 63 as @a[tag=playing] at @s run playsound music.floating-away-corridors-1 ambient @s
execute if score $track music matches 64 as @a[tag=playing] at @s run playsound music.floating-away-underground ambient @s
execute if score $track music matches 65 as @a[tag=playing] at @s run playsound music.floating-away-corridor-3 ambient @s
execute if score $track music matches 66 as @a[tag=playing] at @s run playsound music.floating-away-quartz ambient @s