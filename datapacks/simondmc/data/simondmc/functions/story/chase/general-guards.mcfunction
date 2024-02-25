# ticking function, handles whatever all the guards have in common

# shooting
# shoot once every period (dynamic) after being enabled
# only shoot once even if multiple players
execute if score $shooting guards matches 1 run scoreboard players add $shoot-timer guards 1
execute if score $shoot-timer guards >= $SHOOT-PERIOD guards if entity @a[predicate=simondmc:hall-shoot] as @e[tag=shooting-guard,tag=hall-guard,limit=1,sort=random] run function simondmc:story/chase/shoot-arrow
execute if score $shoot-timer guards >= $SHOOT-PERIOD guards if entity @a[predicate=simondmc:corridor-shoot] as @e[tag=shooting-guard,tag=vent-guard,limit=1,sort=random] run function simondmc:story/chase/shoot-arrow
execute if score $shoot-timer guards >= $SHOOT-PERIOD guards if entity @e[tag=machine-gun-guard] as @e[tag=machine-gun-guard] run function simondmc:story/chase/shoot-arrow
execute if score $shoot-timer guards >= $SHOOT-PERIOD guards if entity @a[predicate=simondmc:corridor-2] as @e[tag=shooting-guard,tag=corridor-2-guard,limit=1,sort=random] run function simondmc:story/chase/shoot-arrow
execute if score $shoot-timer guards >= $SHOOT-PERIOD guards run scoreboard players reset $shoot-timer guards
# remove ground arrows
scoreboard players add @e[type=arrow] arrow 1
kill @e[type=arrow,nbt={inGround:1b}]
# make sure arrows cannot get stuck above invulnerable villagers/guards
execute as @e[type=arrow] at @s positioned ~ ~-2 ~ if entity @e[type=villager,distance=..1] run kill @s
execute as @e[type=arrow] if score @s arrow matches 10.. at @s positioned ~ ~-2 ~ if entity @e[type=armor_stand,distance=..1] run kill @s

# movement
execute as @e[tag=guard] at @s run function simondmc:story/chase/guard-movement

# melee guards
execute as @a at @s as @e[tag=guard,distance=..2] run damage @p 8 mob_attack by @s