# ticking function, controls the clickables in the starting area/lobby

# start
# if you're wondering why there's a tellraw instead of directly starting the map its explained in simondmc:mechanics/time-warper/sys
execute as @e[tag=start-int] if data entity @s interaction on target run function simondmc:start/click-start
execute as @e[tag=start-int] if data entity @s attack unless data entity @s interaction on attacker run function simondmc:start/click-start
execute as @e[tag=start-int] if data entity @s interaction run data remove entity @s interaction
execute as @e[tag=start-int] if data entity @s attack run data remove entity @s attack

# info
execute as @e[tag=info-int] if data entity @s interaction on target run function simondmc:start/click-info
execute as @e[tag=info-int] if data entity @s attack unless data entity @s interaction on attacker run function simondmc:start/click-info
execute as @e[tag=info-int] if data entity @s interaction run data remove entity @s interaction
execute as @e[tag=info-int] if data entity @s attack run data remove entity @s attack

# creator
execute as @e[tag=creator-int] if data entity @s interaction on target run function simondmc:start/click-creator
execute as @e[tag=creator-int] if data entity @s attack unless data entity @s interaction on attacker run function simondmc:start/click-creator
execute as @e[tag=creator-int] if data entity @s interaction run data remove entity @s interaction
execute as @e[tag=creator-int] if data entity @s attack run data remove entity @s attack