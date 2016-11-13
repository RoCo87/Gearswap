-- Aniyah's BLU Gearsets
-- Created: 4/26/2014
-- Last Updated: 6/13/2014
-- To Do List:
--
--

if player.name == 'Aniyah' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')
		--Dynamisa aoe dd ddwar ddrdm dddnc ddnin
		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			
		else
			set_macro_page(8,3)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
				-- Herculean Head Loricate Torque +1
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
				-- Herculean Vest  Herculean Hands
                body="Emet Harness", hands="Hagondes Cuffs", lring=Aug.Darkring1.Aniyah, rring="Shadow Ring",
				-- Flume Belt Herculean Boots 
                back="Cheviot Cape", legs="Hagondes Pants +1", feet="Hagondes Sabots"}
		sets.idle.MDT = {
				-- Herculean Head Loricate Torque +1
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
				-- Herculean Vest  Herculean Hands
                body="Emet Harness", hands="Hagondes Cuffs", lring=Aug.Darkring1.Aniyah, rring="Shadow Ring",
                --  waist="Flume Belt", Herculean Boots 
				back="Shadow Mantle",  legs="Hagondes Pants +1", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {
				head="Orvail Corona +1", neck="Eidolon Pendant", lear="Relaxing Earring", rear="Antivenom Earring",
                body="Jhakri Robe", hands="Serpentes Cuffs",
                back="Cheviot Cape", waist="Austerity Belt", legs="Carmine Cuisses", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Merman's Earring",
				hands="Serpentes Cuffs",
				legs="Carmine Cuisses"})
		sets.misc.Town = set_combine(sets.idle.Standard, {body="Mirage Jubbah", legs="Carmine Cuisses"})
		
		-- JA
		sets.precast.JA["Azure Lore"] = {hands="Luhlaza Bazubands"}
		sets.precast.JA["Unbridled Wisdom"] = {}
		sets.precast.JA["Unbridled Learning"] = {}
		sets.precast.JA["Chain Affinity"] = {head="Hashishin Kavuk", feet="Magus Charuqs"}
		sets.precast.JA["Burst Affinity"] = {legs="Magus Shalwar", feet="Hashishin Basmak"}
		sets.precast.JA["Efflux"] = {legs="Hashishin Tayt"}
		sets.precast.JA["Diffusion"] = {feet="Mirage Charuqs"}
		sets.precast.JA["Convergence"] = {head="Mirage Keffiyeh"}
		sets.precast.JA["Enchainment"] = {body="Mirage Jubbah"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = set_combine(sets.idle.PDT, {ammo="Impatiens", 
				--neck="Orunmila's Torque", 
				head="Haruspex Hat", lear="Loquac. Earring",
                --body="Luhlaza Jubbah", hands="Thaumas Gloves", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Carmine Greaves"})
		sets.precast.BlueMagic = set_combine(sets.precast.Fastcast,{body="Mavi Mintan +2"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {back="Pahtli Cape"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		sets.midcast.ConserveMP = {feet="Carmine Greaves"}
		
		-- Blue Magic
		-- Skill
		sets.midcast.BlueMagic = set_combine(sets.TP,{ammo="Mavi Tathlum",
                head="Mirage Keffiyeh",
                body="Magus Jubbah", 
				--  back="Cornflower Cape", feet="Mirage Charuqs"
				legs="Hashishin Tayt"})
		
		sets.idle.BlueMagic = {}
		sets.idle.BlueMagic.Learn = set_combine(sets.midcast.BlueMagic,{
				hands="Magus Bazubands",
				-- Rosmerta's Cape
				back="Atheling Mantle"})
		
		-- Recast
		sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast,{hands="Mv. Bazubands +2"})
		
		-- STR
		sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
				head="Carmine Mask", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
				body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Ifrit Ring", rring="Ifrit Ring",
				back="Buquwik Cape", waist="Prosilio Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		-- STR Accuracy - 
		-- Heavy Strike
		sets.midcast.BlueMagic.STRAcc = set_combine(sets.midcast.BlueMagic.STR, {ammo="Ginsen",
				head="Carmine Mask", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
				body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Ifrit Ring", rring="Ifrit Ring",
				back="Buquwik Cape", waist="Prosilio Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		-- DEX
		-- Thrashing Assault
		sets.midcast.BlueMagic.DEX = set_combine(sets.midcast.BlueMagic.STR, {ammo="Ginsen",
				head="Carmine Mask", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
				body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Ifrit Ring", rring="Ifrit Ring",
				back="Buquwik Cape", waist="Prosilio Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		-- VIT
		-- Sinker Drill
		sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic.STR, {ammo="Flame Sachet",
                head="Carmine Mask", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
				body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Ifrit Ring", rring="Ifrit Ring",
				back="Buquwik Cape", waist="Prosilio Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		-- AGI
		sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
               head="Carmine Mask", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
				body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Ifrit Ring", rring="Ifrit Ring",
				back="Buquwik Cape", waist="Prosilio Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		-- MND
		sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Carmine Mask", neck="Tjukurrpa Medal", lear="Flame Pearl", rear="Flame Pearl",
				body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Ifrit Ring", rring="Ifrit Ring",
				back="Buquwik Cape", waist="Prosilio Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		-- INT
		sets.midcast.BlueMagic.INT = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Amalric Nails"})
		-- CHR
		sets.midcast.BlueMagic.CHR = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"})
		-- Macc
		sets.midcast.BlueMagic.Macc = set_combine(sets.midcast.BlueMagic, {
                -- head="Mirage Keffiyeh", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
				head="Jhakri Coronal",
				--body="Assimilator's Jubbah", hands="Hagondes Cuffs +1", lring="Sangoma Ring",
				body="Jhakri Robe", hands="Jhakri Cuffs", lring="Balrahn's Ring", rring="Perception Ring",
				--back="Cornflower Cape", waist="Ovate Rope", legs="Hashishin Tayt", feet="Helios Boots"
				back="Ogapepo Cape", legs="Jhakri Slops", feet="Jhakri Pigaches"})	
		-- Acc
		sets.midcast.BlueMagic.PhysMagicAcc = set_combine(sets.midcast.Macc, {
                head="Carmine Mask", neck="Iqabi Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Sangoma Ring", rring="Perception Ring",
				-- waist="Ovate Rope",
                back="Cornflower Cape", waist="Anguinus Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})

		-- Healing Cure Pot
		sets.midcast.BlueMagic.CurePot = set_combine(sets.midcast.BlueMagic.MND, {
				lear="Loquac. Earring",
				lring="Levia. Ring", rring="Levia. Ring",
                back="Tempered Cape"})
		sets.midcast.BlueMagic.CurePot.Self = set_combine(sets.midcast.BlueMagic.CurePot, {
                neck="Phalaina Locket",
                lring="Levia. Ring", rring="Levia. Ring",
                back="Tempered Cape", waist="Chuq'aba Belt"})
		-- White Wind = HP set
		sets.midcast.BlueMagic.WW = set_combine(sets.midcast.BlueMagic.CurePot, {
				lear="Loquac. Earring",
				lring="Kunaji Ring", rring="Asklepian Ring",
                back="Tempered Cape"})
		sets.midcast.BlueMagic.WW.Self = set_combine(sets.midcast.BlueMagic.CurePot.Self, {
                neck="Phalaina Locket",
                lring="Levia. Ring", rring="Levia. Ring",
                back="Tempered Cape", waist="Chuq'aba Belt",})
				
		-- Nuke
		sets.midcast.BlueMagic.Nuke = set_combine(sets.midcast.BlueMagic, {ammo="Dosis Tathlum",
                head="Jhakri Coronal", neck="Eddy Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
                body="Jhakri Robe", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Warwolf Belt", legs="Jhakri Slops", feet="Amalric Nails"})
				
		-- Dark - Tenerbal Crush
		sets.midcast.BlueMagic.Nuke.Dark = set_combine(sets.midcast.Nuke, {
				-- Pixie Hairpin +1
				head="Jhakri Coronal", neck="Eddy Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
				body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Archon Ring",
                back="Toro Cape", waist="Warwolf Belt", legs="Jhakri Slops", feet="Jhakri Pigaches"})
		
		-- Breath 
		sets.midcast.BlueMagic.Breath = set_combine(sets.midcast.BlueMagic.Nuke, {
				ammo="Mavi Tathlum",
				head="Luhlaza Keffiyeh"})

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {ammo="Vanir Battery",
                head="Carmine Mask", neck="Mavi Scarf", lear="Brutal Earring", rear="Ghillie Earring +1",
                body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		-- Accuracy
		sets.TP.Acc = set_combine(sets.TP, {
				head="Carmine Mask", neck="Mavi Scarf", lear="Brutal Earring", rear="Ghillie Earring +1",
                body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rringl="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
						
		-- Allianced Buffs - Haste + March x2 
		sets.TP.Buffed = set_combine(sets.TP, {})
		
		-- DT/Acc
		sets.TP.Hybrid = set_combine(sets.idle.PDT, {
              })
			  
		-- Weaponskill
		sets.precast.WS = set_combine(sets.TP, {ammo="Honed Tahtlum",
				head="Carmine Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rring="Ifrit Ring",
                back="Atheling Mantle", waist="Warwolf Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		sets.precast.WS.Acc = set_combine(sets.TP, {ammo="Honed Tathlum",
				head="Carmine Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rring="Ifrit Ring",
                back="Atheling Mantle", waist="Warwolf Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
	
		-- Sword
		-- Savage Blade - STR
		sets.precast.WS['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				head="Carmine Mask", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Flame Pearl",
                body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rring="Ifrit Ring",
                back="Buquwik Cape", waist="Warwolf Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		sets.precast.WS.Acc['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				head="Carmine Mask", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Flame Pearl",
                body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rring="Ifrit Ring",
                back="Buquwik Cape", waist="Warwolf Belt", legs="Carmine Cuisses", feet="Carmine Greaves"})
		-- Chant du Cygne - DEX Crit
		sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik Feather",
                head="Carmine Mask", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                --body="Luhlaza Jubbah", hands="Luh. Bazubands", lring="Rajas Ring", rring="Epona's Ring",
				body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rring="Ramuh Ring",
				back="Atheling Mantle", waist="Light Belt", legs="Carmine Cuisses", feet="Carmine Greaves"}
		sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Jukukik Feather",
                head="Carmine Mask", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                --body="Luhlaza Jubbah", hands="Luh. Bazubands", lring="Rajas Ring", rring="Epona's Ring",
				body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rring="Ramuh Ring",
				back="Atheling Mantle", waist="Warwolf Belt", legs="Carmine Cuisses", feet="Carmine Greaves"}
		-- Requiescat - MND
		sets.precast.WS['Requiescat'] = {ammo="Aqua Sachet",
                head="Whirlpool Mask", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Assim. Jubbah", hands="Buremte Gloves", lring="Aquasoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Shadow Belt", legs="Manibozho Brais", feet="Assim. Charuqs"}
		sets.precast.WS.Acc['Requiescat'] = {ammo="Aqua Sachet",
                head="Whirlpool Mask", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Assim. Jubbah", hands="Buremte Gloves", lring="Aquasoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Shadow Belt", legs="Manibozho Brais", feet="Assim. Charuqs"}	
		-- Expiacion
		sets.precast.WS['Expiacion'] = {ammo="Dosis Tathlum",
				head="Carmine Mask", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Flame Pearl",
                body="Adhemar Jacket", hands="Adhemar Wristbands", lring="Rajas Ring", rring="Ifrit Ring",
                back="Buquwik Cape", waist="Warwolf Belt", legs="Carmine Cuisses", feet="Carmine Greaves"}
		-- Sanguine Blade
		sets.precast.WS['Sanguine Blade'] = {ammo="Dosis Tathlum",
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Warwolf Belt", legs="Hagondes Pants +1", feet="Hashishin Basmak"}
		-- Realmrazer - MND/MAB
		sets.precast.WS['Realmrazer'] = {ammo="Hasty Pinion +1",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Levia. Ring", rring="Levia. Ring",
                back="Toro Cape", waist="Light Belt", legs="Hagondes Pants +1", feet="Hashishin Basmak"}
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end