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
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job =='NIN' then
				set_macro_page(4,1)
			elseif player.sub_job =='WHM' then
				set_macro_page(4,2)
			elseif player.sub_job =='RDM' then
				set_macro_page(4,3)
			elseif player.sub_job =='SCH' then 
				set_macro_page(4,4)
			elseif player.sub_job =='DNC' then 
				set_macro_page(4,5)
			elseif player.sub_job =='BLM' then 
				set_macro_page(4,6)
			end
		else
			set_macro_page(4,1)
		end
		
		fishing = 0
		
		-- Instruments
		default = {range="Iron Ram Horn"}
		-- Buffs
		ballad = {range="Crooner's Cithara"}
		honor = {range="Marsyas"}
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
		sets.idle.PDT = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Bihu Roundlet +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Gende. Bilaut +1", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Flume Belt", legs="Bihu Cannions +1", feet="Bihu Slippers"}
		sets.idle.MDT = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Inyanga Tiara +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Inyanga Jubbah +1", hands="Inyanga Dastanas +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape +1", waist="Flume Belt", legs="Inyanga Shalwar +1", feet="Inyanga Crackows +1"}			
		sets.Resting = set_combine(sets.idle.PDT, {
				main={name="Chatoyant Staff", priority=2}, sub={name="", priority=1},
				head="", neck="Eidolon Pendant",
                body="Gende. Bilaut +1", hands="Gende. Gages +1",
                back="Felicitas Cape +1", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Etiolation Earring",
                feet="Fili Cothurnes +1"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				neck="Carpenter's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="craftmaster's Ring",
				waist="Carpenter's Belt", feet="Fili Cothurnes +1"})
				
		sets.lockstyle = set_combine(sets.misc.Town,{
				body="Sheikh Manteel",
				feet="Fili Cothurnes +1"})
		
		sets.idle.Fishing = set_combine(sets.idle.Standard,{range="Lu Shang's Fishing Rod", ammo="Sinking Minnow",
				head="Tlahtlamah Glasses", neck="Fisherman's Torque",
				body="Fisherman's Smock", hands="Kachina Gloves", lring="Noddy Ring", rring="",
				waist="Fisherman's Belt", legs="Fisherman's Hose", feet="Waders"})
		sets.idle.Wood = set_combine(sets.idle.Standard,{
				neck="Carver's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="craftmaster's Ring",
				waist="Carpenter's Belt"})		
		
		--	sets.misc.MinusHP = {
		--		head="Zenith Crown", neck="Morgana's Choker",
        --      body="Dalmatica", hands="Zenith Mitts", 
        --      waist="Witful Belt", legs="Zenith Slacks", feet="Zenith Pumps"}
		   
		-- JA
		sets.precast.JA["Nightingale"] = {feet="Bihu Slippers"}
		sets.precast.JA["Troubadour"] = {body="Bihu Justaucorps"}
		sets.precast.JA["Soul Voice"] = {legs="Bihu Cannions +1"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = set_combine(sets.idle.PDT, { 
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Inyanga Jubbah +1", hands="Gende. Gages +1", rring="Prolix Ring",
                back="Intarabus's Cape", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots +1"})
		sets.precast.Fastcast.Song = set_combine(sets.precast.Fastcast, {main={name="Felibre's Dague", priority=1},
				head="Fili Calot", neck="Aoidos' Matinee", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Inyanga Jubbah +1", hands="Gende. Gages +1", lring="Minstrel's Ring", rring="Prolix Ring",
                back="Intarabus's Cape", waist="Witful Belt", legs="Gende. Spats +1", feet="Telchine Pigaches"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris", 
                back="Pahtli Cape"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing, {head="Umuthi Hat"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {back="Swith Cape +1", waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {
				lear="Gwati Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie",
                back="Balladeer's Cape"}
				
		-- Bard songs
		-- Enhancing Buff - Duration Set
		sets.midcast.Buffsong = {main={name="Legato Dagger", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Fili Calot", neck="Aoidos' matinee",
                body="Fili Hongreline +1", hands="Fili Manchettes +1",
                back="Harmony Cape", waist="Corvax Sash", legs="Inyanga Shalwar +1", feet="Brioso Slippers +1"}
		-- Enhancing Buff - Buff Set (set Bonus)
		sets.midcast.EnhanceSong = {main={name="Legato Dagger", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Fili Calot", neck="Aoidos' matinee",
                body="Fili Hongreline +1", hands="Fili Manchettes +1",
                back="Harmony Cape", waist="Corvax Sash", legs="Fili Rhingrave +1", feet="Fili Cothurnes +1"}
		-- Enhancing Buff - Skill Set 800+
		sets.midcast.Skillsong = {main={name="Legato Dagger", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Fili Calot", neck="Aoidos' matinee", lear="Musical Earring",
                body="Fili Hongreline +1", hands="Fili Manchettes +1",
                back="Rhapsode's Cape", waist="Corvax Sash", legs="Fili Rhingrave +1", feet="Brioso Slippers +1"}
		-- Debuffs
		sets.midcast.Debuff = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},
				-- Incantor's Torque
				head="Bihu Roundlet +1", neck="Piper's Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
				-- Carbuncle Ring +1 Carbuncle Ring +1
                body="Inyanga Jubbah +1", hands="Inyan. Dastanas +1", lring="Perception ring", rring="Sangoma Ring",
                back="Intarabus's Cape", waist="Ovate Rope", legs="Fili Rhingrave +1", feet="Inyan. Crackows +1"}
		
		--Healing Magic
		sets.midcast.Cure = {main={name="Arka IV", priority=2}, sub={name="", priority=1},
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Gwait Earring", rear="Novia Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Sirona's Ring", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Artsieq Hose", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main={name="Arka IV", priority=2}, sub={name="", priority=1},
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Gwati Earring", rear="Novia Earring",
                body="Gende. Bilaut +1", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Pahtli Cape", waist="Bishop's Sash", legs="Artsieq Hose", feet="Rubeus Boots"}

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1}, 
				head="Inyanga Tiara +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Inyanga Jubbah +1", hands="Inyan. Dastanas +1", lring="Perception ring", rring="Sangoma Ring",
                back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}
		sets.midcast.Macc = {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1}, 
				head="Inyanga Tiara +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Inyanga Jubbah +1", hands="Inyan. Dastanas +1", lring="Perception ring", rring="Sangoma Ring",
                back="Intarabus's Cape", waist="Ovate Rope", legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}
				
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Enhancing
		sets.midcast.Phalanx = {}
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		-- 40 MND
		sets.midcast.Stoneskin = set_combine(sets.idle.PDT, {})
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Regen = {head="Inyanga Tiara +1"}

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Gende. Spats +1", feet="Bihu Slippers"})
		sets.TP.Acc = set_combine(sets.TP, {{main={name="Mandau", priority=2}, sub="Genbu's Shield", priority=1},
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Gende. Spats +1", feet="Bihu Slippers"})	
		
		-- WeaponSkills
		sets.precast.WS = set_combine(sets.TP, {
				main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Witful Belt", legs="Gende. Spats +1", feet="Bihu Slippers"})
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
				main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Bihu Justaucorps", hands="Bihu Cuffs +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Witful Belt", legs="Gende. Spats +1", feet="Bihu Slippers"})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {
				main={name="Mandau", priority=2}, sub={name="Genbu's Shield", priority=1},
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