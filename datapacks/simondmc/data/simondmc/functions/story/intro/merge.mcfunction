# called by simondmc:story/intro/work whenever the player combines the items by swapping hands

clear @s feather
item replace entity @s weapon.offhand with feather{display:{Name:'{"text":"Combined Item","italic":false}'},CustomModelData:3}
# click sound
execute at @s run playsound ui.button.click master @a ~ ~ ~ 1 2
# increment tutorial
execute if score $tutorial-phase work matches 3 run scoreboard players set $tutorial-phase work 4