-- Geo Gearsets
-- Created: 4/11/2014
-- Last Updated: 03/16/2016
-- To Do List
--
--
--
--

if player.Name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(6,2)
			elseif player.sub_job =='BLM' then
				set_macro_page(7,2)
			elseif player.sub_job == 'WHM' then
				set_macro_page(9,2)
			elseif player.sub_job == 'SCH' then
				set_macro_page(9,2)
			elseif player.sub_job =='DNC' then 
				set_macro_page(8,2)
			elseif player.sub_job =='DRK' then 
				set_macro_page(7,2)
			elseif player.sub_job =='NIN' then 
				set_macro_page(10,2)
			end
		else
			set_macro_page(6,2)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {sub={name="Genbu's Shield",priority=1},
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-Obi", legs="Hagondes Pants +1", feet="Hag. Sabots +1"}
		sets.idle.MDT = {
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felecie", waist="Fucho-no-Obi",  legs="Hagondes Pants +1", feet="Hag. Sabots +1"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				head="", neck="Eidolon Pendant",
                body="Hagondes Coat +1", hands="Bagua Mitaines",
                waist="Fucho-no-Obi", legs="Nares Trews", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield",priority=1}, range="Dunna",
				lear="Merman's Earring", rear="Etiolation Earring",
				hands="Bagua Mitaines",
				waist="Fucho-no-Obi", feet="Geomancy Sandals"})
		sets.idle.Standard.Pet = set_combine(sets.idle.PDT,{range="Dunna",
				head="Selenian Cap",lear="Merman's Earring", rear="Etiolation Earring",
				hands="Geomancy Mitaines",
				feet="Bagua Sandals"})
						
		sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Azimuth Hood",
				body="Azimuth Coat", hands="Azimuth Gloves",
				legs="Azimuth tights", feet="Geomancy Sandals"})
		-- JA
		sets.precast.JA["Bolster"] = {body="Bagua Tunic"}
		sets.precast.JA["Widened Compass"] = {}
		
		sets.precast.JA["Life Circle"] = {body="Geomancy Tunic"}
		sets.precast.JA["Full Circle"] = {hands="Bagua Mitianes"}
		sets.precast.JA["Mending Halation"] = {legs="Bagua Pants"}
		sets.precast.JA["Radial Arcana"] = {feet="Bagua Sandals"}
		sets.precast.JA["Cardinal Chant"] = {head="Geomancy Galero"}
		sets.precast.JA["Collimated Fervor"] = {head="Geomancy Galero"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Anhur Robe", hands="Magavan Mitts", lring="Prolix Ring", rring="",
                back="Lifestream Cape", waist="Witful Belt", legs="Geomancy Pants", feet="Chelona Boots +1"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris",
                back="Pahtli Cape"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{head="Umuthi Hat"})
		sets.precast.Elemental = set_combine(sets.precast.Fastcast,{hands="Bagua Mitaines"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {
				head="Nares Cap", lear="Gwati Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Bagua Mitaines",
				waist="Austerity Belt", feet="Umbani Boots"}
		-- Geomancy
		sets.midcast.Geomancy = set_combine(sets.midcast.ConserveMP,{range="Dunna",
				head="Azimuth Hood", neck="Incantor's Torque",
				body="Bagua Tunic", hands="Geomancy Mitaines",
				back="Lifestream Cape", legs="Bagua Pants", feet="Azimuth Gaiters"})
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		-- Damage
		sets.midcast.Nuke = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}		
		
		sets.midcast.Nuke.Acc = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Azimuth Coat", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Azimuth Tights", feet="Helios Boots"}		
		
		sets.midcast.Nuke.MB = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Hagondes Hat +1", neck="Mizu. Kubikazari", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Locus Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}		
		
		--Healing Magic
		sets.midcast.Cure = {main={name="Tamaxchi",priority=2}, sub={name="Genbu's Shield",priority=1},
				head="Nahtirah Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Beatific Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Sirona's Ring", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Artsieq Hose", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main={name="Tamaxchi",priority=2}, sub={name="Genbu's Shield",priority=1},
				head="Nahtirah Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Enchntr. Earring +1",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Artsieq Hose", feet="Rubeus Boots"}
	
		-- Enhancing 
		sets.midcast.Enhancing = {main={name="Kirin's Pole",priority=2}, sub={name="Fulcio Grip",priority=1},
				head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
				body="Anhur Robe", hands="Ayao's Gages",
				back="Merciful Cape", waist="Olympus Sash", legs="Portant Pants", feet="Rubeus Boots"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {waist="Siegel Sash"}
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main={name="Atinian Staff",priority=2}, sub={name="Mephitis Grip",priority=1}, ammo="Aureole",
				head="Helios Hat", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Helios Jacket", hands="Azimuth Gloves", lring="Perception ring", rring="Sangoma ring",
                back="Lifestream Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Macc = {main={name="Atinian Staff",priority=2}, sub={name="Mephitis Grip",priority=1}, ammo="Aureole",
				head="Helios Hat", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Helios Jacket", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma ring",
                back="Lifestream Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {
				head="Bagua Galero", neck="Aesir Torque",
				body="Geomancy Tunic", 
				legs="Azimuth Tighs", back="Merciful Cape"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark,{waist="Fucho-no-Obi"})
		sets.midcast.Stun = set_combine(sets.midcast.Macc,{ammo="Hasty Pinion +1",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				body="Anhur Robe", hands="Hagondes Cuffs +1", lring="Prolix Ring", rring="Sangoma Ring",
				back="Lifestream Cape", waist="Witful Cape", legs="Geomancy Tights", feet="Hag. Sabots +1"})
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Rajas Ring", rring="Ramuh Ring +1",
				back="Buquwik Cape", waist="Witful Belt", legs="Telchine Braconi", feet="Battlecast Gaiters"}) 
				
		sets.TP.Acc = set_combine(sets.TP, {
				head="Nahtirah Hat", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Rajas Ring", rring="Ramuh Ring +1",
				back="Buquwik Cape", waist="Witful Belt", legs="Telchine Braconi", feet="Battlecast Gaiters"}) 

		-- Weaponskills	
		sets.precast.WS = set_combine(sets.TP, {
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Rajas Ring", rring="Ramuh Ring +1",
				back="Buquwik Cape", waist="Witful Belt", legs="Telchine Braconi", feet="Battlecast Gaiters"}) 
		
		sets.precast.WS.Acc = {}
		
		-- Club
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
				back="Buquwik Cape", waist="Wanion Belt", legs="Telchine Braconi", feet="Battlecast Gaiters"}) 
		
		sets.precast.WS.Acc['Hexa Strike'] = {}
		
		sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {
				head="Nahtirah Hat", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Levithan Ring +1", rring="Levithan Ring +1",
				back="Buquwik Cape", waist="Fotia Belt", legs="Telchine Braconi", feet="Battlecast Gaiters"}) 
		
		sets.precast.WS.Acc['Realmrazer'] = set_combine(sets.precast.WS, {
				head="Nahtirah Hat", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Levithan Ring +1", rring="Levithan Ring +1",
				back="Buquwik Cape", waist="Fotia Belt", legs="Telchine Braconi", feet="Battlecast Gaiters"}) 
		
		sets.precast.WS['Exudation'] = set_combine(sets.precast.WS, {
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Levithan Ring +1", rring="Levithan Ring +1",
				back="Buquwik Cape", waist="Wanion Belt", legs="Telchine Braconi", feet="Battlecast Gaiters"})
				
		sets.precast.WS.Acc['Exudation'] = set_combine(sets.precast.WS, {
				head="Nahtirah Hat", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Levithan Ring +1", rring="Levithan Ring +1",
				back="Buquwik Cape", waist="Wanion Belt", legs="Telchine Braconi", feet="Battlecast Gaiters"})
				
		-- Staff 
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = set_combine(sets.idle.PDT,{})
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = set_combine(sets.midcast.Macc,{main="", sub=""})
end