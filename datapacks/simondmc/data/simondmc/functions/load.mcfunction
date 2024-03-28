# called on load to invalidate the time warper cache and force player to re-cache
# also resets mc version warning

scoreboard players reset $cached timewarper
scoreboard players reset $wrong-version start