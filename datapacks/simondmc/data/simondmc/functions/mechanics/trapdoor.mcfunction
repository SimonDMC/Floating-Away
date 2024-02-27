# ticking function, controls the large trapdoor in corridor 2

execute if block -14 70 31 lever[powered=true] run fill -14 71 32 -14 71 30 minecraft:iron_trapdoor[open=true,facing=west,half=top] 
execute if block -14 70 31 lever[powered=true] run fill -15 71 32 -15 71 30 minecraft:iron_trapdoor[open=true,facing=east,half=top]
execute if block -14 70 31 lever[powered=true] run scoreboard players reset $closed trapdoor
execute if block -14 70 31 lever[powered=false] run fill -14 71 32 -14 71 30 minecraft:iron_trapdoor[open=false,facing=west,half=top]
execute if block -14 70 31 lever[powered=false] run fill -15 71 32 -15 71 30 minecraft:iron_trapdoor[open=false,facing=east,half=top]
execute if block -14 70 31 lever[powered=false] unless score $closed trapdoor matches 1 run playsound minecraft:block.iron_trapdoor.close master @a -14 71 31
execute if block -14 70 31 lever[powered=false] run scoreboard players set $closed trapdoor 1