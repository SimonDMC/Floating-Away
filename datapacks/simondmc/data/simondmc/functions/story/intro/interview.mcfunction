# ticking function, controls the intro cutscene/animation up until the player enters the office

execute if score $start-anim story matches 0.. run scoreboard players add $start-anim story 1
execute if score $start-anim story matches 1..360 run ride @r mount @e[tag=interview-chair,limit=1]
execute if score $start-anim story matches 70 as @a at @s run playsound characters.interview voice @s
execute if score $start-anim story matches 74 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:6}
execute if score $start-anim story matches 84 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:2}
execute if score $start-anim story matches 110 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:5}
execute if score $start-anim story matches 150 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:2}
execute if score $start-anim story matches 170 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:6}
execute if score $start-anim story matches 216 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:3}
execute if score $start-anim story matches 244 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:6}
execute if score $start-anim story matches 269 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:2}
execute if score $start-anim story matches 291 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:6}
execute if score $start-anim story matches 303 as @e[tag=employer-I] run item replace entity @s armor.head with blue_candle{CustomModelData:4}
execute if score $start-anim story matches 330 run title @a times 20 20 20
execute if score $start-anim story matches 330 run title @a title "\u2304"
# tp to work corridor
execute if score $start-anim story matches 360 run kill @e[tag=employer-I]
execute if score $start-anim story matches 360 run tp @a 33.5 105.00 48.5 180 0
execute if score $start-anim story matches 360 run scoreboard players set $phase story 2
# close door
execute if score $start-anim story matches 390 run setblock 33 103 48 air
execute if score $start-anim story matches 400 as @a at @s run playsound characters.follow-me voice @s
execute if score $start-anim story matches 448..538 as @e[tag=employer-W] at @s run tp @s ~ ~ ~-.41
execute if score $start-anim story matches 538 run setblock 35 103 8 minecraft:redstone_torch
execute if score $start-anim story matches 685 run scoreboard players reset $start-anim story