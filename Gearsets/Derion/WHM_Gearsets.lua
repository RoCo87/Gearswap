-- WHM Gearsets
-- Date Created: 1/29/2014
-- Last Updated: 6/6/2014
-- To Do List:
--
--
--
--

if player.name == 'Derion' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='RDM' then
				set_macro_page(1,1)
			elseif player.sub_job =='SCH' then
				set_macro_page(1,2)
			elseif player.sub_job =='SMN' then
				set_macro_page(1,3)
			elseif player.sub_job =='BLM' then 
				set_macro_page(1,4)
			end
		else
			set_macro_page(1,1)
		end
		
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
				head="Gende. Caubeen", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1, rring="Defending Ring",
                back="Cheviot Cape", waist="Austerity Belt", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.idle.MDT = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
				head="Inyanga Tiara", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Inyanga Jubbah", hands="Inyanga Dastanas", lring=Aug.Darkring1, rring="Defending Ring",
                back="", waist="Austerity Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}			
		sets.Resting = set_combine(sets.idle.PDT, {main={name="Chatoyant Staff", priority=2}, sub={name="Pax Grip", priority=1}, ammo="Clarus Stone",
				neck="Eidolon Pendant",
                body="Gendewitha Bliaut", 
                back="Felicitas Cape +1", waist="Austerity Belt", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				})

		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		
		-- Precast
		-- JA
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Orison Cap +2", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Devotion'] = {head="Cleric's Cap +2"}
		sets.precast.JA['Martyr'] = {hands="Cleric's Mitts +2"}
		
		-- Magic
		sets.precast.Fastcast = {ammo="Incantor Stone",
				head="Haruspex Hat", neck="Orison Locket", lear="Loquac. Earring",
                body="Inyanga Jubbah", hands="Gendewitha Gages", lring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Regal Pumps"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				-- body="Heka's Kalairis",
                --back="Pahtli Cape", 
				legs="Orsn. Pantaln. +2", feet="Hygieia Clogs"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {
				})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
                waist="Austerity Belt"}

		--Healing Magic
		-- Cures - Queller Rod Sors Shield 
		sets.midcast.Cure =  {main={name="Arka IV", priority=2}, sub={name="Pax Grip", priority=1}, 
				-- Gende. Caubeen +1  Nourish Earing
				head="Gende. Caubeen", neck="Colossus's Torque", lear="Roundel Earring", rear="Orison Earring",
				-- Theo Mitts +1  Epheral Ring
                body="Orison Bliaud +2", hands="Augur's Gloves", lring="Sirona's Ring", rring="Aquasoul Ring",
				-- Alaunus Cape Bishop Sash kaykaus boots
                back="Tempered Cape +1", waist="Salire Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure,  {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=1},
				head="Gende. Caubeen", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Orison Bliaud +2", hands="Augur's Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Tempered Cape +1", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"})

		sets.midcast.Curaga =  {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=1},
				head="Orison Cap +2", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Gendewitha Bliaut", hands="Augur's Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = {}

		-- Status Ailments
		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {})
		
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				neck="Debilis Medallion",
                rring="Haoma's Ring",
                back="Alaunus Cape", legs="Theophany Pantaloons", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
				head="Inyanga Tiara",
                body="Cleric's Briault", hands="Orison Mitts +2",
                legs="Theo. Pantaloons"})
		sets.midcast.BarElement = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
				--  lear="Andoaa Earring", 
				head="Orison Cap +2", neck="Colossus's Torque",
                body="Orison Bliaut +2", hands="Orison Mitts +2", 
                -- back="Merciful Cape", waist="Cascade Belt",
				legs="Orsn. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.BarStatus = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
				-- lear="Andoaa Earring", 
				neck="Colossus's Torque", 
                -- body="Anhur Robe", 
				hands="Augur's Gloves",
                --back="Merciful Cape", waist="Cascade Belt", 
				legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Boost = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1},
				-- lear="Andoaa Earring", 
				neck="Colossus's Torque", 
                -- body="Anhur Robe", 
				hands="Augur's Gloves",
                --back="Merciful Cape", waist="Cascade Belt", 
				legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main={name="Soothsayer Staff", priority=2}, sub={name="", priority=1},
				--  neck="Eddy Necklace",
				head="Inyanga Tiara", lear="Hecate's Earring", rear="Moldavite Earring",
				-- lring="Perception Ring", rring="Sangoma Ring",
                body="Inyanga Jubbah", hands="Inyanga Dastanas", 
                back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main={name="Soothsayer Staff", priority=2}, sub={name="Mephitis Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Inyanga Tiara",lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Aquasoul ring", rring="Aquasoul ring",
                back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}
		sets.midcast.Macc = {main={name="Soothsayer Staff", priority=2}, sub={name="Mephitis Grip", priority=1},
				--  neck="Eddy Necklace",
				head="Inyanga Tiara", lear="Lifestorm Earring", rear="Psystorm Earring",
				-- lring="Perception Ring", rring="Sangoma Ring",
                body="Inyanga Jubbah", hands="Inyanga Dastanas", 
                back="Ogapepo Cape", waist="Salire Belt", legs="Inyanga Shalwar", feet="Inyanga Crackows +1"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {	
				})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {
				waist="Fucho-no-Obi"})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {
				waist="Fucho-no-Obi"})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.DOT = set_combine(sets.midcast.Macc,{})

		-- Melee Sets
		sets.TP = {}
		
		sets.TP.Acc = {}
		
		-- Weaponskills
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS.Acc = {}
		
		-- Club
		-- Hexa Strike
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})
		
		sets.precast.WS.Acc["Hexa Strike"] = set_combine(sets.precast.WS.Acc,{})
end