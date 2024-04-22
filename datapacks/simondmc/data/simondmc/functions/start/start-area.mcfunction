# ticking function, controls the starting area

# start
# if you're wondering why there's a tellraw instead of directly starting the map its explained in simondmc:mechanics/time-warper/sys
execute as @e[tag=start-int] if data entity @s interaction on target run function simondmc:start/click-start
execute as @e[tag=start-int] if data entity @s attack unless data entity @s interaction on attacker run function simondmc:start/click-start
execute as @e[tag=start-int] if data entity @s interaction run data remove entity @s interaction
execute as @e[tag=start-int] if data entity @s attack run data remove entity @s attack

# info
execute as @e[tag=info-int] if data entity @s interaction on target run function simondmc:start/click-info
execute as @e[tag=info-int] if data entity @s attack unless data entity @s interaction on attacker run function simondmc:start/click-info
execute as @e[tag=info-int] if data entity @s interaction run data remove entity @s interaction
execute as @e[tag=info-int] if data entity @s attack run data remove entity @s attack

# creator
execute as @e[tag=creator-int] if data entity @s interaction on target run function simondmc:start/click-creator
execute as @e[tag=creator-int] if data entity @s attack unless data entity @s interaction on attacker run function simondmc:start/click-creator
execute as @e[tag=creator-int] if data entity @s interaction run data remove entity @s interaction
execute as @e[tag=creator-int] if data entity @s attack run data remove entity @s attack

# wrong mc version warning
execute store result score $mc-version start run data get entity @r DataVersion
execute unless score version intro matches 3700 unless score $wrong-version start matches 1 run tellraw @a ["",{"text":"------------------------------------------","bold":true,"strikethrough":true,"color":"red"},{"text":"\n"},{"text":"WARNING:","bold":true,"color":"dark_red"},{"text":" You are playing on the wrong Minecraft version.","color":"yellow"},{"text":"\n"},{"text":"This map ","color":"yellow"},{"text":"WILL NOT","bold":true,"color":"red"},{"text":" work on any version other than ","color":"yellow"},{"text":"1.20.4","bold":true,"color":"green"},{"text":".\nPlease switch versions and ","color":"yellow"},{"text":"reinstall the map","bold":true,"color":"green"},{"text":".","color":"yellow"},{"text":"\n"},{"text":"------------------------------------------","bold":true,"strikethrough":true,"color":"red"}]
execute unless score version intro matches 3700 unless score $wrong-version start matches 1 run kill @e[tag=start-int]
execute unless score version intro matches 3700 unless score $wrong-version start matches 1 run scoreboard players set $wrong-version start 1

# info anim
execute if score $info-anim start matches 0.. run scoreboard players add $info-anim start 1
execute if score $info-anim start matches 1 run tellraw @a ["",{"text":"> ","color":"green"},{"text":"Adjust ","color":"yellow"},{"text":"Voice Acting ","color":"light_purple"},{"text":"in ","color":"yellow"},{"text":"Music & Sounds ","color":"green"},{"text":"(recommended 40%)","color":"gray"}]
execute if score $info-anim start matches 21 run tellraw @a ["",{"text":"> ","color":"green"},{"text":"Adjust the ","color":"yellow"},{"text":"Soundtrack ","color":"light_purple"},{"text":"in ","color":"yellow"},{"text":"Music & Sounds ","color":"green"},{"text":"(recommended 20%)","color":"gray"}]
execute if score $info-anim start matches 41 run tellraw @a ["",{"text":"> ","color":"green"},{"text":"Reload the resource pack ","color":"yellow"},{"text":"(F3+T)","bold":true,"color":"gold"},{"text":" before starting\n  to preload all sounds","color":"yellow"}]
execute if score $info-anim start matches 81 run tellraw @a ["",{"text":"> ","color":"green"},{"text":"This map is linear, so you won't need to backtrack","color":"yellow"}]
execute if score $info-anim start matches 101 run tellraw @a ["",{"text":"> ","color":"green"},{"text":"If you need help, run ","color":"yellow"},{"text":"/trigger walkthrough","color":"green"}]
execute if score $info-anim start matches 121 run tellraw @a ["",{"text":"> ","color":"green"},{"text":"The ","color":"yellow"},{"text":"original soundtrack","underlined":true,"color":"yellow","clickEvent":{"action":"open_url","value":"https://youtu.be/Wl1DP8Bj03M"},"hoverEvent":{"action":"show_text","contents":"Click to open the soundtrack!"}},{"text":" is fully ","color":"yellow"},{"text":"copyright-free","color":"green"}]

# chair
execute as @e[tag=chair-int] if data entity @s interaction on target run tp @s 28.8 94.5 -59.5 -90 0
execute as @e[tag=chair-int] if data entity @s interaction on target run ride @s mount @e[tag=lobby-chair,limit=1]
execute as @e[tag=chair-int] if data entity @s interaction run data remove entity @s interaction

# make sure player knows to dismount chair
execute as @e[tag=lobby-chair] on passengers run title @s actionbar ["",{"text":"Press "},{"keybind":"key.sneak"},{"text":" to Stand Up"}]

# sometimes the chair disappears so lets try to fix that (?)
execute unless entity @e[tag=lobby-chair] run summon armor_stand 28.8 92.6 -59.5 {Tags:["character","lobby-chair"],NoGravity:1b,Invisible:1b,DisabledSlots:4144959}