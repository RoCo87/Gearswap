-- SCH Gearsets
-- Created: 6/13/2014
-- Last Updated: 6/13/2014
-- To Do:
--
--
--
--

if player.Name == 'Feary' then
	-- includes
	include('include/mappings.lua')
	include('include/equipment.lua')
	
	-- Auto Sets
	-- Standard/idle
	sets.idle.PDT = {main={name="Earth Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Staunch Tathlum",
			head="Mallquis Chapeau +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
			body="Mallquis Saio +1", hands="Mallquis Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
			back="Umbra Cape", waist="Fucho-no-obi", legs="Mallquis Trews +1", feet="Mallquis Clogs +1"}
	sets.idle.MDT = {ammo="Staunch Tathlum",
			head="Mallquis Chapeau +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
			body="Mallquis Saio +1", hands="Mallquis Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
			back="Felicitas Cape +1", waist="Fucho-no-obi", legs="Mallquis Trews +1", feet="Mallquis Clogs +1"}
	sets.Resting = set_combine(sets.idle.PDT, {})
	
	sets.idle.Standard = set_combine(sets.idle.PDT,{main={name="Hvergelmir", priority=2}, sub={name="Zuuxowu Grip", priority=1},
			body="Jhakri Robe +1",
			--Assidity Legs
			feet="Herald's Gaiters"})
	sets.misc.Town = set_combine(sets.idle.PDT, {feet="Herald's Gaiters"})
	
	-- JA
	sets.precast.JA["Tabula Rasa"] = {legs="Pedagogy Pants"}
	sets.precast.JA["Caper Emissarius"] = {}
	
	sets.precast.JA["Sublimation"] = {}
	sets.precast.JA["Enlightenment"] = {}
	sets.precast.JA["Libra"] = {}
	sets.precast.JA["Modus Veritas"] = {}
	
	-- Strategems 
	sets.precast.JA["Rapture"] = {}
	
	-- Precast
	-- Magic
	sets.precast.Fastcast = {ammo="Incantor Stone",
			-- neck="Voltsurge Torque",
			head="Nahtirah Hat", lear="Loquac. Earring", rear="Enchntr. Earring +1",
			body="Anhur Robe", hands="Gende. Gages +1", lring="Prolix Ring",
			-- Aug.Cape.SCH.FC
			back="Swith Cape +1", waist="Witful Belt", legs="Lengo Pants", feet="Peda. Loafers"}
	sets.precast.Cure = set_combine(sets.precast.Fastcast, {
			body="Heka's Kalasiris", 
			back="Pahtli Cape"})  		
	sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{
			waist="Siegel Sash"})
	sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
			head="Umuthi Hat", waist="Siegel Sash"})
	
	-- Midcast
	sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {waist="Witful Belt"})
	
	sets.midcast.ConserveMP = {
			lear="Gwati Earring", rear="Gifted Earring",			
			waist="Austerity Belt",}
	
	-- Elemental Magic 
	-- High Resist
	sets.midcast.Elemental = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Dosis Tathlum",
			head="Mallquis Chapeau +1", neck="Eddy Necklace", lear="Elemental Earring", rear="Friomisi Earring",
			body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
			back="Toro Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
	
	-- Damage
	sets.midcast.Nuke = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Dosis Tathlum",
			head="Mallquis Chapeau +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
			body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
			back="Toro Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
	
	sets.midcast.Nuke.Acc = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Dosis Tathlum",
			head="Helios Hat", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
			body="Jhakri Robe +1", hands="Amalric Slops", lring="Shiva Ring +1", rring="Shiva Ring +1",
			back="Toro Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
	
	-- Magic Burst
	sets.midcast.Nuke.MB = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Dosis Tathlum",
			head="Helios Hat", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
			body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
			back="Toro Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
	
	sets.midcast.Nuke.MB.Acc = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Dosis Tathlum",
			head="Helios Hat", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
			body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
			back="Toro Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
			
	-- Hellx - INT
	sets.midcast.Helix = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Dosis Tathlum",
			head="Arbatel Bonnet", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
			body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
			back="Bookworm's Cape", waist="Sekhmet Corset", legs="Amalric Slops", feet="Amalric Nails"}
	
	--Healing Magic
	sets.midcast.Cure = {main={name="Arka IV", priority=2}, sub={name="Pax Grip", priority=1}, 
			head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Beatific Earring",
			body="Pedagogy Gown", hands="Telchine Gloves", lring="Sirona's Ring", rring="Levia. Ring +1",
			back="Tempered Cape +1", waist="Bishop's Sash", legs="Academic's Pants", feet="Pedagogy Loafers"}
	
	sets.midcast.Cure.Weather = {main={name="Chatoyant Staff", priority=2},
			head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Beatific Earring",
			body="Gende. Bilaut +1", hands="Telchine Gloves", lring="Sirona's Ring", rring="Levia. Ring +1",
			back="Twilight Cape", waist="Hachirin-no-Obi", legs="Academic's Pants", feet="Pedagogy Loafers"}
	
	sets.midcast.Curaga = {main={name="Arka IV", priority=2},
			head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Beatific Earring",
			body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
			back="Tempered Cape +1", waist="Bishop's Sash", legs="Academic's Pants", feet="Pedagogy Loafers"}

	-- Enhancing 
	-- Target 500+ 
	sets.midcast.Enhancing = {main={name="Kirin's Pole",priority=2}, sub={name="Fulcio Grip", priority=1}, ammo="Savant's Treatise",
		head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body="Anhur Robe", hands="Arbatel Bracers",
		back="Merciful Cape", waist="Olympus Sash", legs="Academic's Pants", feet="Rubeus Boots"}
	sets.midcast.Embrava = set_combine(sets.midcast.Enhancing, {hands="Arbatel Bracers"})
	sets.midcast.Regen = set_combine(sets.midcast.Enhancing,{main={name="Bolelabunga", priority=2},
		head="Arbatel Bonnet",
		back="Bookworm's Cape"})
	sets.midcast.Enspell = set_combine(sets.midcast.Enhancing,{})
	sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
	sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
	sets.midcast.Stoneskin = {waist="Siegel Sash"}
	sets.midcast.Aquaveil = {}
	sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
	sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

	-- Enfeebling
	-- Potency
	sets.midcast.Enfeebling = {main={name="Atinian Staff", priority=2}, sub={name="Mephitis Grip", priority=1}, range="Aureole",
			head="Nahtirah Hat", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Enchntr. Earring +1",
			body="Jhakri Robe +1", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma ring",
			back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
	sets.midcast.Macc = {main={name="Atinian Staff", priority=2}, sub={name="Mephitis Grip",priority=1}, ammo="Aureole",
			head="Nahtirah Hat", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Enchntr. Earring +1",
			body="Jhakri Robe +1", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma ring",
			back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
	sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
	sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
	sets.midcast.Blind = set_combine(sets.midcast.Macc)
	sets.midcast.Bio = set_combine(sets.midcast.Macc)
	sets.midcast.Slow = set_combine(sets.midcast.Macc)
	
	
	-- Dark Magic
	sets.midcast.Dark = set_combine(sets.midcast.Macc, {
			head="Appetence Crown", neck="Aesir Torque",
			back="Merciful Cape", })
	sets.midcast.Aspir = set_combine(sets.midcast.Dark, {
		head="Appetence Crown",
		waist="Fucho-no-Obi",})
	
	sets.midcast.Kaustra = set_combine(sets.midcast.Macc,{main={name="Atinian Staff",priority=2}, sub={name="Mephitis Grip", priority=1},
			head="Helios Hat", neck="Eddy Necklace",  lear="Barkaro. Earring", rear="Enchntr. Earring +1",
			body="Jhakri Robe +1", hands="Helios Gloves", lring="Shiva Ring +1", rring="Shiva Ring +1",
			back="Toro Cape", waist="Hachirin-no-Obi", legs="Hagondes Pants +1", feet="Helios Boots"})
	
	-- Stun - Alacrity Down
	sets.midcast.Stun = set_combine(sets.precast.Fastcast, {main="Atinian Staff", sub="Arbuda Grip", ammo="Incantor Stone",
		head="Peda. M.Board", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Hedera Cotehardie", hands="Gende. Gages +1", lring="Prolix Ring", rring="Sangoma Ring",
		back="Swith Cape +1", waist="Ninurta's Sash", legs="Artsieq Hose", feet="Acad. Loafers"})
	-- Stun - Alacrity Up
	sets.midcast.Stun.Alacrity = set_combine(sets.midcast.Stun, {main="Atinian Staff", sub="Arbuda Grip", ammo="Incantor Stone",
		head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Hedera Cotehardie", hands="Gende. Gages +1", lring="Prolix Ring", rring="Sangoma Ring",
		back="Swith Cape +1", waist="Ninurta's Sash", legs="Artsieq Hose", feet="Peda. Loafers"})
	
	-- Melee Sets
	sets.TP = set_combine(sets.idle.PDT, {})
	sets.TP.Acc = set_combine(sets.TP,{})
	
	sets.precast.WS = set_combine(sets.TP, {})
	sets.precast.WS.Acc = set_combine(sets.WS,{})
	
	-- Staff
	sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Myrkr'] = {}
	
end