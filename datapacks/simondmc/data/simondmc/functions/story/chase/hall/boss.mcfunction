# ticking function, controls the boss animation after the wall is blown up

execute if score $security-anim presentation matches 0.. run scoreboard players add $security-anim presentation 1
execute if score $security-anim presentation matches 1 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:1}
execute if score $security-anim presentation matches 1 as @a at @s run playsound characters.security voice @s
execute if score $security-anim presentation matches 36 as @e[tag=boss] at @s run tp @s ~ ~ ~ 90 0
execute if score $security-anim presentation matches 53 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:7}
execute if score $security-anim presentation matches 53 run scoreboard players reset $security-anim presentation