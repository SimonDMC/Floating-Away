# ticking function, unlocks the F202-O door after showing up with a keycard

# !!! this is .7 radius
execute if entity @a[tag=playing,x=38.375,y=85,z=-61.7,distance=...7,nbt={SelectedItem:{tag:{keycard:1}}}] unless block 37 83 -63 redstone_torch run playsound block.note_block.guitar master @a[tag=playing] 38.5 86.5 -61.5 1 2
execute if entity @a[tag=playing,x=38.375,y=85,z=-61.7,distance=...7,nbt={SelectedItem:{tag:{keycard:1}}}] run setblock 37 83 -63 redstone_torch
execute if entity @a[tag=playing,x=38.375,y=85,z=-61.7,distance=...7,nbt={SelectedItem:{tag:{keycard:1}}}] as @e[tag=f102-o] run data merge entity @s {item:{tag:{CustomModelData:8}}}
execute if entity @a[tag=playing,x=38.375,y=85,z=-61.7,distance=...7,nbt={SelectedItem:{tag:{keycard:1}}}] run clear @a[tag=playing] name_tag{keycard:1}