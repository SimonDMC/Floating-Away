# ticking function, ensures item frames and paintings behave as they should
# that means interactable item frames can only be modified while full,
# cosmetic item frames not at all, and paintings not at all

# interactable item frames
execute as @e[type=item_frame,nbt=!{Item:{}},tag=interactable] run data merge entity @s {Invulnerable:1b}
execute as @e[type=item_frame,nbt={Item:{}},tag=interactable] run data merge entity @s {Invulnerable:0b}

# cosmetic item frames
execute as @e[type=item_frame,tag=!interactable] run data merge entity @s {Invulnerable:1b}

# paintings
execute as @e[type=painting] run data merge entity @s {Invulnerable:1b}