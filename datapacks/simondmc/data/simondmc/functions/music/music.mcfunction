# ticking function, controls the music

# slow types:
# (none) - normal
# 1 - slowing
# 2 - slow
# 3 - speeding
# all of these have to be tracked separately due to various ending times to know when to restart it

# initial playing handled in simondmc:start
execute if score $track music matches 1 run scoreboard players add $track-1-timer music 1
execute if score $track-1-timer music matches 2240 run stopsound @a ambient
execute if score $track-1-timer music matches 2240 as @a at @s run playsound music.welcome-to-folio ambient @s
execute if score $track-1-timer music matches 2240 run scoreboard players reset $track-1-timer music

# initial playing handled in simondmc:story/intro/work
execute if score $track music matches 2 run scoreboard players add $track-2-timer music 1
execute if score $track-2-timer music matches 3200 run stopsound @a ambient
execute if score $track-2-timer music matches 3200 as @a at @s run playsound music.stronger-than-gravity ambient @s
execute if score $track-2-timer music matches 3200 run scoreboard players reset $track-2-timer music

# initial playing handled in simondmc:mechanics/elevator
execute if score $track music matches 3 run scoreboard players add $track-3-timer music 1
execute if score $track-3-timer music matches 2700 run stopsound @a ambient
execute if score $track-3-timer music matches 2700 as @a at @s run playsound music.ground-level ambient @s
execute if score $track-3-timer music matches 2700 run scoreboard players reset $track-3-timer music

execute unless score $track music matches 4.. as @a if predicate simondmc:music/out-of-order run stopsound @a ambient
execute unless score $track music matches 4.. as @a if predicate simondmc:music/out-of-order as @a at @s run playsound music.out-of-order ambient @s
execute unless score $track music matches 4.. as @a if predicate simondmc:music/out-of-order run scoreboard players set $track music 4
execute if score $track music matches 4 run scoreboard players add $track-4-timer music 1
execute unless score $slow-type music matches 1.. if score $track-4-timer music matches 2800 run stopsound @a ambient
execute unless score $slow-type music matches 1.. if score $track-4-timer music matches 2800 as @a at @s run playsound music.out-of-order ambient @s
execute unless score $slow-type music matches 1.. if score $track-4-timer music matches 2800 run scoreboard players reset $track-4-timer music
execute if score $slow-type music matches 1 if score $track-4-timer music matches 950 run stopsound @a ambient
execute if score $slow-type music matches 1 if score $track-4-timer music matches 950 as @a at @s run playsound music.out-of-order ambient @s ~ ~ ~ 1 0
execute if score $slow-type music matches 1 if score $track-4-timer music matches 950 run function simondmc:music/out-of-order-slowing
execute if score $slow-type music matches 2 if score $track-4-timer music matches 1390 run stopsound @a ambient
execute if score $slow-type music matches 2 if score $track-4-timer music matches 1390 as @a at @s run playsound music.out-of-order ambient @s ~ ~ ~ 1 0
execute if score $slow-type music matches 2 if score $track-4-timer music matches 1390 run scoreboard players reset $track-4-timer music
execute if score $slow-type music matches 3 if score $track-4-timer music matches 1900 run stopsound @a ambient
execute if score $slow-type music matches 3 if score $track-4-timer music matches 1900 as @a at @s run playsound music.out-of-order ambient @s
execute if score $slow-type music matches 3 if score $track-4-timer music matches 1900 run function simondmc:music/out-of-order-speeding

execute unless score $track music matches 5.. as @a if predicate simondmc:music/sneaking-around run stopsound @a ambient
execute unless score $track music matches 5.. as @a if predicate simondmc:music/sneaking-around as @a at @s run playsound music.sneaking-around ambient @s
execute unless score $track music matches 5.. as @a if predicate simondmc:music/sneaking-around run scoreboard players set $track music 5
execute if score $track music matches 5 run scoreboard players add $track-5-timer music 1
execute if score $track-5-timer music matches 2290 run stopsound @a ambient
execute if score $track-5-timer music matches 2290 as @a at @s run playsound music.sneaking-around ambient @s
execute if score $track-5-timer music matches 2290 run scoreboard players reset $track-5-timer music