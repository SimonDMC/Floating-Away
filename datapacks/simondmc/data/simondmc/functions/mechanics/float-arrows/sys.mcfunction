# ticking function, powers the up and down float arrows. arrows textures credit: ©️ SimonDMCPlayer 2019

execute as @a[nbt={SelectedItem:{id:"minecraft:carrot"}}] run effect give @s levitation 1 3 true
execute as @a[nbt=!{SelectedItem:{id:"minecraft:carrot"}}] unless score $end elevator matches 0.. run effect clear @s levitation
execute as @a[nbt={SelectedItem:{id:"minecraft:potato"}}] run effect give @s slow_falling 1 2 true
execute as @a[nbt=!{SelectedItem:{id:"minecraft:potato"}}] run effect clear @s slow_falling

# pick up from the stage
execute as @e[tag=float-arrows-int] run function simondmc:mechanics/float-arrows/pick-up