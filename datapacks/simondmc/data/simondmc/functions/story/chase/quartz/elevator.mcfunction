# ticking function, controls the ending elevator

# allow passthrough
execute if score $quartz-anim-4 guards matches 50 run fill -3 38 -6 -3 40 -8 air
# open doors
execute if score $quartz-anim-4 guards matches 50 as @e[tag=end-elevator-door,tag=door-left] run data merge entity @s {start_interpolation:0,interpolation_duration:40,transformation:{translation:[-0.5f,-0.5f,1.1f]}}
execute if score $quartz-anim-4 guards matches 50 as @e[tag=end-elevator-door,tag=door-right] run data merge entity @s {start_interpolation:0,interpolation_duration:40,transformation:{translation:[-0.5f,-0.5f,-2.1f]}}

# block passthrough (but allow arrows :D)
execute as @a[x=-4.5,y=38,z=-6.5,distance=..1] unless score $end elevator matches 0.. run fill -3 38 -6 -3 38 -8 barrier
execute as @a[x=-4.5,y=38,z=-6.5,distance=..1] unless score $end elevator matches 0.. run fill -3 40 -6 -3 40 -8 barrier
# close doors
execute as @a[x=-4.5,y=38,z=-6.5,distance=..1] unless score $end elevator matches 0.. as @e[tag=end-elevator-door] run data merge entity @s {start_interpolation:0,interpolation_duration:40,transformation:{translation:[-0.5f,-0.5f,-0.5f]}}
# anim
execute as @a[x=-4.5,y=38,z=-6.5,distance=..1] unless score $end elevator matches 0.. run scoreboard players set $end elevator 0
execute if score $end elevator matches 0.. run scoreboard players add $end elevator 1
# elevate player
execute if score $end elevator matches 50 run effect give @a levitation infinite 1 true
execute if score $end elevator matches 50..362 as @a[x=-6.0,y=66.7,z=-8.0,dy=1,dx=3,dz=3] run effect clear @s levitation
# elevate blocks
execute if score $end elevator matches 55 as @e[tag=end-elevator] run data merge entity @s {start_interpolation:0,interpolation_duration:297,transformation:{translation:[-0.5f,26.49f,-0.5f]}}
# reached the top
execute if score $end elevator matches 300 as @e[tag=ending-stand] run data merge entity @s {CustomNameVisible:1b}
execute if score $end elevator matches 352 run fill -6 64 -8 -4 64 -6 minecraft:quartz_block
execute if score $end elevator matches 352 run setblock -5 64 -7 minecraft:gold_block
# prune old guards because they target if you up arrow to the top
execute if score $end elevator matches 352 run kill @e[tag=vent-guard]
execute if score $end elevator matches 352 run setblock -5 64 -7 minecraft:gold_block
execute if score $end elevator matches 362 run scoreboard players set $done story 1
execute if score $end elevator matches 362 run scoreboard players set $phase story 8
execute if score $end elevator matches 362 run scoreboard players reset $end elevator