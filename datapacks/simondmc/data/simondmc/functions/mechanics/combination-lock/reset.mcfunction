# called by simondmc:mechanics/combination-lock/eval and simondmc:mechanics/combination-lock/load-num
# resets the combination lock to its initial state

scoreboard players set $current combinationlock 1
execute as @e[tag=comb-digit-1] run data merge entity @s {text: '""'}
execute as @e[tag=comb-digit-2] run data merge entity @s {text: '""'}
execute as @e[tag=comb-digit-3] run data merge entity @s {text: '""'}
execute as @e[tag=comb-digit-4] run data merge entity @s {text: '""'}