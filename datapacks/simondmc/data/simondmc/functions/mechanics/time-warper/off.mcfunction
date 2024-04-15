# called by simondmc:mechanics/time-warper/sys, turns off the timewarper
scoreboard players set $on timewarper 0
scoreboard players set $off-tick timewarper 5
# if an on animation is in progress, pick up where it left off
execute if score $on-tick timewarper matches 5..20 run scoreboard players operation $off-tick timewarper = $on-tick timewarper
scoreboard players reset $on-tick timewarper
# replace item
execute as @s[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run item modify entity @s weapon.mainhand simondmc:time-warper/off
execute as @s[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b}]}] run item modify entity @s weapon.offhand simondmc:time-warper/off
# speed up music
execute if score $last-area timewarper matches 1 run stopsound @a[tag=playing] ambient
execute if score $last-area timewarper matches 1 as @a[tag=playing] at @s run playsound music.out-of-order-speeding ambient @s
execute if score $last-area timewarper matches 1 run scoreboard players reset $track-4-timer music
execute if score $last-area timewarper matches 2 unless score $track music matches 63 run stopsound @a[tag=playing] ambient
execute if score $last-area timewarper matches 2 unless score $track music matches 63 as @a[tag=playing] at @s run playsound music.floating-away-quartz-speeding ambient @s
execute if score $last-area timewarper matches 2 unless score $track music matches 63 run scoreboard players reset $track-66-timer music
scoreboard players set $slow-type music 3