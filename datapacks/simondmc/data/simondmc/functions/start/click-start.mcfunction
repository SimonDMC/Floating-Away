# called by simondmc:start/start-area after clicking the start text

execute at @s run playsound ui.button.click master @s

# haven't read info yet
execute unless score $read-info start matches 1 run tellraw @s {"text": "Read the info first!","color": "red"}
execute unless score $read-info start matches 1 run return 0

# have read info
tellraw @s ["",{"text":"+","bold":true,"color":"yellow"},{"text":"------------------","bold":true,"strikethrough":true,"color":"yellow"},{"text":"+","bold":true,"color":"yellow"},{"text":"\n","color":"yellow"},{"text":"\u2305|","bold":true,"color":"yellow"},{"text":"                          |","bold":true,"color":"yellow"},{"text":"\n","color":"yellow"},{"text":"\u2305|","bold":true,"color":"yellow"},{"text":"     \u2305\u2305\u2305  Start the map       \u2305\u2305\u2305","color":"green","clickEvent":{"action":"run_command","value":"/function simondmc:start"}},{"text":"|","bold":true,"color":"yellow"},{"text":"\n","color":"yellow"},{"text":"\u2305|","bold":true,"color":"yellow"},{"text":"                          |","bold":true,"color":"yellow"},{"text":"\n","color":"yellow"},{"text":"+","bold":true,"color":"yellow"},{"text":"------------------","bold":true,"strikethrough":true,"color":"yellow"},{"text":"+","bold":true,"color":"yellow"}]