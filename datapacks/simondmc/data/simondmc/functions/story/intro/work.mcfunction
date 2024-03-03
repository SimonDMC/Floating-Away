# ticking function, controls the work mechanisms in the offices as well as the employer animations

# conveyor belts
execute if score $phase story matches 2..4 if score $conveyor-timer work matches 0.. run scoreboard players add $conveyor-timer work 1

# row 4
execute if score $conveyor-enabled work matches 1 if score $conveyor-timer work matches 15 run clone 39 105 -42 39 105 46 39 105 -41 replace move
# this could be tracked with a scoreboard but would probably be prone to errors and if i accidentally
# reset the scoreboard it would mess up so id say this is better
execute if score $conveyor-enabled work matches 1 if score $conveyor-timer work matches 15 if block 39 105 -39 gray_concrete run setblock 39 105 -42 gray_concrete
execute if score $conveyor-enabled work matches 1 if score $conveyor-timer work matches 15 if block 39 105 -39 black_concrete run setblock 39 105 -42 black_concrete
# move items along conveyor
execute if score $conveyor-enabled work matches 1 if score $conveyor-timer work matches 15 as @e[tag=conveyor-item] at @s run tp @s ~ ~ ~1
execute if score $conveyor-enabled work matches 1 if score $conveyor-timer work matches 15 as @a at @s run playsound minecraft:block.chain.place master @s

# row 3
execute if score $conveyor-timer work matches 15 run clone 27 105 47 27 105 -41 27 105 -42 replace move
execute if score $conveyor-timer work matches 15 if block 27 105 44 gray_concrete run setblock 27 105 47 gray_concrete
execute if score $conveyor-timer work matches 15 if block 27 105 44 black_concrete run setblock 27 105 47 black_concrete

# row 5
execute if score $conveyor-timer work matches 15 run clone 41 105 47 41 105 -41 41 105 -42 replace move
execute if score $conveyor-timer work matches 15 if block 41 105 44 gray_concrete run setblock 41 105 47 gray_concrete
execute if score $conveyor-timer work matches 15 if block 41 105 44 black_concrete run setblock 41 105 47 black_concrete

# row 2
execute if score $conveyor-timer work matches 15 run clone 25 105 -42 25 105 46 25 105 -41 replace move
execute if score $conveyor-timer work matches 15 if block 25 105 -39 gray_concrete run setblock 25 105 -42 gray_concrete
execute if score $conveyor-timer work matches 15 if block 25 105 -39 black_concrete run setblock 25 105 -42 black_concrete

# move player along because why not :3
execute if score $conveyor-enabled work matches 1 if score $conveyor-timer work matches 15 as @a[x=39.0,y=106,z=6.3,dx=1,dz=4.4] at @s if block ~ ~1 ~1.1 air run tp @s ~ ~ ~1

execute if score $conveyor-timer work matches 16.. run scoreboard players set $conveyor-timer work 0

# replenish bases
execute if entity @e[tag=tech-base,x=39.5,y=106.5,z=-21.5,distance=...1] unless entity @e[tag=tech-base,x=39.5,y=106.5,z=-25.5,distance=...1] run summon interaction 39.5 106 -25.5 {width:1f,height:0.1f,Tags:["interaction","base-int","conveyor-item"]}
execute if entity @e[tag=tech-base,x=39.5,y=106.5,z=-21.5,distance=...1] unless entity @e[tag=tech-base,x=39.5,y=106.5,z=-25.5,distance=...1] run summon minecraft:item_display 39.5 106.5 -25.5 {Tags:["display","tech-base","conveyor-item"],item:{Count:1b,id:"minecraft:feather",tag:{CustomModelData:1,display:{Name:'{"text":"item/tech-base","italic":false,"color":"yellow"}'}}},transformation:{left_rotation:[0.0f,-0.3826835f,0.0f,0.9238795f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0000001f,0.9999999f,1.0000001f],translation:[0.0f,0.0f,0.0f]}}

# pick up conveyor item
execute as @e[tag=base-int] if data entity @s attack run function simondmc:story/intro/pickup-base
execute as @e[tag=base-int] run data remove entity @s attack

# pick up chip
execute as @e[tag=chips-int] if data entity @s interaction run function simondmc:story/intro/pickup-chip
execute as @e[tag=chips-int] run data remove entity @s interaction

