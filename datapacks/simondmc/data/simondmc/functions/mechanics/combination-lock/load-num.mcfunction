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
execute unless entity @s[tag=button-R] unless entity @s[tag=button-B] as @a at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2
execute if entity @s[tag=button-R] as @a at @s run playsound minecraft:ui.button.click master @s ~ ~ ~
execute if entity @s[tag=button-B] as @a at @s run playsound minecraft:ui.button.click master @s ~ ~ ~