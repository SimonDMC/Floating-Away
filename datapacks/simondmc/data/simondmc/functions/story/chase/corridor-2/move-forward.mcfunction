# called by simondmc:story/chase/corridor-2/corridor-2-guards, moves a corridor 2 guard forward to fall into the
# underground tunnel if the trapdoor isn't closed

# modifies X-position instead of teleporting because TP cancels y-momentum
execute store result score $guard.x guards run data get entity @s Pos[0] 1000
scoreboard players add $guard.x guards 60
execute store result entity @s Pos[0] double 0.001 run scoreboard players get $guard.x guards