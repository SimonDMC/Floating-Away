# called by simondmc:story/chase/general-guards, shoots an arrow from a random guard in the direction of a random player

execute store result score $guard.x arrow run data get entity @s Pos[0] 1000
execute store result score $guard.y arrow run data get entity @s Pos[1] 1000
execute store result score $guard.z arrow run data get entity @s Pos[2] 1000
execute store result score $player.x arrow run data get entity @p Pos[0] 1000
execute store result score $player.y arrow run data get entity @p Pos[1] 1000
execute store result score $player.z arrow run data get entity @p Pos[2] 1000
scoreboard players operation $player.x arrow -= $guard.x arrow
scoreboard players operation $player.y arrow -= $guard.y arrow
scoreboard players operation $player.z arrow -= $guard.z arrow
# compensate for y
scoreboard players add $player.y arrow 2000

# little bit of randomization
execute unless score $machine-gun guards matches 1 store result score $random.x arrow run random value -1000..1000
execute unless score $machine-gun guards matches 1 store result score $random.y arrow run random value -1000..1000
execute unless score $machine-gun guards matches 1 store result score $random.z arrow run random value -1000..1000
execute unless score $machine-gun guards matches 1 run scoreboard players operation $player.x arrow += $random.x arrow
execute unless score $machine-gun guards matches 1 run scoreboard players operation $player.y arrow += $random.y arrow
execute unless score $machine-gun guards matches 1 run scoreboard players operation $player.z arrow += $random.z arrow

# make arrow deal modified damage
execute if score $DAMAGE guards matches 2 unless score $machine-gun guards matches 1 at @s run summon arrow ~ ~1.5 ~ {Tags:["guard-arrow"],damage:2d}
execute if score $DAMAGE guards matches 3 unless score $machine-gun guards matches 1 at @s run summon arrow ~ ~1.5 ~ {Tags:["guard-arrow"],damage:3d}
execute if score $DAMAGE guards matches 6 at @s run summon arrow ~ ~1.5 ~ {Tags:["guard-arrow"],damage:6d}
execute if score $machine-gun guards matches 1 at @s run summon arrow ~ ~1.5 ~ {Tags:["guard-arrow"],damage:6d}

execute as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[0] double 0.0001 run scoreboard players get $player.x arrow
execute as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[1] double 0.0001 run scoreboard players get $player.y arrow
execute as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[2] double 0.0001 run scoreboard players get $player.z arrow

# shoot sharper, more direct shots if directly following
execute if entity @a[predicate=simondmc:corridor-2] as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[0] double 0.00014 run scoreboard players get $player.x arrow
execute if entity @a[predicate=simondmc:corridor-2] as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[1] double 0.00005 run scoreboard players get $player.y arrow
execute if entity @a[predicate=simondmc:corridor-2] as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[2] double 0.00014 run scoreboard players get $player.z arrow

execute if entity @a[predicate=simondmc:underground] as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[0] double 0.00014 run scoreboard players get $player.x arrow
execute if entity @a[predicate=simondmc:underground] as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[2] double 0.00014 run scoreboard players get $player.z arrow

execute if entity @a[predicate=simondmc:quartz-4] as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[0] double 0.00014 run scoreboard players get $player.x arrow
execute if entity @a[predicate=simondmc:quartz-4] as @e[tag=guard-arrow,tag=!has-motion] store result entity @s Motion[2] double 0.00014 run scoreboard players get $player.z arrow

tag @e[tag=guard-arrow] add has-motion