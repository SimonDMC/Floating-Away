# ticking function, powers the up and down float arrows. arrows textures credit: ©️ SimonDMCPlayer 2019

# disable up arrow near quartz elevator
execute as @a[tag=playing,nbt={SelectedItem:{id:"minecraft:carrot"}}] unless score $end elevator matches 0..362 unless entity @s[x=-4.5,y=38,z=-6.5,distance=..5] run effect give @s levitation 1 3 true
execute as @a[tag=playing,nbt=!{SelectedItem:{id:"minecraft:carrot"}}] unless score $end elevator matches 0..362 run effect clear @s levitation
execute as @a[tag=playing,nbt={SelectedItem:{id:"minecraft:potato"}}] run effect give @s slow_falling 1 2 true
execute as @a[tag=playing,nbt=!{SelectedItem:{id:"minecraft:potato"}}] run effect clear @s slow_falling

# pick up from the stage
execute as @e[tag=float-arrows-int] run function simondmc:mechanics/float-arrows/pick-up