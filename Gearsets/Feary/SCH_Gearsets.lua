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
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(9,1)
			elseif player.sub_job =='WHM' then
				set_macro_page(9,2)
			elseif player.sub_job == 'BLM' then
				set_macro_page(9,3)
			elseif player.sub_job == 'DRK' then
				set_macro_page(9,4)
			elseif player.sub_job =='NIN' then 
				set_macro_page(9,5)
			end
		else
			set_macro_page(9,1)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Hagondes Pants +1", feet="Hag. Sabots +1"}
		sets.idle.MDT = {
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape", waist="Fucho-no-obi", legs="Hagondes Pants +1", feet="Hag. Sabots +1"}			
		sets.Resting = set_combine(sets.idle.PDT, {main={name="Chatoyant Staff", priority=2}, sub={name="", priority=1},
				neck="Eidolon Pendant",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Nares Trews", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{main={name="Hvergelmir", priority=2}, sub={name="", priority=1}
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
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Anhur Robe", hands="Gende. Gages +1", lring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Peda. Loafers"}
		
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris", 
                back="Pahtli Cape"})  		
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{
				waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
				head="Umuthi Hat", waist="Siegel Sash"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				lear="Gwati Earring", rear="Gifted Earring",
                body="Hedera Cotehardie",
				waist="Austerity Belt", feet="Umbani Boots"}
		
		-- Elemental Magic 
		-- High Resist
		sets.midcast.Elemental = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Elemental Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		
		-- Damage
		sets.midcast.Nuke = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva ring", rring="Shiva ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		
		sets.midcast.Nuke.Acc = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Helios Hat", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Helios Jacket", hands="Helios Gloves", lring="Shiva ring", rring="Shiva ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		
		-- Magic Burst
		sets.midcast.Nuke.MB = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Helios Hat", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Helios Jacket", hands="Helios Gloves", lring="Shiva ring", rring="Shiva ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		
		sets.midcast.Nuke.MB.Acc = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Helios Hat", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Helios Jacket", hands="Helios Gloves", lring="Shiva ring", rring="Shiva ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
				
		-- Hellx 
		sets.midcast.Helix = {main={name="Atinian Staff", priority=2}, sub={name="Zuuxowu Grip", priority=1}, ammo="Witchstone",
				head="Arbatel Bonnet", neck="Eddy Necklace", lear="Barkaro. Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Bookworm's Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Arbatel Loafers"}
		
		--Healing Magic
		sets.midcast.Cure = {main={name="Arka IV", priority=2}, 
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
		sets.midcast.Regen = set_combine(sets.midcast.Enhancing,{main="Bolelabunga",
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
		sets.midcast.Enfeebling = {main="Atinian Staff", sub="Mephitis Grip", range="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helios Jacket", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Macc = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helios Jacket", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma ring",
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
		
		sets.midcast.Kaustra = set_combine(sets.midcast.Macc,{main="Atinian Staff", sub="Mephitis Grip",
				head="Helios Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Hachirin-no-Obi", legs="Hagondes Pants +1", feet="Helios Boots"})
		
		-- Stun - Alacrity Down
		sets.midcast.Stun = set_combine(sets.precast.Fastcast, {main="Atinian Staff", sub="Arbuda Grip", ammo="Incantor Stone",
			head="Peda. M.Board", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Gwati Earring",
			body="Hedera Cotehardie", hands="Gende. Gages +1", lring="Prolix Ring", rring="Sangoma Ring",
			back="Swith Cape +1", waist="Ninurta's Sash", legs="Artsieq Hose", feet="Acad. Loafers"})
		-- Stun - Alacrity Up
		sets.midcast.Stun.Alacrity = set_combine(sets.midcast.Stun, {main="Atinian Staff", sub="Arbuda Grip", ammo="Incantor Stone",
			head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Gwati Earring",
			body="Hedera Cotehardie", hands="Gende. Gages +1", lring="Prolix Ring", rring="Sangoma Ring",
			back="Swith Cape +1", waist="Ninurta's Sash", legs="Artsieq Hose", feet="Peda. Loafers"})
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS = set_combine(sets.TP, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end