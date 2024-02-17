# ticking function, controls the sequence lock in the quartz corridor of the chase scene

# when a button is pressed for the first time, call /press/
execute as @e[tag=sequence-lock-int,tag=!pressed] if data entity @s interaction run function simondmc:mechanics/sequence-lock/press

# reset interaction
execute as @e[tag=sequence-lock-int] run data remove entity @s interaction