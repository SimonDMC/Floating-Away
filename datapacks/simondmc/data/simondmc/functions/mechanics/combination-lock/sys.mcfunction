# ticking function, controls the combination lock

# when any button is pressed, load that number into /pressed/
# split into its own function for @e optimization
# also handles backspace and reset
execute as @e[tag=combination-lock-int] if data entity @s interaction run function simondmc:mechanics/combination-lock/load-num

# load into current space (in reverse order to prevent everything at once)
execute if score $pressed combinationlock matches 0.. if score $current combinationlock matches 4 run scoreboard players operation $4 combinationlock = $pressed combinationlock
execute if score $pressed combinationlock matches 0.. if score $current combinationlock matches 4 run scoreboard players set $current combinationlock 5
execute if score $pressed combinationlock matches 0.. if score $current combinationlock matches 3 run scoreboard players operation $3 combinationlock = $pressed combinationlock
execute if score $pressed combinationlock matches 0.. if score $current combinationlock matches 3 run scoreboard players set $current combinationlock 4
execute if score $pressed combinationlock matches 0.. if score $current combinationlock matches 2 run scoreboard players operation $2 combinationlock = $pressed combinationlock
execute if score $pressed combinationlock matches 0.. if score $current combinationlock matches 2 run scoreboard players set $current combinationlock 3
execute if score $pressed combinationlock matches 0.. unless score $current combinationlock matches 2.. run scoreboard players operation $1 combinationlock = $pressed combinationlock
execute if score $pressed combinationlock matches 0.. unless score $current combinationlock matches 2.. run scoreboard players set $current combinationlock 2

# render
execute if score $pressed combinationlock matches 0.. run function simondmc:mechanics/combination-lock/render

# evaluate if finished (with a cinematic delay)
# only run it once tho
execute if score $current combinationlock matches 5 unless score $evalqueued combinationlock matches 1 unless score $done combinationlock matches 1 run schedule function simondmc:mechanics/combination-lock/eval 5t
execute if score $current combinationlock matches 5 run scoreboard players set $evalqueued combinationlock 1

# reset pressed
scoreboard players reset $pressed combinationlock