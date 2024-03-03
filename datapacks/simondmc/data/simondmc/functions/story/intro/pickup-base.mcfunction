# called by simondmc:story/intro/work whenever the conveyor item is left clicked

# don't pick it up if the player already has a base or merged
execute on attacker if entity @s[nbt={Inventory:[{id:"minecraft:feather",tag:{CustomModelData:1}}]}] run return 0
execute on attacker if entity @s[nbt={Inventory:[{id:"minecraft:feather",tag:{CustomModelData:3}}]}] run return 0
execute on attacker run item replace entity @s weapon.offhand with feather{display:{Name:'{"text":"Conveyor Item","italic":false}'},CustomModelData:1}
execute at @s run kill @e[tag=tech-base,limit=1,sort=nearest]
kill @s
# increment tutorial
execute if score $tutorial-phase work matches 1 run scoreboard players set $tutorial-phase work 2
# skip chip tutorial if already holding
execute if score $tutorial-phase work matches 2 if entity @s[nbt={Inventory:[{id:"minecraft:feather",tag:{CustomModelData:2}}]}] run scoreboard players set $tutorial-phase work 3