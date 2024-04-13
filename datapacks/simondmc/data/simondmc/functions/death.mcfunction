# called by simondmc:settings whenever a player dies

# increment death stat
scoreboard players add $deaths stats 1

# reset all shot arrows
kill @e[type=arrow]

# death during folio exploration (you shouldn't be able to die anywhere but in case you do)
# everyone back to spawn
execute if score $phase story matches 5 run tp @a 34.0 85 -10.0 90 12.3

# death during hall ambush
# everyone back to spawn
execute if score $phase story matches 6 run tp @a 4 97 -17 0 0
# restore wall breakage
execute if score $phase story matches 6 run clone 2 79 -13 6 83 -13 2 96 -13
# reset chase
execute if score $phase story matches 6 run scoreboard players reset * guards
execute if score $phase story matches 6 run scoreboard players reset $security-anim presentation
execute if score $phase story matches 6 run stopsound @a voice
execute if score $phase story matches 6 run kill @e[tag=guard]
execute if score $phase story matches 6 run summon armor_stand 20 85 -4 {Tags:["character","hall-guard-L","hall-guard","guard","high-melee-guard"],Invulnerable:1b,Rotation:[-90f, 0f],Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 6 run summon armor_stand 20 85 -6 {Tags:["character","hall-guard-R","hall-guard","guard","high-melee-guard"],Invulnerable:1b,Rotation:[-90f, 0f],Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
# reset audience
execute if score $phase story matches 6 run function simondmc:story/chase/hall/reset-villagers
execute if score $phase story matches 6 run scoreboard players set $DAMAGE guards 6
execute if score $phase story matches 6 run clear @a carrot
execute if score $phase story matches 6 run clear @a potato
execute if score $phase story matches 6 run kill @e[tag=float-arrows-int]
execute if score $phase story matches 6 run summon interaction 7.25 88.0 -8.3 {width:1.25f,height:0.1f,Tags:["interaction","float-arrows-int"]}
execute if score $phase story matches 6 run kill @e[tag=float-arrow]
execute if score $phase story matches 6 run summon minecraft:item_display 7.5 88.0315 -8.125 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[0.7010574f,0.09229595f,-0.09229595f,0.7010574f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.5999997f,0.5999997f],translation:[0.0f,0.0f,0.0f]}}
execute if score $phase story matches 6 run summon minecraft:item_display 7.0 88.0 -8.5 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[-0.09841033f,-0.7002252f,0.7002252f,-0.09841033f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.59999937f,0.59999937f],translation:[0.0f,0.0f,0.0f]}}
# give back wall-breaking tnt
execute if score $phase story matches 6 run clear @a tnt
execute if score $phase story matches 6 run give @r tnt{CanPlaceOn:["minecraft:redstone_block"],display:{Lore:['{"text":" "}','{"text":"Strong enough to destroy","color":"dark_gray"}','{"text":"wood, but not strong","color":"dark_gray"}','{"text":"enough to shatter metal.","color":"dark_gray"}','{"text":" "}','{"text":"Can be placed on:","color":"gray","italic":false}','{"text":"Rusty Block of Iron","color":"dark_gray","italic":false}']},HideFlags:16}

# death during chase

