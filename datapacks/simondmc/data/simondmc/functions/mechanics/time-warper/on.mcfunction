# called by simondmc:mechanics/time-warper/sys, turns on the timewarper
scoreboard players set $on timewarper 1
scoreboard players set $on-tick timewarper 20
scoreboard players reset @a timewarper
# if an off animation is in progress, pick up where it left off
execute if score $off-tick timewarper matches 5..20 run scoreboard players operation $on-tick timewarper = $off-tick timewarper
scoreboard players reset $off-tick timewarper
# replace item
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run item modify entity @s weapon.mainhand simondmc:time-warper/on
execute as @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b}]}] run item modify entity @s weapon.offhand simondmc:time-warper/on
# slow down music
execute if predicate simondmc:time-warper-decommissioned run stopsound @a ambient
execute if predicate simondmc:time-warper-decommissioned as @a at @s run playsound music.out-of-order-slowing ambient @s
execute if predicate simondmc:time-warper-decommissioned run scoreboard players reset $track-4-timer music
scoreboard players set $slow-type music 1