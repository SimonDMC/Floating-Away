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

# initial playing handled in simondmc:mechanics/tnt/explode
execute if score $track music matches 61 run scoreboard players add $track-61-timer music 1
execute if score $track music matches 61 if score $track-61-timer music matches 265 unless score $62-queued music matches 1 as @a at @s run playsound music.floating-away-hall ambient @s
execute if score $track music matches 61 if score $track-61-timer music matches 265 unless score $62-queued music matches 1 run tellraw @a[tag=music-debug] "looping 6-1"
execute if score $track-61-timer music matches 265 unless score $62-queued music matches 1 run scoreboard players reset $track-61-timer music
# 6-2 queue up
execute if score $track music matches 61 as @a if predicate simondmc:music/floating-away-vents if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] unless score $62-queued music matches 1 run tellraw @a[tag=music-debug] "queueing 6-2"
execute if score $track music matches 61 as @a if predicate simondmc:music/floating-away-vents if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] run scoreboard players set $62-queued music 1
execute if score $track-61-timer music matches 132 if score $62-queued music matches 1 run stopsound @a ambient
execute if score $track-61-timer music matches 132 if score $62-queued music matches 1 run scoreboard players set $track music 62
execute if score $track-61-timer music matches 132 if score $62-queued music matches 1 as @a at @s run playsound music.floating-away-vents ambient @s
execute if score $track-61-timer music matches 132 if score $62-queued music matches 1 run tellraw @a[tag=music-debug] "early 6-2"
execute if score $track-61-timer music matches 132 if score $62-queued music matches 1 run scoreboard players reset $62-queued music
execute if score $track-61-timer music matches 265 if score $62-queued music matches 1 run scoreboard players set $track music 62
execute if score $track-61-timer music matches 265 if score $62-queued music matches 1 as @a at @s run playsound music.floating-away-vents ambient @s
execute if score $track-61-timer music matches 265 if score $62-queued music matches 1 run tellraw @a[tag=music-debug] "standard 6-2"
execute if score $track-61-timer music matches 265 if score $62-queued music matches 1 run scoreboard players reset $62-queued music
execute if score $track music matches 62 run scoreboard players add $track-62-timer music 1
execute if score $track music matches 62 if score $track-62-timer music matches 265 unless score $63-queued music matches 1 as @a at @s run playsound music.floating-away-vents ambient @s
execute if score $track music matches 62 if score $track-62-timer music matches 265 unless score $63-queued music matches 1 run tellraw @a[tag=music-debug] "looping 6-2"
execute if score $track-62-timer music matches 265 unless score $63-queued music matches 1 run scoreboard players reset $track-62-timer music
# 6-3 queue up
execute if score $track music matches 62 as @a if predicate simondmc:vent-exit unless score $63-queued music matches 1 run tellraw @a[tag=music-debug] "queueing 6-3"
execute if score $track music matches 62 as @a if predicate simondmc:vent-exit run scoreboard players set $63-queued music 1
execute if score $track-62-timer music matches 132 if score $63-queued music matches 1 run stopsound @a ambient
execute if score $track-62-timer music matches 132 if score $63-queued music matches 1 run scoreboard players set $track music 63
execute if score $track-62-timer music matches 132 if score $63-queued music matches 1 as @a at @s run playsound music.floating-away-corridors-1 ambient @s
execute if score $track-62-timer music matches 132 if score $63-queued music matches 1 run tellraw @a[tag=music-debug] "early 6-3"
execute if score $track-62-timer music matches 132 if score $63-queued music matches 1 run scoreboard players reset $63-queued music
execute if score $track-62-timer music matches 265 if score $63-queued music matches 1 run scoreboard players set $track music 63
execute if score $track-62-timer music matches 265 if score $63-queued music matches 1 as @a at @s run playsound music.floating-away-corridors-1 ambient @s
execute if score $track-62-timer music matches 265 if score $63-queued music matches 1 run tellraw @a[tag=music-debug] "standard 6-3"
execute if score $track-62-timer music matches 265 if score $63-queued music matches 1 run scoreboard players reset $63-queued music
execute if score $track music matches 63 run scoreboard players add $track-63-timer music 1
execute if score $track music matches 63 if score $track-63-timer music matches 265 unless score $64-queued music matches 1 as @a at @s run playsound music.floating-away-corridors-1 ambient @s
execute if score $track music matches 63 if score $track-63-timer music matches 265 unless score $64-queued music matches 1 run tellraw @a[tag=music-debug] "looping 6-3"
execute if score $track-63-timer music matches 265 unless score $64-queued music matches 1 run scoreboard players reset $track-63-timer music
# 6-4 queue up
execute if score $track music matches 63 as @a if predicate simondmc:music/floating-away-underground unless score $64-queued music matches 1 run tellraw @a[tag=music-debug] "queueing 6-4"
execute if score $track music matches 63 as @a if predicate simondmc:music/floating-away-underground run scoreboard players set $64-queued music 1
execute if score $track-63-timer music matches 132 if score $64-queued music matches 1 run stopsound @a ambient
execute if score $track-63-timer music matches 132 if score $64-queued music matches 1 run scoreboard players set $track music 64
execute if score $track-63-timer music matches 132 if score $64-queued music matches 1 as @a at @s run playsound music.floating-away-underground ambient @s
execute if score $track-63-timer music matches 132 if score $64-queued music matches 1 run tellraw @a[tag=music-debug] "early 6-4"
execute if score $track-63-timer music matches 132 if score $64-queued music matches 1 run scoreboard players reset $64-queued music
execute if score $track-63-timer music matches 265 if score $64-queued music matches 1 run scoreboard players set $track music 64
execute if score $track-63-timer music matches 265 if score $64-queued music matches 1 as @a at @s run playsound music.floating-away-underground ambient @s
execute if score $track-63-timer music matches 265 if score $64-queued music matches 1 run tellraw @a[tag=music-debug] "standard 6-4"
execute if score $track-63-timer music matches 265 if score $64-queued music matches 1 run scoreboard players reset $64-queued music
execute if score $track music matches 64 run scoreboard players add $track-64-timer music 1
execute if score $track music matches 64 if score $track-64-timer music matches 265 unless score $65-queued music matches 1 as @a at @s run playsound music.floating-away-underground ambient @s
execute if score $track music matches 64 if score $track-64-timer music matches 265 unless score $65-queued music matches 1 run tellraw @a[tag=music-debug] "looping 6-4"
execute if score $track-64-timer music matches 265 unless score $65-queued music matches 1 run scoreboard players reset $track-64-timer music
# 6-5 queue up
execute if score $track music matches 64 as @a if predicate simondmc:music/floating-away-corridor-3 unless score $65-queued music matches 1 run tellraw @a[tag=music-debug] "queueing 6-5"
execute if score $track music matches 64 as @a if predicate simondmc:music/floating-away-corridor-3 run scoreboard players set $65-queued music 1
execute if score $track-64-timer music matches 132 if score $65-queued music matches 1 run stopsound @a ambient
execute if score $track-64-timer music matches 132 if score $65-queued music matches 1 run scoreboard players set $track music 65
execute if score $track-64-timer music matches 132 if score $65-queued music matches 1 as @a at @s run playsound music.floating-away-corridor-3 ambient @s
execute if score $track-64-timer music matches 132 if score $65-queued music matches 1 run tellraw @a[tag=music-debug] "early 6-5"
execute if score $track-64-timer music matches 132 if score $65-queued music matches 1 run scoreboard players reset $65-queued music
execute if score $track-64-timer music matches 265 if score $65-queued music matches 1 run scoreboard players set $track music 65
execute if score $track-64-timer music matches 265 if score $65-queued music matches 1 as @a at @s run playsound music.floating-away-corridor-3 ambient @s
execute if score $track-64-timer music matches 265 if score $65-queued music matches 1 run tellraw @a[tag=music-debug] "standard 6-5"
execute if score $track-64-timer music matches 265 if score $65-queued music matches 1 run scoreboard players reset $65-queued music
execute if score $track music matches 65 run scoreboard players add $track-65-timer music 1
execute if score $track music matches 65 if score $track-65-timer music matches 265 unless score $66-queued music matches 1 as @a at @s run playsound music.floating-away-corridor-3 ambient @s
execute if score $track music matches 65 if score $track-65-timer music matches 265 unless score $66-queued music matches 1 run tellraw @a[tag=music-debug] "looping 6-5"
execute if score $track-65-timer music matches 265 unless score $66-queued music matches 1 run scoreboard players reset $track-65-timer music
# 6-6 queue up
execute if score $track music matches 65 as @a if predicate simondmc:music/floating-away-quartz unless score $66-queued music matches 1 run tellraw @a[tag=music-debug] "queueing 6-6"
execute if score $track music matches 65 as @a if predicate simondmc:music/floating-away-quartz run scoreboard players set $66-queued music 1
execute if score $track-65-timer music matches 132 if score $66-queued music matches 1 run stopsound @a ambient
execute if score $track-65-timer music matches 132 if score $66-queued music matches 1 run scoreboard players set $track music 66
execute if score $track-65-timer music matches 132 if score $66-queued music matches 1 as @a at @s run playsound music.floating-away-quartz ambient @s
execute if score $track-65-timer music matches 132 if score $66-queued music matches 1 run tellraw @a[tag=music-debug] "early 6-6"
execute if score $track-65-timer music matches 132 if score $66-queued music matches 1 run scoreboard players reset $66-queued music
execute if score $track-65-timer music matches 265 if score $66-queued music matches 1 run scoreboard players set $track music 66
execute if score $track-65-timer music matches 265 if score $66-queued music matches 1 as @a at @s run playsound music.floating-away-quartz ambient @s
execute if score $track-65-timer music matches 265 if score $66-queued music matches 1 run tellraw @a[tag=music-debug] "standard 6-6"
execute if score $track-65-timer music matches 265 if score $66-queued music matches 1 run scoreboard players reset $66-queued music
execute if score $track music matches 66 run scoreboard players add $track-66-timer music 1
# slow down with timewarper
execute unless score $slow-type music matches 1..3 if score $track music matches 66 if score $track-66-timer music matches 265 unless score $67-queued music matches 1 as @a at @s run playsound music.floating-away-quartz ambient @s
execute unless score $slow-type music matches 1..3 if score $track music matches 66 if score $track-66-timer music matches 265 unless score $67-queued music matches 1 run tellraw @a[tag=music-debug] "looping 6-6"
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 265 unless score $67-queued music matches 1 run scoreboard players reset $track-66-timer music
execute if score $slow-type music matches 1 if score $track music matches 66 if score $track-66-timer music matches 137 as @a at @s run playsound music.floating-away-quartz ambient @s ~ ~ ~ 1 0
execute if score $slow-type music matches 1 if score $track music matches 66 if score $track-66-timer music matches 137 run tellraw @a[tag=music-debug] "looping 6-6 slow after slowing"
execute if score $slow-type music matches 1 if score $track music matches 66 if score $track-66-timer music matches 137 run function simondmc:music/floating-away-quartz-slowing
execute if score $slow-type music matches 2 if score $track music matches 66 if score $track-66-timer music matches 132 as @a at @s run playsound music.floating-away-quartz ambient @s ~ ~ ~ 1 0
execute if score $slow-type music matches 2 if score $track music matches 66 if score $track-66-timer music matches 132 run tellraw @a[tag=music-debug] "looping 6-6 slow"
execute if score $slow-type music matches 2 if score $track-66-timer music matches 132 run scoreboard players reset $track-66-timer music
execute if score $slow-type music matches 3 if score $track music matches 66 if score $track-66-timer music matches 255 unless score $67-queued music matches 1 as @a at @s run playsound music.floating-away-quartz ambient @s
execute if score $slow-type music matches 3 if score $track music matches 66 if score $track-66-timer music matches 255 unless score $67-queued music matches 1 run tellraw @a[tag=music-debug] "looping 6-6 after speeding"
execute if score $slow-type music matches 3 if score $track music matches 66 if score $track-66-timer music matches 255 unless score $67-queued music matches 1 run function simondmc:music/floating-away-quartz-speeding
# 6-7 queue up handled in simondmc:story/chase/elevator
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 132 if score $67-queued music matches 1 run stopsound @a ambient
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 132 if score $67-queued music matches 1 run scoreboard players set $track music 67
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 132 if score $67-queued music matches 1 as @a at @s run playsound music.floating-away-ending ambient @s
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 132 if score $67-queued music matches 1 run tellraw @a[tag=music-debug] "early 6-7"
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 132 if score $67-queued music matches 1 run scoreboard players reset $67-queued music
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 265 if score $67-queued music matches 1 run scoreboard players set $track music 67
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 265 if score $67-queued music matches 1 as @a at @s run playsound music.floating-away-ending ambient @s
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 265 if score $67-queued music matches 1 run tellraw @a[tag=music-debug] "standard 6-7"
execute unless score $slow-type music matches 1..3 if score $track-66-timer music matches 265 if score $67-queued music matches 1 run scoreboard players reset $67-queued music
execute if score $slow-type music matches 3 if score $track music matches 66 if score $track-66-timer music matches 255 if score $67-queued music matches 1 run stopsound @a ambient
execute if score $slow-type music matches 3 if score $track music matches 66 if score $track-66-timer music matches 255 if score $67-queued music matches 1 as @a at @s run playsound music.floating-away-ending ambient @s
execute if score $slow-type music matches 3 if score $track music matches 66 if score $track-66-timer music matches 255 if score $67-queued music matches 1 run tellraw @a[tag=music-debug] "from slowing 6-7"
execute if score $slow-type music matches 3 if score $track music matches 66 if score $track-66-timer music matches 255 if score $67-queued music matches 1 run scoreboard players set $track music 67
execute if score $track music matches 67 run scoreboard players add $track-67-timer music 1
execute if score $track-67-timer music matches 260 run title @a times 0 1000 0
execute if score $track-67-timer music matches 265 run title @a title {"text":"Map Name","color":"#9DFDFF"}
execute if score $track-67-timer music matches 298 run title @a subtitle ["",{"text":"by "},{"text":"SimonDMC","color":"green"}]
execute if score $track-67-timer music matches 330 run title @a clear