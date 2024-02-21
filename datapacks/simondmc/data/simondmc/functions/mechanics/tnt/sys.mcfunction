# ticking function, handles the TNT dispensing and exploding in the vents ඞ

# constantly have one tnt in the dropper ready to be dispensed
item replace block 16 96 -17 container.0 with tnt{CanPlaceOn:["minecraft:redstone_block"],display:{Lore:['{"text":" "}','{"text":"Strong enough to destroy","color":"dark_gray"}','{"text":"wood, but not strong","color":"dark_gray"}','{"text":"enough to shatter metal.","color":"dark_gray"}','{"text":" "}','{"text":"Can be placed on:","color":"gray","italic":false}','{"text":"Rusty Block of Iron","color":"dark_gray","italic":false}']},HideFlags:16}

# clear tnt from player and from ground whenever pressed
execute if block 16 95 -17 stone_button[powered=false] run scoreboard players reset $pressed tnt
execute if block 16 95 -17 stone_button[powered=true] unless score $pressed tnt matches 1 run clear @a tnt
execute if block 16 95 -17 stone_button[powered=true] unless score $pressed tnt matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:tnt"}}]
# also set spawnpoint in vent in case of grave injury
execute if block 16 95 -17 stone_button[powered=true] unless score $pressed tnt matches 1 run spawnpoint @a 21 91 -16 90
execute if block 16 95 -17 stone_button[powered=true] unless score $pressed tnt matches 1 run scoreboard players set $pressed tnt 1

# fake explosion
execute as @e[type=tnt,nbt={fuse:1s}] at @s run function simondmc:mechanics/tnt/explode