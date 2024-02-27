# scheduled by simondmc:mechanics/sequence-lock/press upon clicking the wrong button in the sequence
# also called by simondmc:death upon death in chase sequence

# reset interactions
execute as @e[tag=sequence-lock-int] at @s run tp ~ ~ 16.0625
execute as @e[tag=sequence-lock-int] run tag @s remove pressed

# reset digit and button position
# digit transformation check because otherwise the unmoved digits flash weirdly
execute as @e[tag=sequence-lock-button] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute as @e[tag=sequence-lock-digit,nbt={transformation:{translation:[0f,0f,-0.03125f]}}] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}

# reset digit color
execute as @e[tag=seq-btn-1,tag=sequence-lock-digit] run data merge entity @s {text:'"1"'}
execute as @e[tag=seq-btn-2,tag=sequence-lock-digit] run data merge entity @s {text:'"2"'}
execute as @e[tag=seq-btn-3,tag=sequence-lock-digit] run data merge entity @s {text:'"3"'}
execute as @e[tag=seq-btn-4,tag=sequence-lock-digit] run data merge entity @s {text:'"4"'}
execute as @e[tag=seq-btn-5,tag=sequence-lock-digit] run data merge entity @s {text:'"5"'}
execute as @e[tag=seq-btn-6,tag=sequence-lock-digit] run data merge entity @s {text:'"6"'}
execute as @e[tag=seq-btn-7,tag=sequence-lock-digit] run data merge entity @s {text:'"7"'}
execute as @e[tag=seq-btn-8,tag=sequence-lock-digit] run data merge entity @s {text:'"8"'}
execute as @e[tag=seq-btn-9,tag=sequence-lock-digit] run data merge entity @s {text:'"9"'}

# reset progress
scoreboard players reset $progress sequencelock

# sound effect
playsound minecraft:block.note_block.bass master @a 35 39 16 1 0

# reset door
setblock 36 36 15 air