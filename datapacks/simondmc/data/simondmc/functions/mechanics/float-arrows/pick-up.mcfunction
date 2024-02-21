# called by simondmc:mechanics/float-arrows/sys, checks for pickup of float arrows

# right click
execute if data entity @s interaction at @s on target run give @s carrot{display:{Name:'{"text":"Up","italic":false}'}}
execute if data entity @s interaction at @s on target run give @s potato{display:{Name:'{"text":"Down","italic":false}'}}
execute if data entity @s interaction run kill @e[tag=float-arrow]
execute if data entity @s interaction run kill @s

# left click (make sure they don't get two though)
execute if data entity @s attack unless data entity @s interaction at @s on attacker run give @s carrot{display:{Name:'{"text":"Up","italic":false}'}}
execute if data entity @s attack unless data entity @s interaction at @s on attacker run give @s potato{display:{Name:'{"text":"Down","italic":false}'}}
execute if data entity @s attack run kill @e[tag=float-arrow]
execute if data entity @s attack run kill @s
