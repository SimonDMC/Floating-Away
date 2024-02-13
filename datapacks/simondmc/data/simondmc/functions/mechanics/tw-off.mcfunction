# called by simondmc:mechanics/time-warper, turns off the timewarper
scoreboard players reset @a timewarper
scoreboard players set #on timewarper 0
scoreboard players set #off-tick timewarper 5
# if an on animation is in progress, pick up where it left off
execute if score #on-tick timewarper matches 5..20 run scoreboard players operation #off-tick timewarper = #on-tick timewarper
scoreboard players reset #on-tick timewarper
# replace texture
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run item modify entity @s weapon.mainhand simondmc:cmd2
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b}]}] run item modify entity @s weapon.offhand simondmc:cmd2