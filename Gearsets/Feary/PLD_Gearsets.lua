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
	
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')

	-- sets Macros: 0ff = 0  On = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='NIN' then
				set_macro_page(1,16)
			elseif player.sub_job =='DNC' then
				set_macro_page(1,16)
			elseif player.sub_job =='WAR' then
				set_macro_page(3,16)
			elseif player.sub_job =='BLU' then 
				set_macro_page(4,16)
			elseif player.sub_job =='RDM' then 
				set_macro_page(5,16)
			elseif player.sub_job =='RUN' then 
				set_macro_page(6,16)
			end
		elseif automacroset == 2 then
			set_macro_page(2,16)
		else
			windower.send_command('input /macro book 16')
		end
	-- Auto Sets
	physicalshield = {sub="Ochain"}
	magicalshield = {sub="Aegis"}

	-- Standard/Idle - Iron Gobbet
	sets.idle.PDT = { ammo="Hasty Pinion +1",
			-- Souveran Schaller +1 Combatant's Torque Thureous Earring
			head="Sulevia's Mask +1", neck="Twilight Torque", lear="Ethereal Earring", rear="Etiolation Earring",
			-- Chev. Gauntlets +1
			body="Tartarus Platemail", hands="Sulev. Gauntlets +1", lring=Aug.Darkring1, rring="Defending Ring",
			-- Chev Cuisses +1 Soveriegn Schuhs +1
			back=Aug.Cape.PLD, waist="Flume Belt +1", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}

	sets.idle.MDT = { ammo="Vanir Battery",
			-- Founder's Corona Warder's Charm +1
			head="Sulevia's Mask +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
			-- 
			body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",
			-- Flax Sash Cab Leggings +1
			back="Engulfer Cape +1", waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}

	sets.idle.MDT.Shell = { ammo="Vanir Battery",
			-- Founder's Corona Warder's Charm +1 Spellbr. Earring  Sanare Earring
			head="Sulevia's Mask +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
			body="Tartarus Platemail", hands="Souv. Handsch. +1", lring=Aug.Darkring1, rring="Defending Ring",
			back="Engulfer Cape +1", waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}

	sets.idle.BDT = { ammo="Hasty Pinion +1",
			-- Souveran Schaller +1 Zwazo Earring +1
			head="Sulevia's Mask +1", neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souv. Cuirass +1
			body="Cab. Surcoat +1", hands="Sulev. Gauntlets +1", lring=Aug.Darkring1, rring="Defending Ring",
			-- Xucau Mantle
			back="Mollusca Mantle", waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}			
		
	-- Turtle
	sets.idle.DT = { ammo="Hasty Pinion +1",
			-- Souv. Schaller +1 Warder's Charm Odnowa Earring +1 Odnowa Earring
			head="Sulevia's Mask +1", neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souveran Cuirass +1 
			body="Tartarus Platemail", hands="Souv. Handsch. +1", lring=Aug.Darkring1, rring="Defending Ring",
			-- Reiki Cloak  Gold Mog. Belt Souveran Schuhs +1
			back="Mollusca Mantle", waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}			

	sets.misc.Town = set_combine(sets.idle.PDT, {
				neck="Carver's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="craftmaster's Ring",
				waist="Carpenter's Belt", legs="Carmine Cuisses +1"})
		
		sets.lockstyle = set_combine(sets.misc.Town,{
				neck="Carver's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="craftmaster's Ring",
				waist="Carpenter's Belt", legs="Carmine Cuisses +1"})
		
		sets.idle.Fishing = set_combine(sets.idle.Standard,{range="Lu Shang's Fishing Rod", ammo="Sinking Minnow",
				head="Tlahtlamah Glasses", neck="Fisherman's Torque",
				body="Fisherman's Smock", hands="Kachina Gloves", lring="Noddy Ring", rring="",
				waist="Fisherman's Belt", legs="Fisherman's Hose", feet="Waders"})
		sets.idle.Wood = set_combine(sets.idle.Standard,{
				neck="Carver's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="Craftmaster's Ring",
				waist="Carpenter's Belt", legs="Carmine Cuisses +1"})		
					
	sets.idle.Standard = set_combine(sets.idle.PDT, {
			lear="Merman's Earring", rear="Etiolation Earring", 
			back="Shadow Mantle", legs="Carmine Cuisses +1"})
					
	sets.lockstyle = set_combine(sets.idle.Standard,{
			legs="Kaiser Diechlings",
			})
	-- TP 
	sets.TP = {ammo="Ginsen",
			head="Sulevia's Mask +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souveran Cuirass +1
			body="Chev. Cuirass", hands="Souv. Handsch. +1", lring="Rajas Ring", rring="K'ayres Ring",
			back=Aug.Cape.PLD.Enimty, waist="Windbuffet Belt", legs="Souv. Diechlings +1", feet="Sulevia's Leggings +1"}
	sets.TP.Acc = { ammo="Hasty Pinion +1",
			head="Carmine Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souveran
			body="Chev. Cuirass", hands="Souv. Handsch. +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Anguinus Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}
	-- Tank 
	sets.TP.Tank = {ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souveran
			body="Chev. Cuirass", hands="Souv. Handsch. +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Anguinus Belt", legs="Souv. Diechlings +1", feet="Sulevia's Leggings +1"}
	
	-- DT/Acc Turtle Build
	sets.TP.Hybrid = { ammo="Hasty Pinion +1",
			head="Sulevia's Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Souveran
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			back="Ground. Mantle +1", waist="Anguinus Belt", legs="Sulevia's Cuisses +1", feet="Sulevia's Leggings +1"}
	
	sets.Weakened = set_combine(sets.TP.Hybrid,{})

	-- Precast 
	sets.precast.Fastcast = set_combine(sets.idle.PDT, {ammo="Incantor Stone",
			-- neck="Voltsurge Torque",
			head="Carmine Mask +1", lear="Loquac. Earring", rear="Enchntr. Earring +1",
			--  Odyssean Chestplate Leyline Gloves lring="Veneficium Ring",
			hands="Buremte Gloves", rring="Prolix Ring",
			--legs="Enif Cosciales",
			back=Aug.Cape.PLD.FC, waist="Goading Belt", feet="Carmine Greaves +1"})
	sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {waist="Siegel Sash"})
	sets.precast.Cure = set_combine(sets.precast.Fastcast, {body="Jumalik Mail"})
	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})
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
			head="Rev. Coronet +1", neck="Phalaina Locket", lear="Ethereal Earring", rear="Knightly Earring",
			body="Jumalik Mail", hands="Buremte Gloves", lring="Meridian Ring", rring="K'ayres Ring",
			--  Solemnity Cape Rumination Sash Founder's Hose Odyssean Greaves
			back=Aug.Cape.PLD.Enmity, waist="Chuq'aba Belt", legs="Rev. Breeches +1", feet="Cab. Leggings"})
	sets.midcast.Cure.Self = set_combine(sets.midcast.Cure,{ammo="Paeapua",
			-- Souv. Schaller +1
			head="Rev. Coronet +1", neck="Phalaina Locket", lear="Ethereal Earring", rear="Knightly Earring",
			body="Jumalik Mail", hands="Buremte Gloves", lring="Meridian Ring", rring="K'ayres Ring",
			--  Solemnity Cape Gishdubar Sash
			back=Aug.Cape.PLD.Enmity, waist="Chuq'aba Belt", legs="Rev. Breeches +1", feet="Cab. Leggings"})

	-- Divine Magic - Enlight 490 Goal
	sets.midcast.DivineMagic = set_combine(sets.midcast.Recast,{
			-- head="Kahin Turban", heck="Nesanica Torque",
			lear="Beatific Earring", rear="Divine Earring",
			-- lring="Globidonta Ring", 
			body="Reverence Surcoat", hands="Paragon Moufles", 
			-- back="Altruistic Cape", 
			waist="Bishop's Sash", legs="Kaiser Diechlings", feet="Templar Sabatons"})

	sets.midcast.DivineMagic.Flash = set_combine(sets.midcast.DivineMagic,{ammo="Paeapua",
			-- lear="Trux Earring", rear="Pluto's Pearl",
			head="Cizin Helm +1", neck="Atzintli Necklace", 
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
	
	sets.midcast.EnhancingMagic.Refresh = {feet="Shab. Sabatons +1"}
	
	sets.midcast.EnhancingMagic.Reprisal = set_combine(sets.midcast.EnhancingMagic, {
				-- Souveran Schaller Dualism Collar +1 Odnowa Earring Odnowa Earring +1
				-- Souveran Cuirass Souveran Handschuhs Eihwaz Ring Meridian Ring 
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
					body="Cab. Surcoat +1", hands="Cab. Gauntlets +1", lring="Titan Ring", rring="Titan Ring",
					waist="Chuq'aba Belt", legs="Cab. Breeches", feet="Rev. Leggings +1"})
	sets.precast.JA["Sentinel"] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
	sets.precast.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
	sets.precast.JA["Fealty"] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
	sets.precast.JA["Shield Bash"] = set_combine(sets.Enmity,{
					lear="Knightly Earring",
					hands="Cab. Gauntlets +1"})

	-- WS
	sets.precast.WS = { ammo="Ginsen",
			-- Lust. Cap +1
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			-- Lustr. Harness +1 Lustr.	Mittens +1 
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			-- Lustr. Subligar +1 Lustra. Leggings +1
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"}
		
	sets.precast.WS.Acc = {ammo="Ginsen",
			head="Otomi Helm", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"}

	-- Swords
	-- Requiescat
	sets.precast.WS['Requiescat'] = { ammo="Ginsen",
			-- Carmine Mask +1
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Carmine Mail +1 Carmine Fin. Gauntlets +1
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
			-- Carmine Cuisses +1
			back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Sulevi. Cuisses +1", feet="Carmine Greaves +1"}
	
	sets.precast.WS.Acc['Requiescat'] = set_combine(sets.precast.WS.Requiescat, {ammo="Ginsen",
			-- Carmine Mask +1
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Carmine Mail +1 Carmine Fin. Gauntlets +1
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
			-- Carmine Cuisses +1
			back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Sulevi. Cuisses +1", feet="Carmine Greaves +1"})

	-- Savage Blade
	sets.precast.WS['Savage Blade'] = {ammo="Ginsen",
			-- Lust. Cap +1
			head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Lustr. Harness +1 Lustr.	Mittens +1 
			body="Chev. Cuirass", hands="Sulev. Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			-- Metalsinger Belt Lustr. Subligar +1 Lustra. Leggings +1
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"}
	sets.precast.WS.Acc['Savage Blade'] = {ammo="Ginsen",
			head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"}

	-- Chant du Cygne
	sets.precast.WS['Chant du Cygne'] = {ammo="Ginsen",
			-- Lust. Cap +1
			head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Lustr. Harness +1 Lustr.	Mittens +1 
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			-- Rudianos's Cape Chiner's Belt +1 Lustr. Subligar +1 Lustra. Leggings +1
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"}
	
	sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Ginsen",
			-- Lust. Cap +1
			head="Otomi Helm", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			-- Lustr. Harness +1 Lustr.	Mittens +1 
			body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			-- Rudianos's Cape Chiner's Belt +1 Lustr. Subligar +1 Lustra. Leggings +1
			back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"}
	
	-- Atonement
	sets.precast.WS['Atonement'] = set_combine(sets.precast.WS, sets.Enmity,{
			neck="Fotia Gorget", rear="Moonshade Earring",
			body="Phorcys Korazin", lring="",
			back=Aug.Cape.PLD.WS, waist="Fotia Belt"})

	sets.precast.WS.Acc['Atonement'] = set_combine(sets.precast.WS.Atonement)
	
	-- Dagger
	-- Aeolian Edge
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
			-- Founder/obyssean
		--	head="Sukeroku Hachimaki", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
			-- Carmine Mail +1  Carmine Fin. Gauntlets +1  Shiva Ring +1 Shiva Ring +1 
		--	body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Shiva Ring", rring="Shiva Ring",
			-- back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"
			})

end