# ticking function, handles the guards in the presentation hall

# shooting
# shoot once every 0.5s after being enabled
execute if score $shooting guards matches 1 run scoreboard players add $shoot-timer guards 1
execute if score $shoot-timer guards matches 10 as @e[tag=shooting-guard,limit=1,sort=random] run function simondmc:story/chase/shoot_arrow
execute if score $shoot-timer guards matches 10 run scoreboard players reset $shoot-timer guards
# arrow pruning stuff
kill @e[type=arrow,nbt={inGround:1b}]
execute as @e[type=arrow] at @s positioned ~ ~-2 ~ if entity @e[type=villager,distance=..1] run kill @s