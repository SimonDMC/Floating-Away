# ticking functions, handles all the stuff in the ending room

# play original float
execute as @a if score @s endtrigger matches 230419 run tellraw @s ["",{"text":"Play the original Float!","bold":true,"color":"yellow"},{"text":"\n\n"},{"text":"The story of this map is based on an old (and frankly low-effort) minigame map I made 5 years ago. If you nonetheless want to play it to understand the context of this map, you can do so ","color":"green"},{"text":"here","bold":true,"color":"aqua","clickEvent":{"action":"open_url","value":"https://simondmc.com/float"}},{"text":"!","color":"green"}] 

# spectator mode
execute as @a if score @s endtrigger matches 573214 run gamemode spectator @s

# give feedback
execute as @a if score @s endtrigger matches 433684 run tellraw @s ["",{"text":"Give Feedback","bold":true,"color":"yellow"},{"text":"\n\n"},{"text":"Have feedback to share? I'd love to hear it! Let me know what you liked, disliked, if you found any bugs or anything else ","color":"green"},{"text":"here","bold":true,"color":"aqua","clickEvent":{"action":"open_url","value":"https://simondmc.com/folio-industries/feedback"}},{"text":"!","color":"green"}]

# allow clicking if ended
scoreboard players reset @a endtrigger
execute if score $done story matches 1 run scoreboard players enable @a endtrigger

# particles
particle minecraft:cloud -7.5 68.5 -6.5 0.1 0.1 0.2 0 1
particle minecraft:rain -7.5 68.5 -6.5 0.1 0.1 0.2 0 3