# everyone back to spawn
execute if score $phase story matches 7 unless score $checkpoint-set stats matches 1 run tp @a -8 80 -3 90 0
execute if score $phase story matches 7 if score $checkpoint-set stats matches 1 run tp @a 4.5 51.00 21.0 -180 -5
# increment phase 7 deaths
execute if score $phase story matches 7 run scoreboard players add $7-deaths stats 1
# let player set a checkpoint if 15 deaths
execute if score $phase story matches 7 if score $7-deaths stats matches 15 run scoreboard players set $checkpoint-allowed stats 1
execute if score $phase story matches 7 if score $7-deaths stats matches 15 run tellraw @a ["",{"text":"Struggling? ","color":"green","clickEvent":{"action":"run_command","value":"/trigger set-checkpoint-trigger"}},{"text":"Set a checkpoint half-way through","underlined":true,"color":"yellow","clickEvent":{"action":"run_command","value":"/trigger set-checkpoint-trigger"}}]
# increment times player died due to not flicking 1->2 lever
execute if score $phase story matches 7 if score $missed-lever guards matches 1 run scoreboard players add $lever-misses story 1
# and add a glowing hint if 3 misses
execute if score $phase story matches 7 if score $lever-misses story matches 3 run summon minecraft:block_display -44.5 73.5 20.5 {Tags:["display","corridor-lever"],Glowing:1b,block_state:{Name:"minecraft:lever",Properties:{face:"wall",facing:"north",powered:"true"}},transformation:{left_rotation:[0.0f,1.0f,0.0f,0.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.5f,-0.5f,0.5f]}}
execute if score $phase story matches 7 run scoreboard players reset * guards
execute if score $phase story matches 7 run scoreboard players set $shooting guards 1
execute if score $phase story matches 7 run scoreboard players set $SHOOT-PERIOD guards 10
execute if score $phase story matches 7 run scoreboard players set $corridor-anim-1 guards 0
execute if score $phase story matches 7 run scoreboard players set $DAMAGE guards 2
execute if score $phase story matches 7 run kill @e[tag=hall-guard]
execute if score $phase story matches 7 run kill @e[tag=vent-guard]
execute if score $phase story matches 7 run kill @e[tag=corridor-guard]
execute if score $phase story matches 7 run kill @e[tag=corridor-2-guard]
execute if score $phase story matches 7 run kill @e[tag=corridor-3-guard]
execute if score $phase story matches 7 run kill @e[tag=quartz-guard]
# new vent shooting guards
execute if score $phase story matches 7 run summon armor_stand -6 92 -18 {Tags:["character","guard","vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 7 run summon armor_stand -7 92 -17 {Tags:["character","guard","vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 7 run summon armor_stand -8 92 -16 {Tags:["character","guard","vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],HandItems:[{id:"minecraft:bow",Count:1b},{}],CustomName:'{"text":"Guard"}'}
# new stationary vent guards
execute if score $phase story matches 7 run summon armor_stand -5 108 -18 {Tags:["character","guard","stationary-vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 7 run summon armor_stand -5 108 -17 {Tags:["character","guard","stationary-vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
execute if score $phase story matches 7 run summon armor_stand -5 108 -16 {Tags:["character","guard","stationary-vent-guard","high-melee-guard"],Rotation:[90f,0f],Invulnerable:1b,Invisible:1b,DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
# close corridor 1 doors
execute if score $phase story matches 7 run setblock -19 71 2 air
execute if score $phase story matches 7 run setblock -16 71 2 air
# remove corridor 1 guard turn block
execute if score $phase story matches 7 run setblock -18 69 -1 air
# restore wood block
execute if score $phase story matches 7 run clone -39 64 -1 -44 65 -3 -44 72 -3
# reset crate trapdoors
execute if score $phase story matches 7 run fill -39 74 1 -40 74 -1 minecraft:spruce_trapdoor[facing=east,half=bottom]
execute if score $phase story matches 7 run fill -41 76 -1 -44 76 -5 minecraft:spruce_trapdoor[facing=east,half=bottom]
# remove wood block movement blocks
execute if score $phase story matches 7 run fill -38 70 -5 -38 70 1 air
execute if score $phase story matches 7 run setblock -37 70 -2 air
# open 1->2 door
execute if score $phase story matches 7 run setblock -45 73 20 minecraft:lever[powered=true,facing=south]
execute if score $phase story matches 7 run setblock -45 71 19 minecraft:redstone_torch
# close corridor 2 doors
execute if score $phase story matches 7 run setblock -42 71 35 air
execute if score $phase story matches 7 run setblock -39 71 35 air
# remove corridor 2 guard turn block
execute if score $phase story matches 7 run setblock -40 69 32 air
# open big trapdoor
execute if score $phase story matches 7 run fill -14 71 32 -14 71 30 minecraft:iron_trapdoor[open=true,facing=west,half=top] 
execute if score $phase story matches 7 run fill -15 71 32 -15 71 30 minecraft:iron_trapdoor[open=true,facing=east,half=top]
execute if score $phase story matches 7 as @e[tag=trapdoor-lever] run data merge entity @s {block_state:{Properties:{powered:"true"}}}
execute if score $phase story matches 7 run scoreboard players reset $closed trapdoor
# close underground trapdoor
execute if score $phase story matches 7 run setblock 3 53 16 minecraft:lever[face=ceiling,facing=north]
execute if score $phase story matches 7 run setblock 4 54 16 minecraft:iron_trapdoor[facing=south,half=bottom]
# close corridor 3 doors
execute if score $phase story matches 7 run setblock 8 55 30 air
execute if score $phase story matches 7 run setblock 8 55 27 air
# remove corridor 3 guard turn block
execute if score $phase story matches 7 run setblock 5 65 29 air
# reset trap
execute if score $phase story matches 7 run setblock 4 57 59 lever[facing=north]
# close quartz 1 doors
execute if score $phase story matches 7 run setblock 2 37 39 air
execute if score $phase story matches 7 run setblock 2 37 42 air
# remove quartz 1 guard turn block
execute if score $phase story matches 7 run setblock 3 35 40 air
# close quartz 2 doors
execute if score $phase story matches 7 run setblock 23 37 19 air
execute if score $phase story matches 7 run setblock 20 37 19 air
# remove quartz 2 guard turn block
execute if score $phase story matches 7 run setblock 22 35 20 air
# reset sequence lock (2->3) door
execute if score $phase story matches 7 run function simondmc:mechanics/sequence-lock/reset
# close quartz 3 doors
execute if score $phase story matches 7 run setblock 38 37 10 air
execute if score $phase story matches 7 run setblock 38 37 7 air
# remove quartz 3 guard turn block
execute if score $phase story matches 7 run setblock 37 35 8 air
# close 3->4 door
# close quartz 4 doors
execute if score $phase story matches 7 run setblock 17 37 -5 air
execute if score $phase story matches 7 run setblock 20 37 -5 air
# remove quartz 4 guard turn block
execute if score $phase story matches 7 run setblock 18 35 -6 air
# prune quartz items
execute if score $phase story matches 7 run kill @e[tag=quartz-block]
execute if score $phase story matches 7 run clear @a quartz_block
# remove return blockade
execute if score $phase story matches 7 run fill 31 38 -7 31 39 -7 air
# clear quartz place room
execute if score $phase story matches 7 run fill 29 38 -8 -2 40 -6 air replace minecraft:quartz_block
execute if score $phase story matches 7 run fill 28 40 -7 -1 40 -7 air
# reset elevator door
execute if score $phase story matches 7 run fill -3 38 -6 -3 40 -8 iron_block
execute if score $phase story matches 7 as @e[tag=end-elevator-door] run data merge entity @s {transformation:{translation:[-0.5f,-0.5f,-0.5f]}}
execute if score $phase story matches 7 run scoreboard players reset * elevator
# reset give up trigger
execute if score $phase story matches 7 run scoreboard players reset @a give-up-trigger

# reset music
# preserve 6-3 timer if died in 6-3
scoreboard players reset $63-carry story
execute if score $phase story matches 7 if score $track music matches 63 run scoreboard players operation $63-carry story = $track-63-timer music
execute if score $phase story matches 6..7 run scoreboard players reset * music
execute if score $phase story matches 6 run stopsound @a ambient
execute if score $phase story matches 7 unless score $63-carry story matches 0.. run stopsound @a ambient
execute if score $63-carry story matches 0.. run scoreboard players operation $track-63-timer music = $63-carry story
execute if score $phase story matches 7 unless score $checkpoint-set stats matches 1 run scoreboard players set $track music 63
execute if score $phase story matches 7 if score $checkpoint-set stats matches 1 run scoreboard players set $track music 64
execute if score $phase story matches 7 unless score $checkpoint-set stats matches 1 unless score $on timewarper matches 1 unless score $63-carry story matches 0.. run scoreboard players set $track-63-timer music -1
execute if score $phase story matches 7 unless score $checkpoint-set stats matches 1 unless score $on timewarper matches 1 unless score $63-carry story matches 0.. run tellraw @a[tag=music-debug] "starting 6-3 normal"
execute if score $phase story matches 7 unless score $checkpoint-set stats matches 1 if score $63-carry story matches 0.. run tellraw @a[tag=music-debug] "letting 6-3 play"
execute if score $phase story matches 7 unless score $checkpoint-set stats matches 1 if score $on timewarper matches 1 run scoreboard players set $track-63-timer music 2
execute if score $phase story matches 7 unless score $checkpoint-set stats matches 1 if score $on timewarper matches 1 run tellraw @a[tag=music-debug] "starting 6-3 after tw death"
execute if score $phase story matches 7 if score $checkpoint-set stats matches 1 unless score $on timewarper matches 1 run scoreboard players set $track-64-timer music -1
execute if score $phase story matches 7 if score $checkpoint-set stats matches 1 unless score $on timewarper matches 1 run tellraw @a[tag=music-debug] "starting 6-4 normal"
execute if score $phase story matches 7 if score $checkpoint-set stats matches 1 if score $on timewarper matches 1 run scoreboard players set $track-64-timer music 2
execute if score $phase story matches 7 if score $checkpoint-set stats matches 1 if score $on timewarper matches 1 run tellraw @a[tag=music-debug] "starting 6-4 after tw death"
execute if score $phase story matches 7 run function simondmc:mechanics/time-warper/macros/20 {"command":"tick rate 20"}
execute if score $phase story matches 7 unless score $checkpoint-set stats matches 1 unless score $63-carry story matches 0.. as @a at @s run playsound music.floating-away-corridors-1 ambient @s
execute if score $phase story matches 7 if score $checkpoint-set stats matches 1 as @a at @s run playsound music.floating-away-underground ambient @s

# tp all items to some player to make sure you can't lose them
# there was an issue where dropping an item a few ticks before dying would cause you to lose it
tp @e[type=item] @r

scoreboard players reset @a death