# ticking function, controls the elevator at the start

execute if block 63 106 -44 minecraft:stone_button[powered=true] run scoreboard players set $start elevator 0
execute if score $start elevator matches 0.. run scoreboard players add $start elevator 1
execute if score $start elevator matches 1 run setblock 63 106 -44 air
# spawn float arrows for chase
execute if score $start elevator matches 1 run summon minecraft:item_display 7.5 88.0315 -8.125 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[0.7010574f,0.09229595f,-0.09229595f,0.7010574f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.5999997f,0.5999997f],translation:[0.0f,0.0f,0.0f]}}
execute if score $start elevator matches 1 run summon minecraft:item_display 7.0 88.0 -8.5 {Tags:["display","float-arrow"],item:{Count:1b,id:"minecraft:carrot"},transformation:{left_rotation:[-0.09841033f,-0.7002252f,0.7002252f,-0.09841033f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.59999996f,0.59999937f,0.59999937f],translation:[0.0f,0.0f,0.0f]}}
# get everyone who isn't in the elevator in
execute if score $start elevator matches 1 run tp @a[tag=playing,predicate=!simondmc:first-elevator] @r[tag=playing,predicate=simondmc:first-elevator]
# tp to destination elevator
execute if score $start elevator matches 1 as @a[tag=playing] at @s run tp @s ~8 ~-19 ~-32
execute if score $start elevator matches 1 as @a[tag=playing] at @s run playsound block.stone.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 21 as @a[tag=playing] at @s run tp @s ~ ~1 ~
execute if score $start elevator matches 21 as @a[tag=playing] at @s run playsound block.stone.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 41 as @a[tag=playing] at @s run tp @s ~ ~1 ~
execute if score $start elevator matches 41 as @a[tag=playing] at @s run playsound block.stone.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 61 as @a[tag=playing] at @s run tp @s ~ ~1 ~
execute if score $start elevator matches 61 as @a[tag=playing] at @s run playsound block.stone.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 81 as @a[tag=playing] at @s run fill 69 85 -77 69 87 -77 air
execute if score $start elevator matches 81 as @a[tag=playing] at @s run playsound block.chain.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 101 as @a[tag=playing] at @s run fill 69 85 -76 69 87 -78 air
execute if score $start elevator matches 101 as @a[tag=playing] at @s run playsound block.chain.break master @s ~ ~ ~ 1 0
execute if score $start elevator matches 121 run stopsound @a[tag=playing] ambient
execute if score $start elevator matches 121 as @a[tag=playing] at @s run playsound music.ground-level ambient @s
execute if score $start elevator matches 121 run scoreboard players set $track music 3
execute if score $start elevator matches 121 run scoreboard players reset $start elevator