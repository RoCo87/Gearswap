-- RDM Gearsets
-- Created on: 3/19/2014
-- Last Updated:
-- To Do List
--
--
--
--

if player.Name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='WHM' then
				set_macro_page(3,1)
			elseif player.sub_job =='BLM' then
				set_macro_page(3,2)
			elseif player.sub_job =='NIN' then
				set_macro_page(3,3)
			elseif player.sub_job =='DNC' then
				set_macro_page(3,4)
			elseif player.sub_job =='SCH' then 
				set_macro_page(3,5)
			end
		else
			set_macro_page(3,1)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Hagondes Hat +1", neck="Twilight Torque", rear="Ethereal Earring",
                body="Hagondes Coat +1", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Flume Belt", legs="Hagondes Pants +1", feet="Helios Boots"}
		sets.idle.MDT = {ammo="Vanir Battery",
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape +1", waist="Flume Belt", legs="Hagondes Pants +1", feet="Helios Boots"}			
		sets.Resting = set_combine(sets.idle.PDT, {main={name="Chatoyant Staff", priority=2}, sub={name="Pax Grip", priority=1},
				head="Vitivation Chapeau", neck="Eidolon Pendant", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Felicitas Cape +1", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				head="Vitivation Chapeau", lear="Merman's Earring", rear="Etiolation Earring",
				body="Hagondes Coat +1",
				legs="Blood Cuisses", waist="Fucho-no-Obi"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Vitivation Chapeau",
				body="Vitivation Tabard",
				legs="Blood Cuisses"})
	
		-- JA
		sets.precast.JA["Chainspell"] = {body="Vitivation Tabard"}
		sets.precast.JA["Stymie"] = {}
		
		sets.precast.JA["Composure"] = {head="Lethargy Chappel", body="Lethargy Sayon", hands="Leth. Gantherots", legs="Leth. Fuseau", feet="Leth. Houseaux"}
		sets.precast.JA["Saboteur"] = {hands="Leth. Gantherots"}
		sets.precast.JA["Convert"] = {}
		sets.precast.JA["Spontaneity"] = {}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Impatiens",
				head="Carmine Mask +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Vitivation Tabard", hands="Gende. Gages +1", lring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Carmine Greaves +1"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris",
                back="Pahtli Cape"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {
				waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
				head="Umuthi Hat"})
				
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {ammo="Impatiens", 
				waist="Witful Belt"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				-- rear="Gifted Earring",
                -- body="Hedera Cotehardie", hands="Serpentes Cuffs",
                waist="Austerity Belt", feet="Carmine Greaves +1"}
		
		--Healing Magic
		sets.midcast.Cure = {main={name="Tamaxchi", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Gende. Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Atrophy Tights", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main={name="Tamaxchi", priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Vitivation Chapeau", neck="Colossus's Torque", lear="Novia Earring", rear="Enchntr. Earring +1",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Atrophy Tights", feet="Rubeus Boots"}
	
		-- Enhancing 
		-- Goal 500+
		sets.midcast.Enhancing = {main={name="Earth Staff", priority=2}, sub={name="Fulcio Grip", priority=1},
				head="Vitivation Chapeau", neck="Colossus's Torque", lear="Augment. Earring", rear="Andoaa Earring",
                body="Vitivation Tabard", hands="Vitivation Gloves",
                back="Estoqueur's Cape", waist="Bishop's Sash", legs="Atrophy Tights", feet="Leth. Houseaux"}
		-- Duration
		sets.midcast.Enhancing.Self = {main={name="Earth Staff", priority=2}, sub={name="Fulcio Grip", priority=1},
				head="Telchine Cap", neck="Colossus's Torque", lear="Augment. Earring", rear="Andoaa Earring",
                body="Telchine Chas.", hands="Atrophy Gloves",
				--  legs="Telchine Braconi", Duration Bonus
                back="Estoqueur's Cape", waist="Bishop's Sash", feet="Leth. Houseaux"}
		sets.midcast.Enhancing.Party = {main={name="Earth Staff", priority=2}, sub={name="Fulcio Grip", priority=1},
				head="Vitivation Chapeau", neck="Colossus's Torque", lear="Augment. Earring", rear="Andoaa Earring",
                body="Vitivation Tabard", hands="Vitivation Gloves",
                back="Estoqueur's Cape", waist="Bishop's Sash", legs="Atrophy Tights", feet="Leth. Houseaux"}
		
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing, {hands="Vitivation Gloves"})
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing.Self, {waist="Siegel Sash"})
		sets.midcast.Aquaveil = set_combine(sets.midcast.Enhancing.Self,{waist="Empahatikos Rope", legs="Shedir Seraweels"})
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Regen = {main="Bolelabunga"}
		
		sets.midcast.INT = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Kalboron Stone",
		-- Spikes: Goal 250 Int
				head="Atrophy Chapeau", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Hagondes Coat +1", hands="Vitivation Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Ovate Rope", legs="Hagondes Pants +1", feet="Vitivation Boots"}
				
		-- Enfeebling 
		-- Skill need 625
		-- Frazzle/Distract 
		sets.midcast.Enfeebling = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Kalboron Stone",
				head="Vitivation Chapeau", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Lethargy Sayon", hands="Leth. Gantherots", lring="Perception ring", rring="Sangoma ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Vitivation Boots"}
		-- MACC
		sets.midcast.Macc = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Kalboron Stone",
				head="Carmine Mask +1", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Lethargy Sayon", hands="Leth. Gantherots", lring="Perception ring", rring="Sangoma ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Vitivation Boots"}
		
		-- Potency
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{head="Vitivation Chapeau"})
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc, {feet="Vitivation Boots"})
		sets.midcast.Blind = set_combine(sets.midcast.Macc, {legs="Vitivation Tights"})
		sets.midcast.Slow = set_combine(sets.midcast.Macc, {head="Vitivation Chapeau"})
		sets.midcast.Bind = set_combine(sets.midcast.INT, sets.midcast.Macc)
		
		-- Elemental
		-- Skill Gear For Elemental Dots And High Resisted Nukes
		sets.midcast.Elemental = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Auroele",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalic Nails"}
		-- Pure Damage
		sets.midcast.Nuke = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		
		-- Dark Magic
		sets.midcast.Bio = set_combine(sets.midcast.Macc, {legs="Vitivation Tights"})
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {neck="Aesir Torque"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark)
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {})
		
		sets.TP.Acc = set_combine(sets.TP, {})
		
		-- Weaponskills
		sets.precast.WS = set_combine(sets.TP, {})

		-- Dagger 
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Requeiscat'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc, {})
		sets.misc.flourish = set_combine(sets.midcast.Macc, {})
end