-- PLD Gearsets
-- Created:4/1/2014
-- Last Modified: 7/19/2014
-- To Do List
--
--
--
--

if player.name == 'Feary' then
	-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')

	-- sets Macros: 0ff = 0  On = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='NIN' then
				set_macro_page(16,1)
			elseif player.sub_job =='DNC' then
				set_macro_page(16,2)
			elseif player.sub_job =='WAR' then
				set_macro_page(16,3)
			elseif player.sub_job =='BLU' then 
				set_macro_page(16,4)
			elseif player.sub_job =='RDM' then 
				set_macro_page(16,5)
			elseif player.sub_job =='RUN' then 
				set_macro_page(16,6)
			end
		elseif automacroset == 2 then
			set_macro_page(16,2)
		else
			windower.send_command('input /macro book 16')
		end
	-- Auto Sets
	physicalshield = {sub="Ochain"}
	magicalshield = {sub="Aegis"}

	-- Standard/idle
	sets.idle.PDT = { ammo="Hasty Pinion +1",
					head="Rev. Coronet +1", neck="Twilight Torque", lear="Ethereal Earring", rear="Etiolation Earring",
					
					body="Cab. Surcoat +1", hands="Redan Gloves", lring=Aug.Darkring1, rring="Defending Ring",
					back="Mollusca Mantle", waist="Nierenschutz", legs="Cab. Breeches", feet="Yorium Sabatons"}

	sets.idle.MDT = { ammo="Vanir Battery",
					head="Cizin Helm +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
					body="Cab. Surcoat +1", hands="Rev. Gauntlets", lring=Aug.Darkring1, rring="Defending Ring",
					back="Mollusca Mantle", waist="Creed Baudrier", legs="Yorium Cuisses", feet="Cab. Leggings"}

	sets.idle.MDT.Shell = { ammo="Vanir Battery",
					head="Cizin Helm +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
					body="Cab. Surcoat +1", hands="Reverence Gauntlets", lring=Aug.Darkring1, rring="Defending Ring",
					back="Engulfer Cape", waist="Creed Baudrier", legs="Yorium Cuisses", feet="Cab. Leggings"}

	sets.idle.BDT = { ammo="Hasty Pinion +1",
					head=Aug.Skirmish.Yorium.Head.DT, neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
					body="Cab. Surcoat +1", hands=Aug.Skirmish.Yorium.Hands.DT, lring=Aug.Darkring1, rring="Defending Ring",
					back="Mollusca Mantle", waist="Nierenschutz", legs=Aug.Skirmish.Yorium.Legs.DT, feet=Aug.Skirmish.Yorium.Feet.DT}			

	sets.idle.DT = { ammo="Hasty Pinion +1",
					head=Aug.Skirmish.Yorium.Head.DT, neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
					body="Cab. Surcoat +1", hands=Aug.Skirmish.Yorium.Hands.DT, lring=Aug.Darkring1, rring="Defending Ring",
					back="Mollusca Mantle", waist="Nierenschutz", legs=Aug.Skirmish.Yorium.Legs.DT, feet=Aug.Skirmish.Yorium.Feet.DT}			

	sets.misc.Town = set_combine(sets.idle.DT, {
					back="Shadow Mantle", legs="Blood Cuisses"})
					
	sets.idle.Standard = set_combine(sets.idle.PDT, {
					lear="Merman's Earring", rear="Etiolation Earring", 
					back="Shadow Mantle", legs="Blood Cuisses"})
					
	sets.lockstyle = set_combine(sets.idle.Standard,{
					legs="Kaiser Diechlings",
					})
	-- TP 
	sets.TP = {ammo="Ginsen",
			head="Sulevia's Mask +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souvereign
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Rajas Ring", rring="K'ayres Ring",
			back="Atheling Mantle", waist="Windbuffet Belt", legs="Sulevia's Cuisses +1", feet="Sulevia's Leggings +1"}
	sets.TP.Acc = { ammo="Hasty Pinion +1",
			head="Carmine Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souvereign
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Anguinus Belt", legs="Sulevia's Cuisses +1", feet="Carmine Greaves +1"}
	-- Tank 
	sets.TP.Tank = {ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souvereign
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Anguinus Belt", legs="Sulevia's Cuisses +1", feet="Sulevia's Leggings +1"}
	
	-- DT/Acc Turtle Build
	sets.TP.Hybrid = { ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souvereign
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Anguinus Belt", legs="Sulevia's Cuisses +1", feet="Sulevia's Leggings +1"}
	
	sets.Weakened = set_combine(sets.TP.Hybrid,{})

	-- Precast 
	sets.precast.Fastcast = set_combine(sets.idle.PDT, {ammo="Incantor Stone",
			-- 
			head="Carmine Mask +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
			--  Odyssean Chestplate Leyline Gloves
			body="Nuevo Coselete", hands="Buremte Gloves", lring="Veneficium Ring", rring="Prolix Ring",
			--
			waist="Goading Belt", legs="Enif Cosciales", feet="Carmine Greaves +1"})
	sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {waist="Siegel Sash"})
	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

		-- Misc Sets
	sets.misc.Waltz = set_combine(sets.precast.JA["Chivalry"],{})
	sets.misc.Steps = set_combine(sets.TP.Acc,{})
	sets.misc.flourish = {}
	
	-- Enmity Caps at ?, Gear caps at 120, Current is 
	sets.Enmity = set_combine(sets.idle.PDT,{ ammo="Paeapua",
			-- Loess Barbuta +1 Unmoving Collar +1 lear="Trux Earring", rear="Pluto's Pearl",
			head="Cab. Coronet", neck="Atzintli Necklace", 
			-- Souv. Cuirass +1 Yorium Gauntlets Apeile Ring +1
			body="Cab. Surcoat +1", hands="Cab. Gauntlets +1", lring="Vengeful Ring", rring="Apeile Ring",
			-- Obyssean Cuisses Eschite Greaves path A
			back=Aug.Cape.PLD.Enmity, waist="Creed Baudrier", legs="Cab. Breeches", feet="Cab. Leggings"})

	sets.HPDown = set_combine(sets.idle.PDT,{
					head="Cizin Helm +1", lear="Loquac. Earring",
					rring="Prolix Ring"})
	-- Midcast
	sets.midcast.Recast = set_combine(sets.precast.Fastcast,{})

	-- Healing Magic 
	sets.midcast.Cure = set_combine(sets.midcast.Recast,{ammo="Paeapua",
					-- Souv. Schaller +1 Nourish. Earring +1
					head="Carmine Mask +1", neck="Phalaina Locket", lear="Ethereal Earring", rear="Knightly Earring",
					body="Reverence Surcoat", hands="Buremte Gloves", lring="Meridian Ring", rring="K'ayres Ring",
					--  Solemnity Cape Rumination Sash Founder's Hose Odyssean Greaves
					back="Fravashi Mantle", waist="Chuq'aba Belt", legs="Rev. Breeches +1", feet="Cab. Leggings"})
	sets.midcast.Cure.Self = set_combine(sets.midcast.Cure,{ammo="Paeapua",
					-- Souv. Schaller +1
					neck="Phalaina Locket", lear="Ethereal Earring", rear="Knightly Earring",
					body="Reverence Surcoat", hands="Buremte Gloves", lring="Meridian Ring", rring="K'ayres Ring",
					--  Solemnity Cape Gishdubar Sash
					back="Fravashi Mantle", waist="Chuq'aba Belt", legs="Rev. Breeches +1", feet="Cab. Leggings"})

	-- Divine Magic - Enlight 490 Goal
	sets.midcast.DivineMagic = set_combine(sets.midcast.Recast,{
					-- head="Kahin Turban", heck="Nesanica Torque",
					lear="Beatific Earring", rear="Divine Earring",
					body="Reverence Surcoat", hands="Paragon Moufles", lring="Globidonta Ring", 
					back="Altruistic Cape", waist="Bishop's Sash", legs="Kaiser Diechlings", feet="Templar Sabatons"})

	sets.midcast.DivineMagic.Flash = set_combine(sets.midcast.DivineMagic,{ammo="Paeapua",
					-- lear="Trux Earring", rear="Pluto's Pearl",
					head="Carmine Mask +1", neck="Atzintli Necklace", 
					-- Apeile Ring +1
					body="Reverence Surcoat", hands="Cab. Gauntlets +1", lring="Vengeful Ring", rring="Apeile Ring",
					back=Aug.Cape.PLD.Enmity, waist="Goading Belt", legs="Cab. Breeches", feet="Cab. Leggings"})
	
	-- Enhancing Magic 				
	sets.midcast.EnhancingMagic = set_combine(sets.midcast.Recast,{
			-- Incantor Torque
			head="Carmine Mask +1", neck="Colossus's Torque", lear="Augment. Earring", rear="Andoaa Earring",
			-- body="Shabti Cuirass",
			-- Carmine Cuisses +1
			back="Merciful Cape", waist="Olympus Sash", legs="Rev. Breeches +1"})

	sets.midcast.EnhancingMagic.Phalanx = set_combine(sets.midcast.EnhancingMagic,{
			back="Weard Mantle",})
	
	sets.midcast.EnhancingMagic.Reprisal = set_combine(sets.midcast.EnhancingMagic, {
				-- Souvereign Schaller Dualism Collar +1 Odnowa Earring Odnowa Earring +1
				-- Souvereign Cuirass Souvereign Handschuhs Eihwaz Ring Meridian Ring 
				rring="Meridian Ring",
				-- Reiki Cloak Creed Baudrier Souv Diechlings Souv Schuhs
				waist="Creed Baudrier"})
	
	-- JA
	sets.precast.JA["Invincible"] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
	sets.precast.JA["Intervene"] = set_combine(sets.precast.JA["Shield Bash"],{
					lear="Knightly Earring",
					hands="Cab. Gauntlets +1"})
	-- MND			
	sets.precast.JA["Chivalry"] = set_combine(sets.idle.PDT,{hands="Cab. Gauntlets +1"},{
			head="Rev. Coronet +1", neck="Phalaina Locket",
			body="Cab. Surcoat +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
			legs="Cab. Breeches", feet="Carmine Greaves +1"})
	-- VIT - No Cap
	sets.precast.JA["Rampart"] = set_combine(sets.Enmity,{
					head="Cab. Coronet", 
					body="Cab. Surcoat +1", hands="Cab. Gauntlets +1",
					waist="Chuq'aba Belt", legs="Cab. Breeches", feet="Rev. Leggings +1"})
	sets.precast.JA["Sentinel"] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
	sets.precast.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
	sets.precast.JA["Fealty"] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
	sets.precast.JA["Shield Bash"] = set_combine(sets.Enmity,{
					hands="Cab. Gauntlets +1",lear="Knightly Earring"})

	-- WS
	sets.precast.WS = { ammo="Ginsen",
			-- Lust. Cap +1
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Lustr. Harness +1 Lustr.	Mittens +1 
			body="Chev. Cuirass", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			-- Lustr. Subligar +1 Lustra. Leggings +1
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"}
		
	sets.precast.WS.Acc = {ammo="Ginsen",
			head="Otomi Helm", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Chev. Cuirass", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Acro Breeches", feet="Acro Leggings"}

	-- Swords
	-- Requiescat
	sets.precast.WS['Requiescat'] = { ammo="Ginsen",
			-- Carmine Mask +1
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Carmine Mail +1 Carmine Fin. Gauntlets +1
			body="Chev. Cuirass", hands="Acro Gauntlets", lring="Levia. Ring +1", rring="Levia. Ring +1",
			-- Carmine Cuisses +1
			back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Acro Breeches", feet="Carmine Greaves +1"}
	
	sets.precast.WS.Acc['Requiescat'] = set_combine(sets.precast.WS.Requiescat, {ammo="Aqua Sachet",
			-- Carmine Mask +1
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Carmine Mail +1 Carmine Fin. Gauntlets +1
			body="Chev. Cuirass", hands="Acro Gauntlets", lring="Levia. Ring +1", rring="Levia. Ring +1",
			-- Carmine Cuisses +1
			back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Acro Breeches", feet="Carmine Greaves +1"})

	-- Savage Blade
	sets.precast.WS['Savage Blade'] = {ammo="Ginsen",
			-- Lust. Cap +1
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Lustr. Harness +1 Lustr.	Mittens +1 
			body="Chev. Cuirass", hands="Miki. Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			-- Metalsinger Belt Lustr. Subligar +1 Lustra. Leggings +1
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"}
	sets.precast.WS.Acc['Savage Blade'] = {ammo="Ginsen",
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			body="Chev. Cuirass", hands="Acro Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"}

	-- Chant du Cygne
	sets.precast.WS['Chant du Cygne'] = {ammo="Ginsen",
			-- Lust. Cap +1
			head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Lustr. Harness +1 Lustr.	Mittens +1 
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			-- Rudianos's Cape Chiner's Belt +1 Lustr. Subligar +1 Lustra. Leggings +1
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Sulvevia's Cuisses +1", feet="Sulvevia's Leggings +1"}
	
	sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Ginsen",
			-- Lust. Cap +1
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Lustr. Harness +1 Lustr.	Mittens +1 
			body="Chev. Cuirass", hands="Acro Gauntlets", lring="Rajas Ring", rring="Ramuh Ring +1",
			-- Rudianos's Cape Chiner's Belt +1 Lustr. Subligar +1 Lustra. Leggings +1
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"}
	
	-- Atonement
	sets.precast.WS['Atonement'] = set_combine(sets.precast.WS, sets.Enmity,{
			neck="Fotia Gorget", rear="Moonshade Earring",
			body="Phorcys Korazin", lring="",
			waist="Fotia Belt"})

	sets.precast.WS.Acc['Atonement'] = set_combine(sets.precast.WS.Atonement)
	
	-- Dagger
	-- Aeolian Edge
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
			-- Founder/obyssean
			head="Sukeroku Hachimaki", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
			-- Carmine Mail +1  Carmine Fin. Gauntlets +1  Shiva Ring +1 Shiva Ring +1 
			body="Chev. Cuirass", hands="Acro Gauntlets", lring="Shiva Ring", rring="Shiva Ring",
			back="Toro Cape", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"})

end