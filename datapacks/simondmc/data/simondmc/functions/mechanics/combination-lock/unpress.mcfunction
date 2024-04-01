# ticking function called by simondmc:mechanics/combination-lock/sys, handles the button unpressing system

# advance timer
execute if score @s combinationlock matches 0.. run scoreboard players add @s combinationlock 1

# unpress button
execute if score @s combinationlock matches 4.. if entity @s[tag=button-1] run data merge entity @e[tag=comb-btn-1,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-2] run data merge entity @e[tag=comb-btn-2,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-3] run data merge entity @e[tag=comb-btn-3,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-4] run data merge entity @e[tag=comb-btn-4,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-5] run data merge entity @e[tag=comb-btn-5,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-6] run data merge entity @e[tag=comb-btn-6,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-7] run data merge entity @e[tag=comb-btn-7,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-8] run data merge entity @e[tag=comb-btn-8,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-9] run data merge entity @e[tag=comb-btn-9,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-R] run data merge entity @e[tag=comb-btn-R,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-0] run data merge entity @e[tag=comb-btn-0,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-B] run data merge entity @e[tag=comb-btn-B,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}

# unpress digit
execute if score @s combinationlock matches 4.. if entity @s[tag=button-1] run data merge entity @e[tag=comb-btn-digit-1,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-2] run data merge entity @e[tag=comb-btn-digit-2,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-3] run data merge entity @e[tag=comb-btn-digit-3,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-4] run data merge entity @e[tag=comb-btn-digit-4,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-5] run data merge entity @e[tag=comb-btn-digit-5,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-6] run data merge entity @e[tag=comb-btn-digit-6,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-7] run data merge entity @e[tag=comb-btn-digit-7,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-8] run data merge entity @e[tag=comb-btn-digit-8,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-9] run data merge entity @e[tag=comb-btn-digit-9,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-R] run data merge entity @e[tag=comb-btn-digit-R,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-0] run data merge entity @e[tag=comb-btn-digit-0,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}
execute if score @s combinationlock matches 4.. if entity @s[tag=button-B] run data merge entity @e[tag=comb-btn-digit-B,limit=1] {start_interpolation:0,interpolation_duration:3,transformation:{translation:[0f,0f,0f]}}

# reset timer
execute if score @s combinationlock matches 4.. run scoreboard players reset @s combinationlock