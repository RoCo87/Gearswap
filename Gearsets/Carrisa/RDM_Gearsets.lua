-- RDM Gearsets
-- Created on: 3/19/2014
-- Last Updated:
-- To Do List
--
--
--
--

if player.Name == 'Carrisa' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'WHM' then
				set_macro_page(5,6)
			elseif player.sub_job =='BLM' then
				set_macro_page(5,2)
			elseif player.sub_job == 'NIN' then
				set_macro_page(5,3)
			elseif player.sub_job == 'DNC' then
				set_macro_page(5,4)
			elseif player.sub_job =='SCH' then 
				set_macro_page(5,5)
			end
		else
			set_macro_page(5,6)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Bolelabunga", sub="Genbu's Shield",
				head="Hagondes Hat", neck="Twilight Torque",
                body="Hagondes Coat", hands="Hagondes Gages", lring=Aug.Darkring1.Carrisa, rring=Aug.Darkring2.Carrisa,
                back="Umbra Cape", waist="Flume Belt", legs="Hagondes Pants", feet="Hagondes Sabots"}
		sets.idle.MDT = {ammo="Vanir Battery",
				head="Hagondes Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Hagondes Coat", hands="Gende. Gages +1", lring=Aug.Darkring1.Carrisa, rring=Aug.Darkring2.Carrisa,
                back="Engulfer Cape", waist="Flume Belt", legs="Hagondes Pants", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT,{main="Boonwell Staff", ammo="Clarus Stone",
				head="Vitivation Chapeau", neck="Eidolon Pendant", lear="Antivenom Earring", rear="Friomisi Earring",
                body="Hagondes Coat", hands="Serpentes Cuffs", lring="Icesoul Ring", rring="Angha Ring",
                back="Felicitas Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{main="Bolelabunga", sub="Genbu's Shield", ammo="Dosis Tathlum", head="Vitivation Chapeau",
				neck="Twilight Torque", lear="Novio Earring", rear="Friomisi Earring", body="Hagondes Coat", hands="Hagondes Gages", 
				lring=Aug.Darkring1.Carrisa, rring=Aug.Darkring2.Carrisa,
				back="Umbra Cape", waist="Flume Belt", legs="Blood Cuisses", Feet="Hagondes Sabots"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Vitivation Chapeau",
				body="Vitivation Tabard", hands="Vitivation Gloves",
				legs="Blood Cuisses", feet="Vitivation Boots"})
		-- JA
		sets.precast.JA["Chainspell"] = {body="Vitivation Tabard"}
		sets.precast.JA["Stymie"] = {}
		
		sets.precast.JA["Composure"] = {head="Estq. Chappel +2", body="Estq. Sayon +2", hands="Estq. Ganthrt. +2", legs="Estqr. Fuseau +2", feet="Estq. Houseaux +2"}
		sets.precast.JA["Saboteur"] = {hands="Estq. Ganthrt. +2"}
		sets.precast.JA["Convert"] = {}
		sets.precast.JA["Spontaneity"] = {}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Impatiens",
				head="Haruspex Hat +1", neck="Jeweled Collar", lear="Loquac. Earring", rear="Estq. Earring",
                body="Vitivation Tabard", hands="Gende. Gages", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris", hands="Bokwus Gloves",
                back="Pahtli Cape"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {
				waist="Siegal Sash"})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {ammo="Impatiens", waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera Cotehardie", hands="Serpentes Cuffs",
                waist="Austerity Belt", legs="Nares Trews", feet="Umbani Boots"}
		--Healing Magic
		sets.midcast.Cure = {main="Tamaxchi", sub="Sors Shield", ammo="Impatiens",
				head="Vitivation Chapeau", neck="Colossus's Torque", lear="Roundel Earring", rear="Healing Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Sirona's Ring", rring="Haoma's Ring",
                back="Tempered Cape +1", waist="Cascade Belt", legs="Atrophy Tights", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV", 
				head="Vitivation Chapeau", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Atrophy Tights", feet="Rubeus Boots"}
	
		-- Enhancing 
		-- Goal 500+
		sets.midcast.Enhancing = {
				head="Vitivation Chapeau", neck="Colossus's Torque", rear="Andoaa Earring",
                body="Vitivation Tabard", hands="Vitivation Gloves",
                back="Estoqueur's Cape", waist="Cascade Belt", legs="Atrophy Tights", feet="Estq. Houseaux +2"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing, {hands="Vitivation Gloves"})
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {head="Umuthi Hat", neck="Stone Gorget", rear="Earthcry Earring", hands="Carapacho Cuffs",waist="Siegal Sash", 
		legs="Haven Hose", back="Estoqueur's Cape", feet="Estq. Houseaux +2"}
		sets.midcast.Aquaveil = {back="Estoqueur's Cape", waist="Empahatikos Rope", legs="Shedir Seraweels", feet="Estq. Houseaux +2"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Ngqoqwanb", sub="Mephitis Grip", ammo="Kalboron Stone",
				head="Vitivation Chapeau", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Estq. Sayon +2", hands="Estq. Ganthrt. +2", lring="Perception ring", rring="Sangoma ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Artsieq Hose", feet="Vitivation Boots"}
		sets.midcast.Macc = {main="Ngqoqwanb", sub="Mephitis Grip", ammo="Kalboron Stone",
				head="Atrophy Chapeau", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Estq. Sayon +2", hands="Estq. Ganthrt. +2", lring="Perception ring", rring="Sangoma ring",
                back="Refraction Cape", waist="Demonry Sash", legs="Artsieq Hose", feet="Vitivation Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{head="Vitivation Chapeau"})
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc, {feet="Vitivation Boots"})
		sets.midcast.Blind = set_combine(sets.midcast.Macc, {legs="Vitivation Tights"})
		sets.midcast.Bio = set_combine(sets.midcast.Macc, {legs="Vitivation Tights"})
		sets.midcast.Slow = set_combine(sets.midcast.Macc, {head="Vitivation Chapeau"})
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {main="Ngqoqwanb", sub="Mephitis Grip", ammo="Dosis Tathlum",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Novio Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Strendu Ring", rring="Icesoul ring",
                back="Toro Cape", waist="Aswang Sash", legs="Hagondes Pants", feet="Vitivation Boots"}
		-- Damage
		sets.midcast.Nuke = {main="Ngqoqwanb", sub="Zuuxowu Grip", ammo="Dosis Tathlum",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Novio Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Strendu Ring", rring="Icesoul ring",
                back="Toro Cape", waist="Aswang Sash", legs="Hagondes Pants", feet="Vivitation Boots"}
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {neck="Aesir Torque"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark)
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {})
		sets.TP.Acc = set_combine(sets.TP, {})
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Requeiscat'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc, {})
		sets.misc.flourish = set_combine(sets.midcast.Macc, {})
end