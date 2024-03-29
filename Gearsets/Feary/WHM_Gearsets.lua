-- WHM Gearsets
-- Date Created: 1/29/2014
-- Last Updated: 02/03/2015
-- To Do List:
--

if player.name == 'Feary' then
		-- includes
		
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
		
		
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main={name="Bolelabunga", priority=2}, sub={name="Genbu's Shield", priority=1}, ammo="Staunch Tathlum", 
				head="Aya. Zucchetto +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Ayanmo Corazza +1", hands="Aya. Gambieras +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-Obi", legs="Aya. Cosciales +1", feet="Aya. Gambieras +1"}
		sets.idle.MDT = {
				head="Inyanga Tiara +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Inyanga Jubbah +1", hands="Inyan. Dastanas +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape +1", waist="Fucho-no-Obi",  legs="Inyanga Shalwar +1", feet="Inyan. Crackows +1"}			
		sets.Resting = set_combine(sets.idle.PDT, {})
		
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Etiolation Earring",
				hands="Serpentes Cuffs",
                waist="Fucho-no-Obi", legs="Nares Trews", feet="Herald's Gaiters"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
				
		-- JA
		sets.precast.JA['Benediction'] = {body="Piety Briault"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Ebers Cap", hands="Ebers Mitts", back="Mending Cape"}
		sets.precast.JA['Devotion'] = {head="Piety Cap"}
		sets.precast.JA['Martyr'] = {hands="Piety Mitts"}
		
		sets.precast.JA['Divine Veil'] = {head="Ebers Cap +1"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Incantor Stone",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Anhur Robe", hands="Gende. Gages +1", lring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Lengo Pants", feet="Chelona Boots +1"}
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{
				waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
				head="Umuthi Hat", waist="Siegel Sash"})
		sets.precast.Healing = set_combine(sets.precast.Fastcast,{legs="Ebers Pantaloons"})
		-- Caps - 80%/26 Current: 81%/13 Haste
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="Piety Cap",
                body="Heka's Kalasiris",
                back="Pahtli Cape", legs="Ebers Pantaloons", feet="Cure Clogs"})
	
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {
				})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				lear="Gwati Earring", rear="Gifted Earring",
                body="Hedera Cotehardie",
                waist="Austerity Belt", legs="Nares Trews", feet="Umbani Boots"}

		--Healing Magic
		-- Cures
		sets.midcast.Cure = {main="Tamaxchi",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Ebers Bliaud", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main="Tamaxchi",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Ebers Bliaud", hands="Telchine Gloves", lring="Sirona's Ring", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"})

		sets.midcast.Curaga = {main="Tamaxchi",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {main="Tamaxchi",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"})

		sets.midcast.Cura = {}

		-- Status Ailments
		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {
				legs="Ebers Pantaloons"})
		
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells, {})

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {ammo="Impatiens",
				neck="Debilis Medallion",
                rring="Haoma's Ring",
                back="Mending Cape", legs="Theo. Pantaloons", feet="Gende. Galosh. +1"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{main="Bolelabunga",
                body="Piety Briault", hands="Ebers Mitts",
                legs="Theo. Pantaloons"})
		sets.midcast.BarElement = {main="Beneficus",
				head="Ebers Cap", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
                body="Ebers Bliaud", hands="Ebers Mitts",
                back="Merciful Cape", waist="Olympus Sash", legs="Ebers Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.BarStatus = {main="Beneficus",
				head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
                body="Anhur Robe", hands="Inyanga Dastanas +1",
                back="Merciful Cape", waist="Olympus Sash", legs="Piety Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.Boost = {main="Beneficus",
				head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
                body="Anhur Robe", hands="Ayao's Gages", 
                back="Merciful Cape", waist="Olympus Sash", legs="Piety Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Boost)
		sets.midcast.Hastespell = set_combine(sets.precast.Fastcast,{ammo="Impatiens", 
				back="Ogapepo Cape", waist="Witful Belt"})
		sets.midcast.Stoneskin = {waist="Siegel Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Shellra = set_combine(sets.precast.Enhancing,{legs="Piety Pantaloons"})
		sets.midcast.Protectra = set_combine(sets.precast.Enhancing,{feet="Piety Duckbills"})
		sets.midcast.Auspice = set_combine(sets.precast.Enhancing,{feet="Ebers Duckbills"})

		-- Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast,{ammo="Aureole",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
				body="Vanir Cotehardie", hands="Gende. Gages +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
				back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots +1"})
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
                body="Helios Jacket", hands=Aug.Skirmish.Helios.Hands.MAB, lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Toro Cape", waist="Sekhmet Corset", legs="Artsieq Hose", feet=Aug.Skirmish.Helios.Feet.MAB}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency - Slow Addle Paralyze
		sets.midcast.Enfeebling = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
				-- Incantor Torque 
				head="Inyanga Tiara +1", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Inyanga Jubbah +1", hands="Inyanga Dastanas +1", lring="Perception Ring", rring="Sangoma Ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Inyanga Shalwar +1", feet="Inyanga Crackows +1"}
		sets.midcast.Macc = {main={name="Bolelabunga",priority=2}, sub={name="Genbu's Shield", priority=1},
				-- Incantor Torque 
				head="Inyanga Tiara +1", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Inyanga Jubbah +1", hands="Inyanga Dastanas +1", lring="Perception Ring", rring="Sangoma Ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Inyanga Shalwar +1", feet="Inyanga Crackows +1"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {	
				head="Appetence Crown", neck="Aesir Torque",
				body="Hedera Cotehardie",
				back="Merciful Cape"})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				waist="Fucho-no-Obi"})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
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