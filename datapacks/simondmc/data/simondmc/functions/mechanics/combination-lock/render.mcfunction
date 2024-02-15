# called by simondmc:mechanics/combination-lock/sys, renders a digit whenever there is a change

# current is offset by 1 because its already been incremented after pressing
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 1 as @e[tag=comb-digit-1] run data merge entity @s {text: '"1"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 2 as @e[tag=comb-digit-1] run data merge entity @s {text: '"2"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 3 as @e[tag=comb-digit-1] run data merge entity @s {text: '"3"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 4 as @e[tag=comb-digit-1] run data merge entity @s {text: '"4"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 5 as @e[tag=comb-digit-1] run data merge entity @s {text: '"5"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 6 as @e[tag=comb-digit-1] run data merge entity @s {text: '"6"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 7 as @e[tag=comb-digit-1] run data merge entity @s {text: '"7"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 8 as @e[tag=comb-digit-1] run data merge entity @s {text: '"8"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 9 as @e[tag=comb-digit-1] run data merge entity @s {text: '"9"'}
execute if score $current combinationlock matches 2 if score $pressed combinationlock matches 0 as @e[tag=comb-digit-1] run data merge entity @s {text: '"0"'}

execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 1 as @e[tag=comb-digit-2] run data merge entity @s {text: '"1"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 2 as @e[tag=comb-digit-2] run data merge entity @s {text: '"2"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 3 as @e[tag=comb-digit-2] run data merge entity @s {text: '"3"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 4 as @e[tag=comb-digit-2] run data merge entity @s {text: '"4"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 5 as @e[tag=comb-digit-2] run data merge entity @s {text: '"5"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 6 as @e[tag=comb-digit-2] run data merge entity @s {text: '"6"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 7 as @e[tag=comb-digit-2] run data merge entity @s {text: '"7"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 8 as @e[tag=comb-digit-2] run data merge entity @s {text: '"8"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 9 as @e[tag=comb-digit-2] run data merge entity @s {text: '"9"'}
execute if score $current combinationlock matches 3 if score $pressed combinationlock matches 0 as @e[tag=comb-digit-2] run data merge entity @s {text: '"0"'}

execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 1 as @e[tag=comb-digit-3] run data merge entity @s {text: '"1"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 2 as @e[tag=comb-digit-3] run data merge entity @s {text: '"2"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 3 as @e[tag=comb-digit-3] run data merge entity @s {text: '"3"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 4 as @e[tag=comb-digit-3] run data merge entity @s {text: '"4"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 5 as @e[tag=comb-digit-3] run data merge entity @s {text: '"5"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 6 as @e[tag=comb-digit-3] run data merge entity @s {text: '"6"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 7 as @e[tag=comb-digit-3] run data merge entity @s {text: '"7"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 8 as @e[tag=comb-digit-3] run data merge entity @s {text: '"8"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 9 as @e[tag=comb-digit-3] run data merge entity @s {text: '"9"'}
execute if score $current combinationlock matches 4 if score $pressed combinationlock matches 0 as @e[tag=comb-digit-3] run data merge entity @s {text: '"0"'}

execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 1 as @e[tag=comb-digit-4] run data merge entity @s {text: '"1"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 2 as @e[tag=comb-digit-4] run data merge entity @s {text: '"2"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 3 as @e[tag=comb-digit-4] run data merge entity @s {text: '"3"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 4 as @e[tag=comb-digit-4] run data merge entity @s {text: '"4"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 5 as @e[tag=comb-digit-4] run data merge entity @s {text: '"5"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 6 as @e[tag=comb-digit-4] run data merge entity @s {text: '"6"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 7 as @e[tag=comb-digit-4] run data merge entity @s {text: '"7"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 8 as @e[tag=comb-digit-4] run data merge entity @s {text: '"8"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 9 as @e[tag=comb-digit-4] run data merge entity @s {text: '"9"'}
execute if score $current combinationlock matches 5 if score $pressed combinationlock matches 0 as @e[tag=comb-digit-4] run data merge entity @s {text: '"0"'}