-- Feary's BRD Gearsets
-- Created: 02/02/2014
-- Last Modified: 02/03/2015
--
--

if player.name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		--include('include/autoexec.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(4,1)
			elseif player.sub_job =='whm' then
				set_macro_page(4,2)
			elseif player.sub_job == 'RDM' then
				set_macro_page(4,3)
			elseif player.sub_job =='sch' then 
				set_macro_page(4,4)
			elseif player.sub_job =='dnc' then 
				set_macro_page(4,5)
			elseif player.sub_job =='blm' then 
				set_macro_page(4,6)
			end
		else
			set_macro_page(4,1)
		end
		
		-- Instruments
		default = {range="Iron Ram Horn"}
		-- Buffs
		ballad = {range="Crooner's Cithara"}
		march = {range="Langeleik"}
		minuet = {range="Apollo's Flute"}
		madrigal = {range="Cantabank's Horn"}
		minne = {range="Syrinx"}
		etude = {range="Langeleik"}
		carol = {range="Crumhorn"}
		mambo  = {range="Vihuela"}
		mazurka = {range="Daurdabla"}
		paeon = {range="Iron Ram Horn"}
		prelude = {range="Cantabank's Horn"}
		scherzo = {range="Iron Ram Horn"}
		hymnus = {range="Daurdabla"}
		--Debuffs
		elegy = {range="Syrinx"}
		threnody = {range="Sorrowful Harp"}
		lullaby = {range="Pan's Horn"}
		horde = {range="Nursemaid Harp"}
		finale = {range="Pan's Horn"}
		requiem = {range="Requiem Flute"}
		virelai = {range="Daurdabla"}
		nocturne = {range="Iron Ram Horn"}

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Mandau", sub="Genbu's Shield",
				head="Bihu Roundlet +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gende. Bilaut +1", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Flume Belt", legs="Bihu Cannions +1", feet="Bihu Slippers"}
		sets.idle.MDT = {
				head="Nahtirah Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gende. Bilaut +1", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt",  legs="Gende. Spats +1", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				head="", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Gende. Bilaut +1", hands="Gende. Gages +1", lring="", rring="",
                back="Felicitas Cape", waist="", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Moonshade Earring",
                feet="Aoidos' Cothrn. +2"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Aoidos' Cothrn. +2"})
		sets.misc.MinusHP = {
				head="Zenith Crown", neck="Morgana's Choker", lear="", rear="",
                body="Dalmatica", hands="Zenith Mitts", lring="", rring="",
                back="", waist="Witful Belt", legs="Zenith Slacks", feet="Zenith Pumps"}
		-- JA
		sets.precast.JA["Nightingale"] = {feet="Bihu Slippers"}
		sets.precast.JA["Troubadour"] = {body="Bihu Justaucorps"}
		sets.precast.JA["Soul Voice"] = {legs="Bihu Cannions +1"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { 
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchtr. Earring +1",
                body="Anhur Robe", hands="Gende. Gages +1", lring="", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots"}
		sets.precast.Fastcast.Song = set_combine(sets.precast.Fastcast, {main="Felibre's Dague",
				head="Aoidos' Calot +2", neck="Aoidos' Matinee", lear="Loquac. Earring", rear="Aoidos' Earring",
                body="Anhur Robe", hands="Gende. Gages +1", lring="Minstrel's Ring", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Gende. Spats +1", feet="Telchine Pigaches"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris", 
                back="Pahtli Cape"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing, {head="Umuthi Hat"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {
				head="", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="Balladeer's Cape", waist="Austerity Belt", legs="", feet="Serpentes Sabots"}
		-- Bard songs
		-- Enhancing Buff - Duration Set
		sets.midcast.Buffsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee",
                body="Aoidos' hngrln. +2", hands="Fili Manchettes",
                back="Harmony Cape", waist="Corvax Sash", legs="Mdk. Shalwar +1", feet="Brioso Slippers +1"}
		-- Enhancing Buff - Buff Set (set Bonus)
		sets.midcast.EnhanceSong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee",
                body="Aoidos' hngrln. +2", hands="Fili Manchettes",
                back="Harmony Cape", waist="Corvax Sash", legs="Fili Rhingrave", feet="Aoidos' Cothrn. +2"}
		-- Enhancing Buff - Skill Set 800+
		sets.midcast.Skillsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring",
                body="Aoidos' hngrln. +2", hands="Fili Manchettes",
                back="Rhapsode's Cape", waist="Corvax Belt", legs="Fili Rhingrave", feet="Brioso Slippers +1"}
		-- Debuffs
		sets.midcast.Debuff = {main="Mandau",
				head="Bihu Roundlet +1", neck="Piper's Torque", lear="Musical Earring", rear="Gwati Earring",
                body="Brioso Just. +1", hands="Fili Manchettes", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Ovate Rope", legs="Fili Rhingrave", feet="Telchine Pigaches"}
		
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Orison Cape", waist="Cascade Belt", legs="Artsieq Hose", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="",
                body="Gende. Bilaut +1", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Pahtli Cape", waist="Cascade Belt", legs="", feet="Rubeus Boots"}
	
		-- Enhancing
		sets.midcast.Phalanx = {}
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		-- 40 MND
		sets.midcast.Stoneskin = set_combine(sets.idle.PDT, {})
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Mandau", ammo="Aureole",
				head="Bihu Roundlet +1", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Brioso Just. +1", hands="Gende. Gages +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Mandau", ammo="Aureole",
				head="Bihu Roundlet +1", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Brioso Just. +1", hands="Gende. Gages +1", lring="Perception ring", rring="Sangoma Ring",
                back="Rhapsode's Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Gende. Spats +1", feet="Bihu Slippers"})
		sets.TP.Acc = set_combine(sets.TP, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Gende. Spats +1", feet="Bihu Slippers"})	
		sets.precast.WS = set_combine(sets.TP, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Witful Belt", legs="Gende. Spats +1", feet="Bihu Slippers"})
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Witful Belt", legs="Gende. Spats +1", feet="Bihu Slippers"})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Witful Belt", legs="Gende. Spats +1", feet="Bihu Slippers"})
		sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {main="Mandau",
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Witful Belt", legs="Gende. Spats +1", feet="Bihu Slippers"})
		
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = set_combine(sets.TP.Macc,{})
end