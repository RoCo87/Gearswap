-- BLM Gearsets
-- Created On: 4/11/2014
-- Last Updated: 4/16/2016
--

if player.Name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		
	

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1},
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Hagondes Pants +1", feet="Hag. Sabots +1"}
		sets.idle.MDT = {
				-- Sanare Earring
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
				-- Amalric Doublet
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape +1", waist="Fucho-no-obi", legs="Hagondes Pants +1", feet="Amalric Nails"}			
		sets.Resting = set_combine(sets.idle.PDT, {
				main={name="Chatoyant Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Clarus Stone",
				-- Amalric Coif
				neck="Eidolon Pendant",
                body="Jhakri Robe +1", hands="Serpentes Cuffs",
				-- Assidaity Pants +1
                back="Umbra Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1},
				-- Amalric Coif
				body="Jhakri Robe +1", hands="Serpentes Cuffs",
				-- Assidiaty pants +1 Serpentes boots
				feet="Herald's Gaiters"})
		sets.misc.Town = set_combine(sets.idle.PDT,  {main={name="Hvergelmir", priority=2}, sub={name="Zuuxowu Grip", priority=1},
				feet="Herald's Gaiters"})
		
		-- JA
		sets.precast.JA["Manafont"] = {body="Archmage's Coat"}
		sets.precast.JA["Subtle Sorcery"] = {}
		
		sets.precast.JA["Elemental Seal"] = {main="Baqil Staff"}
		sets.precast.JA["Emnity Douse"] = {}
		sets.precast.JA["Manawell"] = {}
		-- Manawall 
		sets.precast.JA["Manawall"] = {feet="Wicce Sabots"}
		
		-- Precast
		-- Magic
		sets.precast.MinusHP = {
				head="Zenith Crown", neck="Morgana's Choker",
				body="Dalmatica", hands="Zenith Mitts", 
				legs="Zenith Slacks", feet="Zenith Pumps"}
		sets.precast.Fastcast = {ammo="Impatiens",
				-- Merlinic Hood
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Anhur Robe", hands="Magavan Mitts", lring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Amalric Nails"}
		sets.precast.Elemental = set_combine(sets.precast.Fastcast,{
				head="Wicce Petasos"})
		sets.precast.Death = set_combine(sets.precast.Fastcast,{})
		
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris",
                back="Pahtli Cape"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{
				waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
				head="Umuthi Hat", waist="Siegel Sash"})
				
		-- Midcast
		sets.midcast.Recast = set_combine(sets.precast.Fastcast, {
				waist="Witful Belt"})		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				lear="Gifted Earring", rear=" Gwati Earring",
                body="Hedera Cotehardie", hands="Serpentes Cuffs",
				waist="Austerity Belt", feet="Umbani Boots"}
		
		-- Elemental
		-- Skill
		sets.midcast.Elemental = {main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Elemental Earring",
                body="Spaekona's Coat", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		-- Damage
		sets.midcast.Nuke = {main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Spaekona's Coat", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		-- Acc
		sets.midcast.Nuke.Acc = {main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Spaekona's Coat", hands="Amalric Gages", lring="Shiva Ring", rring="Shiva Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		
		-- Magic Burst
		sets.midcast.Nuke.MB = {main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Jhakri Coronal +1", neck="Mizukage-no-Kubikazari", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Spaekona's Coat", hands="Amalric Gages", lring="Shiva Ring", rring="Locus Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		-- Magic Burst Acc
		sets.midcast.Nuke.MB.Acc = {main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Jhakri Coronal +1", neck="Mizukage-no-Kubikazari", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Spaekona's Coat", hands="Amalric Gages", lring="Shiva Ring", rring="Locus Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
				
		-- Death
		sets.idle.Death = {
				main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Jhakri Coronal +1", neck="Mizukage-no-Kubikazari", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring", rring="Locus Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		sets.precast.Death = {}
		sets.midcast.Nuke.Death = {
				main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Jhakri Coronal +1", neck="Mizukage-no-Kubikazari", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring", rring="Locus Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		sets.midcast.Nuke.Death.Acc = {
				main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Jhakri Coronal +1", neck="Mizukage-no-Kubikazari", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring", rring="Locus Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		sets.midcast.Nuke.Death.MB = {
				-- Noibid Strap - Psilomene
				main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				-- Pixie Hairpin 
				head="Jhakri Coronal +1", neck="Mizukage-no-Kubikazari", lear="Barkaro. Earring", rear="Friomisi Earring",
				-- Amalric Doublet/Merlinic - Memphitas Ring
			    body="Hagondes Coat +1", hands="Amalric Gages", lring="Shiva Ring", rring="Archon Ring",
				-- Merlinic Crackows
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
		
		
		--Healing Magic
		sets.midcast.Cure = {main={name="Arka IV", priority=2}, sub={name="Zuuxowu Grip", priority=1},
				head="Nahtirah Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Sirona's Ring",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Artsieq Hose", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main={name="Arka IV", priority=2}, sub={name="Zuuxowu Grip", priority=1},
				head="Nahtirah Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Artsieq Hose", feet="Rubeus Boots"}
	
		-- Enhancing
		sets.midcast.Enhancing = {main={name="Kirin's Pole", priority=2}, sub={name="Fulcio Grip", priority=1},
				head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
				body="Anhur Robe", hands="Ayao's Gages", 
				back="Merciful Cape", waist="Olympus Sash", legs="Portant Pants", feet="Rubeus Boots"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", 
				back="Ogapepo Cape", waist="Witful Belt"}
		sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing,{waist="Siegel Sash"})
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main={name="Lathi", priority=2}, sub={name="Mephitis Grip", priority=1}, ammo="Aureole",
				--head="Jhakri Coronal +1", 
				neck="Eddy Necklace", lear="Barkaro. Earring", rear="Enchntr. Earring +1",
                -- Helios Jacket
				body="Cohort Cloak", hands="Helios Gloves", lring="Perception ring", rring="Sangoma ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Macc = {main={name="Lathi", priority=2}, sub={name="Mephitis Grip", priority=1}, ammo="Aureole",
				-- head="Jhakri Coronal +1",
				neck="Eddy Necklace", lear="Barkaro. Earring", rear="Enchntr. Earring +1",
                -- Helios Jacket
				body="Cohort Cloak", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				-- Merlinic or Helios Gloves 
				hands="Sorcerer's Gloves", 
				back="Merciful Cape", legs="Wizard's Tonban", feet="Wicce Sabots"})
		sets.midcast.Aspir = set_combine(sets.midcast.DarkMagic,
				{main={name="Lathi", priority=2}, sub={name="Mephitis Grip", priority=1}, ammo="Aureole",
				-- Helio Band  Hirudinea Earring Barko Earring
				head="Appetence Crown", neck="Aesir Torque", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helios Jacket", hands="Hagondes Cuffs +1", lring="Archon Ring", rring="Sangoma ring",
                -- Bane Cape
				back="Merciful Cape", waist="Fucho-no-Obi", legs="Artsieq Hose", feet="Helios Boots"})
		sets.midcast.Aspir.Death = {
				-- Niobid Strap - Hydrocera
				main={name="Lathi", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				-- Pixie Hairpin +1 - Incantor's Torque - Barkaro. Earring
				head="Hagondes Hat +1", neck="Mizukage-no-Kubikazari", lear="Gwati Earring", rear="Friomisi Earring",
				-- Helios Gloves 
                body="Spaekona's Coat", hands="Helios Gloves", lring="Shiva Ring", rring="Archon Ring",
                back="Taranus's Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		-- Stun
		sets.midcast.Stun = set_combine(sets.midcast.Macc,
				{main={name="Lathi", priority=2}, sub={name="Mephitis Grip", priority=1}, ammo="Hasty Pinion",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				-- Vanir Cotehardie
				body="Hedera Cotehardie", hands="Hagondes Cuffs +1", lring="Prolix Ring", rring="Sangoma Ring",
				back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Hag. Sabots +1"})
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {})
		
		sets.TP.Acc = set_combine(sets.TP,{})
		
		-- Weaponskills
		sets.precast.WS = set_combine(sets.TP, {})
		
		-- Staff
		-- Shattersoul
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		sets.precast.WS['Myrkr'] = {}
end