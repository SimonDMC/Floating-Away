# called by simondmc:story/intro/work whenever the player left clicks one of the conveyor spots

# only place down if player has a merged item
execute on attacker unless entity @s[nbt={Inventory:[{id:"minecraft:feather",Slot:-106b,tag:{CustomModelData:3}}]}] run return 0
execute on attacker run item replace entity @s weapon.offhand with air
scoreboard players add $merged work 1
# spawn item
execute at @s run summon minecraft:item_display ~ ~0.5 ~ {Tags:["display","tech-merged","conveyor-item"],item:{Count:1b,id:"minecraft:feather",tag:{CustomModelData:3,display:{Name:'{"text":"item/tech-merged","italic":false,"color":"yellow"}'}}},transformation:{left_rotation:[0.0f,-0.3826835f,0.0f,0.9238795f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0000001f,0.9999999f,1.0000001f],translation:[0.0f,0.0f,0.0f]}}
# end tutorial and start next anim
scoreboard players reset $tutorial-phase work
execute if score $phase story matches 3 run scoreboard players set $employer-leave-anim work 0
# transition to cutscene if 8th completion
execute if score $merged work matches 8 run scoreboard players set $shift-end-anim work 0