# merge
execute as @a[nbt={SelectedItem:{id:"minecraft:feather",tag:{CustomModelData:1}},Inventory:[{id:"minecraft:feather",Slot:-106b,tag:{CustomModelData:2}}]}] run function simondmc:story/intro/merge

# place down merged
execute as @e[tag=place-merged-int] if data entity @s attack run function simondmc:story/intro/place-merged
execute as @e[tag=place-merged-int] run data remove entity @s attack

# enter office
execute as @a[x=36.5,y=105,z=8.5,distance=..1] if score $phase story matches 2 run fill 34 105 8 34 106 8 barrier
execute as @a[x=36.5,y=105,z=8.5,distance=..1] if score $phase story matches 2 run scoreboard players set $tutorial-anim work 0
execute as @a[x=36.5,y=105,z=8.5,distance=..1] if score $phase story matches 2 run scoreboard players set $phase story 3

# assemblies completed
execute if score $phase story matches 4 run title @a actionbar [{"text":"Assemblies Completed: "},{"score":{"name":"$merged","objective":"work"}}]

# villager turning
execute as @e[tag=work-villager] at @s if block ~ ~-2 ~ reinforced_deepslate run tp @s ~ ~ ~ -90 0

# anims
execute if score $tutorial-anim work matches 0.. run scoreboard players add $tutorial-anim work 1
execute if score $tutorial-anim work matches 1 run tellraw @a "Scene 2 Dialogue B"
execute if score $tutorial-anim work matches 1..4 as @e[tag=employer-W] at @s run tp @s ~ ~ ~.3
execute if score $tutorial-anim work matches 5 as @e[tag=employer-W] at @s run tp @s ~ ~ ~ -90 0
execute if score $tutorial-anim work matches 6..15 as @e[tag=employer-W] at @s run tp @s ~.3 ~ ~
execute if score $tutorial-anim work matches 16 as @e[tag=employer-W] at @s run tp @s ~ ~ ~ -180 0
execute if score $tutorial-anim work matches 16 run setblock 35 103 8 air
execute if score $tutorial-anim work matches 17..23 as @e[tag=employer-W] at @s run tp @s ~ ~ ~-.3
execute if score $tutorial-anim work matches 24 as @e[tag=employer-W] at @s run tp @s ~ ~ ~ -35 0
execute if score $tutorial-anim work matches 84 run scoreboard players set $conveyor-enabled work 1
execute if score $tutorial-anim work matches 104 run scoreboard players set $tutorial-phase work 1
execute if score $tutorial-anim work matches 154 run scoreboard players reset $conveyor-enabled work
execute if score $tutorial-anim work matches 154 run scoreboard players reset $tutorial-anim work

execute if score $tutorial-phase work matches 1 run title @a actionbar "Left Click to pick up conveyor item"
execute if score $tutorial-phase work matches 2 run title @a actionbar "Right Click to pick up chip"
execute if score $tutorial-phase work matches 3 run title @a actionbar "F to combine"
execute if score $tutorial-phase work matches 4 run title @a actionbar "Left Click to place onto conveyor belt"

execute if score $employer-leave-anim work matches 0.. run scoreboard players add $employer-leave-anim work 1
execute if score $employer-leave-anim work matches 1 run tellraw @a "Scene 2 Dialogue C"
execute if score $employer-leave-anim work matches 40 as @e[tag=employer-W] at @s run tp @s ~ ~ ~ 0 0
execute if score $employer-leave-anim work matches 41..47 as @e[tag=employer-W] at @s run tp @s ~ ~ ~.3
execute if score $employer-leave-anim work matches 48 as @e[tag=employer-W] at @s run tp @s ~ ~ ~ 90 0
execute if score $employer-leave-anim work matches 48 run setblock 35 103 8 minecraft:redstone_torch
execute if score $employer-leave-anim work matches 49..58 as @e[tag=employer-W] at @s run tp @s ~-.3 ~ ~
execute if score $employer-leave-anim work matches 59 as @e[tag=employer-W] at @s run tp @s ~ ~ ~ 180 0
execute if score $employer-leave-anim work matches 59 run setblock 35 103 8 air
execute if score $employer-leave-anim work matches 60..80 as @e[tag=employer-W] at @s run tp @s ~ ~ ~-.3
execute if score $employer-leave-anim work matches 81 as @e[tag=employer-W] run kill @s
execute if score $employer-leave-anim work matches 101 run scoreboard players set $conveyor-enabled work 1
execute if score $employer-leave-anim work matches 101 run scoreboard players set $phase story 4

