# called by simondmc:start/start-area after clicking the info text

scoreboard players set $info-anim start 0
execute at @s run playsound ui.button.click master @s
# preload all sounds
execute as @a at @s run playsound music.welcome-to-folio ambient @s
execute as @a at @s run playsound music.stronger-than-gravity ambient @s
execute as @a at @s run playsound music.ground-level ambient @s
execute as @a at @s run playsound music.out-of-order ambient @s
execute as @a at @s run playsound music.out-of-order-slowing ambient @s
execute as @a at @s run playsound music.out-of-order-speeding ambient @s
execute as @a at @s run playsound music.sneaking-around ambient @s
execute as @a at @s run playsound music.floating-away ambient @s
execute as @a at @s run playsound characters.follow-me voice @s
execute as @a at @s run playsound characters.interview voice @s
execute as @a at @s run playsound characters.nice-job voice @s
execute as @a at @s run playsound characters.presentation voice @s
execute as @a at @s run playsound characters.security voice @s
execute as @a at @s run playsound characters.test-run voice @s
execute as @a at @s run playsound sfx.audience voice @s
execute as @a at @s run playsound sfx.audience-fadein voice @s