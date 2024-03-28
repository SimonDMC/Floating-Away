# called by simondmc:mechanics/tnt/sys, checks if the tnt is about to explode next to the wall and
# starts playing music in advance if so

execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run stopsound @a ambient
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run scoreboard players set $track music 60
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall run scoreboard players set $track-61-timer music -1
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall as @a at @s run playsound music.floating-away-start ambient @s
execute unless score $hall-anim guards matches 0.. if predicate simondmc:tnt-wall as @a at @s run tellraw @a[tag=music-debug] "starting 6-0"