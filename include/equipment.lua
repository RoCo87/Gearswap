-- Feary's Equipment
-- Created On 1/12/2014
-- Last Update:
-- To Do
--
--
--
--

-- Augmented Gear
	Aug = {}
	-- Dark Rings
	Aug.Darkring1 = {name="Dark Ring",augments={"Phys. dmg. taken -5%","Magic dmg. taken -3%"}}
	Aug.Darkring2 = {name="Dark Ring",augments={"Phys. dmg. taken -4%","Magic dmg. taken -4%"}}
	Aug.Darkring1.Aniyah = {name="Dark Ring",augments={"Phys. dmg. Taken -4%", "Breath dmg. taken -4%"}}
	Aug.Darkring2.Aniyah = {name="Dark Ring",augments={"Spell interruption rate down 3%", "Magic dmg. taken -4%"}}
	Aug.Darkring1.Derion = {name="Dark Ring",augments={"Breath dmg. Taken -4%","Phys. dmg. Taken -5%", "Magic dmg. taken -3%"}}
	--Aug.Darkring2.Derion = {name="Dark Ring",augments={"Spell interruption rate down 3%", "Magic dmg. taken -4%"}}
	--Aug.Darkring1.Firetoplay = {name="Dark Ring",augments={"Phys. dmg. Taken -4%", "Breath dmg. taken -4%"}}
	--Aug.Darkring2.Firetoplay = {name="Dark Ring",augments={"Spell interruption rate down 3%", "Magic dmg. taken -4%"}}
	Aug.Darkring1.Carrisa = {name="Dark Ring",augments={"Magic dmg. taken -4%","Breath dmg. taken -4%"}}
	Aug.Darkring2.Carrisa = {name="Dark Ring",augments={"Magic dmg. taken -4%","Breath dmg. taken -4%"}}

	-- Demon Rings
	Aug.DemonRing1 = {name="Demon's Ring",augments={"Resist Curse+2","Mag. crit. hit dmg. +3%"}}
	Aug.DemonRing2 = {name="Demon's Ring",augments={"Resist Curse+2","Mag. crit. hit dmg. +3%"}}
	
	-- Skirmish
	Aug.Skirmish = {}
	
	-- Yorcia 
	-- Hagondes 
	Aug.Skirmish.Hagondes = {}
	Aug.Skirmish.Hagondes.Head = {}
	Aug.Skirmish.Hagondes.Body = {}
	Aug.Skirmish.Hagondes.Hands = {}
	Aug.Skirmish.Hagondes.Legs = {}
	Aug.Skirmish.Hagondes.Feet = {}
	
	-- Alluvion Skirmish
	-- Acro 
	Aug.Skirmish.Acro = {}
	Aug.Skirmish.Acro.Head = {}
	Aug.Skirmish.Acro.Body = {}
	Aug.Skirmish.Acro.Hands = {}
	Aug.Skirmish.Acro.Legs = {}
	Aug.Skirmish.Acro.Feet = {}
	
	-- Yorium
	Aug.Skirmish.Yorium = {}
	Aug.Skirmish.Yorium.Head = {}
	Aug.Skirmish.Yorium.Body = {}
	Aug.Skirmish.Yorium.Hands = {}
	Aug.Skirmish.Yorium.Legs = {}
	Aug.Skirmish.Yorium.Feet = {}
	
	-- Taeon
	Aug.Skirmish.Taeon = {}
	Aug.Skirmish.Taeon.Head = {}
	Aug.Skirmish.Taeon.Body = {}
	Aug.Skirmish.Taeon.Hands = {}
	Aug.Skirmish.Taeon.Legs = {}
	Aug.Skirmish.Taeon.Feet = {}
	
	-- Helios - WHM BLM RDM SMN BLU SCH GEO
	Aug.Skirmish.Helios = {}
	Aug.Skirmish.Helios.Head = {}
	Aug.Skirmish.Helios.Body = {}
	Aug.Skirmish.Helios.Hands = {}
	Aug.Skirmish.Helios.Legs = {}
	Aug.Skirmish.Helios.Feet = {}
	
	Aug.Skirmish.Helios.Head.MAB = {name="Helios Band",augments={"", ""}}
	Aug.Skirmish.Helios.Hands.MAB = {name="Helios Gloves",augments={"", ""}}
	Aug.Skirmish.Helios.Feet.MAB = {name="Helios Boots",augments={"", ""}}
	
	-- Telchine - WHM BLM RDM BRD SMN BLU SCH GEO
	Aug.Skirmish.Telchine = {}
	Aug.Skirmish.Telchine.Head = {}
	Aug.Skirmish.Telchine.Body = {}
	Aug.Skirmish.Telchine.Hands = {}
	Aug.Skirmish.Telchine.Legs = {}
	Aug.Skirmish.Telchine.Feet = {}
	
	Aug.Skirmish.Telchine.Feet.Song = {name="Telchine Pigaches",augments={"", ""}}
	
