# ticking function, controls the emergency exit "puzzle"

# this is meant to expedite the unpressing of the button to have half the length, but behaves kinda wonkily due to MC-108726
# i thought about it for a while and came up with no better solution than to just force press it and act like it's not doing
# that so if you have a cleaner way of making this harder in multiplayer then please lmk :D
execute if score $multiplayer stats matches 1 if score $button1 emergencyexit matches 1..9 run setblock 49 86 -13 polished_blackstone_button[face=wall,facing=west,powered=true]
execute if score $multiplayer stats matches 1 if score $button2 emergencyexit matches 1..9 run setblock 49 89 -12 polished_blackstone_button[face=wall,facing=west,powered=true]
execute if score $multiplayer stats matches 1 if score $button3 emergencyexit matches 1..9 run setblock 49 87 -11 polished_blackstone_button[face=wall,facing=west,powered=true]
execute if score $multiplayer stats matches 1 if score $button4 emergencyexit matches 1..9 run setblock 49 88 -9 polished_blackstone_button[face=wall,facing=west,powered=true]
execute if score $multiplayer stats matches 1 if score $button5 emergencyexit matches 1..9 run setblock 49 85 -9 polished_blackstone_button[face=wall,facing=west,powered=true]

# count how many buttons are pressed
scoreboard players reset $count emergencyexit
execute if block 49 86 -13 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 86 -13 polished_blackstone_button[powered=true] run setblock 50 86 -13 dead_tube_coral_block
execute if block 49 86 -13 polished_blackstone_button[powered=true] run scoreboard players add $button1 emergencyexit 1
execute if block 49 86 -13 polished_blackstone_button[powered=false] run setblock 50 86 -13 chiseled_stone_bricks
execute if block 49 89 -12 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 89 -12 polished_blackstone_button[powered=true] run setblock 50 89 -12 dead_tube_coral_block
execute if block 49 89 -12 polished_blackstone_button[powered=true] run scoreboard players add $button2 emergencyexit 1
execute if block 49 89 -12 polished_blackstone_button[powered=false] run setblock 50 89 -12 chiseled_stone_bricks
execute if block 49 87 -11 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 87 -11 polished_blackstone_button[powered=true] run setblock 50 87 -11 dead_tube_coral_block
execute if block 49 87 -11 polished_blackstone_button[powered=true] run scoreboard players add $button3 emergencyexit 1
execute if block 49 87 -11 polished_blackstone_button[powered=false] run setblock 50 87 -11 chiseled_stone_bricks
execute if block 49 88 -9 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 88 -9 polished_blackstone_button[powered=true] run setblock 50 88 -9 dead_tube_coral_block
execute if block 49 88 -9 polished_blackstone_button[powered=true] run scoreboard players add $button4 emergencyexit 1
execute if block 49 88 -9 polished_blackstone_button[powered=false] run setblock 50 88 -9 chiseled_stone_bricks
execute if block 49 85 -9 polished_blackstone_button[powered=true] run scoreboard players add $count emergencyexit 1
execute if block 49 85 -9 polished_blackstone_button[powered=true] run setblock 50 85 -9 dead_tube_coral_block
execute if block 49 85 -9 polished_blackstone_button[powered=true] run scoreboard players add $button5 emergencyexit 1
execute if block 49 85 -9 polished_blackstone_button[powered=false] run setblock 50 85 -9 chiseled_stone_bricks

execute if score $multiplayer stats matches 1 if score $button1 emergencyexit matches 10.. run setblock 49 86 -13 polished_blackstone_button[face=wall,facing=west]
execute if score $multiplayer stats matches 1 if score $button1 emergencyexit matches 10.. run playsound block.stone_button.click_off block @a[tag=playing] 49 86 -13
execute if score $multiplayer stats matches 1 if score $button1 emergencyexit matches 10.. run scoreboard players reset $button1 emergencyexit
execute if score $multiplayer stats matches 1 if score $button2 emergencyexit matches 10.. run setblock 49 89 -12 polished_blackstone_button[face=wall,facing=west]
execute if score $multiplayer stats matches 1 if score $button2 emergencyexit matches 10.. run playsound block.stone_button.click_off block @a[tag=playing] 49 89 -12
execute if score $multiplayer stats matches 1 if score $button2 emergencyexit matches 10.. run scoreboard players reset $button2 emergencyexit
execute if score $multiplayer stats matches 1 if score $button3 emergencyexit matches 10.. run setblock 49 87 -11 polished_blackstone_button[face=wall,facing=west]
execute if score $multiplayer stats matches 1 if score $button3 emergencyexit matches 10.. run playsound block.stone_button.click_off block @a[tag=playing] 49 87 -11
execute if score $multiplayer stats matches 1 if score $button3 emergencyexit matches 10.. run scoreboard players reset $button3 emergencyexit
execute if score $multiplayer stats matches 1 if score $button4 emergencyexit matches 10.. run setblock 49 88 -9 polished_blackstone_button[face=wall,facing=west]
execute if score $multiplayer stats matches 1 if score $button4 emergencyexit matches 10.. run playsound block.stone_button.click_off block @a[tag=playing] 49 88 -9
execute if score $multiplayer stats matches 1 if score $button4 emergencyexit matches 10.. run scoreboard players reset $button4 emergencyexit
execute if score $multiplayer stats matches 1 if score $button5 emergencyexit matches 10.. run setblock 49 85 -9 polished_blackstone_button[face=wall,facing=west]
execute if score $multiplayer stats matches 1 if score $button5 emergencyexit matches 10.. run playsound block.stone_button.click_off block @a[tag=playing] 49 85 -9
execute if score $multiplayer stats matches 1 if score $button5 emergencyexit matches 10.. run scoreboard players reset $button5 emergencyexit

# update display count (0/5)
# only one @e selector will get executed at a time so extracting into its own function is unnecessary 
execute unless score $count emergencyexit matches 1.. as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n0/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 1 as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n1/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 2 as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n2/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 3 as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n3/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 4 as @e[tag=emergency-exit] run data merge entity @s {text: '{"text":"Emergency Exit","extra":[{"text":"\\n4/5","color":"gray"}],"color":"red"}'}
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 as @a[tag=playing] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 run setblock 41 91 -11 redstone_block
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 run kill @e[tag=emergency-exit]
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 run spawnpoint @a[tag=playing] 34 85 -10 90
execute if score $count emergencyexit matches 5 unless score $done emergencyexit matches 1 run scoreboard players set $done emergencyexit 1

# close doors behind player
execute unless score $multiplayer stats matches 1 if entity @a[tag=playing,x=32.0,y=85,z=-10.0,distance=..1] run setblock 41 91 -11 air