# called by simondmc:mechanics/combination-lock/sys, loads a pressed number to be processed
execute if entity @s[tag=button-1] run scoreboard players set $pressed combinationlock 1
execute if entity @s[tag=button-2] run scoreboard players set $pressed combinationlock 2
execute if entity @s[tag=button-3] run scoreboard players set $pressed combinationlock 3
execute if entity @s[tag=button-4] run scoreboard players set $pressed combinationlock 4
execute if entity @s[tag=button-5] run scoreboard players set $pressed combinationlock 5
execute if entity @s[tag=button-6] run scoreboard players set $pressed combinationlock 6
execute if entity @s[tag=button-7] run scoreboard players set $pressed combinationlock 7
execute if entity @s[tag=button-8] run scoreboard players set $pressed combinationlock 8
execute if entity @s[tag=button-9] run scoreboard players set $pressed combinationlock 9
execute if entity @s[tag=button-0] run scoreboard players set $pressed combinationlock 0

# press in button
execute if entity @s[tag=button-1] run data merge entity @e[tag=comb-btn-1,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-2] run data merge entity @e[tag=comb-btn-2,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-3] run data merge entity @e[tag=comb-btn-3,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-4] run data merge entity @e[tag=comb-btn-4,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-5] run data merge entity @e[tag=comb-btn-5,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-6] run data merge entity @e[tag=comb-btn-6,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-7] run data merge entity @e[tag=comb-btn-7,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-8] run data merge entity @e[tag=comb-btn-8,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-9] run data merge entity @e[tag=comb-btn-9,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-R] run data merge entity @e[tag=comb-btn-R,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-0] run data merge entity @e[tag=comb-btn-0,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-B] run data merge entity @e[tag=comb-btn-B,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}

# press in digit
execute if entity @s[tag=button-1] run data merge entity @e[tag=comb-btn-digit-1,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-2] run data merge entity @e[tag=comb-btn-digit-2,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-3] run data merge entity @e[tag=comb-btn-digit-3,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-4] run data merge entity @e[tag=comb-btn-digit-4,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-5] run data merge entity @e[tag=comb-btn-digit-5,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-6] run data merge entity @e[tag=comb-btn-digit-6,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-7] run data merge entity @e[tag=comb-btn-digit-7,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-8] run data merge entity @e[tag=comb-btn-digit-8,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-9] run data merge entity @e[tag=comb-btn-digit-9,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-R] run data merge entity @e[tag=comb-btn-digit-R,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-0] run data merge entity @e[tag=comb-btn-digit-0,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}
execute if entity @s[tag=button-B] run data merge entity @e[tag=comb-btn-digit-B,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0.035f]}}

# unpress after 3 ticks
scoreboard players set @s combinationlock 0

# backspace
execute if entity @s[tag=button-B] run scoreboard players remove $current combinationlock 1
execute if score $current combinationlock matches 1 as @e[tag=comb-digit-1] run data merge entity @s {text: '""'}
execute if score $current combinationlock matches 2 as @e[tag=comb-digit-2] run data merge entity @s {text: '""'}
execute if score $current combinationlock matches 3 as @e[tag=comb-digit-3] run data merge entity @s {text: '""'}
execute if score $current combinationlock matches 4 as @e[tag=comb-digit-4] run data merge entity @s {text: '""'}

# reset
execute if entity @s[tag=button-R] run function simondmc:mechanics/combination-lock/reset

# reset interaction
data remove entity @s interaction

# sound effect (different for reset/backspace)
execute unless entity @s[tag=button-R] unless entity @s[tag=button-B] run playsound minecraft:ui.button.click master @a 21 86 -33 1 2
execute if entity @s[tag=button-R] run playsound minecraft:ui.button.click master @a 21 86 -33
execute if entity @s[tag=button-B] run playsound minecraft:ui.button.click master @a 21 86 -33