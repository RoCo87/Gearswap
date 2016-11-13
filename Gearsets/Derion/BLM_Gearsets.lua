-- BLM Gearsets
-- Created On: 4/11/2014
-- Last Updated: 4/11/2014
-- To Do List
--
--
--
--
--
--

if player.Name == 'Derion' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(2,1)
			elseif player.sub_job =='WHM' then
				set_macro_page(2,2)
			elseif player.sub_job == 'SCH' then
				set_macro_page(2,3)
			elseif player.sub_job == 'BRD' then
				set_macro_page(2,4)
			elseif player.sub_job =='NIN' then 
				set_macro_page(2,5)
			end
		else
			set_macro_page(2,3)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="Wise Strap", priority=1},
				head="Hagondes Hat", neck="Twilight Torque",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
				--waist="Fucho-no-obi",
                back="Cheviot Cape",  legs="Hagondes Pants", feet="Hagondes Sabots"}
		sets.idle.MDT = {main={name="Earth Staff", priority=2}, sub={name="Wise Strap", priority=1},
				head="Hagondes Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
                --waist="Fucho-no-obi",
				back="Felicitas Cape", legs="Hagondes Pants", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {main={name="Chatoyant Staff", priority=2},
				head="Amalric Coif", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                --hands="Serpentes Cuffs",
				body="Jhakri Robe", 
                -- waist="Fucho-no-obi",
				back="Cheviot Cape", legs="Nares Trews", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				head="Amalric Coif", lear="Merman's Earring", rear="Merman's Earring",
				body="Jhakri Robe", 
				-- Legs="Assudity Pants +1 feet="Herald's Gaiters"
				})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Shaded Spectacles", neck="Goldsmith's Torque",
				body="Goldsmith's Smock", lring="Craftkeeper's Ring", rring="Craftmaster's Ring", 
				--feet="Herald's Gaiters"
				waist="Goldsmith's Belt"})
		
		-- JA
		sets.precast.JA["Manafont"] = {body="Sorcerer's Coat +2"}
		sets.precast.JA["Subtle Sorcery"] = {}
		sets.precast.JA["Elemental Seal"] = {}
		sets.precast.JA["Emnity Douse"] = {}
		sets.precast.JA["Manawell"] = {back="Taranus's Cape", feet="Goetia's Sabots +2"}
		
		-- Precast
		-- Magic
		sets.precast.MinusHP = {
			head="Zenith Crown", neck="Morgana's Choker",
			body="Dalmatica", hands="Zenith Mitts",
			legs="Zenith Slacks", feet="Zenith Pumps"}
		sets.precast.Fastcast = {--ammo="Impatiens",
				--neck="Voltsurge Torque", rear="Enchantr. Earring +1"
				head="Haruspex Hat", lear="Loquac. Earring",
                --body="Anhur Robe", rring="Prolix Ring",
				hands="Magavan Mitts",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Regal Pumps"}
		sets.precast.Elemental = set_combine(sets.precast.Fastcast,{head="Goetia Petasos +2"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {	
               -- body="Heka's Kalasiris", 
               -- back="Pahtli Cape"
				})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {head="Jhakri Coronal"}
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		-- Damage
		sets.midcast.Nuke = {--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Hecate's Earring", rear="Moldavite Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		-- Acc
		sets.midcast.Nuke.Acc = {--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		
		-- Magic Burst
		sets.midcast.Nuke.MB = {--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		-- Magic Burst Acc
		sets.midcast.Nuke.MB.Acc = {--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
				
		-- Death
		sets.idle.Death = {
				--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		sets.precast.Death = {}
		sets.midcast.Nuke.Death = {
				--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		sets.midcast.Nuke.Death.Acc = {
				--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		sets.midcast.Nuke.Death.MB = {
				--ammo="Witchstone",
				main={name="Eminent Staff", priority=2}, sub={name="Wise Grip", priority=1},
				-- neck="Eddy Necklace", 
				head="Jhakri Coronal", neck="Artemis's Necklace", lear="Psystorm Earring", rear="Lifestorm Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Acuity Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		
		--Healing Magic
		sets.midcast.Cure = {main={name="Arka IV", priority=2}, sub={name="", priority=1},
				head="Haruspex Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Augur's Gloves", lring="Levia. Ring", rring="Levia. Ring",
                back="Tempered Cape +1", waist="Salire Belt", legs="Orvail Pants +1", feet="Regal Pumps"}
		
		sets.midcast.Curaga = {main={name="Arka IV", priority=2}, sub={name="", priority=1},
				head="Haruspex Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Augur's Gloves", lring="Levia. Ring", rring="Levia. Ring",
                back="Tempered Cape +1", waist="Salire Belt", legs="Orvail Pants +1", feet="Regal Pumps"}
		
		-- Enhancing 
		sets.midcast.Enhancing = {sub="Fulcio Grip",
			-- Andoaa Earring
			neck="Colossus's Torque", 
			--body="Anhur Robe",
			hands="Augur's Gloves", 
			-- back="Merciful Cape", waist="Sash", legs="Portant Pants", 
			feet="Rubeus Boots"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {}
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling ={main={name="Eminent Staff", priority=2}, sub={name="Mephitis Grip", priority=1},
				--neck="Eddy Necklace", 
				head="Jhakri Coronal", lear="Lifestorm Earring", rear="Psystorm Earring",
				-- rring="Sangoma ring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Perception ring",
                back="Taranus's Cape", waist="Salire Sash", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		sets.midcast.Macc = {main={name="Eminent Staff", priority=2}, sub={name="Mephitis Grip", priority=1},
				--neck="Eddy Necklace", 
				head="Jhakri Coronal", lear="Lifestorm Earring", rear="Psystorm Earring",
				-- rring="Sangoma ring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Perception ring",
                back="Taranus's Cape", waist="Salire Sash", legs="Jhakri Slops", feet="Jhakri Pigaches +1"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {
				--head="Appetence Crown",
				neck="Aesir Torque",
				hands="Sorcerer's Gloves", 
				--back="Merciful Cape", waist="Fucho-no-Obi", legs="Wizard's Tonban", 
				feet="Goetia Sabots +2"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark)
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				head="Jhakri Coronal", neck="Peacock Charm", lear="Bladeborn Earring", rear="SteelFlash Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Rajas Ring", rring="Ramuh Ring",
                back="Rancorous Mantle", waist="Goading Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"})
		sets.precast.WS = set_combine(sets.TP, {
				head="Jhakri Coronal", neck="Peacock Charm", lear="Bladeborn Earring", rear="SteelFlash Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Rajas Ring", rring="Ramuh Ring",
                back="Rancorous Mantle", waist="Goading Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {
				head="Jhakri Coronal", neck="Peacock Charm",  lear="Bladeborn Earring", rear="SteelFlash Earring",
                body="Jhakri Robe", hands="Jhakri Cuffs", lring="Rajas Ring", rring="Ramuh Ring",
                back="Rancorous Mantle", waist="Goading Belt", legs="Jhakri Slops", feet="Jhakri Pigaches +1"})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end