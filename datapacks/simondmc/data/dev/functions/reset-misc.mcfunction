# restore darkness near power source
fill 45 89 -28 64 89 -3 minecraft:dead_brain_coral_block replace minecraft:sea_lantern
fill 51 91 -22 42 91 -6 minecraft:dead_brain_coral_block replace minecraft:sea_lantern
fill 52 85 -27 52 88 -23 barrier

# close combination lock door
setblock 22 83 -32 air

# close keycard door
setblock 37 83 -63 air

# drain water dispenser room
fill 22 85 -57 31 89 -50 air replace water

# close sequence lock door
setblock 36 36 15 air

# close emergency exit
setblock 41 91 -11 air

# restore tnt breakage
clone 2 79 -13 6 83 -13 2 96 -13

# close presentation hall door
setblock 19 83 -5 air

# mechanics scoreboards
scoreboard players reset * combinationlock
scoreboard players reset * powersource
scoreboard players reset * timewarper
scoreboard players reset * waterdispenser
scoreboard players reset * sequencelock
scoreboard players reset * emergencyexit
scoreboard players reset * guards