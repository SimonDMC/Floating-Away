# called by simondmc:story/intro/work whenever the chip basked is right clicked

# don't pick it up if the player already has one or an item in their mainhand
execute on target if entity @s[nbt={Inventory:[{id:"minecraft:feather",tag:{CustomModelData:2}}]}] run return 0
execute on target if entity @s[nbt={SelectedItem:{}}] run return 0
execute on target run item replace entity @s weapon.mainhand with feather{display:{Name:'{"text":"Chip","italic":false}'},CustomModelData:2}
# increment tutorial
execute if score $tutorial-phase work matches 2 run scoreboard players set $tutorial-phase work 3