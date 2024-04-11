# ticking functions, handles all the stuff in the ending room

# play original float
execute as @a if score @s endtrigger matches 230419 run playsound ui.button.click master @s -2 66 -7
execute as @a if score @s endtrigger matches 230419 run tellraw @s ["",{"text":"Play the original Float!","bold":true,"color":"yellow"},{"text":"\n\n"},{"text":"The story of this map is based on an old (and frankly low-effort) minigame map I made 5 years ago. If you nonetheless want to play it to understand the context of this map, you can do so ","color":"green"},{"text":"here","bold":true,"color":"aqua","clickEvent":{"action":"open_url","value":"https://simondmc.com/float"}},{"text":"!","color":"green"}] 

# spectator mode
execute as @a if score @s endtrigger matches 573214 run playsound ui.button.click master @s -5 66 -10
execute as @a if score @s endtrigger matches 573214 run gamemode spectator @s

# give feedback
execute as @a if score @s endtrigger matches 433684 run playsound ui.button.click master @s -5 66 -4
execute as @a if score @s endtrigger matches 433684 run tellraw @s ["",{"text":"Give Feedback","bold":true,"color":"yellow"},{"text":"\n\n"},{"text":"Have feedback to share? I'd love to hear it! Let me know what you liked, disliked, if you found any bugs or anything else ","color":"green"},{"text":"here","bold":true,"color":"aqua","clickEvent":{"action":"open_url","value":"https://simondmc.com/floating-away/feedback"}},{"text":"!","color":"green"}]

# click armor stand
execute as @e[tag=creator-stand-int] if data entity @s interaction on target run playsound ui.button.click master @s
execute as @e[tag=creator-stand-int] if data entity @s interaction on target run tellraw @s ["",{"text":"\n"},{"text":"Map by SimonDMC","bold":true,"color":"yellow"},{"text":"\n"},{"text":"> simondmc.com","color":"green","clickEvent":{"action":"open_url","value":"https://simondmc.com"}},{"text":"\n"},{"text":"> youtube.com/SimonDMC","color":"red","clickEvent":{"action":"open_url","value":"https://youtube.com/SimonDMC"}},{"text":"\n\n"},{"text":"Dedicated to ","color":"#A1A1FF"},{"text":"PoldsSlippers","color":"blue","clickEvent":{"action":"open_url","value":"https://youtube.com/PoldsSlippers"}},{"text":"\n\n"},{"text":"Listen to the original soundtrack ","color":"yellow","clickEvent":{"action":"open_url","value":"https://example.com"}},{"text":"here","bold":true,"color":"green","clickEvent":{"action":"open_url","value":"https://example.com"}},{"text":"!","color":"yellow","clickEvent":{"action":"open_url","value":"https://example.com"}},{"text":"\n\n"},{"text":"More of my maps:","color":"#88FF73"},{"text":" simondmc.com/maps","color":"green"}]
execute as @e[tag=creator-stand-int] run data remove entity @s interaction

# allow clicking if ended
scoreboard players reset @a endtrigger
execute if score $done story matches 1 run scoreboard players enable @a endtrigger

# particles
particle minecraft:cloud -7.5 68.5 -6.5 0.1 0.1 0.2 0 1
particle minecraft:rain -7.5 68.5 -6.5 0.1 0.1 0.2 0 3