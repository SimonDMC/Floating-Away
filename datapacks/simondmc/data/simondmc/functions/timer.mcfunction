# ticking function, controls the timer
# only runs after the map has started, before the map has ended, while not paused

scoreboard players add $ticks stats 1
# compensate for slowed down gameplay
execute if score $enabled timewarper matches 1 run scoreboard players add $ticks stats 3

execute if score $ticks stats matches 20.. run scoreboard players add $seconds stats 1
# we have to subtract 20 instead of resetting here since slowed down gameplay increases by 4 ticks every tick
execute if score $ticks stats matches 20.. run scoreboard players remove $ticks stats 20
execute if score $seconds stats matches 60.. run scoreboard players add $minutes stats 1
execute if score $seconds stats matches 60.. run scoreboard players set $seconds stats 0
execute if score $minutes stats matches 60.. run scoreboard players add $hours stats 1
execute if score $minutes stats matches 60.. run scoreboard players set $minutes stats 0