# ticking function, controls the presentation animation

execute as @a[tag=playing,x=18.6,y=105,z=0.4,distance=...2,y_rotation=110..150,x_rotation=44..70] unless score $intro-anim presentation matches -1.. run scoreboard players set $intro-anim presentation 0
execute if score $intro-anim presentation matches 0.. run scoreboard players add $intro-anim presentation 1
execute if score $intro-anim presentation matches 1 as @a[tag=playing] at @s run stopsound @a[tag=playing] voice
execute if score $intro-anim presentation matches 1 as @a[tag=playing] at @s run schedule clear simondmc:story/intro/audience-noise
execute if score $intro-anim presentation matches 1 as @a[tag=playing] at @s run playsound characters.presentation voice @s
execute if score $intro-anim presentation matches 20 run fill 3 103 14 15 88 -10 light replace structure_void
execute if score $intro-anim presentation matches 20 as @a[tag=playing] at @s run playsound block.glass.place master @s ~ ~ ~ 1 0
execute if score $intro-anim presentation matches 20..59 as @e[tag=boss] at @s run tp @s ~-.2 ~ ~
execute if score $intro-anim presentation matches 20 run scoreboard players set $boss-walking story 1
execute if score $intro-anim presentation matches 60 as @e[tag=boss] at @s run tp @s ~ ~ ~ 0 0
execute if score $intro-anim presentation matches 60 run scoreboard players reset $boss-walking story
execute if score $intro-anim presentation matches 60 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:1}
execute if score $intro-anim presentation matches 84 run tellraw @a[tag=playing] ["",{"text":"[Boss]:","color":"dark_aqua"},{"text":" Hello everyone! I\u2019m so excited to be here today and we promise this will be worth your time.","color":"gray"}]
execute if score $intro-anim presentation matches 205 run tellraw @a[tag=playing] ["",{"text":"[Boss]:","color":"dark_aqua"},{"text":" I\u2019m standing here on behalf of Folio Industries to show you the latest and greatest technology we\u2019ve been working on for the past decade.","color":"gray"}]
execute if score $intro-anim presentation matches 369 run tellraw @a[tag=playing] ["",{"text":"[Boss]:","color":"dark_aqua"},{"text":" I truly believe we\u2019ve got something special on our hands that will revolutionize the way we interact with our world. Here\u2019s what we\u2019ve been working on.","color":"gray"}]
execute if score $intro-anim presentation matches 528 run tellraw @a[tag=playing] ["",{"text":"[Boss]:","color":"dark_aqua"},{"text":" These are Float Arrows. There\u2019s two of them and each one is special in its own way.","color":"gray"}]
execute if score $intro-anim presentation matches 528 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:6}
execute if score $intro-anim presentation matches 528 as @e[tag=boss] run item replace entity @s weapon.mainhand with potato
execute if score $intro-anim presentation matches 528 as @e[tag=boss] run item replace entity @s weapon.offhand with carrot
execute if score $intro-anim presentation matches 632 run tellraw @a[tag=playing] ["",{"text":"[Boss]:","color":"dark_aqua"},{"text":" We\u2019ve got the up arrow, which makes you slowly float upwards when you hold it. And then we\u2019ve got the down arrow, which makes you slowly float downwards.","color":"gray"}]
execute if score $intro-anim presentation matches 640 as @e[tag=boss] run item replace entity @s weapon.mainhand with carrot
execute if score $intro-anim presentation matches 640 as @e[tag=boss] run item replace entity @s weapon.offhand with potato
execute if score $intro-anim presentation matches 640 as @e[tag=boss] run effect give @s levitation infinite 0 true
execute if score $intro-anim presentation matches 718 as @e[tag=boss] run item replace entity @s weapon.mainhand with potato
execute if score $intro-anim presentation matches 718 as @e[tag=boss] run item replace entity @s weapon.offhand with carrot
execute if score $intro-anim presentation matches 718 as @e[tag=boss] run effect give @s slow_falling infinite 0 true
execute if score $intro-anim presentation matches 718 as @e[tag=boss] run effect clear @s levitation
execute if score $intro-anim presentation matches 781 run tellraw @a[tag=playing] ["",{"text":"[Boss]:","color":"dark_aqua"},{"text":" Our research team has found a way to pack so much technology into these little accessories that we\u2019re able to generate a force stronger than gravity.","color":"gray"}]
execute if score $intro-anim presentation matches 953 run tellraw @a[tag=playing] ["",{"text":"[Boss]:","color":"dark_aqua"},{"text":" Now, this is an extremely powerful technology, but it\u2019s our job to be careful and responsible with who we give access to it.","color":"gray"}]
execute if score $intro-anim presentation matches 953 as @e[tag=boss] run item replace entity @s weapon.mainhand with air
execute if score $intro-anim presentation matches 953 as @e[tag=boss] run item replace entity @s weapon.offhand with air
execute if score $intro-anim presentation matches 953 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:1}
execute if score $intro-anim presentation matches 1097 run tellraw @a[tag=playing] ["",{"text":"[Boss]:","color":"dark_aqua"},{"text":" It\u2019s not yet ready for production, but we wanted to demo it to show what\u2019s possible. Let\u2019s take a little break and I\u2019ll answer some questions afterwards.","color":"gray"}]
execute if score $intro-anim presentation matches 1260 run fill 61 105 -45 61 107 -45 air
execute if score $intro-anim presentation matches 1260 run playsound block.chain.break master @a[tag=playing] 61 105 -45 1 0
execute if score $intro-anim presentation matches 1280 run fill 61 105 -44 61 107 -44 air
execute if score $intro-anim presentation matches 1280 run fill 61 105 -46 61 107 -46 air
execute if score $intro-anim presentation matches 1280 run playsound block.chain.break master @a[tag=playing] 61 105 -45 1 0
execute if score $intro-anim presentation matches 1260 as @e[tag=boss] at @s run tp @s ~ ~ ~ -90 0
execute if score $intro-anim presentation matches 1270 run scoreboard players set $boss-walking story 1
execute if score $intro-anim presentation matches 1270..1309 as @e[tag=boss] at @s run tp @s ~.2 ~ ~
execute if score $intro-anim presentation matches 1309 run scoreboard players reset $boss-walking story
execute if score $intro-anim presentation matches 1309 run scoreboard players set $intro-anim presentation -1

