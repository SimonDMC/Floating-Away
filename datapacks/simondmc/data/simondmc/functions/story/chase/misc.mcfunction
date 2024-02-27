# ticking function, handles random stuff related to the chase

# die in pits
execute as @a if predicate simondmc:pit-1 run damage @s 100 stalagmite
execute as @e[tag=corridor-2-guard] if predicate simondmc:pit-1 run kill @s
execute as @a if predicate simondmc:pit-2 run damage @s 100 stalagmite
execute as @e[tag=corridor-3-guard] if predicate simondmc:pit-2 run kill @s