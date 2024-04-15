# ticking function, removes the protruding wire display when the real one is placed

execute if block 41 85 -23 minecraft:redstone_wire run kill @e[tag=protruding-wire]

# close door behind player
execute unless score $was-multiplayer stats matches 1 if entity @a[tag=playing,x=49.5,y=85,z=-24.5,distance=..2.5] run setblock 41 84 -22 air