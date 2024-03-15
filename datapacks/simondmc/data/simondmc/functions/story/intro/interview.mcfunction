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
execute if score $start-anim story matches 330 run title @a times 20 20 20
execute if score $start-anim story matches 330 run title @a title "\u2304"
# tp to work corridor
execute if score $start-anim story matches 360 run kill @e[tag=employer-I]
execute if score $start-anim story matches 360 run tp @a 33.5 105.00 36.5 180 0
execute if score $start-anim story matches 360 run scoreboard players set $phase story 2
# close door
execute if score $start-anim story matches 390 run setblock 33 103 36 air
execute if score $start-anim story matches 400 as @a at @s run playsound characters.follow-me voice @s
# turn around
execute if score $start-anim story matches 443 as @e[tag=employer-W] at @s run tp @s ~ ~ ~ -180 0
# walk
execute if score $start-anim story matches 448 run scoreboard players set $employer-walking story 1
execute if score $start-anim story matches 448..538 as @e[tag=employer-W] at @s run tp @s ~ ~ ~-.28
execute if score $start-anim story matches 538 run scoreboard players reset $employer-walking story
execute if score $start-anim story matches 538 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:1}
execute if score $start-anim story matches 538 as @e[tag=employer-W] at @s run tp @s ~ ~ ~ 0 0
execute if score $start-anim story matches 538 run setblock 35 103 8 minecraft:redstone_torch
execute if score $start-anim story matches 685 run scoreboard players reset $start-anim story

# walking animation
# so the anim is comprised of 8 states:
# partial-right -> full-right -> partial-right -> still -> partial-left -> full-left -> partial-left -> still
# and we want the state to switch every two ticks so we divide it by 2 to get it to increment every other tick
# and then modulo by 8 to get the animation phase
# the subtraction by 1 is there so that tick 1 starts at 0
scoreboard players set $CONST_1 story 1
scoreboard players set $CONST_2 story 2
scoreboard players set $CONST_8 story 8
execute if score $employer-walking story matches 1 run scoreboard players add $employer-walk-tick story 1
execute if score $employer-walking story matches 1 run scoreboard players operation $employer-walk-phase story = $employer-walk-tick story
execute if score $employer-walking story matches 1 run scoreboard players operation $employer-walk-phase story -= $CONST_1 story
execute if score $employer-walking story matches 1 run scoreboard players operation $employer-walk-phase story /= $CONST_2 story
execute if score $employer-walking story matches 1 run scoreboard players operation $employer-walk-phase story %= $CONST_8 story
execute if score $employer-walking story matches 1 if score $employer-walk-phase story matches 0 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:9}
execute if score $employer-walking story matches 1 if score $employer-walk-phase story matches 1 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:10}
execute if score $employer-walking story matches 1 if score $employer-walk-phase story matches 2 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:9}
execute if score $employer-walking story matches 1 if score $employer-walk-phase story matches 3 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:1}
execute if score $employer-walking story matches 1 if score $employer-walk-phase story matches 4 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:7}
execute if score $employer-walking story matches 1 if score $employer-walk-phase story matches 5 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:8}
execute if score $employer-walking story matches 1 if score $employer-walk-phase story matches 6 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:7}
execute if score $employer-walking story matches 1 if score $employer-walk-phase story matches 7 as @e[tag=employer-W] run item replace entity @s armor.head with blue_candle{CustomModelData:1}