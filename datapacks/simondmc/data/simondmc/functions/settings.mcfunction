# ticking function, controls misc. settings like effects and entity invulnerability

# effects
effect give @a saturation infinite 0 true

# interactable item frames
execute as @e[type=item_frame,nbt=!{Item:{}},tag=interactable] run data merge entity @s {Invulnerable:1b}
execute as @e[type=item_frame,nbt={Item:{}},tag=interactable] run data merge entity @s {Invulnerable:0b}

# cosmetic item frames
execute as @e[type=item_frame,tag=!interactable] run data merge entity @s {Invulnerable:1b}

# paintings
execute as @e[type=painting] run data merge entity @s {Invulnerable:1b}

# item despawning
execute as @e[type=item,nbt={Age:10s}] run data merge entity @s {Age:5}

# death
execute as @a if score @s death matches 1.. run function simondmc:death

# cache
execute if score $started start matches 1 unless score $cached timewarper matches 1 run function simondmc:mechanics/time-warper/force-setup

# make sure villagers have no trades (they gain them again after relogging for some reason)
execute as @e[type=villager] run data modify entity @s Offers set value {}

# scoreboards
scoreboard objectives add timewarper minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add combinationlock dummy
scoreboard objectives add powersource dummy
scoreboard objectives add waterdispenser dummy
scoreboard objectives add sequencelock dummy
scoreboard objectives add emergencyexit dummy
scoreboard objectives add tnt dummy
scoreboard objectives add guards dummy
scoreboard objectives add arrow dummy
scoreboard objectives add story dummy
scoreboard objectives add death deathCount
scoreboard objectives add trapdoor dummy
scoreboard objectives add trap dummy
scoreboard objectives add elevator dummy
scoreboard objectives add endtrigger trigger
scoreboard objectives add start dummy