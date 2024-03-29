# called by simondmc:settings whenever the game is running but tickrate isn't cached

# mark game as paused
scoreboard players set $paused start 1

# get player/s to reenable
tellraw @a [{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n------------------","color":"yellow","bold":true,"strikethrough":true},{"text":"\n\n       ","bold":false,"strikethrough":false},{"text":"    Resume","color":"green","bold":false,"strikethrough":false,"clickEvent":{"action":"run_command","value":"/function simondmc:resume"}},{"text":"\n\n"},{"text":"------------------","color":"yellow","bold":true,"strikethrough":true}]

# mark spots
tag @r[tag=!paused-1,tag=!paused-2,tag=!paused-3,tag=!paused-4,tag=!paused-5,tag=!paused-6,tag=!paused-7,tag=!paused-8] add paused-1
execute unless entity @e[tag=paused-1-placeholder] as @a[tag=paused-1] at @s run summon marker ~ ~ ~ {Tags:["paused-1-placeholder","paused-placeholder"],Invulnerable:1b,NoGravity:1b}
tag @r[tag=!paused-1,tag=!paused-2,tag=!paused-3,tag=!paused-4,tag=!paused-5,tag=!paused-6,tag=!paused-7,tag=!paused-8] add paused-2
execute unless entity @e[tag=paused-2-placeholder] as @a[tag=paused-2] at @s run summon marker ~ ~ ~ {Tags:["paused-2-placeholder","paused-placeholder"],Invulnerable:1b,NoGravity:1b}
tag @r[tag=!paused-1,tag=!paused-2,tag=!paused-3,tag=!paused-4,tag=!paused-5,tag=!paused-6,tag=!paused-7,tag=!paused-8] add paused-3
execute unless entity @e[tag=paused-3-placeholder] as @a[tag=paused-3] at @s run summon marker ~ ~ ~ {Tags:["paused-3-placeholder","paused-placeholder"],Invulnerable:1b,NoGravity:1b}
tag @r[tag=!paused-1,tag=!paused-2,tag=!paused-3,tag=!paused-4,tag=!paused-5,tag=!paused-6,tag=!paused-7,tag=!paused-8] add paused-4
execute unless entity @e[tag=paused-4-placeholder] as @a[tag=paused-4] at @s run summon marker ~ ~ ~ {Tags:["paused-4-placeholder","paused-placeholder"],Invulnerable:1b,NoGravity:1b}
tag @r[tag=!paused-1,tag=!paused-2,tag=!paused-3,tag=!paused-4,tag=!paused-5,tag=!paused-6,tag=!paused-7,tag=!paused-8] add paused-5
execute unless entity @e[tag=paused-5-placeholder] as @a[tag=paused-5] at @s run summon marker ~ ~ ~ {Tags:["paused-5-placeholder","paused-placeholder"],Invulnerable:1b,NoGravity:1b}
tag @r[tag=!paused-1,tag=!paused-2,tag=!paused-3,tag=!paused-4,tag=!paused-5,tag=!paused-6,tag=!paused-7,tag=!paused-8] add paused-6
execute unless entity @e[tag=paused-6-placeholder] as @a[tag=paused-6] at @s run summon marker ~ ~ ~ {Tags:["paused-6-placeholder","paused-placeholder"],Invulnerable:1b,NoGravity:1b}
tag @r[tag=!paused-1,tag=!paused-2,tag=!paused-3,tag=!paused-4,tag=!paused-5,tag=!paused-6,tag=!paused-7,tag=!paused-8] add paused-7
execute unless entity @e[tag=paused-7-placeholder] as @a[tag=paused-7] at @s run summon marker ~ ~ ~ {Tags:["paused-7-placeholder","paused-placeholder"],Invulnerable:1b,NoGravity:1b}
tag @r[tag=!paused-1,tag=!paused-2,tag=!paused-3,tag=!paused-4,tag=!paused-5,tag=!paused-6,tag=!paused-7,tag=!paused-8] add paused-8
execute unless entity @e[tag=paused-8-placeholder] as @a[tag=paused-8] at @s run summon marker ~ ~ ~ {Tags:["paused-8-placeholder","paused-placeholder"],Invulnerable:1b,NoGravity:1b}

# keep in place
tp @a 31.5 107 -59.5
gamemode spectator @a
stopsound @a voice
stopsound @a ambient
scoreboard players reset $track-1-timer music
scoreboard players reset $track-2-timer music
scoreboard players reset $track-3-timer music
scoreboard players reset $track-4-timer music
scoreboard players reset $track-5-timer music
scoreboard players reset $track-61-timer music
scoreboard players reset $track-62-timer music
scoreboard players reset $track-63-timer music
scoreboard players reset $track-64-timer music
scoreboard players reset $track-65-timer music
scoreboard players reset $track-66-timer music