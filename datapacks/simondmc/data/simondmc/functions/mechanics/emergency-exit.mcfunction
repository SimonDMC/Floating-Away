# ticking function, controls the emergency exit "puzzle"

# count how many buttons are pressed
scoreboard players reset $count emergencyexit
execute if block 49 86 -13 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 86 -13 polished_blackstone_button[powered=true] run setblock 50 86 -13 dead_tube_coral_block
execute if block 49 86 -13 polished_blackstone_button[powered=false] run setblock 50 86 -13 chiseled_stone_bricks
execute if block 49 89 -12 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 89 -12 polished_blackstone_button[powered=true] run setblock 50 89 -12 dead_tube_coral_block
execute if block 49 89 -12 polished_blackstone_button[powered=false] run setblock 50 89 -12 chiseled_stone_bricks
execute if block 49 87 -11 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 87 -11 polished_blackstone_button[powered=true] run setblock 50 87 -11 dead_tube_coral_block
execute if block 49 87 -11 polished_blackstone_button[powered=false] run setblock 50 87 -11 chiseled_stone_bricks
execute if block 49 88 -9 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 88 -9 polished_blackstone_button[powered=true] run setblock 50 88 -9 dead_tube_coral_block
execute if block 49 88 -9 polished_blackstone_button[powered=false] run setblock 50 88 -9 chiseled_stone_bricks
execute if block 49 85 -9 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 85 -9 polished_blackstone_button[powered=true] run setblock 50 85 -9 dead_tube_coral_block
execute if block 49 85 -9 polished_blackstone_button[powered=false] run setblock 50 85 -9 chiseled_stone_bricks

# update display count (0/5)
# only one @e selector will get executed at a time so extracting into its own function is unnecessary 
execute unless score $count emergencyexit matches 1.. as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n0/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 1 as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n1/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 2 as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n2/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 3 as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n3/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 4 as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n4/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 run setblock 41 91 -11 redstone_block
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 run kill @e[tag=emergency-exit]
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 run scoreboard players set $done emergencyexit 1