# called by simondmc:mechanics/time-warper/sys, replaces the /off/ or /on/ item with the /disabled/ item irrespective of the slot
# also turns off the time warper if it is on
scoreboard players set $enabled timewarper 0
execute if score $on timewarper matches 1 run function simondmc:mechanics/time-warper/off
# play deactivation sound
execute at @s run playsound block.conduit.deactivate master @s
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:0b}]}] run item modify entity @s hotbar.0 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:1b}]}] run item modify entity @s hotbar.1 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:2b}]}] run item modify entity @s hotbar.2 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:3b}]}] run item modify entity @s hotbar.3 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:4b}]}] run item modify entity @s hotbar.4 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:5b}]}] run item modify entity @s hotbar.5 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:6b}]}] run item modify entity @s hotbar.6 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:7b}]}] run item modify entity @s hotbar.7 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:8b}]}] run item modify entity @s hotbar.8 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:9b}]}] run item modify entity @s inventory.0 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:10b}]}] run item modify entity @s inventory.1 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:11b}]}] run item modify entity @s inventory.2 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:12b}]}] run item modify entity @s inventory.3 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:13b}]}] run item modify entity @s inventory.4 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:14b}]}] run item modify entity @s inventory.5 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:15b}]}] run item modify entity @s inventory.6 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:16b}]}] run item modify entity @s inventory.7 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:17b}]}] run item modify entity @s inventory.8 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:18b}]}] run item modify entity @s inventory.9 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:19b}]}] run item modify entity @s inventory.10 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:20b}]}] run item modify entity @s inventory.11 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:21b}]}] run item modify entity @s inventory.12 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:22b}]}] run item modify entity @s inventory.13 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:23b}]}] run item modify entity @s inventory.14 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:24b}]}] run item modify entity @s inventory.15 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:25b}]}] run item modify entity @s inventory.16 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:26b}]}] run item modify entity @s inventory.17 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:27b}]}] run item modify entity @s inventory.18 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:28b}]}] run item modify entity @s inventory.19 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:29b}]}] run item modify entity @s inventory.20 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:30b}]}] run item modify entity @s inventory.21 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:31b}]}] run item modify entity @s inventory.22 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:32b}]}] run item modify entity @s inventory.23 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:33b}]}] run item modify entity @s inventory.24 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:34b}]}] run item modify entity @s inventory.25 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:35b}]}] run item modify entity @s inventory.26 simondmc:time-warper/disabled
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:-106b}]}] run item modify entity @s weapon.offhand simondmc:time-warper/disabled
