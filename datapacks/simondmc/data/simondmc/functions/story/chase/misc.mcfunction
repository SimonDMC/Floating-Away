# ticking function, handles random stuff related to the chase

# die in pits
execute as @a[tag=playing] if predicate simondmc:pit-1 run damage @s 100 stalagmite
execute as @e[tag=corridor-2-guard] if predicate simondmc:pit-1 run kill @s
execute as @a[tag=playing] if predicate simondmc:pit-2 run damage @s 100 stalagmite
execute as @e[tag=corridor-3-guard] if predicate simondmc:pit-2 run kill @s

# set checkpoint
execute as @a[tag=playing] if score @s set-checkpoint-trigger matches 1 run scoreboard players set $checkpoint-set stats 1
execute as @a[tag=playing] if score @s set-checkpoint-trigger matches 1 run spawnpoint @a[tag=playing] 4 52 21 -180
execute as @a[tag=playing] if score @s set-checkpoint-trigger matches 1 run kill @a[tag=playing]
execute as @a[tag=playing] if score @s set-checkpoint-trigger matches 1 run scoreboard players reset @a[tag=playing] set-checkpoint-trigger
execute if score $checkpoint-allowed stats matches 1 unless score $checkpoint-set stats matches 1 run scoreboard players enable @a[tag=playing] set-checkpoint-trigger