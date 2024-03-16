# tick function called by tick.json, calls all ticking functions

# mechanics
execute if score $phase story matches 5..7 run function simondmc:mechanics/time-warper/sys
execute if score $phase story matches 5 run function simondmc:mechanics/combination-lock/sys
execute if score $phase story matches 5 run function simondmc:mechanics/power-source/sys
execute if score $phase story matches 5 run function simondmc:mechanics/keycard
execute if score $phase story matches 5 run function simondmc:mechanics/water-dispenser/sys
execute if score $phase story matches 7 run function simondmc:mechanics/sequence-lock/sys
execute if score $phase story matches 5 run function simondmc:mechanics/emergency-exit
execute if score $phase story matches 5..6 run function simondmc:mechanics/tnt/sys
execute if score $phase story matches 6..8 run function simondmc:mechanics/float-arrows/sys
execute if score $phase story matches 5 run function simondmc:mechanics/guards/sys
execute if score $phase story matches 7 run function simondmc:mechanics/trapdoor
execute if score $phase story matches 7 run function simondmc:mechanics/trap
execute if score $phase story matches 5 run function simondmc:mechanics/elevator

# story
execute if score $phase story matches 1..3 run function simondmc:story/intro/interview
execute if score $phase story matches 2..5 run function simondmc:story/intro/work
execute if score $phase story matches 5 run function simondmc:story/intro/presentation
execute if score $phase story matches 5 run function simondmc:story/exit
execute if score $phase story matches 6..7 run function simondmc:story/chase/guards
execute if score $phase story matches 6 run function simondmc:story/chase/hall/hall-guards
execute if score $phase story matches 6 run function simondmc:story/chase/hall/boss
execute if score $phase story matches 6..7 run function simondmc:story/chase/vents/vent-guards
execute if score $phase story matches 7 run function simondmc:story/chase/corridor-1/corridor-1-guards
execute if score $phase story matches 7 run function simondmc:story/chase/corridor-2/corridor-2-guards
execute if score $phase story matches 7 run function simondmc:story/chase/corridor-3/corridor-3-guards
execute if score $phase story matches 7 run function simondmc:story/chase/quartz/quartz-guards
execute if score $phase story matches 7 run function simondmc:story/chase/quartz/elevator
execute if score $phase story matches 7 run function simondmc:story/chase/misc
execute if score $phase story matches 7..8 run function simondmc:story/chase/quartz/end
execute if score $phase story matches 1.. run function simondmc:story/armor

# misc
function simondmc:settings
execute unless score $phase story matches 1.. run function simondmc:start/start-area
execute if score $phase story matches 1..7 if score $cached timewarper matches 1 run function simondmc:timer