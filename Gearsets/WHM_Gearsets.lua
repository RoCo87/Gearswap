-- WHM Gearsets
--

function get_sets()
	if player.name = 'Feary' then
		-- includes
		include(include/utility.lua)
		
		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset = 1 then
			if player.sub_job = 'rdm' then
				set_macro_page(1, 1)
			elseif player.sub_job = 'sch' then
				set.macro_page(1, 2)
			elseif player.sub_job = 'smn' then
				set.macro_page(1,3)
			elseif players.sub_job = 'blm' then 
				set.macro_page(1,4)
			end
		else
			set.macro_page(1,1)
		end
		
		-- Augmented Gear
		Aug = {}
		Aug.Darkring1 = {name="Dark Ring",augments={"Physical Damage Taken -5%, Magical Damage Taken -3%"}}
		Aug.Darkring2 = {name="Dark Ring",augments={"Physical Damage Taken -4%, Magical Damage Taken -4%"}}
		
		-- Auto Sets
		-- Standard/idle
		sets.idle = {}
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				head="", neck="", lear="", rear="Moonshade Earring",
                body="Heka's Kalasiris", hands="Serpentes Cuffs", lring="", rring="",
                back="", waist="",  legs="Nares Trews", feet="Serpentes Boots"})
		sets.idle.PDT = { main="Earth Staff",
				head=" Gendewitha Caubeen", neck="Twilight Torque", lear="", rear="",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Umbra Cape", waist="Flume Belt", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.idle.MDT = {
				head="Gendewitha Caubeen", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="", waist="",  legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
				
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff", ammo="Clarus Stone",
				head="", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Heka's Kalasiris", hands="Serpentes Cuffs", lring="", rring="",
                back="Felicitas Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots"})

		sets.misc = {}
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		-- Precast
		-- Magic
		sets.precast = {}
		sets.precast.Fastcast = { ammo="Impatiens",
				head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring", rear="",
                body="Anhur Robe", hands="Gendewitha Gages", lring="Prolix Ring", rring="",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants", feet="Chelona Boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="", lear="", rear="",
                body="Heka's Kalairis", hands="", lring="", rring="",
                back="", waist="", legs="Orsn. Pantaln +2", feet=""})
		-- JA
		sets.precast.JA = {}
		sets.precast.JA['Divine Caress'] = {head="Orison Cap +2", hands="Orison Mitts +2", back="Mending Cape"}
		sets.precast.JA['Benediction'] = {body="Cleric's Briault +2"}
		
		-- Midcast
		sets.midcast.Recast = { main="Plenitas Virga",
				head="Nahtirah hat", neck="", lear="", rear="",
                body="Hedera Cotehardie", hands="", lring="", rring="",
                back="", waist="Witful Belt", legs="", feet="Gende. Galoshes"}
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="", waist="Austerity Belt", legs="Nares Trews", feet="Serpentes Sabots"}

		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Orison Cap +2", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Orison Bliaud +2", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Orison Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main="Arka IV", 
				head="Orison Cap +2", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Orison Bliaud +2", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Orison Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"})

		sets.midcast.Curaga = {main="Arka IV", sub="Pax Grip",
				head="Orison Cap +2", neck="Colossus's Torque", lear="Novia Earring", rear="Orison Earring",
                body="Gendewitha Bliaut", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Rubeus Boots"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = {}

		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {ammo="Incantor Stone",
				head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring", rear="",
                body="Hedera Cotehardie", hands="", lring="Prolix Ring", rring="",
                back="", waist="Witful Belt", legs="", feet=""})
		sets.midcast.Erase = set_Combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				head="", neck="Debilis Medallion", lear="Loquac. Earring", rear="",
                body="Orison Bliaud +2", hands="", lring="Prolix Ring", rring="Haoma's Ring",
                back="Mending Cape", waist="Witful Belt", legs="Orn. Pantaln. +2", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
				head="", neck="", lear="", rear="",
                body="Cleric's Briault", hands="Orison Mitts +2", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.midcast.BarElement = {main="Beneficus",
				head="Orison Cap +2", neck="Colossus's Torque", lear="", rear="",
                body="Orison Bliaut +2", hands="Orison Mitts +2", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Orsn. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.BarStatus = {main="Beneficus",
				head="", neck="Colossus's Torque", lear="", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Boost = {main="Beneficus", sub="Fulcio Grip",
				head="", neck="Colossus's Torque", lear="", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Cascade Belt", legs="Clr. Pantaln. +2", feet="Orsn. Duckbills +2"}
		sets.midcast.Phalanx = set_combine(sets.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Ring"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Soothsayer Staff",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Hecate's Earring", rear="Novio Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Searing Cape", waist="", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul ring", rring="Aquasoul ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Soothsayer Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Balrahn's ring", rring="Sangoma Ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc. {})
		sets.midcast.Drain = set_combine(sets.midcast.Macc. {})
		sets.midcast.Aspir = set_combine(sets.midtcast.Macc. {})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.Dot = {}

		-- Melee Sets
		sets.TP = {}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'} = set_combine(sets.precast.WS, {})


	elseif player.name = 'Derion' then
		-- sets Macros
		set_macro_page(1, 1)
		-- Augmented Gear
		Aug = {}
		Aug.Darkring1 = {name="Dark Ring",augments={"Physical Damage Taken -5%, Magical Damage Taken -3%"}}
		Aug.Darkring2 = {name="Dark Ring",augments={"Physical Damage Taken -4%, Magical Damage Taken -4%"}}

		-- Auto Sets
		-- Standard/idle
		sets.idle = {}
		sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Hermes' Sandals"})
		sets.idle.PDT = { 
				head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Repulse Mantle", waist="Black Belt", legs="Otronif Brais", feet="Otronif Boots"}

		sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Engulfer Cape", waist="Black Belt", legs="Nahtirah Trousers", feet="Manibozho Boots"}

		sets.Resting = set_combine(sets.idle.PDT, {})

		sets.misc = {}
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		-- Precast
		sets.precast.Fastcast = {}
		sets.CurePrecast = {}

		-- Midcast
		sets.midcast.Recast = {}
		sets.midcast.ConserveMP = {}

		--Healing Magic
		sets.midcast.Cure = {}
		sets.midcast.EnmityCure = {}

		sets.midcast.Curaga = {}
		sets.precast.EnmityCuraga = {}

		sets.Cura = {}

		sets.NaSpells = {}
		sets.Erase = set_Combine(sets.NaSpells)

		sets.Cursna =
		sets.Esuna = set_combine(sets.midcast.Recast)
		sets.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.Regen = {}
		sets.BarElement = {}
		sets.BarStatus = {}
		sets.Boost = {}
		sets.Phalanx = set_combine(sets.Boost)
		sets.Hastespell = {}
		sets.Stoneskin = {}
		sets.Aquaveil = {}
		sets.Blink = set_combine(sets.Aquaveil)
		sets.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.Repose = {}
		sets.Flash = {}
		sets.Banish = {}
		sets.Holy = set_combine(sets.Banish)

		-- Enfeebling
		-- Potency
		sets.Enfeebling = {}
		sets.Macc = {}
		sets.Dia = {}

		-- Dark Magic
		sets.DarkMagic = set_combine(sets.Macc. {})
		sets.Drain = set_combine(sets.Macc. {})
		sets.Aspir = set_combine(sets.Macc. {})

		-- Melee Sets
		sets.TP = {}
		sets.precast = {}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'} = set_combine(sets.precast.WS, {})
	elseif player.name = 'Aniyah' then
		-- sets Macros
		set_macro_page(1, 1)
		-- Augmented Gear
		Aug = {}
		Aug.Darkring1 = {name="Dark Ring",augments={"Physical Damage Taken -5%, Magical Damage Taken -3%"}}
		Aug.Darkring2 = {name="Dark Ring",augments={"Physical Damage Taken -4%, Magical Damage Taken -4%"}}

		-- Auto Sets
		-- Standard/idle
		sets.idle = {}
		sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Hermes' Sandals"})
		sets.idle.PDT = { 
				head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Repulse Mantle", waist="Black Belt", legs="Otronif Brais", feet="Otronif Boots"}

		sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Engulfer Cape", waist="Black Belt", legs="Nahtirah Trousers", feet="Manibozho Boots"}

		sets.Resting = set_combine(sets.idle.PDT, {})

		sets.misc = {}
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		-- Precast
		sets.precast.Fastcast = {}
		sets.CurePrecast = {}

		-- Midcast
		sets.midcast.Recast = {}
		sets.midcast.ConserveMP = {}

		--Healing Magic
		sets.midcast.Cure = {}
		sets.midcast.EnmityCure = {}

		sets.midcast.Curaga = {}
		sets.precast.EnmityCuraga = {}

		sets.Cura = {}

		sets.NaSpells = {}
		sets.Erase = set_Combine(sets.NaSpells)

		sets.Cursna =
		sets.Esuna = set_combine(sets.midcast.Recast)
		sets.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.Regen = {}
		sets.BarElement = {}
		sets.BarStatus = {}
		sets.Boost = {}
		sets.Phalanx = set_combine(sets.Boost)
		sets.Hastespell = {}
		sets.Stoneskin = {}
		sets.Aquaveil = {}
		sets.Blink = set_combine(sets.Aquaveil)
		sets.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.Repose = {}
		sets.Flash = {}
		sets.Banish = {}
		sets.Holy = set_combine(sets.Banish)

		-- Enfeebling
		-- Potency
		sets.Enfeebling = {}
		sets.Macc = {}
		sets.Dia = {}

		-- Dark Magic
		sets.DarkMagic = set_combine(sets.Macc. {})
		sets.Drain = set_combine(sets.Macc. {})
		sets.Aspir = set_combine(sets.Macc. {})

		-- Melee Sets
		sets.TP = {}
		sets.precast = {}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'} = set_combine(sets.precast.WS, {})

	elseif player.name = 'Firetoplay' then
		-- sets Macros
		set_macro_page(1, 1)
		-- Augmented Gear
		Aug = {}
		Aug.Darkring1 = {name="Dark Ring",augments={"Physical Damage Taken -5%, Magical Damage Taken -3%"}}
		Aug.Darkring2 = {name="Dark Ring",augments={"Physical Damage Taken -4%, Magical Damage Taken -4%"}}

		-- Auto Sets
		-- Standard/idle
		sets.idle = {}
		sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Hermes' Sandals"})
		sets.idle.PDT = { 
				head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Repulse Mantle", waist="Black Belt", legs="Otronif Brais", feet="Otronif Boots"}

		sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Engulfer Cape", waist="Black Belt", legs="Nahtirah Trousers", feet="Manibozho Boots"}

		sets.Resting = set_combine(sets.idle.PDT, {})

		sets.misc = {}
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		-- Precast
		sets.precast.Fastcast = {}
		sets.CurePrecast = {}

		-- Midcast
		sets.midcast.Recast = {}
		sets.midcast.ConserveMP = {}

		--Healing Magic
		sets.midcast.Cure = {}
		sets.midcast.EnmityCure = {}

		sets.midcast.Curaga = {}
		sets.precast.EnmityCuraga = {}

		sets.Cura = {}

		sets.NaSpells = {}
		sets.Erase = set_Combine(sets.NaSpells)

		sets.Cursna =
		sets.Esuna = set_combine(sets.midcast.Recast)
		sets.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.Regen = {}
		sets.BarElement = {}
		sets.BarStatus = {}
		sets.Boost = {}
		sets.Phalanx = set_combine(sets.Boost)
		sets.Hastespell = {}
		sets.Stoneskin = {}
		sets.Aquaveil = {}
		sets.Blink = set_combine(sets.Aquaveil)
		sets.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.Repose = {}
		sets.Flash = {}
		sets.Banish = {}
		sets.Holy = set_combine(sets.Banish)

		-- Enfeebling
		-- Potency
		sets.Enfeebling = {}
		sets.Macc = {}
		sets.Dia = {}

		-- Dark Magic
		sets.DarkMagic = set_combine(sets.Macc. {})
		sets.Drain = set_combine(sets.Macc. {})
		sets.Aspir = set_combine(sets.Macc. {})

		-- Melee Sets
		sets.TP = {}
		sets.precast = {}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'} = set_combine(sets.precast.WS, {})
	end
end