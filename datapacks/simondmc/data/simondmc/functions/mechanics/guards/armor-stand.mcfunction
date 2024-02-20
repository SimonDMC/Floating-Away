# called by simondmc:mechanics/guards/sys, places an armor stand at the player's position
# with their head, rotation and some clothes

$summon armor_stand ~ ~ ~ {Tags:["guard-anim-player"],ShowArms:1b,NoBasePlate:1b,DisabledSlots:4144959,Rotation:[$(yaw)F,0F],Pose:{Head:[$(pitch)f,0f,0f]},ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:0}}},{}]}