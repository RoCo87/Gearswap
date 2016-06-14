-- Aniyah's WHM Gearsets
-- Date Created: 1/29/2014
-- Last Updated: 6/13/2016
-- To Do List:
--
--
--
--

if player.name == 'Aniyah' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'rdm' then
				set_macro_page(1,1)
			elseif player.sub_job =='sch' then
				set_macro_page(1,2)
			elseif player.sub_job == 'smn' then
				set_macro_page(1,3)
			elseif player.sub_job =='blm' then 
				set_macro_page(1,4)
			end
		else
			set_macro_page(1,1)
		end
		
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
				head="Gende. Caubeen", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Aniyah, rring="Shadow Ring",
                back="Cheviot Cape", waist="Austerity Belt", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.idle.MDT = {main={name="Earth Staff", priority=2}, sub={name="Pax Grip", priority=1},
				head="Gende. Caubeen", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Aniyah, rring="Shadow Ring",
                back="Felicitas Cape", waist="Austerity Belt",  legs="Gendewitha Spats", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff", ammo="Clarus Stone",
				head="Orvail Corona +1", neck="Eidolon Pendant", lear="Antivenom Earring", rear="Relaxing Earring",
                body="Heka's Kalasiris", hands="Serpentes Cuffs",
                back="Felicitas Cape", waist="Austerity Belt", legs="", feet=""})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				hands="Serpentes Cuffs",
                })

		sets.misc.Town = set_combine(sets.idle.PDT, {
				--feet="Herald's Gaiters"
				})
				
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Incantor Stone",
				head="Haruspex Hat", neck="Orison Locket", lear="Loquac. Earring",
                body="Inyanga Jabbuh", hands="Gendewitha Gages", lring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris",
				-- back="Pahtli Cape", feet="Cure Clogs"
                 legs="Ebers Pantaloons",})
		-- JA
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Ebers Cap", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Devotion'] = {head="Cleric's Cap +2"}
		sets.precast.JA['Martyr'] = {hands="Cleric's Mitts +2"}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {
                --body="Hedera Cotehardie",  
				--feet="Umbani Boots"
				})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				--lear="Magnetic Earring", rear="Gifted Earring",
				-- body="Hedera Cotehardie", 
				hands="Serpentes Cuffs",
				-- legs="Nares Trews", feet="Umbani Boots"
                waist="Austerity Belt", }

		--Healing Magic
		-- Cures
		sets.midcast.Cure = {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=2},
				head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Ebers Bliaud", hands="Healer's Mitts", lring="Sirona's Ring", rring="Leviathan's Ring",
                back="Tempered Cape", waist="Cascade Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=2},
				head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Ebers Bliaud", hands="Healer's Mitts", lring="Leviathan's Ring", rring="Leviathan's Ring",
                back="Tempered Cape", waist="Cascade Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"})

		sets.midcast.Curaga = {main={name="Arka IV", priority=2}, sub={name="Pax Grip",priority=2},
				head="Ebers Cap", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Gendewitha Bliaut", hands="Healer's Mitts", lring="Leviathan's Ring", rring="Leviathan's Ring",
                back="Tempered Cape", waist="Cascade Belt", legs="Ebers Pantaloons", feet="Rubeus Boots"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = {}

		-- Status Ailments
		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {})
		
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				--neck="Debilis Medallion",
                --rring="Haoma's Ring",
                --back="Mending Cape", legs="Theophany Pantaloons",
				feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
				head="Inyanga Tiara",
                body="Cleric's Briault", hands="Orison Mitts +2",
                legs="Theo. Pantaloons"})
		sets.midcast.BarElement = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1}
				head="Ebers Cap", neck="Colossus's Torque", lear="Andoaa Earring", rear="",
                body="Orison Bliaut +2", hands="Orison Mitts +2", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Ebers Pantaloons", feet="Orsn. Duckbills +2"}
		sets.midcast.BarStatus = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1}
				-- head="", lear="Andoaa Earring", rear="Augment. Earring",
				neck="Colossus's Torque", 
				--body="Anhur Robe", hands="Ayao's Gages",
				--back="Merciful Cape", 
				waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Boost = {main={name="Beneficus", priority=2}, sub={name="Genbu's Shield", priority=1}
				head="", neck="Colossus's Torque", lear="Andoaa Earring", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main={name="Gabaxorea",priority=2}, sub={name="Genbu's Shield", priority=1},
				-- head="Haruspex Hat", neck="Eddy Necklace",
				lear="Friomisi Earring", rear="Hecate's Earring",
				-- body="Bokwus Robe", hands="Yaoyotl Gloves",
				lring="Leviathan's Ring", rring="Leviathan's Ring",
                -- waist="Sekhmet Corset", legs="Gendewitha Spats", feet="Gendewitha Galoshes"
				back="Toro Cape"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main={name="Gabaxorea",priority=2}, sub={name="Genbu's Shield", priority=1},
				--  lear="Lifestorm Earring", rear="Psystorm Earring",
				head="Inyanga Tiara", neck="Enfeebling Torque",
                body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception ring", rring="Balrahn's Ring",
                back="Ogapepo Cape", waist="Demonry Sash", legs="Inyanga Shalwar", feet="Inyanga Crackows"}
		sets.midcast.Macc = {main={name="Gabaxorea", priority=2}, sub={name="Genbu's Shield", priority=1},
				-- lear="Lifestorm Earring", rear="Psystorm Earring",
				head="Inyanga Tiara", neck="Enfeebling Torque", 
				body="Inyanga Jubbah", hands="Inyanga Dastanas", lring="Perception ring", rring="Balrahn's Ring",
                back="Ogapepo Cape", waist="Demonry Sash", legs="Inyanga Shalwar", feet="Inyanga Crackows"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {	
				neck="Aesir Torque"})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {
				neck="Aesir Torque",})
				--waist="Fucho-no-Obi"
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {
				neck="Aesir Torque",})
				--waist="Fucho-no-Obi"
		
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