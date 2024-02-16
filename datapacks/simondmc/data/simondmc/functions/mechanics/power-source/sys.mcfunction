# ticking function, handles the manual power generator system

# spin the lever if not currently spinning
execute as @e[tag=power-source-int] if data entity @s interaction unless score $disabled powersource matches 1 run function simondmc:mechanics/power-source/spin

# light animation
execute if score $anim powersource matches 0.. run scoreboard players add $anim powersource 1
execute if score $anim powersource matches 1 run kill @e[tag=darkness]
execute if score $anim powersource matches 1 run fill 52 85 -27 52 88 -23 air
execute if score $anim powersource matches 1 run fill 45 89 -28 64 89 -3 minecraft:sea_lantern replace minecraft:dead_brain_coral_block
execute if score $anim powersource matches 1 run fill 51 91 -22 42 91 -6 minecraft:sea_lantern replace minecraft:dead_brain_coral_block
execute if score $anim powersource matches 1 as @a at @s run playsound block.beacon.activate master @s ~ ~ ~ 1 0
execute if score $anim powersource matches 4 run fill 45 89 -28 64 89 -3 minecraft:dead_brain_coral_block replace minecraft:sea_lantern
execute if score $anim powersource matches 4 run fill 51 91 -22 42 91 -6 minecraft:dead_brain_coral_block replace minecraft:sea_lantern
execute if score $anim powersource matches 4 run stopsound @a master block.beacon.activate
execute if score $anim powersource matches 7 run fill 45 89 -28 64 89 -3 minecraft:sea_lantern replace minecraft:dead_brain_coral_block
execute if score $anim powersource matches 7 run fill 51 91 -22 42 91 -6 minecraft:sea_lantern replace minecraft:dead_brain_coral_block
execute if score $anim powersource matches 7 as @a at @s run playsound block.beacon.activate master @s ~ ~ ~ 1 0
execute if score $anim powersource matches 7 run scoreboard players reset $anim powersource