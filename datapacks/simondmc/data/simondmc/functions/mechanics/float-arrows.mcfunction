# ticking function, powers the up and down float arrows. arrows textures credit: ©️ SimonDMCPlayer 2019

execute as @a[nbt={SelectedItem:{id:"minecraft:carrot"}}] run effect give @s levitation 1 3 true
execute as @a[nbt=!{SelectedItem:{id:"minecraft:carrot"}}] run effect clear @s levitation
execute as @a[nbt={SelectedItem:{id:"minecraft:potato"}}] run effect give @s slow_falling 1 2 true
execute as @a[nbt=!{SelectedItem:{id:"minecraft:potato"}}] run effect clear @s slow_falling