# ticking function, controls the ending elevator

# allow passthrough
execute if score $quartz-anim-4 guards matches 50 run fill -3 38 -6 -3 40 -8 air
# open doors
execute if score $quartz-anim-4 guards matches 50 as @e[tag=end-elevator-door,tag=door-left] run data merge entity @s {start_interpolation:0,interpolation_duration:40,transformation:{translation:[-0.5f,-0.5f,1.1f]}}
execute if score $quartz-anim-4 guards matches 50 as @e[tag=end-elevator-door,tag=door-right] run data merge entity @s {start_interpolation:0,interpolation_duration:40,transformation:{translation:[-0.5f,-0.5f,-2.1f]}}

# KILL the player if they somehow snuck into the elevator without blocking themselves in
execute as @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=..1.3] unless entity @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=1.3..] if blocks -2 38 -8 29 39 -6 -2 42 -8 masked run damage @s 100 arrow by @e[tag=quartz-guard,limit=1]
# block passthrough (but allow arrows :D)
execute as @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=..1.3] unless entity @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=1.3..] unless score $closing elevator matches 1 run fill -3 38 -6 -3 40 -8 barrier
# moving pistons are so that you can't place blocks in there and start building inside of the elevator haha
execute as @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=..1.3] unless entity @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=1.3..] unless score $closing elevator matches 1 run fill -3 39 -6 -3 39 -8 moving_piston
# close doors
execute as @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=..1.3] unless entity @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=1.3..] unless score $closing elevator matches 1 as @e[tag=end-elevator-door] run data merge entity @s {start_interpolation:0,interpolation_duration:40,transformation:{translation:[-0.5f,-0.5f,-0.5f]}}
# queue up ending music segment
execute as @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=..1.3] unless entity @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=1.3..] unless score $closing elevator matches 1 run scoreboard players set $67-queued music 1
execute as @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=..1.3] unless entity @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=1.3..] unless score $closing elevator matches 1 run tellraw @a[tag=playing,tag=music-debug] "queueing 6-7"
execute as @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=..1.3] unless entity @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=1.3..] unless score $closing elevator matches 1 run scoreboard players set $end elevator 0
execute as @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=..1.3] unless entity @a[tag=playing,x=-4.5,y=38,z=-6.5,distance=1.3..] unless score $closing elevator matches 1 run scoreboard players set $closing elevator 1
# anim
execute if score $track music matches 67 run scoreboard players add $track-67-timer music 1
execute if score $end elevator matches 0.. run scoreboard players add $end elevator 1
# reset give up trigger
execute if score $end elevator matches 0 run scoreboard players set $quartz-anim-4 guards 401
execute if score $end elevator matches 0 run scoreboard players reset @a[tag=playing] give-up-trigger
# tp player to floor if they're mid-jump or something
execute if score $end elevator matches 51 as @a[tag=playing] at @s run tp @s ~ 38 ~
execute if score $end elevator matches 51 run effect give @a[tag=playing] jump_boost 1 200 true
# elevate player
execute if score $end elevator matches 51 run effect give @a[tag=playing] levitation infinite 1 true
execute if score $end elevator matches 51..363 as @a[tag=playing,x=-6.0,y=66.7,z=-8.0,dy=1,dx=3,dz=3] run effect clear @s levitation
# elevate blocks
execute if score $end elevator matches 56 as @e[tag=end-elevator] run data merge entity @s {start_interpolation:0,interpolation_duration:297,transformation:{translation:[-0.5f,26.49f,-0.5f]}}
# title credits
execute if score $track-67-timer music matches 260 run title @a[tag=playing] times 0 1000 0
execute if score $track-67-timer music matches 265 run title @a[tag=playing] title {"text":"Floating Away","color":"#9DFDFF"}
execute if score $track-67-timer music matches 298 run title @a[tag=playing] subtitle ["",{"text":"by "},{"text":"SimonDMC","color":"green"}]
execute if score $track-67-timer music matches 330 as @e[tag=ending-stand] run data merge entity @s {CustomNameVisible:1b}
execute if score $track-67-timer music matches 330 run title @a[tag=playing] clear
# stats
execute if score $track-67-timer music matches 330 as @a[tag=playing] at @s run playsound entity.experience_orb.pickup master @a[tag=playing] ~ ~ ~ 1 2
execute if score $track-67-timer music matches 330 run tellraw @a[tag=playing] [{"text":""},{"text":"Stats","bold":true,"color":"yellow"},{"text":"\n\n"},{"text":"Time Played:","color":"yellow"},{"text":" "},{"score":{"name":"$hours","objective":"stats"},"color":"green"},{"text":"h ","color":"green"},{"score":{"name":"$minutes","objective":"stats"},"color":"green"},{"text":"m ","color":"green"},{"score":{"name":"$seconds","objective":"stats"},"color":"green"},{"text":"s","color":"green"},{"text":"\n"},{"text":"Deaths: ","color":"yellow"},{"score":{"name":"$deaths","objective":"stats"},"color":"green"}]
# reached the top
execute if score $end elevator matches 353 run fill -6 64 -8 -4 64 -6 minecraft:quartz_block
execute if score $end elevator matches 353 run setblock -5 64 -7 minecraft:gold_block
# there are STILL ways to block yourself from reaching the top so tp to the top if still in elevator shaft
execute if score $end elevator matches 356 as @a[tag=playing] unless predicate simondmc:in-end run tp @s -4.5 65 -6.5 90 0
# prune old guards because they target if you up arrow to the top
execute if score $end elevator matches 353 run kill @e[tag=vent-guard]
execute if score $end elevator matches 353 run scoreboard players set $done story 1
execute if score $end elevator matches 353 run scoreboard players set $phase story 8
# failsafe levitation clear because it was sometimes failing but i think it's good now (?) still here just to make sure i guess
execute if score $end elevator matches 356 run effect clear @a[tag=playing] levitation
# ok but what if the music breaks
execute if score $end elevator matches 353 unless score $track music matches 67 run stopsound @a[tag=playing] ambient
execute if score $end elevator matches 353 unless score $track music matches 67 as @a[tag=playing] at @s run playsound music.floating-away-ending ambient @s
execute if score $end elevator matches 353 unless score $track music matches 67 run scoreboard players set $track music 67