-- Magian Staves
	-- Elemental Precast
		Fastcast = {}
		Fastcast.Staff = {['Light']='Arka I', ['Dark']='Xsaeta I', ['Fire']='Atar I', ['Ice']='Vourukasha I',
				['Wind']='Vayuvata I', ['Earth']='Vishrava I', ['Lightning']='Apamajas I', ['Water']='Haoma I', ['Thunder']='Apamajas I'}
		Fastcast.Staff.ID = {['Light']=19932, ['Dark']=19936, ['Fire']=19914, ['Ice']=19917,
				['Wind']=19920, ['Earth']=19923, ['Lightning']=19926, ['Water']=19929, ['Thunder']=19926}
	-- Elemental Recast
		Recast = {}
		Recast.Staff = {['Light']='Arka II', ['Dark']='Xsaeta II', ['Fire']='Atar II', ['Ice']='Vourukasha II',
				['Wind']='Vayuvata II', ['Earth']='Vishrava II', ['Lightning']='Apamajas II', ['Water']='Haoma II', ['Thunder']='Apamajas II'}
		Recast.Staff.ID = {['Light']=19933, ['Dark']=19937, ['Fire']=19915, ['Ice']=19918,
				['Wind']=19921, ['Earth']=19924, ['Lightning']=19927, ['Water']=19930, ['Thunder']=19927}

	-- Perp Cost Staves
		Prep = {}
		Prep.Staff = {['Light']='Arka III', ['Dark']='Xsaeta III', ['Fire']='Atar III', ['Ice']='Vourukasha III',
				['Wind']='Vayuvata III', ['Earth']='Vishrava III', ['Lightning']='Apamajas III', ['Water']='Haoma III', ['Thunder']='Apamajas III'}
		Prep.Staff.ID = {['Light']=19934, ['Dark']=19938, ['Fire']=19916, ['Ice']=19919,
				['Wind']=19922, ['Earth']=19925, ['Lightning']=19928, ['Water']=19931, ['Thunder']=19928}

-- Elemental Gear 
	elemental = {}
		
	elemental.Obi = {['Light']='Hachirin-no-Obi', ['Dark']='Anrin Obi', ['Fire']='Hachirin-no-Obi', ['Ice']='Hachirin-no-Obi', ['Wind']='Hachirin-no-Obi',
			['Earth']='Hachirin-no-Obi', ['Lightning']='Hachirin-no-Obi', ['Water']='Hachirin-no-Obi'}

	elemental.Gorget = {['Light']='Fortia Gorget', ['Dark']='Fortia Gorget', ['Fire']='Fortia Gorget', ['Ice']='Fortia Gorget',
			['Wind']='Fortia Gorget', ['Earth']='Fortia Gorget', ['Lightning']='Fortia Gorget', ['Water']='Fortia Gorget'}

	elemental.Belt = {['Light']='Fortia Belt', ['Dark']='Shadow Belt', ['Fire']='Fortia Belt', ['Ice']='Fortia Belt',
			['Wind']='Fortia Belt', ['Earth']='Fortia Belt', ['Lightning']='Fortia Belt', ['Water']='Fortia Belt'}

			
