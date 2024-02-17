# called by simondmc:mechanics/combination-lock/sys, checks if the inputted code is right
# if so, opens the door; otherwise resets
execute if score $1 combinationlock matches 6 if score $2 combinationlock matches 8 if score $3 combinationlock matches 7 if score $4 combinationlock matches 9 as @a at @s run playsound entity.experience_orb.pickup master @s
execute if score $1 combinationlock matches 6 if score $2 combinationlock matches 8 if score $3 combinationlock matches 7 if score $4 combinationlock matches 9 run schedule function simondmc:mechanics/combination-lock/open-door 5t
execute if score $1 combinationlock matches 6 if score $2 combinationlock matches 8 if score $3 combinationlock matches 7 if score $4 combinationlock matches 9 run scoreboard players set $correct combinationlock 1
execute if score $1 combinationlock matches 6 if score $2 combinationlock matches 8 if score $3 combinationlock matches 7 if score $4 combinationlock matches 9 run scoreboard players set $done combinationlock 1

# if not marked as correct, at least one digit has to be wrong
execute unless score $correct combinationlock matches 1 as @a at @s run playsound entity.villager.no master @s
execute unless score $correct combinationlock matches 1 run function simondmc:mechanics/combination-lock/reset
scoreboard players reset $correct combinationlock
scoreboard players reset $evalqueued combinationlock