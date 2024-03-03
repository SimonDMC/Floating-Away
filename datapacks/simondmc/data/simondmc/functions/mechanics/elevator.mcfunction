# ticking function, controls the elevator at the start

execute if block 63 106 -44 minecraft:stone_button[powered=true] run scoreboard players set $start elevator 0
execute if score $start elevator matches 0.. run scoreboard players add $start elevator 1
execute if score $start elevator matches 1 run setblock 63 106 -44 air
# tp to destination elevator
execute if score $start elevator matches 1 as @a at @s run tp @s ~8 ~-19 ~-32
execute if score $start elevator matches 1 as @a at @s run playsound block.stone.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 21 as @a at @s run tp @s ~ ~1 ~
execute if score $start elevator matches 21 as @a at @s run playsound block.stone.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 41 as @a at @s run tp @s ~ ~1 ~
execute if score $start elevator matches 41 as @a at @s run playsound block.stone.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 61 as @a at @s run tp @s ~ ~1 ~
execute if score $start elevator matches 61 as @a at @s run playsound block.stone.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 81 as @a at @s run fill 69 85 -77 69 87 -77 air
execute if score $start elevator matches 81 as @a at @s run playsound block.chain.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 101 as @a at @s run fill 69 85 -76 69 87 -78 air
execute if score $start elevator matches 101 as @a at @s run playsound block.chain.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 101 run scoreboard players reset $start elevator