# boss walking animation
scoreboard players set $CONST_3 story 3
scoreboard players set $CONST_8 story 8
execute if score $boss-walking story matches 1 run scoreboard players add $boss-walk-tick story 1
execute if score $boss-walking story matches 1 run scoreboard players operation $boss-walk-phase story = $boss-walk-tick story
execute if score $boss-walking story matches 1 run scoreboard players operation $boss-walk-phase story -= $CONST_1 story
execute if score $boss-walking story matches 1 run scoreboard players operation $boss-walk-phase story /= $CONST_3 story
execute if score $boss-walking story matches 1 run scoreboard players operation $boss-walk-phase story %= $CONST_8 story
execute if score $boss-walking story matches 1 if score $boss-walk-phase story matches 0 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:5}
execute if score $boss-walking story matches 1 if score $boss-walk-phase story matches 1 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:5}
execute if score $boss-walking story matches 1 if score $boss-walk-phase story matches 2 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:4}
execute if score $boss-walking story matches 1 if score $boss-walk-phase story matches 3 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:1}
execute if score $boss-walking story matches 1 if score $boss-walk-phase story matches 4 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:2}
execute if score $boss-walking story matches 1 if score $boss-walk-phase story matches 5 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:3}
execute if score $boss-walking story matches 1 if score $boss-walk-phase story matches 6 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:2}
execute if score $boss-walking story matches 1 if score $boss-walk-phase story matches 7 as @e[tag=boss] run item replace entity @s armor.head with white_candle{CustomModelData:1}