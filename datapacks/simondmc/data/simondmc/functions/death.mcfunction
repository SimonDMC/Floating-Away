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
execute if score $phase story matches 6 run scoreboard players set $DAMAGE guards 6
execute if score $phase story matches 6 run clear @a carrot
execute if score $phase story matches 6 run clear @a potato
execute if score $phase story matches 6 run kill @e[tag=float-arrows-int]
execute if score $phase story matches 6 run summon interaction 7.25 88.0 -8.3 {width:1.25f,height:0.1f,Tags:["interaction","float-arrows-int"]}
execute if score $phase story matches 6 run kill @e[tag=float-arrow]
execute if score $phase story matches 6 run summon minecraft:item_display 7.5 88.0315 -8.125 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[0.7010574f,0.09229595f,-0.09229595f,0.7010574f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.5999997f,0.5999997f],translation:[0.0f,0.0f,0.0f]}}
execute if score $phase story matches 6 run summon minecraft:item_display 7.0 88.0 -8.5 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[-0.09841033f,-0.7002252f,0.7002252f,-0.09841033f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.59999937f,0.59999937f],translation:[0.0f,0.0f,0.0f]}}
# give back wall-breaking tnt
execute if score $phase story matches 6 run give @r tnt{CanPlaceOn:["minecraft:redstone_block"],display:{Lore:['{"text":" "}','{"text":"Strong enough to destroy","color":"dark_gray"}','{"text":"wood, but not strong","color":"dark_gray"}','{"text":"enough to shatter metal.","color":"dark_gray"}','{"text":" "}','{"text":"Can be placed on:","color":"gray","italic":false}','{"text":"Rusty Block of Iron","color":"dark_gray","italic":false}']},HideFlags:16}

# death during chase
# everyone back to spawn
execute if score $phase story matches 7 run tp @a -8 80 -3 90 0
execute if score $phase story matches 7 run scoreboard players reset * guards
execute if score $phase story matches 7 run scoreboard players set $shooting guards 1
execute if score $phase story matches 7 run scoreboard players set $SHOOT-PERIOD guards 10
execute if score $phase story matches 7 run scoreboard players set $corridor-anim-1 guards 0
execute if score $phase story matches 7 run scoreboard players set $DAMAGE guards 3
execute if score $phase story matches 7 run kill @e[tag=hall-guard]
execute if score $phase story matches 7 run kill @e[tag=vent-guard]
execute if score $phase story matches 7 run kill @e[tag=corridor-guard]
execute if score $phase story matches 7 run kill @e[tag=corridor-2-guard]
# new vent shooting guards
execute if score $phase story matches 7 run summon armor_stand -6 92 -18 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
execute if score $phase story matches 7 run summon armor_stand -7 92 -17 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
execute if score $phase story matches 7 run summon armor_stand -8 92 -16 {Tags:["character","guard","vent-guard"],Rotation:[90f,0f],Invulnerable:1b}
# close corridor 1 doors
execute if score $phase story matches 7 run setblock -19 71 2 air
execute if score $phase story matches 7 run setblock -16 71 2 air
# remove corridor 1 guard turn block
execute if score $phase story matches 7 run setblock -18 69 -1 air
# restore wood block
execute if score $phase story matches 7 run clone -39 64 -1 -44 65 -3 -44 72 -3
# remove wood block movement blocks
execute if score $phase story matches 7 run fill -38 70 -5 -38 70 1 air
execute if score $phase story matches 7 run setblock -37 70 -2 air
# open 1->2 door
execute if score $phase story matches 7 run setblock -45 73 20 minecraft:lever[powered=true,facing=south]
execute if score $phase story matches 7 run setblock -45 71 19 minecraft:redstone_torch
# close corridor 1 doors
execute if score $phase story matches 7 run setblock -42 71 35 air
execute if score $phase story matches 7 run setblock -39 71 35 air
# remove corridor 1 guard turn block
execute if score $phase story matches 7 run setblock -40 69 32 air
# open big trapdoor
execute if score $phase story matches 7 run setblock -14 70 31 lever[powered=true,facing=west]
execute if score $phase story matches 7 run scoreboard players reset $closed trapdoor

scoreboard players reset @a death