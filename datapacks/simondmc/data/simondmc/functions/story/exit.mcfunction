# ticking function, handles the (fake) exit

# @e optimization
execute positioned 52.0 85 -52.5 as @a[tag=!exit-informed,distance=..2] run tellraw @s [{"text":"<Receptionist> ","color":"dark_green"},{"text":"Sorry, the exit is locked right now.","color":"white"}] 
execute positioned 52.0 85 -52.5 as @a[tag=!exit-informed,distance=..2] run playsound entity.villager.ambient master @s
execute positioned 52.0 85 -52.5 as @a[tag=!exit-informed,distance=..2] run tag @s add exit-informed