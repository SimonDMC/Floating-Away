# ticking function, controls the intro cutscene/animation up until the player enters the office

execute if score $start-anim story matches 0.. run scoreboard players add $start-anim story 1
execute if score $start-anim story matches 1..170 run ride @r mount @e[tag=interview-chair,limit=1]
execute if score $start-anim story matches 50 run tellraw @a "Scene 1 Dialogue"
execute if score $start-anim story matches 150 run title @a times 20 20 20
execute if score $start-anim story matches 150 run title @a title "\u2304"
# tp to work corridor
execute if score $start-anim story matches 180 run tp @a 33.5 105.00 48.5 180 0
execute if score $start-anim story matches 180 run scoreboard players set $phase story 2
# close door
execute if score $start-anim story matches 210 run setblock 33 103 48 air
execute if score $start-anim story matches 220 run tellraw @a "Scene 2 Dialogue A"
execute if score $start-anim story matches 220..343 as @e[tag=employer-W] at @s run tp @s ~ ~ ~-.3
execute if score $start-anim story matches 343 run setblock 35 103 8 minecraft:redstone_torch
execute if score $start-anim story matches 343 run scoreboard players reset $start-anim story