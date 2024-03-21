# ticking function, controls the music

# slow types:
# (none) - normal
# 1 - slowing
# 2 - slow
# 3 - speeding
# all of these have to be tracked separately due to various ending times to know when to restart it

execute unless score $track music matches 4.. as @a if predicate simondmc:music/decommissioned run stopsound @a ambient
execute unless score $track music matches 4.. as @a if predicate simondmc:music/decommissioned as @a at @s run playsound music.decommissioned ambient @s
execute unless score $track music matches 4.. as @a if predicate simondmc:music/decommissioned run scoreboard players set $track music 4
execute if score $track music matches 4 run scoreboard players add $track-4-timer music 1
execute unless score $slow-type music matches 1.. if score $track-4-timer music matches 2800 run stopsound @a ambient
execute unless score $slow-type music matches 1.. if score $track-4-timer music matches 2800 as @a at @s run playsound music.decommissioned ambient @s
execute unless score $slow-type music matches 1.. if score $track-4-timer music matches 2800 run scoreboard players reset $track-4-timer music
execute if score $slow-type music matches 1 if score $track-4-timer music matches 950 run stopsound @a ambient
execute if score $slow-type music matches 1 if score $track-4-timer music matches 950 as @a at @s run playsound music.decommissioned-slow ambient @s
execute if score $slow-type music matches 1 if score $track-4-timer music matches 950 run function simondmc:music/decommissioned-slowing
execute if score $slow-type music matches 2 if score $track-4-timer music matches 1390 run stopsound @a ambient
execute if score $slow-type music matches 2 if score $track-4-timer music matches 1390 as @a at @s run playsound music.decommissioned-slow ambient @s
execute if score $slow-type music matches 2 if score $track-4-timer music matches 1390 run scoreboard players reset $track-4-timer music
execute if score $slow-type music matches 3 if score $track-4-timer music matches 1900 run stopsound @a ambient
execute if score $slow-type music matches 3 if score $track-4-timer music matches 1900 as @a at @s run playsound music.decommissioned ambient @s
execute if score $slow-type music matches 3 if score $track-4-timer music matches 1900 run function simondmc:music/decommissioned-speeding

execute unless score $track music matches 5.. as @a if predicate simondmc:music/prechase run stopsound @a ambient
execute unless score $track music matches 5.. as @a if predicate simondmc:music/prechase as @a at @s run playsound music.prechase ambient @s
execute unless score $track music matches 5.. as @a if predicate simondmc:music/prechase run scoreboard players set $track music 5
execute if score $track music matches 5 run scoreboard players add $track-5-timer music 1
execute if score $track-5-timer music matches 2290 run stopsound @a ambient
execute if score $track-5-timer music matches 2290 as @a at @s run playsound music.prechase ambient @a
execute if score $track-5-timer music matches 2290 run scoreboard players reset $track-5-timer music