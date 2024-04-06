# called by simondmc:mechanics/water-dispenser/sys once the fake button has been pressed

# fake button press illusion
execute as @e[tag=water-button] run data merge entity @s {block_state:{Properties:{powered:"true"}}}
playsound block.wooden_button.click_on block @a 27.5 85.5 -54.5
data merge entity @s {response:0b}

# disable pressing button while its pressed
scoreboard players set $disabled waterdispenser 1

# unpress in 1.5 seconds
schedule function simondmc:mechanics/water-dispenser/unpress 30t

scoreboard players add $count waterdispenser 1

particle splash 27.5 85.5 -55.0 0 0 0 1 10 force

# crackling sounds
execute if score $count waterdispenser matches 1..2 run playsound entity.turtle.egg_crack master @a 27.5 85.5 -54.5
execute if score $count waterdispenser matches 3 run playsound entity.turtle.egg_break master @a 27.5 85.5 -54.5

# fill room with water once clicked enough times
execute if score $count waterdispenser matches 3 run setblock 27 85 -55 water
execute if score $count waterdispenser matches 4 run setblock 27 86 -55 water
execute if score $count waterdispenser matches 5 run fill 26 86 -56 28 86 -54 water replace air
execute if score $count waterdispenser matches 6 run setblock 27 87 -55 water
execute if score $count waterdispenser matches 6 run setblock 25 86 -55 water