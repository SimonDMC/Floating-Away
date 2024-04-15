# ticking function, controls the trap in corridor 3 in the chase

execute unless score $anim trap matches -1..16 run scoreboard players set $anim trap 0
execute if block 4 57 59 minecraft:lever[powered=true] if score $anim trap matches -1 run scoreboard players set $anim trap 4
execute if block 4 57 59 minecraft:lever[powered=true] if score $anim trap matches -1..15 run scoreboard players add $anim trap 1
execute if block 4 57 59 minecraft:lever[powered=false] if score $anim trap matches 16 run scoreboard players set $anim trap 11
execute if block 4 57 59 minecraft:lever[powered=false] if score $anim trap matches 0..16 run scoreboard players remove $anim trap 1

# closed
execute if score $anim trap matches 0 run clone 1 66 51 7 67 55 1 53 51
execute if score $anim trap matches 0 run playsound block.anvil.place master @a[tag=playing] 4 54 53 1 2
execute if score $anim trap matches 5 run clone 1 69 51 7 70 55 1 53 51
execute if score $anim trap matches 5 run playsound block.anvil.place master @a[tag=playing] 4 54 53 1 2
execute if score $anim trap matches 10 run clone 1 72 51 7 73 55 1 53 51
execute if score $anim trap matches 10 run playsound block.anvil.place master @a[tag=playing] 4 54 53 1 2
# open
execute if score $anim trap matches 15 run fill 1 53 51 7 54 55 air
execute if score $anim trap matches 15 run playsound block.anvil.place master @a[tag=playing] 4 54 53 1 2