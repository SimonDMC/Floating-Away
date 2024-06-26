# ticking function, controls the activation and toggling on/off of the time warper 
execute if score $enabled timewarper matches 1 as @a[tag=playing] if score @s timewarper matches 1.. unless score $on timewarper matches 1 run function simondmc:mechanics/time-warper/on
execute if score $enabled timewarper matches 1 as @a[tag=playing] if score @s timewarper matches 1.. if score $on timewarper matches 1 run function simondmc:mechanics/time-warper/off
scoreboard players reset @a[tag=playing] timewarper

# if you were wondering how the tick rate abuse works and/or why there are 15 macro functions, the time warper utilizes
# the bug MC-266135. only one cached command can exist per macro function and i wanted it to run 20->5 and 5->20 for
# smoothness so a separate function is necessary for each "tick step". this is also the reason the map is stuck in 1.20.4 btw
execute if score $on-tick timewarper matches ..20 run scoreboard players remove $on-tick timewarper 1
execute if score $on-tick timewarper matches 19 run function simondmc:mechanics/time-warper/macros/19 {"command":"tick rate 19"}
execute if score $on-tick timewarper matches 18 run function simondmc:mechanics/time-warper/macros/18 {"command":"tick rate 18"}
execute if score $on-tick timewarper matches 17 run function simondmc:mechanics/time-warper/macros/17 {"command":"tick rate 17"}
execute if score $on-tick timewarper matches 16 run function simondmc:mechanics/time-warper/macros/16 {"command":"tick rate 16"}
execute if score $on-tick timewarper matches 15 run function simondmc:mechanics/time-warper/macros/15 {"command":"tick rate 15"}
execute if score $on-tick timewarper matches 14 run function simondmc:mechanics/time-warper/macros/14 {"command":"tick rate 14"}
execute if score $on-tick timewarper matches 13 run function simondmc:mechanics/time-warper/macros/13 {"command":"tick rate 13"}
execute if score $on-tick timewarper matches 12 run function simondmc:mechanics/time-warper/macros/12 {"command":"tick rate 12"}
execute if score $on-tick timewarper matches 11 run function simondmc:mechanics/time-warper/macros/11 {"command":"tick rate 11"}
execute if score $on-tick timewarper matches 10 run function simondmc:mechanics/time-warper/macros/10 {"command":"tick rate 10"}
execute if score $on-tick timewarper matches 9 run function simondmc:mechanics/time-warper/macros/9 {"command":"tick rate 9"}
execute if score $on-tick timewarper matches 8 run function simondmc:mechanics/time-warper/macros/8 {"command":"tick rate 8"}
execute if score $on-tick timewarper matches 7 run function simondmc:mechanics/time-warper/macros/7 {"command":"tick rate 7"}
execute if score $on-tick timewarper matches 6 run function simondmc:mechanics/time-warper/macros/6 {"command":"tick rate 6"}
execute if score $on-tick timewarper matches 5 run function simondmc:mechanics/time-warper/macros/5 {"command":"tick rate 5"}
execute if score $on-tick timewarper matches 4 run scoreboard players reset $on-tick timewarper

execute if score $off-tick timewarper matches 5.. run scoreboard players add $off-tick timewarper 1
# don't run slow animation to 20tps after dying in chase with it on (detecting via music isnt the best but it works)
execute if score $off-tick timewarper matches 6 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/6 {"command":"tick rate 6"}
execute if score $off-tick timewarper matches 7 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/7 {"command":"tick rate 7"}
execute if score $off-tick timewarper matches 8 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/8 {"command":"tick rate 8"}
execute if score $off-tick timewarper matches 9 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/9 {"command":"tick rate 9"}
execute if score $off-tick timewarper matches 10 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/10 {"command":"tick rate 10"}
execute if score $off-tick timewarper matches 11 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/11 {"command":"tick rate 11"}
execute if score $off-tick timewarper matches 12 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/12 {"command":"tick rate 12"}
execute if score $off-tick timewarper matches 13 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/13 {"command":"tick rate 13"}
execute if score $off-tick timewarper matches 14 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/14 {"command":"tick rate 14"}
execute if score $off-tick timewarper matches 15 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/15 {"command":"tick rate 15"}
execute if score $off-tick timewarper matches 16 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/16 {"command":"tick rate 16"}
execute if score $off-tick timewarper matches 17 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/17 {"command":"tick rate 17"}
execute if score $off-tick timewarper matches 18 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/18 {"command":"tick rate 18"}
execute if score $off-tick timewarper matches 19 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/19 {"command":"tick rate 19"}
execute if score $off-tick timewarper matches 20 unless score $track music matches 63 run function simondmc:mechanics/time-warper/macros/20 {"command":"tick rate 20"}
execute if score $off-tick timewarper matches 21 run scoreboard players reset $off-tick timewarper

# mark last area so we can play the correct track when leaving
execute as @a[tag=playing,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] if predicate simondmc:time-warper-decommissioned run scoreboard players set $last-area timewarper 1
execute as @a[tag=playing,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] if predicate simondmc:time-warper-chase run scoreboard players set $last-area timewarper 2

# make sure it also gets disabled once any player moves into guard room corridor
execute as @a if predicate simondmc:music/sneaking-around run scoreboard players set $disallowed timewarper 1

# enable/disable in areas
execute as @a[tag=playing,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] unless score $enabled timewarper matches 1 if score $track music matches 4 if predicate simondmc:time-warper-decommissioned unless score $disallowed timewarper matches 1 run function simondmc:mechanics/time-warper/enable
execute as @a[tag=playing,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] unless score $enabled timewarper matches 1 if predicate simondmc:time-warper-chase run function simondmc:mechanics/time-warper/enable
execute as @a[tag=playing,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] if score $enabled timewarper matches 1 unless predicate simondmc:time-warper-decommissioned unless predicate simondmc:time-warper-chase run function simondmc:mechanics/time-warper/disable
execute as @a[tag=playing,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] if score $enabled timewarper matches 1 if score $disallowed timewarper matches 1 run function simondmc:mechanics/time-warper/disable