# called by simondmc:mechanics/sequence-lock/sys whenever a button is pressed

tag @s add pressed

# play slowed down sound if time warp is on
execute unless score $enabled timewarper matches 1 as @a at @s run playsound ui.button.click master @s ~ ~ ~ 1 2
execute if score $enabled timewarper matches 1 as @a at @s run playsound ui.button.click master @s ~ ~ ~ 1 0

execute at @s run tp @s ~ ~ 16.03125

# "press in" the corresponding digit and button
execute if entity @s[tag=button-1] as @e[tag=seq-btn-1] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}
execute if entity @s[tag=button-1] as @e[tag=seq-btn-2,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"2","color":"yellow"}'}
execute if entity @s[tag=button-2] as @e[tag=seq-btn-2] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}
execute if entity @s[tag=button-2] as @e[tag=seq-btn-3,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"3","color":"yellow"}'}
execute if entity @s[tag=button-3] as @e[tag=seq-btn-3] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}
execute if entity @s[tag=button-3] as @e[tag=seq-btn-4,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"4","color":"yellow"}'}
execute if entity @s[tag=button-4] as @e[tag=seq-btn-4] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}
execute if entity @s[tag=button-4] as @e[tag=seq-btn-5,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"5","color":"yellow"}'}
execute if entity @s[tag=button-5] as @e[tag=seq-btn-5] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}
execute if entity @s[tag=button-5] as @e[tag=seq-btn-6,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"6","color":"yellow"}'}
execute if entity @s[tag=button-6] as @e[tag=seq-btn-6] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}
execute if entity @s[tag=button-6] as @e[tag=seq-btn-7,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"7","color":"yellow"}'}
execute if entity @s[tag=button-7] as @e[tag=seq-btn-7] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}
execute if entity @s[tag=button-7] as @e[tag=seq-btn-8,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"8","color":"yellow"}'}
execute if entity @s[tag=button-8] as @e[tag=seq-btn-8] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}
execute if entity @s[tag=button-8] as @e[tag=seq-btn-9,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"9","color":"yellow"}'}
execute if entity @s[tag=button-9] as @e[tag=seq-btn-9] run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,-0.03125f]}}

# incorrect if clicked the wrong one
execute if score $progress sequencelock matches 1.. if entity @s[tag=button-1] as @e[tag=seq-btn-1,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"1","color":"red"}'}
execute if score $progress sequencelock matches 1.. if entity @s[tag=button-1] run schedule function simondmc:mechanics/sequence-lock/reset 5t
execute unless score $progress sequencelock matches 1 if entity @s[tag=button-2] as @e[tag=seq-btn-2,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"2","color":"red"}'}
execute unless score $progress sequencelock matches 1 if entity @s[tag=button-2] run schedule function simondmc:mechanics/sequence-lock/reset 5t
execute unless score $progress sequencelock matches 2 if entity @s[tag=button-3] as @e[tag=seq-btn-3,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"3","color":"red"}'}
execute unless score $progress sequencelock matches 2 if entity @s[tag=button-3] run schedule function simondmc:mechanics/sequence-lock/reset 5t
execute unless score $progress sequencelock matches 3 if entity @s[tag=button-4] as @e[tag=seq-btn-4,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"4","color":"red"}'}
execute unless score $progress sequencelock matches 3 if entity @s[tag=button-4] run schedule function simondmc:mechanics/sequence-lock/reset 5t
execute unless score $progress sequencelock matches 4 if entity @s[tag=button-5] as @e[tag=seq-btn-5,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"5","color":"red"}'}
execute unless score $progress sequencelock matches 4 if entity @s[tag=button-5] run schedule function simondmc:mechanics/sequence-lock/reset 5t
execute unless score $progress sequencelock matches 5 if entity @s[tag=button-6] as @e[tag=seq-btn-6,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"6","color":"red"}'}
execute unless score $progress sequencelock matches 5 if entity @s[tag=button-6] run schedule function simondmc:mechanics/sequence-lock/reset 5t
execute unless score $progress sequencelock matches 6 if entity @s[tag=button-7] as @e[tag=seq-btn-7,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"7","color":"red"}'}
execute unless score $progress sequencelock matches 6 if entity @s[tag=button-7] run schedule function simondmc:mechanics/sequence-lock/reset 5t
execute unless score $progress sequencelock matches 7 if entity @s[tag=button-8] as @e[tag=seq-btn-8,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"8","color":"red"}'}
execute unless score $progress sequencelock matches 7 if entity @s[tag=button-8] run schedule function simondmc:mechanics/sequence-lock/reset 5t
execute unless score $progress sequencelock matches 8 if entity @s[tag=button-9] as @e[tag=seq-btn-9,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"9","color":"red"}'}
execute unless score $progress sequencelock matches 8 if entity @s[tag=button-9] run schedule function simondmc:mechanics/sequence-lock/reset 5t

# correct if clicked the right one
execute unless score $progress sequencelock matches 1.. if entity @s[tag=button-1] as @e[tag=seq-btn-1,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"1","color":"green"}'}
execute unless score $progress sequencelock matches 1.. if entity @s[tag=button-1] run scoreboard players add $progress sequencelock 1
execute if score $progress sequencelock matches 1 if entity @s[tag=button-2] as @e[tag=seq-btn-2,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"2","color":"green"}'}
execute if score $progress sequencelock matches 1 if entity @s[tag=button-2] run scoreboard players add $progress sequencelock 1
execute if score $progress sequencelock matches 2 if entity @s[tag=button-3] as @e[tag=seq-btn-3,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"3","color":"green"}'}
execute if score $progress sequencelock matches 2 if entity @s[tag=button-3] run scoreboard players add $progress sequencelock 1
execute if score $progress sequencelock matches 3 if entity @s[tag=button-4] as @e[tag=seq-btn-4,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"4","color":"green"}'}
execute if score $progress sequencelock matches 3 if entity @s[tag=button-4] run scoreboard players add $progress sequencelock 1
execute if score $progress sequencelock matches 4 if entity @s[tag=button-5] as @e[tag=seq-btn-5,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"5","color":"green"}'}
execute if score $progress sequencelock matches 4 if entity @s[tag=button-5] run scoreboard players add $progress sequencelock 1
execute if score $progress sequencelock matches 5 if entity @s[tag=button-6] as @e[tag=seq-btn-6,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"6","color":"green"}'}
execute if score $progress sequencelock matches 5 if entity @s[tag=button-6] run scoreboard players add $progress sequencelock 1
execute if score $progress sequencelock matches 6 if entity @s[tag=button-7] as @e[tag=seq-btn-7,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"7","color":"green"}'}
execute if score $progress sequencelock matches 6 if entity @s[tag=button-7] run scoreboard players add $progress sequencelock 1
execute if score $progress sequencelock matches 7 if entity @s[tag=button-8] as @e[tag=seq-btn-8,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"8","color":"green"}'}
execute if score $progress sequencelock matches 7 if entity @s[tag=button-8] run scoreboard players add $progress sequencelock 1
execute if score $progress sequencelock matches 8 if entity @s[tag=button-9] as @e[tag=seq-btn-9,tag=sequence-lock-digit] run data merge entity @s {text:'{"text":"9","color":"green"}'}
execute if score $progress sequencelock matches 8 if entity @s[tag=button-9] run scoreboard players add $progress sequencelock 1

# completion check
execute if score $progress sequencelock matches 9 as @a at @s run playsound entity.experience_orb.pickup master @s
execute if score $progress sequencelock matches 9 run setblock 36 36 15 redstone_torch