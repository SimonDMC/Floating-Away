# ticking function, controls the large trapdoor in corridor 2

execute as @e[tag=trapdoor-lever-int] if data entity @s interaction unless score $closed trapdoor matches 1 run fill -14 71 32 -14 71 30 minecraft:iron_trapdoor[open=false,facing=west,half=top]
execute as @e[tag=trapdoor-lever-int] if data entity @s interaction unless score $closed trapdoor matches 1 run fill -15 71 32 -15 71 30 minecraft:iron_trapdoor[open=false,facing=east,half=top]
execute as @e[tag=trapdoor-lever-int] if data entity @s interaction unless score $closed trapdoor matches 1 run playsound minecraft:block.iron_trapdoor.close block @a[tag=playing] -14 71 31
execute as @e[tag=trapdoor-lever-int] if data entity @s interaction unless score $closed trapdoor matches 1 run playsound minecraft:block.lever.click block @a[tag=playing] -14 68 31
execute as @e[tag=trapdoor-lever-int] if data entity @s interaction unless score $closed trapdoor matches 1 as @e[tag=trapdoor-lever] run data merge entity @s {block_state:{Properties:{powered:"false"}}}
execute as @e[tag=trapdoor-lever-int] if data entity @s interaction unless score $closed trapdoor matches 1 run scoreboard players set $closed trapdoor 1
execute as @e[tag=trapdoor-lever-int] if data entity @s interaction run data remove entity @s interaction