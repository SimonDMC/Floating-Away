kill @e[tag=character]

# receptionist
summon villager 52.0 85 -52.5 {Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","receptionist"],VillagerData:{profession:"minecraft:nitwit",type:"minecraft:plains"},Offers:{}}

# hall guards
summon armor_stand 20 85 -4 {Tags:["character","hall-guard-L","hall-guard","guard","high-melee-guard"],Invulnerable:1b,Invisible:1b,Rotation:[-90f, 0f],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}
summon armor_stand 20 85 -6 {Tags:["character","hall-guard-R","hall-guard","guard","high-melee-guard"],Invulnerable:1b,Invisible:1b,Rotation:[-90f, 0f],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:black_candle",Count:1b,tag:{CustomModelData:1}}],CustomName:'{"text":"Guard"}'}

# employer interview room
summon armor_stand 12.8 85.3 -56.5 {Tags:["character","employer-I"],Invulnerable:1b,Invisible:1b,NoGravity:1b,Rotation:[-90f, 0f],ArmorItems:[{},{},{},{id:"minecraft:blue_candle",Count:1b,tag:{CustomModelData:2}}],DisabledSlots:4144959}

# employer work corridor
summon armor_stand 33.5 105 32.5 {Tags:["character","employer-W"],Invulnerable:1b,Invisible:1b,NoGravity:1b,Rotation:[0f, 0f],ArmorItems:[{},{},{},{id:"minecraft:blue_candle",Count:1b,tag:{CustomModelData:1}}],DisabledSlots:4144959}

# chair armor stand, not really a character but i don't have a better place to put it
summon armor_stand 17.3 83.7 -56.5 {Tags:["character","interview-chair"],NoGravity:1b,Invisible:1b,DisabledSlots:4144959}

# lobby chair
summon armor_stand 28.8 92.6 -59.5 {Tags:["character","lobby-chair"],NoGravity:1b,Invisible:1b,DisabledSlots:4144959}

# boss
summon armor_stand 17 88 -9 {Tags:["character","boss"],Invulnerable:1b,Rotation:[90f, 0f],Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:white_candle",Count:1b,tag:{CustomModelData:1}}],Pose:{LeftArm:[350f,0f,2f],RightArm:[350f,0f,358f]},DisabledSlots:4144959}

# audience and work villagers
function simondmc:story/chase/hall/reset-villagers
summon villager 23.8 105.5 32.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:fletcher",type:"minecraft:savanna"},Offers:{}}
summon villager 29.2 105.5 32.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:mason",type:"minecraft:jungle"},Offers:{}}
summon villager 37.8 105.5 32.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:fisherman",type:"minecraft:snow"},Offers:{}}
summon villager 43.2 105.5 32.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:fisherman",type:"minecraft:taiga"},Offers:{}}
summon villager 23.8 105.5 26.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:fletcher",type:"minecraft:snow"},Offers:{}}
summon villager 29.2 105.5 26.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:fisherman",type:"minecraft:desert"},Offers:{}}
summon villager 37.8 105.5 26.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:cleric",type:"minecraft:snow"},Offers:{}}
summon villager 43.2 105.5 26.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:butcher",type:"minecraft:plains"},Offers:{}}
summon villager 23.8 105.5 20.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:shepherd",type:"minecraft:desert"},Offers:{}}
summon villager 29.2 105.5 20.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:leatherworker",type:"minecraft:savanna"},Offers:{}}
summon villager 37.8 105.5 20.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:librarian",type:"minecraft:desert"},Offers:{}}
summon villager 43.2 105.5 20.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:librarian",type:"minecraft:plains"},Offers:{}}
summon villager 23.8 105.5 14.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:librarian",type:"minecraft:desert"},Offers:{}}
summon villager 29.2 105.5 14.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:nitwit",type:"minecraft:desert"},Offers:{}}
summon villager 37.8 105.5 14.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:fisherman",type:"minecraft:taiga"},Offers:{}}
summon villager 43.2 105.5 14.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:fisherman",type:"minecraft:taiga"},Offers:{}}
summon villager 23.8 105.5 8.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:cartographer",type:"minecraft:taiga"},Offers:{}}
summon villager 29.2 105.5 8.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:shepherd",type:"minecraft:taiga"},Offers:{}}
# player instead of this villager
summon villager 43.2 105.5 8.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:leatherworker",type:"minecraft:snow"},Offers:{}}
summon villager 23.8 105.5 2.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:mason",type:"minecraft:jungle"},Offers:{}}
summon villager 29.2 105.5 2.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:shepherd",type:"minecraft:plains"},Offers:{}}
summon villager 37.8 105.5 2.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:armorer",type:"minecraft:desert"},Offers:{}}
summon villager 43.2 105.5 2.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:armorer",type:"minecraft:plains"},Offers:{}}
summon villager 23.8 105.5 -3.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:cartographer",type:"minecraft:plains"},Offers:{}}
summon villager 29.2 105.5 -3.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:cartographer",type:"minecraft:taiga"},Offers:{}}
summon villager 37.8 105.5 -3.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:toolsmith",type:"minecraft:jungle"},Offers:{}}
summon villager 43.2 105.5 -3.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:farmer",type:"minecraft:savanna"},Offers:{}}
summon villager 23.8 105.5 -9.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:armorer",type:"minecraft:snow"},Offers:{}}
summon villager 29.2 105.5 -9.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:mason",type:"minecraft:taiga"},Offers:{}}
summon villager 37.8 105.5 -9.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:mason",type:"minecraft:taiga"},Offers:{}}
summon villager 43.2 105.5 -9.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:taiga"},Offers:{}}
summon villager 23.8 105.5 -15.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:toolsmith",type:"minecraft:taiga"},Offers:{}}
summon villager 29.2 105.5 -15.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:farmer",type:"minecraft:taiga"},Offers:{}}
summon villager 37.8 105.5 -15.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:nitwit",type:"minecraft:desert"},Offers:{}}
summon villager 43.2 105.5 -15.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:butcher",type:"minecraft:desert"},Offers:{}}
summon villager 23.8 105.5 -21.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:cleric",type:"minecraft:desert"},Offers:{}}
summon villager 29.2 105.5 -21.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:savanna"},Offers:{}}
summon villager 37.8 105.5 -21.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:mason",type:"minecraft:snow"},Offers:{}}
summon villager 43.2 105.5 -21.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:leatherworker",type:"minecraft:taiga"},Offers:{}}
summon villager 23.8 105.5 -27.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:farmer",type:"minecraft:desert"},Offers:{}}
summon villager 29.2 105.5 -27.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:plains"},Offers:{}}
summon villager 37.8 105.5 -27.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:toolsmith",type:"minecraft:snow"},Offers:{}}
summon villager 43.2 105.5 -27.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:weaponsmith",type:"minecraft:savanna"},Offers:{}}
summon villager 23.8 105.5 -33.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:butcher",type:"minecraft:snow"},Offers:{}}
summon villager 29.2 105.5 -33.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:farmer",type:"minecraft:savanna"},Offers:{}}
summon villager 37.8 105.5 -33.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:toolsmith",type:"minecraft:savanna"},Offers:{}}
summon villager 43.2 105.5 -33.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:farmer",type:"minecraft:taiga"},Offers:{}}
summon villager 23.8 105.5 -39.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-2"],VillagerData:{profession:"minecraft:cleric",type:"minecraft:taiga"},Offers:{}}
summon villager 29.2 105.5 -39.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-3"],VillagerData:{profession:"minecraft:mason",type:"minecraft:savanna"},Offers:{}}
summon villager 37.8 105.5 -39.5 {Rotation:[-90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-4"],VillagerData:{profession:"minecraft:farmer",type:"minecraft:swamp"},Offers:{}}
summon villager 43.2 105.5 -39.5 {Rotation:[90f,35f],Silent:1b,Invulnerable:1b,NoAI:1b,Tags:["character","work-villager","row-5"],VillagerData:{profession:"minecraft:librarian",type:"minecraft:plains"},Offers:{}}