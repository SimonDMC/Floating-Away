# ticking function, controls misc. settings like effects and entity invulnerability

# effects
effect give @a saturation infinite 0 true

# knockback resistance
execute as @a run attribute @s generic.knockback_resistance base set 0.5

# interactable item frames
execute as @e[type=item_frame,nbt={Item:{}},tag=interactable] run data merge entity @s {Invulnerable:0b}

# remove empty item frames
execute as @e[type=item_frame,nbt=!{Item:{}},tag=interactable] run kill @s

# cosmetic item frames
execute as @e[type=item_frame,tag=!interactable] run data merge entity @s {Invulnerable:1b}

# paintings
execute as @e[type=painting] run data merge entity @s {Invulnerable:1b}

# make items never despawn
execute as @e[type=item,nbt={Age:10s}] run data merge entity @s {Age:5}

# make dropped items insta-pickup to prevent losing them
execute as @e[type=item,nbt={PickupDelay:40s}] run data merge entity @s {PickupDelay:0}

# death
execute as @a if score @s death matches 1.. run function simondmc:death

# cache
execute if score $phase story matches 1..7 unless score $cached timewarper matches 1 run function simondmc:mechanics/time-warper/force-setup

# make sure villagers have no trades (they gain them again after relogging for some reason)
execute as @e[type=villager] run data modify entity @s Offers set value {}

# tp newly-joined players to the lobby because they have a tendency to spawn outside the map
execute as @a[tag=!start-tpd] run tp @s 28.8 94.5 -59.5 -90 0
execute as @a[tag=!start-tpd] run ride @s mount @e[tag=lobby-chair,limit=1]
execute as @a[tag=!start-tpd] run tag @s add start-tpd

# team
team add floater "Float!er"
team modify floater friendlyFire false
team modify floater collisionRule never
team modify floater seeFriendlyInvisibles false
team join floater @a

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
scoreboard objectives add work dummy
scoreboard objectives add presentation dummy
scoreboard objectives add stats dummy
scoreboard objectives add guard-walk-anim dummy
scoreboard objectives add music dummy
scoreboard objectives add give-up-trigger trigger
scoreboard objectives add set-checkpoint-trigger trigger