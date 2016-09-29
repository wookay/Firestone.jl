using PyCall
using Base.Test

enums = pyimport("hearthstone.enums")

CardClass = enums[:CardClass]
CardType = enums[:CardType] 
GameTag = enums[:GameTag]

@test 3 == CardType[:HERO]

# CardClass
# (0,"INVALID")
# (1,"DEATHKNIGHT")
# (2,"DRUID")
# (3,"HUNTER")
# (4,"MAGE")
# (5,"PALADIN")
# (6,"PRIEST")
# (7,"ROGUE")
# (8,"SHAMAN")
# (9,"WARLOCK")
# (10,"WARRIOR")
# (11,"DREAM")
# (12,"NEUTRAL")

# CardType
# (0,:INVALID)
# (1,:GAME)
# (2,:PLAYER)
# (3,:HERO)
# (4,:MINION)
# (5,:SPELL)
# (6,:ENCHANTMENT)
# (7,:WEAPON)
# (8,:ITEM)
# (9,:TOKEN)
# (10,:HERO_POWER)

cards = pyimport("fireplace.cards")
cards[:filter](collectible=true) # [fireplace.__init__]: Initializing card database
                                 # [fireplace.__init__]: Merged 2528 cards
db = cards[:db]

karazhan = db["KAR_037t"] # PyObject <KAR_037t: 'Secrets of Karazhan'>
@test "Secrets of Karazhan" == karazhan[:name]
@test CardType[:ENCHANTMENT] == karazhan[:type]
@test CardClass[:NEUTRAL] == karazhan[:card_class]
@test !karazhan[:collectible]

# [x for x in a if x[2][:name]=="Alexstrasza" ]
# EX1_561: 'Alexstrasza'
alex = db["EX1_561"]
@test "Alexstrasza" == alex[:name]
@test CardType[:MINION] == alex[:type]
@test CardClass[:NEUTRAL] == alex[:card_class]
@test alex[:collectible]
