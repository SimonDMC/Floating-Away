# called by simondmc:start/start-area after clicking the start text

tellraw @s ["",{"text":"------------------","bold":true,"strikethrough":true,"color":"yellow"},{"text":"\n\n \u0020 \u0020 \u0020 "},{"text":"Start the map","color":"green","clickEvent":{"action":"run_command","value":"/function simondmc:start"}},{"text":"\n\n"},{"text":"------------------","bold":true,"strikethrough":true,"color":"yellow"}]
execute at @s run playsound ui.button.click master @s