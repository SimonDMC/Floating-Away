scoreboard players reset @a timewarper
scoreboard players set #global timewarper 1
execute as @a at @s run playsound minecraft:block.respawn_anchor.charge master @s
function simondmc:time-warper/macro {"command": "tick rate 5"}