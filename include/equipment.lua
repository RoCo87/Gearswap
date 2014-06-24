-- Feary's Equipment
--
--
--
--


-- Augmented Gear
	Aug = {}
	Aug.Darkring1 = {name="Dark Ring",augments={"Phys. dmg. taken -5%","Magic dmg. taken -3%"}}
	Aug.Darkring2 = {name="Dark Ring",augments={"Phys. dmg. taken -4%","Magic dmg. taken -4%"}}
	Aug.Darkring1.Aniyah = {name="Dark Ring",augments={"Phys. dmg. Taken -4%", "Breath dmg. taken -4%"}}
	Aug.Darkring2.Aniyah = {name="Dark Ring",augments={"Spell interruption rate down 3%", "Magic dmg. taken -4%"}}
	Aug.Darkring1.Derion = {name="Dark Ring",augments={"Breath dmg. Taken -4%","Phys. dmg. Taken -5%", "Magic dmg. taken -3%"}}
	--Aug.Darkring2.Derion = {name="Dark Ring",augments={"Spell interruption rate down 3%", "Magic dmg. taken -4%"}}
	--Aug.Darkring1.Firetoplay = {name="Dark Ring",augments={"Phys. dmg. Taken -4%", "Breath dmg. taken -4%"}}
	--Aug.Darkring2.Firetoplay = {name="Dark Ring",augments={"Spell interruption rate down 3%", "Magic dmg. taken -4%"}}
	Aug.Darkring1.Carrisa = {name="Dark Ring",augments={"Magic dmg. taken -4%","Breath dmg. taken -4%"}}
	--Aug.Darkring2.Carrisa = {name="Dark Ring"}

	Aug.DemonRing1 = {name="Demon's Ring",augments={"Resist Curse+2","Mag. crit. hit dmg. +3%"}}
	Aug.DemonRing2 = {name="Demon's Ring",augments={"Resist Curse+2","Mag. crit. hit dmg. +3%"}}
	
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
		
	elemental.Obi = {['Light']='Korin Obi', ['Dark']='Anrin Obi', ['Fire']='Karin Obi', ['Ice']='Hyorin Obi', ['Wind']='Furin Obi',
			['Earth']='Dorin Obi', ['Lightning']='Rairin Obi', ['Water']='Suirin Obi'}

	elemental.Gorget = {['Light']='Light Gorget', ['Dark']='Shadow Gorget', ['Fire']='Flame Gorget', ['Ice']='Snow Gorget',
			['Wind']='Breeze Gorget', ['Earth']='Soil Gorget', ['Lightning']='Thunder Gorget', ['Water']='Aqua Gorget'}

	elemental.Belt = {['Light']='Light Belt', ['Dark']='Shadow Belt', ['Fire']='Flame Belt', ['Ice']='Snow Belt',
			['Wind']='Breeze Belt', ['Earth']='Soil Belt', ['Lightning']='Thunder Belt', ['Water']='Aqua Belt'}

			
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

