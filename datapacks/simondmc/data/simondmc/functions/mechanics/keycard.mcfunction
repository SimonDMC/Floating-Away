# ticking function, unlocks the F202-O door after showing up with a keycard

# !!! this is .1 radius
execute if entity @a[x=38.375,y=85,z=-61.7,distance=...1,nbt={SelectedItem:{tag:{keycard:1b}}}] run setblock 37 83 -63 redstone_torch
execute if entity @a[x=38.375,y=85,z=-61.7,distance=...1,nbt={SelectedItem:{tag:{keycard:1b}}}] as @e[tag=f102-o] run data merge entity @s {item:{tag:{CustomModelData:8}}}