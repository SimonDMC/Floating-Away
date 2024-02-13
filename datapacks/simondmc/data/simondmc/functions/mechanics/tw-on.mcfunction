# called by simondmc:mechanics/time-warper, turns on the timewarper
scoreboard players reset @a timewarper
scoreboard players set #on timewarper 1
scoreboard players set #on-tick timewarper 20
# if an off animation is in progress, pick up where it left off
execute if score #off-tick timewarper matches 5..20 run scoreboard players operation #on-tick timewarper = #off-tick timewarper
scoreboard players reset #off-tick timewarper
# replace texture
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run item modify entity @s weapon.mainhand simondmc:cmd3
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b}]}] run item modify entity @s weapon.offhand simondmc:cmd3