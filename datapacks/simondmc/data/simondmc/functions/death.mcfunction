# called by simondmc:settings whenever a player dies

# death during hall ambush
# everyone back to spawn
execute if score $phase story matches 6 run tp @a 4 97 -17 0 0
# restore wall breakage
execute if score $phase story matches 6 run clone 2 79 -13 6 83 -13 2 96 -13
# reset chase
execute if score $phase story matches 6 run scoreboard players reset * guards
execute if score $phase story matches 6 run kill @e[tag=hall-guard]
execute if score $phase story matches 6 run kill @e[tag=vent-guard]
execute if score $phase story matches 6 run summon armor_stand 20 85 -4 {Tags:["character","hall-guard-L","hall-guard","guard"],Invulnerable:1b,Rotation:[-90f, 0f]}
execute if score $phase story matches 6 run summon armor_stand 20 85 -6 {Tags:["character","hall-guard-R","hall-guard","guard"],Invulnerable:1b,Rotation:[-90f, 0f]}
execute if score $phase story matches 6 run scoreboard players reset $machine-gun guards
execute if score $phase story matches 6 run scoreboard players reset $vent-guards guards
execute if score $phase story matches 6 run clear @a carrot
execute if score $phase story matches 6 run clear @a potato
execute if score $phase story matches 6 run kill @e[tag=float-arrows-int]
execute if score $phase story matches 6 run summon interaction 7.25 88.0 -8.3 {width:1.25f,height:0.1f,Tags:["interaction","float-arrows-int"]}
execute if score $phase story matches 6 run kill @e[tag=float-arrow]
execute if score $phase story matches 6 run summon minecraft:item_display 7.5 88.0315 -8.125 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[0.7010574f,0.09229595f,-0.09229595f,0.7010574f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.5999997f,0.5999997f],translation:[0.0f,0.0f,0.0f]}}
execute if score $phase story matches 6 run summon minecraft:item_display 7.0 88.0 -8.5 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[-0.09841033f,-0.7002252f,0.7002252f,-0.09841033f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.59999937f,0.59999937f],translation:[0.0f,0.0f,0.0f]}}
# give back wall-breaking tnt
execute if score $phase story matches 6 run give @r tnt{CanPlaceOn:["minecraft:redstone_block"],display:{Lore:['{"text":" "}','{"text":"Strong enough to destroy","color":"dark_gray"}','{"text":"wood, but not strong","color":"dark_gray"}','{"text":"enough to shatter metal.","color":"dark_gray"}','{"text":" "}','{"text":"Can be placed on:","color":"gray","italic":false}','{"text":"Rusty Block of Iron","color":"dark_gray","italic":false}']},HideFlags:16}

scoreboard players reset @a death