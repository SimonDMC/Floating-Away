# ticking function, makes sure the player always has the business suit on
# not using curse of binding because i don't like the enchanted glint on armor

execute as @a[nbt=!{Inventory:[{id:"minecraft:leather_chestplate",Slot:102b}]}] run clear @s leather_chestplate
execute as @a[nbt=!{Inventory:[{id:"minecraft:leather_chestplate",Slot:102b}]}] run item replace entity @s armor.chest with minecraft:leather_chestplate{display:{color:0},Unbreakable:true,HideFlags:4}
execute as @a[nbt=!{Inventory:[{id:"minecraft:leather_leggings",Slot:101b}]}] run clear @s leather_leggings
execute as @a[nbt=!{Inventory:[{id:"minecraft:leather_leggings",Slot:101b}]}] run item replace entity @s armor.legs with minecraft:leather_leggings{display:{color:0},Unbreakable:true,HideFlags:4}
execute as @a[nbt=!{Inventory:[{id:"minecraft:leather_boots",Slot:100b}]}] run clear @s leather_boots
execute as @a[nbt=!{Inventory:[{id:"minecraft:leather_boots",Slot:100b}]}] run item replace entity @s armor.feet with minecraft:leather_boots{display:{color:0},Unbreakable:true,HideFlags:4}

kill @e[type=item,nbt={Item:{id:"minecraft:leather_chestplate"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:leather_leggings"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:leather_boots"}}]