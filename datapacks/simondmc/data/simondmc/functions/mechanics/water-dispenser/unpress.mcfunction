# scheduled by simondmc:mechanics/water-dispenser/press, unpresses and enables the button after 1.5s
# isolated in a function for easy scheduling

execute as @e[tag=water-button] run data merge entity @s {block_state:{Properties:{powered:"false"}}}
playsound block.wooden_button.click_off block @a[tag=playing] 27.5 85.5 -54.5
execute as @e[tag=water-button-int] run data merge entity @s {response:1b}
scoreboard players reset $disabled waterdispenser