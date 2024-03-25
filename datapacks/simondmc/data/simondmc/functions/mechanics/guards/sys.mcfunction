# ticking function, controls the guards and their vision

# block vision if trapdoors are flicked
execute if block 27 85 -4 spruce_trapdoor[open=true] if block 27 86 -4 spruce_trapdoor[open=true] run fill 30 85 -4 28 86 -4 air
execute if block 27 85 -3 spruce_trapdoor[open=true] if block 27 86 -3 spruce_trapdoor[open=true] run fill 30 85 -3 28 86 -3 air

# reveal vision if at least partially unflicked
execute if block 27 85 -4 spruce_trapdoor[open=false] run fill 30 85 -4 28 86 -4 light[level=0]
execute if block 27 86 -4 spruce_trapdoor[open=false] run fill 30 85 -4 28 86 -4 light[level=0]
execute if block 27 85 -3 spruce_trapdoor[open=false] run fill 30 85 -3 28 86 -3 light[level=0]
execute if block 27 86 -3 spruce_trapdoor[open=false] run fill 30 85 -3 28 86 -3 light[level=0]

# start animation if in structure block or light block level zero (so you can click trapdoors through it)
execute as @a if predicate simondmc:guard-room unless score $in-anim guards matches 1 at @s if block ~ ~ ~ structure_void run scoreboard players set @s guards 0
execute as @a if predicate simondmc:guard-room unless score $in-anim guards matches 1 at @s if block ~ ~1 ~ structure_void run scoreboard players set @s guards 0
execute as @a if predicate simondmc:guard-room unless score $in-anim guards matches 1 at @s if block ~ ~ ~ light[level=0] run scoreboard players set @s guards 0
execute as @a if predicate simondmc:guard-room unless score $in-anim guards matches 1 at @s if block ~ ~1 ~ light[level=0] run scoreboard players set @s guards 0
# also start it if near a closed trapdoor and above quartz ore 
# (trapdoor window exception because you cant put structure voids in the trapdoors)
execute as @a if predicate simondmc:guard-room at @s if block ~ ~-2 ~ nether_quartz_ore if block ~ ~ ~ spruce_trapdoor[open=false] run scoreboard players set @s guards 0
execute as @a if predicate simondmc:guard-room at @s if block ~ ~-2 ~ nether_quartz_ore if block ~ ~1 ~ spruce_trapdoor[open=false] run scoreboard players set @s guards 0

# spotted animation
execute as @a if score @s guards matches 0.. run scoreboard players add @s guards 1
execute as @a if score @s guards matches 1 run scoreboard players set $in-anim guards 1
execute as @a if score @s guards matches 1 run data modify storage simondmc:guards yaw set from entity @s Rotation[0]
execute as @a if score @s guards matches 1 run data modify storage simondmc:guards pitch set from entity @s Rotation[1]
execute as @a if score @s guards matches 1 at @s run function simondmc:mechanics/guards/armor-stand with storage simondmc:guards
execute as @a if score @s guards matches 1 run gamemode spectator @a
execute as @a if score @s guards matches 1..60 at @s as @a run spectate @e[tag=hall-guard,limit=1,sort=nearest] @s
execute as @a if score @s guards matches 2 run loot replace entity @e[tag=guard-anim-player] armor.head loot simondmc:player-head
execute as @a if score @s guards matches 2 run item replace entity @e[tag=guard-anim-player] weapon.mainhand from entity @s weapon.mainhand
execute as @a if score @s guards matches 2 run item replace entity @e[tag=guard-anim-player] weapon.offhand from entity @s weapon.offhand
# remove door because it will be replaced with a closed one and we stopsound next tick
execute as @a if score @s guards matches 2 run fill 31 85 -10 31 86 -11 air
execute as @a if score @s guards matches 3 run stopsound @a * minecraft:block.wood.break
execute as @a if score @s guards matches 3 run stopsound @a * minecraft:item.armor.equip_generic
execute as @a if score @s guards matches 20 as @e[tag=guard] at @s run tp @s ~ ~ ~ facing entity @e[tag=guard-anim-player,limit=1]
execute as @a if score @s guards matches 40 at @s run playsound entity.wolf.growl master @a
# now we "close" (replace) the door
execute as @a if score @s guards matches 55 run setblock 31 85 -10 minecraft:birch_door[facing=east,half=lower,open=false,hinge=right]
execute as @a if score @s guards matches 55 run setblock 31 86 -10 minecraft:birch_door[facing=east,half=upper,open=false,hinge=right]
execute as @a if score @s guards matches 55 run setblock 31 85 -11 minecraft:birch_door[facing=east,half=lower,open=false,hinge=left]
execute as @a if score @s guards matches 55 run setblock 31 86 -11 minecraft:birch_door[facing=east,half=upper,open=false,hinge=left]
execute as @a if score @s guards matches 60 run tp @a 34.0 85 -10.0 90 12.3
execute as @a if score @s guards matches 60 run title @a times 0 0 20
execute as @a if score @s guards matches 60 run title @a title "\u2304"
execute as @a if score @s guards matches 60 run gamemode adventure @a
execute as @a if score @s guards matches 60 run kill @e[tag=guard-anim-player]
execute as @a if score @s guards matches 60 run function simondmc:mechanics/guards/reset-room
execute as @a if score @s guards matches 60 run scoreboard players reset $in-anim guards
execute as @a if score @s guards matches 60 as @e[tag=guard] at @s run tp @s ~ ~ ~ -90 0
execute as @a if score @s guards matches 60 run scoreboard players reset @s guards