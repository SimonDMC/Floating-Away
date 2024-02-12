scoreboard players reset @a timewarper
scoreboard players set #global timewarper 0
execute as @a at @s run playsound minecraft:block.respawn_anchor.deplete master @s
function simondmc:time-warper/macro {"command": "tick rate 20"}