# called by simondmc:start/start-area after clicking the info text

scoreboard players set $info-anim start 0
execute at @s run playsound ui.button.click master @s
scoreboard players set $read-info start 1