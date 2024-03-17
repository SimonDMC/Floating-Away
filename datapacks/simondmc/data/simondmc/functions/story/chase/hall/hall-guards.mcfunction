# ticking function, handles the guards in the presentation hall

# animation
execute if score $hall-anim guards matches 0.. run scoreboard players add $hall-anim guards 1
# looky look
execute if score $hall-anim guards matches 0.. as @e[tag=hall-guard] at @s run tp @s ~ ~ ~ facing entity @p
# start shooting slow(er)
execute if score $hall-anim guards matches 1 run scoreboard players set $SHOOT-PERIOD guards 10
execute if score $hall-anim guards matches 1 run scoreboard players set $DAMAGE guards 6
# open door
execute if score $hall-anim guards matches 20 run setblock 19 83 -5 redstone_torch
# guards in
execute if score $hall-anim guards matches 30 run scoreboard players set $override guard-walk-anim 1
execute if score $hall-anim guards matches 30..33 as @e[tag=hall-guard-L] at @s run tp @s ~ ~ ~-0.2
execute if score $hall-anim guards matches 30..33 as @e[tag=hall-guard-R] at @s run tp @s ~ ~ ~0.2 
execute if score $hall-anim guards matches 43..52 as @e[tag=hall-guard] at @s run tp @s ~-.2 ~ ~
execute if score $hall-anim guards matches 62..65 as @e[tag=hall-guard-L] at @s run tp @s ~ ~ ~0.2
execute if score $hall-anim guards matches 62..65 as @e[tag=hall-guard-R] at @s run tp @s ~ ~ ~-0.2
execute if score $hall-anim guards matches 65 run scoreboard players reset $override guard-walk-anim
# guards start shooting
execute if score $hall-anim guards matches 65 run tag @e[tag=hall-guard] add shooting-guard
execute if score $hall-anim guards matches 65 as @e[tag=hall-guard] run item replace entity @s weapon.mainhand with bow
execute if score $hall-anim guards matches 65 run scoreboard players set $shooting guards 1
# speed up over time if the player isn't getting out
execute if score $hall-anim guards matches 120 unless score $vent-guards guards matches 1 run scoreboard players set $SHOOT-PERIOD guards 8
execute if score $hall-anim guards matches 170 unless score $vent-guards guards matches 1 run scoreboard players set $SHOOT-PERIOD guards 5
# activate MACHINE GUN if player REALLY isn't getting out
execute if score $hall-anim guards matches 230 unless score $vent-guards guards matches 1 run scoreboard players set $machine-gun guards 1
execute if score $hall-anim guards matches 230 unless score $vent-guards guards matches 1 run scoreboard players set $SHOOT-PERIOD guards 2