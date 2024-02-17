# ticking function, controls the water dispenser in the room with the keycard

# the reason the button is made up of a display entity and an interaction entity instead of just being a real button is
# because the room gets flooded and the real button would break. didnt test it but i think switching out the real button
# for a fake one halfway through would look worse.

# press the button if not currently pressed
execute as @e[tag=water-button-int] if data entity @s interaction unless score $disabled waterdispenser matches 1 run function simondmc:mechanics/water-dispenser/press

# reset interaction
execute as @e[tag=water-button-int] run data remove entity @s interaction