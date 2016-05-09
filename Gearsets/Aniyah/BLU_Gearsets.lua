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

		-- sets Macros off = 0  on = 1
		automacroset = 0
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
			set_macro_page(8,3)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
				head="Hagondes Hat +1", neck="Twilight Torque",
                body="Emet Harness", hands="Hagondes Cuffs", lring=Aug.Darkring1.Aniyah, rring=Aug.Darkring2.Aniyah,
                back="Cheviot Cape", waist="Flume belt", legs="Hagondes Pants +1", feet="Hagondes Sabots"}
		sets.idle.MDT = {
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Emet Harness", hands="Hagondes Cuffs", lring=Aug.Darkring1.Aniyah, rring="Shadow Ring",
                back="Shadow Mantle", waist="Flume Belt",  legs="Hagondes Pants +1", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {
				head="Ovail Corona +1", neck="Eidolon Pendant", lear="Relaxing Earring", rear="Antivenom Earring",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Cheviot Cape", waist="Austerity Belt", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Merman's Earring",
				hands="Serpentes Cuffs",
				legs="Crimson Cuisses"})
		sets.misc.Town = set_combine(sets.idle.Standard, {body="Mirage Jubbah", legs="Crimson Cuisses"})
		
		-- JA
		sets.precast.JA["Azure Lore"] = {hands="Luhlaza Bazubands"}
		sets.precast.JA["Unbridled Wisdom"] = {}
		
		sets.precast.JA["Unbridled Learning"] = {}
		sets.precast.JA["Chain Affinity"] = {head="Mavi Kavuk +2", feet="Magus Charuqs"}
		sets.precast.JA["Burst Affinity"] = {legs="Magus Shalwar", feet="Mavi Basmak +2"}
		sets.precast.JA["Efflux"] = {legs="Mavi Tayt +2"}
		sets.precast.JA["Diffusion"] = {feet="Mirage Charuqs"}
		sets.precast.JA["Convergence"] = {head="Mirage Keffiyeh"}
		sets.precast.JA["Enchainment"] = {body="Mirage Jubbah"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = set_combine(sets.idle.PDT, {ammo="Impatiens", 
				--neck="Orunmila's Torque", lear="Loquac. Earring",
				head="Haruspex Hat",
                --body="Luhlaza Jubbah", hands="Thaumas Gloves", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Carmine Greaves"})
		sets.precast.BlueMagic = set_combine(sets.precast.Fastcast,{body="Mavi Mintan +2"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {back="Pahtli Cape"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		sets.midcast.ConserveMP = {}
		
		-- Blue Magic
		-- Skill
		sets.midcast.BlueMagic = set_combine(sets.TP,{ammo="Mavi Tathlum",
                head="Mirage Keffiyeh",
                body="Magus Jubbah", 
                back="Cornflower Cape", legs="Mavi Tayt +2", feet="Mirage Charuqs"})
		
		sets.idle.BlueMagic = {}
		sets.idle.BlueMagic.Learn = set_combine(sets.midcast.BlueMagic,{
				hands="Magus Bazubands", 
				back="Atheling Mantle"})
		
		-- Recast
		sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast,{hands="Mv. Bazubands +2"})
		
		-- STR
		sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                -- head="Taeon Chapeau", lear="Vulcan's Pearl", 
				head="Espial Cap", neck="Tjukurrpa Medal", rear="Vulcan's Pearl",
                --body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA,
				body="Emet Harness", hands="Espial Bracers", lring="Ifrit Ring", rring="Ifrit Ring",
                -- legs="Taeon Tights", 
				back="Buquwik Cape", waist="Prosilio Belt", legs="Espial Hose", feet="Carmine Greaves"})
		-- STR Accuracy - I.E Heavy Strike
		sets.midcast.BlueMagic.STRAcc = set_combine(sets.midcast.BlueMagic, {ammo="Ginsen",
                --head="Taeon Chapeau",  lear="Vulcan's Pearl", 
                head="Espial Cap", neck="Tjukurrpa Medal", rear="Vulcan's Pearl",
				--body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                body="Emet Harness", hands="Espial Bracers", lring="Ifrit Ring", rring="Ifrit Ring",
				--legs="Taeon Tights", 
				back="Buquwik Cape", waist="Prosilio Belt", legs="Espial Hose", feet="Carmine Greaves"})
		-- Dex 
		sets.midcast.BlueMagic.DEX = set_combine(sets.midcast.BlueMagic, {ammo="Ginsen",
                --head="Taeon Chapeau",  lear="Vulcan's Pearl", 
                head="Espial Cap", neck="Tjukurrpa Medal", rear="Vulcan's Pearl",
				--body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                body="Emet Harness", hands="Espial Bracers", lring="Ifrit Ring", rring="Ifrit Ring",
				--legs="Taeon Tights", 
				back="Buquwik Cape", waist="Prosilio Belt", legs="Espial Hose", feet="Carmine Greaves"})
		-- VIT
		sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
               --head="Taeon Chapeau",  lear="Vulcan's Pearl", 
                head="Espial Cap", neck="Tjukurrpa Medal", rear="Vulcan's Pearl",
				--body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                body="Emet Harness", hands="Espial Bracers", lring="Ifrit Ring", rring="Ifrit Ring",
				--legs="Taeon Tights", 
				back="Buquwik Cape", waist="Prosilio Belt", legs="Espial Hose", feet="Carmine Greaves"})

		-- AGI
		sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
               --head="Taeon Chapeau",  lear="Vulcan's Pearl", 
                head="Espial Cap", neck="Tjukurrpa Medal", rear="Vulcan's Pearl",
				--body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                body="Emet Harness", hands="Espial Bracers", lring="Ifrit Ring", rring="Ifrit Ring",
				--legs="Taeon Tights", 
				back="Buquwik Cape", waist="Prosilio Belt", legs="Espial Hose", feet="Carmine Greaves"})

		-- MND
		sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                --head="Taeon Chapeau",  lear="Vulcan's Pearl", 
                head="Espial Cap", neck="Tjukurrpa Medal", rear="Vulcan's Pearl",
				--body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                body="Emet Harness", hands="Espial Bracers", lring="Ifrit Ring", rring="Ifrit Ring",
				--legs="Taeon Tights", 
				back="Buquwik Cape", waist="Prosilio Belt", legs="Espial Hose", feet="Carmine Greaves"})
		-- INT
		sets.midcast.BlueMagic.INT = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"})
		-- CHR
		sets.midcast.BlueMagic.CHR = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"})
		-- Macc
		sets.midcast.BlueMagic.Macc = set_combine(sets.midcast.BlueMagic, {
                -- head="Mirage Keffiyeh", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
				head="Orvail Corona +1",
				--body="Assimilator's Jubbah", hands="Hagondes Cuffs +1", lring="Sangoma Ring", rring="Perception Ring",
				body="Mavi Mintan +2", lring="Balrahn's Ring", rring="Perception Ring",
				--back="Cornflower Cape", waist="Ovate Rope", legs="Hashishin Tayt", feet="Helios Boots"
				back="Ogapepo Cape", legs="Orvail Pants +1", feet="Mavi Basmak +2"})	
		-- Acc
		sets.midcast.BlueMagic.PhysMagicAcc = set_combine(sets.midcast.Macc, {
                head="Mirage Keffiyeh", neck="Iqabi Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Assimilator's Jubbah", hands="Helios Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Cornflower Cape", waist="Ovate Rope", legs="Hashishin Tayt", feet="Helios Boots"})

		-- Healing Cure Pot
		sets.midcast.BlueMagic.CurePot = set_combine(sets.midcast.BlueMagic.MND, {
				lear="Loquac. Earring",
				lring="Levia. Ring", rring="Levia. Ring",
                back="Tempered Cape"})
		sets.midcast.BlueMagic.CurePot.Self = set_combine(sets.midcast.BlueMagic.CurePot, {
                neck="Phalaina Locket",
                lring="Levia. Ring", rring="Levia. Ring",
                back="Tempered Cape", waist="Chuq'aba Belt",})
		
		-- Nuke
		sets.midcast.BlueMagic.Nuke = set_combine(sets.midcast.BlueMagic, {ammo="Dosis Tahlum",
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Warwolf Belt", legs="Hagondes Pants +1", feet="Mavi Basmak +2"})
		-- Dark
		-- Pixie Hairpin +1
		sets.midcast.BlueMagic.Nuke.Dark = set_combine(sets.midcast.Nuke, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs", lring="Shiva Ring", rring="Archon Ring",
                back="Toro Cape", waist="Warwolf Belt", legs="Hagondes Pants +1", feet="Mavi Basmak +2"})
		-- Breath 
		sets.midcast.BlueMagic.Breath = set_combine(sets.midcast.BlueMagic.Nuke, {
				ammo="Mavi Tathlum",
				head="Luhlaza Keffiyeh"})

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {ammo="Vanir Battery",
                head="Espial Cap", neck="Mavi Scarf", lear="Brutal Earring", rear="Pixie Earring",
                body="Thaumas Coat", hands="Espial Bracers", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Espial Hose", feet="Carmine Greaves"})
		-- Accuracy
		sets.TP.Acc = set_combine(sets.TP, {})
		
		-- Allianced Buffs - Haste + March x2 
		sets.TP.Buffed = set_combine(sets.TP, {})
		
		-- DT/Acc
		sets.TP.Hybrid = set_combine(sets.idle.PDT, {
              })
			  
		-- Weaponskill
		sets.precast.WS = set_combine(sets.TP, {ammo="Honed Tahtlum",
				head="Espial Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Espial Gambison", hands="Espial Bracers", lring="Rajas Ring", rring="Ifrit Ring",
                back="Atheling Mantle", waist="Warwolf Belt", legs="Espial Hose", feet="Carmine Greaves"})
		sets.precast.WS.Acc = set_combine(sets.TP, {ammo="Honed Tathlum",
				head="Espial Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Espial Gambison", hands="Espial Bracers", lring="Rajas Ring", rring="Ifrit Ring",
                back="Atheling Mantle", waist="Warwolf Belt", legs="Espial Hose", feet="Carmine Greaves"})
	
		-- Sword
		-- Savage Blade - STR
		sets.precast.WS['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				head="Espial Cap", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Flame Pearl",
                body="Espial Gambison", hands="Espial Bracers", lring="Rajas Ring", rring="Ifrit Ring",
                back="Buquwik Cape", waist="Warwolf Belt", legs="Espial Hose", feet="Carmine Greaves"})
		sets.precast.WS.Acc['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				head="Espial Cap", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Flame Pearl",
                body="Espial Gambison", hands="Espial Bracers", lring="Rajas Ring", rring="Ifrit Ring",
                back="Buquwik Cape", waist="Warwolf Belt", legs="Espial Hose", feet="Carmine Greaves"})
		-- Chant du Cygne - DEX Crit
		sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik Feather",
                head="Espial Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                --body="Luhlaza Jubbah", hands="Luh. Bazubands", lring="Rajas Ring", rring="Epona's Ring",
				body="Espial Gambison", hands="Espial Bracers", lring="Rajas Ring", rring="Ramuh Ring",
				back="Atheling Mantle", waist="Light Belt", legs="Espial Hose", feet="Carmine Greaves"}
		sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Jukukik Feather",
                head="Espial Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                --body="Luhlaza Jubbah", hands="Luh. Bazubands", lring="Rajas Ring", rring="Epona's Ring",
				body="Espial Gambison", hands="Espial Bracers", lring="Rajas Ring", rring="Ramuh Ring",
				back="Atheling Mantle", waist="Warwolf Belt", legs="Espial Hose", feet="Carmine Greaves"}
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
				head="Espial Cap", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Flame Pearl",
                body="Espial Gambison", hands="Espial Bracers", lring="Rajas Ring", rring="Ifrit Ring",
                back="Buquwik Cape", waist="Warwolf Belt", legs="Espial Hose", feet="Carmine Greaves"})
		-- Sanguine Blade
		sets.precast.WS['Sanguine Blade'] = {ammo="Dosis Tathlum",
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Hecate's Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Warwolf Belt", legs="Hagondes Pants +1", feet="Mavi Basmak +2"}
		-- Realmrazer - MND/MAB
		sets.precast.WS['Realmrazer'] = {ammo="Hasty Pinion +1",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Levia. Ring", rring="Levia. Ring",
                back="Toro Cape", waist="Light Belt", legs="Hagondes Pants +1", feet="Mavi Basmak +2"}
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end