execute if score $shift-end-anim work matches 0.. run scoreboard players add $shift-end-anim work 1
execute if score $shift-end-anim work matches 1 run title @a times 80 40 0
execute if score $shift-end-anim work matches 1 run title @a title "\u2304"
execute if score $shift-end-anim work matches 80 run scoreboard players set $phase story 5
execute if score $shift-end-anim work matches 80 run clear @a feather
execute if score $shift-end-anim work matches 80..272 run gamemode spectator @a
execute if score $shift-end-anim work matches 80..272 run tp @a 33.5 106.3 17.0 180 15.5
execute if score $shift-end-anim work matches 121 as @a at @s run playsound block.bell.use master @s
execute if score $shift-end-anim work matches 140 as @a at @s run playsound block.bell.use master @s
execute if score $shift-end-anim work matches 180 run fill 31 103 14 35 103 -40 redstone_torch replace minecraft:stripped_mangrove_wood
execute if score $shift-end-anim work matches 180 run setblock 33 103 -43 minecraft:redstone_torch
execute if score $shift-end-anim work matches 180 as @e[tag=work-villager,tag=row-3] at @s run tp @s ~1.3 ~-.5 ~ -90 0
execute if score $shift-end-anim work matches 180 as @e[tag=work-villager,tag=row-4] at @s run tp @s ~-1.3 ~-.5 ~ 90 0
execute if score $shift-end-anim work matches 181..195 as @e[tag=work-villager,tag=row-3] at @s run tp @s ~.2 ~ ~
execute if score $shift-end-anim work matches 196 as @e[tag=work-villager,tag=row-3] at @s run tp @s ~ ~ ~ -180 0
execute if score $shift-end-anim work matches 197..272 as @e[tag=work-villager,tag=row-3] at @s run tp @s ^ ^ ^.2
execute if score $shift-end-anim work matches 197..211 as @e[tag=work-villager,tag=row-4] at @s run tp @s ~-.2 ~ ~
execute if score $shift-end-anim work matches 212 as @e[tag=work-villager,tag=row-4] at @s run tp @s ~ ~ ~ -180 0
execute if score $shift-end-anim work matches 213..272 as @e[tag=work-villager,tag=row-4] at @s run tp @s ^ ^ ^.2
execute if score $shift-end-anim work matches 273 run title @a times 0 20 40
execute if score $shift-end-anim work matches 273 run title @a title "\u2304"
# get the player far enough that they don't hear the doors closing and villagers dying
# in the y-direction so nothing unloads
execute if score $shift-end-anim work matches 274 run tp @a 33.5 180.00 -31.5
execute if score $shift-end-anim work matches 275 run fill 31 103 14 35 103 -40 minecraft:stripped_mangrove_wood replace redstone_torch
execute if score $shift-end-anim work matches 275 as @e[tag=work-villager] at @s run tp @s ~ ~-10 ~
execute if score $shift-end-anim work matches 275 run setblock 34 106 -42 minecraft:polished_blackstone_button[facing=south]
execute if score $shift-end-anim work matches 275 run fill 34 105 8 34 106 8 air
execute if score $shift-end-anim work matches 275 run setblock 35 103 8 minecraft:redstone_torch
execute if score $shift-end-anim work matches 275 run setblock 33 103 -43 air
execute if score $shift-end-anim work matches 275 run kill @e[tag=basket-chip]
execute if score $shift-end-anim work matches 275 run kill @e[tag=conveyor-item]
execute if score $shift-end-anim work matches 275 run kill @e[tag=chips-int]
execute if score $shift-end-anim work matches 276 run kill @e[tag=work-villager]
execute if score $shift-end-anim work matches 277 run tp @a 37.8 105.50 8.50 -90 35
execute if score $shift-end-anim work matches 277 run gamemode adventure @a
execute if score $shift-end-anim work matches 353 run fill 12 108 47 54 108 -42 minecraft:dead_brain_coral_block replace minecraft:sea_lantern
execute if score $shift-end-anim work matches 353 as @a at @s run playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 1 0
execute if score $shift-end-anim work matches 353 run scoreboard players reset $shift-end-anim work