-------------------------------------------------------------------------------------------------------------------
-- Mappings, lists and sets to describe game relationships that aren't easily determinable otherwise.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Elemental mappings for element relationships and certian types of spells.
-------------------------------------------------------------------------------------------------------------------

elements = {}

elements.list = S{'Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water'}

elements.weak_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Ice', ['Ice']='Wind', ['Wind']='Earth', ['Earth']='Lightning',
['Lightning']='Water', ['Water']='Fire'}

elements.strong_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Water', ['Ice']='Fire', ['Wind']='Ice', ['Earth']='Wind',
['Lightning']='Earth', ['Water']='Lightning'}

elements.storm_of = {['Light']="Aurorastorm", ['Dark']="Voidstorm", ['Fire']="Firestorm", ['Earth']="Sandstorm",
['Water']="Rainstorm", ['Wind']="Windstorm", ['Ice']="Hailstorm", ['Lightning']="Thunderstorm"}

elements.spirit_of = {['Light']="Light Spirit", ['Dark']="Dark Spirit", ['Fire']="Fire Spirit", ['Earth']="Earth Spirit",
['Water']="Water Spirit", ['Wind']="Air Spirit", ['Ice']="Ice Spirit", ['Lightning']="Thunder Spirit"}



storms = S{"Aurorastorm", "Voidstorm", "Firestorm", "Sandstorm", "Rainstorm", "Windstorm", "Hailstorm", "Thunderstorm"}


skillchain_elements = {}
skillchain_elements.Light = S{'Light','Fire','Wind','Lightning'}
skillchain_elements.Dark = S{'Dark','Ice','Earth','Water'}
skillchain_elements.Fusion = S{'Light','Fire'}
skillchain_elements.Fragmentation = S{'Wind','Lightning'}
skillchain_elements.Distortion = S{'Ice','Water'}
skillchain_elements.Gravitation = S{'Dark','Earth'}
skillchain_elements.Transfixion = S{'Light'}
skillchain_elements.Compression = S{'Dark'}
skillchain_elements.Liquification = S{'Fire'}
skillchain_elements.Induration = S{'Ice'}
skillchain_elements.Detonation = S{'Wind'}
skillchain_elements.Scission = S{'Earth'}
skillchain_elements.Impaction = S{'Lightning'}
skillchain_elements.Reverberation = S{'Water'}



-- list of weaponskills that use ammo
bow_gun_weaponskills = S{"Flaming Arrow", "Piercing Arrow", "Dulling Arrow", "Sidewinder", "Blast Arrow",
						"Arching Arrow", "Empyreal Arrow", "Refulgent Arrow", "Apex Arrow", "Namas Arrow", "Jishnu's Radiance",
						"Hot Shot", "Split Shot", "Sniper Shot", "Slug Shot", "Blast Shot", "Heavy Shot", "Detonator",
						"Numbing Shot", "Last Stand", "Coronach", "Trueflight", "Leaden Salute", "Wildfire"}

-- list of weaponskills that can be used at greater than melee range
ranged_weaponskills = S{"Flaming Arrow", "Piercing Arrow", "Dulling Arrow", "Sidewinder", "Arching Arrow",
"Empyreal Arrow", "Refulgent Arrow", "Apex Arrow", "Namas Arrow", "Jishnu's Radiance",
"Hot Shot", "Split Shot", "Sniper Shot", "Slug Shot", "Heavy Shot", "Detonator", "Last Stand",
"Coronach", "Trueflight", "Leaden Salute", "Wildfire",
"Myrkr"}

