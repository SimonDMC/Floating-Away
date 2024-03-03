# ticking function, controls the presentation animation

execute as @a[x=18.6,y=105,z=0.4,distance=...2] unless score $intro-anim presentation matches -1.. run scoreboard players set $intro-anim presentation 0
execute if score $intro-anim presentation matches 0.. run scoreboard players add $intro-anim presentation 1
execute if score $intro-anim presentation matches 1 run tellraw @a "Presentation Dialogue"
execute if score $intro-anim presentation matches 100 run fill 61 105 -46 61 107 -44 air
execute if score $intro-anim presentation matches 100 run scoreboard players set $intro-anim presentation -1