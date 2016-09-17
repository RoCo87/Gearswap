-- BLU Gearsets
-- Created: 4/26/2014
-- Last Updated: 6/13/2014
-- To Do List:
-- Spell.Interrupted 
--
--
--

if player.name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(8,1)
			elseif player.sub_job == 'WAR' then
				set_macro_page(8,2)
			elseif player.sub_job == 'RDM' then
				set_macro_page(8,3)
			elseif player.sub_job == 'DNC' then
				set_macro_page(8,4)
			elseif player.sub_job == 'NIN' then 
				set_macro_page(8,5)
			end
		else
			set_macro_page(8,1)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Flume Belt", legs="Hagondes Pants +1", feet="Hag. Sabots +1"}
		sets.idle.MDT = {ammo="Vanir Battery",
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape +1", waist="Flume Belt",  legs="Hagondes Pants +1", feet="Hag. Sabots +1"}			
		sets.Resting = set_combine(sets.idle.PDT, {
				neck="Eidolon Pendant",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Umbra Cape", waist="Austerity Belt", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Etiolation Earring",
				legs="Blood Cuisses"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				legs="Blood Cuisses"})
		 sets.lockstyle = set_combine{sets.misc.Town}
		 sets.idle.Fishing = set_combine(sets.idle.Standard,{range="Lu Sh. F. Rod +1", ammo="Sinking Minnow",
				head="Tlahtlamah Glasses", neck="Fisherman's Torque",
				body="Fisherman's Smock", hands="Kachina Gloves", lring="Noddy Ring", rring="Puffin Ring",
				waist="Fisherman's Belt", legs="Fisherman's Hose", feet="Waders"})
		sets.idle.Wood = set_combine(sets.idle.Standard,{
				neck="Carpenter's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="Craftmaster's Ring",
				waist="Carpenter's Belt"})		
				 
		-- JA
		sets.precast.JA["Azure Lore"] = {hands="Luhlaza Bazubands"}
		sets.precast.JA["Unbridled Wisdom"] = {}
		
		sets.precast.JA["Unbridled Learning"] = {}
		sets.precast.JA["Chain Affinity"] = {head="Hashishin Kavuk", feet="Assimilator's Charuqs"}
		sets.precast.JA["Burst Affinity"] = {legs="Mirage Shalwar", feet="Mavi Basmak +2"}
		sets.precast.JA["Efflux"] = {legs="Hashishin Tayt"}
		sets.precast.JA["Diffusion"] = {feet="Luhlaza Charuqs"}
		sets.precast.JA["Convergence"] = {head="Luhlaza Keffiyeh"}
		sets.precast.JA["Enchainment"] = {body="Luhlaza Jubbah"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Impatiens",
				-- neck="Voltsurge Torque", 
				head="Carmine Mask +1", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				-- Leyline Gloves
                body="Luhlaza Jubbah", hands="Thaumas Gloves", rring="Prolix Ring",
				-- 
                back="Swith Cape +1", waist="Witful Belt", legs="Orvail Pants +1", feet="Carmine Greaves +1"}
		sets.precast.BlueMagic = set_combine(sets.precast.Fastcast,{body="Hashishin Mintan"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {back="Pahtli Cape"})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {ammo="Ginsen",
				head="Carmine Mask +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Adhemar Jacket  Adhemar Wristbands lring="Petrov Ring"
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas Ring", rring="Epona's Ring",
                -- Rosmerta's Cape 
				back="Ground. Mantle +1", waist="Windbuffet Belt", legs="Samnuha Tights", feet="Carmine Greaves +1"}
		sets.misc.flourish = {}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {
			waist="Witful Belt"})
		sets.midcast.ConserveMP = {feet="Carmine Greaves +1"}
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {ammo="Vanir Battery",
				-- Adhemar Bonnet
                head="Carmine Mask +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Adhemar Jacket  Adhemar Wristbands lring="Petrov Ring"
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas Ring", rring="Epona's Ring",
                -- Bleating Mantle 
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Samnuha Tights", feet="Carmine Greaves +1"})
		-- Accuracy - Need 1200 Acc - 100 = 1100
		sets.TP.Acc = set_combine(sets.TP, {ammo="Ginsen",
               -- Adhemar Bonnet Zennoroi	
                head="Carmine Mask +1", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Adhemar Jacket  Adhemar Wristbands lring="Cacoethic Ring +1"
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ramuh Ring +1", rring="Patricius Ring",
				-- Rosmerta Cape
				back="Ground. Mantle +1", waist="Anguinus Belt", legs="Taeon Tights", feet="Carmine Greaves +1"})
		-- Alliance Buffs - Haste + March x2 
		sets.TP.Buffed = set_combine(sets.TP, {ammo="Ginsen",
                -- Adhemar Bonnet
                head="Carmine Mask +1", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Adhemar Jacket  Adhemar Wristbands lring="Petrov Ring"
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas Ring", rring="Epona's Ring",
                -- Bleating Mantle 
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Samnuha Tights", feet="Carmine Greaves +1"})
				
		--  DT/Acc
		sets.TP.Hybrid = set_combine(sets.idle.PDT, {ammo="Ginsen",
                -- Adhemar Bonnet 	
                head="Carmine Mask +1", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Adhemar Jacket  Adhemar Wristbands lring="Petrov Ring"
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas Ring", rring="Epona's Ring",
                -- Bleating Mantle 
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Samnuha Tights", feet="Carmine Greaves +1"})
				
		-- Blue Magic
		-- Skill
		sets.midcast.BlueMagic = set_combine(sets.TP, {ammo="Mavi Tathlum",
                head="Luhlaza Keffiyeh",
				-- hands="Fea's Cuffs",
                body="Assimilator's Jubbah", 
                back="Cornflower Cape", legs="Hashishin Tayt", feet="Luhlaza Charuqs"})
		sets.idle.BlueMagic = {}
		sets.idle.BlueMagic.Learn = set_combine(sets.midcast.BlueMagic,{hands="Assim. Bazu.", back="Atheling Mantle"})
		
		-- Recast
		sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast,{hands="Hashi. Bazubands"})
		
		-- STR
		sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- STR Accuracy - I.E Heavy Strike
		sets.midcast.BlueMagic.STRAcc = set_combine(sets.midcast.BlueMagic, {ammo="Ginsen",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- Dex 
		sets.midcast.BlueMagic.DEX = set_combine(sets.midcast.BlueMagic, {ammo="Ginsen",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- VIT
		sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- AGI
		sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- MND
		sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Taeon Chapeau", neck="Phalaina Locket", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands="Luhlaza Bazubands", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Hashishin Tayt", feet="Taeon Boots"})
		-- INT
		sets.midcast.BlueMagic.INT = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"})
		-- CHR
		sets.midcast.BlueMagic.CHR = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"})
		-- Macc
		sets.midcast.BlueMagic.Macc = set_combine(sets.midcast.BlueMagic, {
                head="Jhakri Coronal", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Jhakri Robe", hands="Jhakri Cuffs +1", lring="Sangoma Ring", rring="Perception Ring",
                back="Cornflower Cape", waist="Ovate Rope", legs="Jhakri Slops", feet="Jhakri Pigaches +1"})	
		-- Acc
		sets.midcast.BlueMagic.PhysMagicAcc = set_combine(sets.midcast.Macc, {
                head="Luhlaza Keffiyeh", neck="Iqabi Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Assimilator's Jubbah", hands="Helios Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Cornflower Cape", waist="Ovate Rope", legs="Hashishin Tayt", feet="Helios Boots"})

		-- Healing Cure Pot
		sets.midcast.BlueMagic.CurePot = set_combine(sets.midcast.BlueMagic.MND, {
				head="Telchine Cap", neck="Phalaina Locket", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				body="Telchine Chas.", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Chuq'aba Belt", legs="Telchine Braconi", feet="Telchine Pigaches"})
		sets.midcast.BlueMagic.CurePot.Self = set_combine(sets.midcast.BlueMagic.CurePot, {
                neck="Phalaina Locket",
                hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Chuq'aba Belt",})
		
		-- Nuke
		sets.midcast.BlueMagic.Nuke = set_combine(sets.midcast.BlueMagic, {ammo="Dosis Tathlum",
                head="Jhakri Coronal", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs +1", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"})
		-- Dark
		sets.midcast.BlueMagic.Nuke.Dark = set_combine(sets.midcast.Nuke, {
				-- Pixie Hairpin +1
                head="Jhakri Coronal", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Archon Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"})
		-- Breath 
		sets.midcast.BlueMagic.Breath = set_combine(sets.midcast.BlueMagic.Nuke, {ammo="Mavi Tathlum",
				head="Luhlaza Keffiyeh"
				})
		
		
		-- Weaponskill
		sets.precast.WS = set_combine(sets.TP, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"})
		sets.precast.WS.Acc = set_combine(sets.TP, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"})		
		-- Savage Blade
		sets.precast.WS['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		sets.precast.WS.Acc['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- Chant du Cygne
		sets.precast.WS['Chant du Cygne'] = {ammo="Ginsen",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ramuh Ring +1", rring="Epona's Ring",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Ginsen",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ramuh Ring +1", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		-- Requiescat
		sets.precast.WS['Requiescat'] = {ammo="Vanir Battery",
                head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- Carmine Mail +1 Carmine Fin. Ga. +1
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Levia. Ring +1", rring="Epona's Ring",
                -- Rosmerta's Cape 
				back="Atheling Mantle", waist="Fotia Belt", legs="Samnuha Tights", feet="Carmine Greaves +1"}
		sets.precast.WS.Acc['Requiescat'] = {ammo="Vanir Battery",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		-- Expiacion
		sets.precast.WS['Expiacion'] = {ammo="Dosis Tathlum",
                head="Hagondes Hat +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Epona's Ring",
                back="Vespid Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		-- Sanguine Blade
		sets.precast.WS['Sanguine Blade'] = {ammo="Aqua Sachet",
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"}
		-- Realmrazer
		sets.precast.WS['Realmrazer'] = {ammo="Hasty Pinion +1",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"}
		
	
end