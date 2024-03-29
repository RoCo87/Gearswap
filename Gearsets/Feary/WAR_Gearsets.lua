-- WAR Gear_sets
-- Created: 6/1/2014
-- Last Modified: 6/14/2014
-- To Do:
--

if player.name == 'Feary' then
-- includes
	
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { ammo="Vanir Battery",
				head="Cizin Helm +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Cizin Mail +1", hands="Cizin Mufflers +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Cizin Breeches", feet="Cizin Greaves +1"}

sets.idle.MDT = { ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Cizin Mail +1", hands="Cizin Mufflers +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape +1", waist="Nierenschutz", legs="Cizin Breeches +1", feet="Cizin Greaves +1"}

sets.misc.Town = set_combine(sets.idle.PDT, {feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Etiolation Earring", feet="Hermes' Sandals"})

sets.lockstyle = set_combine(sets.misc.Town,{})

-- Precast
-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				head="Cizin Helm +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				rring="Prolix Ring"})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = set_combine(sets.idle.PDT,{lring="Asklepian Ring"})
sets.misc.Steps = {ammo="Ginsen",
			head="Yaoyotl Helm", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Boii Mufflers", lring="Patricius Ring", rring="Ramuh Ring +1",
            back="Kayapa Cape", waist="Anguinus Belt", legs=Aug.Skirmish.Yorium.DT, feet="Boii Calligae"}
sets.misc.flourish = {}

-- JA
sets.Enmity = {}

sets.precast.JA["Mighty Strikes"] = {hands="Agoge Mufflers"}
sets.precast.JA["Brazen Rush"] = {}

sets.precast.JA["Provoke"] = set_combine(sets.Enmity,{})
sets.precast.JA["Berserk"] = {body="Pummeler's Lorica", feet="Agoge Calligae"}
sets.precast.JA["Defender"] = {}
sets.precast.JA["Warcry"] = {head="Agoge Mask"}
sets.precast.JA["Aggressor"] = {head="Pummeler's Mask", body="Agoge Lorica"}
sets.precast.JA["Tomahawk"] = {ammo="Thr. Tomahawk", feet="Agoge Calligae"}
sets.precast.JA["Restraint"] = {hands="Ravager's Mufflers +2"}
sets.precast.JA["Warrior's Charge"] = {legs="Agoge Cuisses"}
sets.precast.JA["Savagery"] = {head="Agoge Mask"}
sets.precast.JA["Aggressive Aim"] = {body="Agoge Lorica"}


-- Generic TP Set
sets.TP = { ammo="Ginsen",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt +1", legs="Agoge Cuisses", feet="Boii Calligae"}
sets.TP.Acc = {ammo="Ginsen",
			head="Otomi Helm", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Dynamic Belt +1", legs="Agoge Cuisses", feet="Boii Calligae"}

sets.TP.Hybrid = { ammo="Hasty Pinion +1",
				head=Aug.Skirmish.Yorium.Head.DT, neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Cizin Mail +1", hands=Aug.Skirmish.Yorium.Hands.DT, lring=Aug.Darkring1, rring="Defending Ring",
                back="Mollusca Mantle", waist="Nierenschutz", legs=Aug.Skirmish.Yorium.Legs.DT, feet=Aug.Skirmish.Yorium.Feet.DT}			

-- Great Axe TP 
sets.TP.GA = {  ammo="Ginsen",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt +1", legs="Agoge Cuisses", feet="Boii Calligae"}

-- Ionis Haste +2% Save TP 25+
sets.TP.GA.Ionis = set_combine(sets.TP.GA, {  ammo="Ginsen",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt +1", legs="Agoge Cuisses", feet="Boii Calligae"})

-- Great Axe Accuracy TP
sets.TP.GA.Acc = {	ammo="Ginsen",
			head="Otomi Helm", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Dynamic Belt +1", legs="Agoge Cuisses", feet="Boii Calligae"}

sets.TP.GA.Acc.Ionis = set_combine(sets.TP.GA.Acc,{ammo="Ginsen",
			head="Otomi Helm", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Dynamic Belt +1", legs="Agoge Cuisses", feet="Boii Calligae"})

-- GreatSword
sets.TP.GS = {ammo="Ginsen",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt +1", legs="Agoge Cuisses", feet="Boii Calligae"}

sets.TP.GS.Acc = set_combine(sets.TP.GS,{ammo="Ginsen",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Boii Lorica", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt +1", legs="Agoge Cuisses", feet="Boii Calligae"})

-- Weaponskills
sets.precast.WS = {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"}
sets.precast.WS.Acc = {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"}
				
sets.precast.WS.MS = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"})
-- Great Axe
-- Ukko's Fury
sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Otomi Helm", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Acro Breeches", feet="Acro Leggings"})

sets.precast.WS.Acc["Ukko's Fury"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Otomi Helm", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Acro Breeches", feet="Acro Leggings"})
				
-- Upheaval				
sets.precast.WS["Upheaval"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"})

sets.precast.WS.MS["Upheaval"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"})
		
sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"})
sets.precast.WS.MS["Fell Cleave"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"})

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Boii Lorica", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"})
				

end