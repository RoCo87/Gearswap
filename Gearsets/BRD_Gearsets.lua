-- BRD Gearsets
--

if player.Name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		--include('include/autoexec.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'nin' then
				set_macro_page(4,1)
			elseif player.sub_job =='whm' then
				set_macro_page(4,2)
			elseif player.sub_job == 'rdm' then
				set_macro_page(4,3)
			elseif player.sub_job =='sch' then 
				set_macro_page(4,4)
			elseif player.sub_job =='dnc' then 
				set_macro_page(4,5)
			elseif player.sub_job =='BLM' then 
				set_macro_page(4,6)
			end
		else
			set_macro_page(4,1)
		end
		
		-- Instruments
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
		sets.idle.PDT = {main="Earth Staff",
				head="Gendewitha Caubeen", neck="Twilight Torque", lear="", rear="",
                body="Gendewitha Bliaut", hands="Gende. Gages +1", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Umbra Cape", waist="Flume Belt", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.idle.MDT = {
				head="Gendewitha Caubeen", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gende. Gages +1", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Engulfer Cape", waist="Flume Belt",  legs="Gendewitha Spats", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				head="", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Gendewitha Bliaut", hands="Serpentes Cuffs", lring="", rring="",
                back="Felicitas Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Moonshade Earring",
                body="Gendewitha Bliaut", hands="Serpentes Cuffs",
                legs="Nares Trews", feet="Aoidos' Cothrn. +2"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Aoidos' Cothrn. +2"})
		sets.misc.MinusHP = {
				head="Zenith Crown", neck="Morgana's Choker", lear="", rear="",
                body="Dalmatica", hands="Zenith Mitts", lring="", rring="",
                back="", waist="Witful Belt", legs="Zenith Slacks", feet="Zenith Pumps"}
		-- JA
		sets.precast.JA["Nightingale"] = {feet="Bihu Slippers"}
		sets.precast.JA["Troubadour"] = {body="Bihu Justaucorps"}
		sets.precast.JA["Soul Voice"] = {legs="Bihu Cannions"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = { 
				head="Nahtirah Hat", neck="", lear="Loquac. Earring", rear="",
                body="Anhur Robe", hands="Gende. Gages +1", lring="", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants", feet="Chelona Boots"}
		sets.precast.Fastcast.Song = set_combine(sets.precast.Fastcast, {main="Felibre Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' Matinee", lear="", rear="Aoidos' Earring",
                body="", hands="Gende. Gages +1", lring="Minstrel's Ring", rring="",
                back="Swith Cape", waist="Witful Belt", legs="Gendewitha Spats", feet="Bokwus Boots"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="", lear="", rear="",
                body="Heka's Kalairis", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		-- Midcast
		sets.midcast.Recast = { main="",
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="Witful Belt", legs="", feet=""}
		sets.midcast.ConserveMP = {
				head="", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="Balladeer's Cape", waist="Austerity Belt", legs="Nares Trews", feet="Serpentes Sabots"}
		-- Bard songs
		sets.midcast.Buffsong = { main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring", rear="",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="", rring="",
                back="", waist="", legs="Aoidos' Rhing. +2", feet="Aoidos' Cothrn. +2"}
		sets.midcast.Skillsong = {main="Legato Dagger",
				head="Aoidos' Calot +2", neck="Aoidos' matinee", lear="Musical Earring", rear="",
                body="Aoidos' hngrln. +2", hands="Ad. Mnchtte. +2", lring="", rring="",
                back="", waist="Witful Belt", legs="Aoidos' Rhing. +2", feet="Aoidos' Cothrn. +2"}
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Novia Earring", rear="",
                body="Heka's Kalairis", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Orison Cape", waist="Cascade Belt", legs="Bokwus Pants", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV", sub="Pax Grip",
				head="Orison Cap +2", neck="Colossus's Torque", lear="Novia Earring", rear="",
                body="Gendewitha Bliaut", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="", feet="Rubeus Boots"}
	
		-- Enhancing
		sets.midcast.Phalanx = {}
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {main="",
				head="Nahtirah Hat", neck="Morgana's Choker", lear="Loquac. Earring", rear="Magnetic Earring",
                body="Gendewitha Bliaut", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Siegal Sash", legs="Bokwus Slops", feet="Rubeus Boots"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul ring", rring="Aquasoul ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Soothsayer Staff", sub="Mephitis Grip",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Balrahn's ring", rring="Sangoma Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS = set_combine(sets.TP, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {})
		sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {})
		
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end