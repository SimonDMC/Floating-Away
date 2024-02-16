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

# scoreboards
scoreboard objectives add timewarper minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add combinationlock dummy
scoreboard objectives add powersource dummy