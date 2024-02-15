# tick function called by tick.json, calls all ticking functions

scoreboard objectives add timewarper minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add combinationlock dummy

# mechanics
function simondmc:mechanics/time-warper/sys
function simondmc:mechanics/combination-lock/sys

# misc
function simondmc:item-frames