-- Feary's COR Gear_sets
-- Created: 03/10/2014
-- Last Modified: 9/4/2014
--
--

if player.name == 'Feary' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'DNC' then
				set_macro_page(10,1)
			elseif player.sub_job == 'NIN' then
				set_macro_page(10,2)
			elseif player.sub_job == 'RNG' then
				set_macro_page(10,3)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(10,4)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(10,6)
			elseif player.sub_job == 'BRD' then 
				set_macro_page(10,5)	
			end
		else
			set_macro_page(10,1)
		end
		
-- Auto Sets
-- Standard/idle
	sets.idle.PDT = { 
			head="Meghanada Visor", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
			back="Repulse Mantle", waist="Flume Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}

	sets.idle.MDT = { 
			head="Meghanada Visor", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
			back="Engulfer Cape +1", waist="Flume Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}

	sets.misc.Town = set_combine(sets.idle.PDT, {
			head="Lanun Tricorne",
			body="Lak. Frac", hands="Lanun Gants",
			legs="Lanun Culottes", feet="Hermes' Sandals"})
					
	sets.idle.Standard = set_combine(sets.idle.PDT, {
			feet="Hermes' Sandals"})
					
	-- Precast 
	sets.precast.Fastcast = set_combine(sets.idle.PDT, {
			-- neck="Voltsurge Torque",
			head="Carmine Mask +1",  lear="Loquac. Earring", rear="Enchntr. Earring +1", 
			--  hands="Leyline Gloves", 
			body="Taeon Tabard", rring="Prolix Ring",
			--back="Camulus's Mantle", legs="Taeon Tights", 
			waist="Twilight Belt", feet="Carmine Greaves +1"})

	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})
							
	sets.misc.Waltz = {}
	sets.misc.Steps = {}
	sets.misc.flourish = {}

	-- JA
	sets.precast.JA["Wild Card"] = {feet="Lanun Bottes"}
	sets.precast.JA["Cutting Cards"] = {}

	sets.precast.JA["Fold"] = {hands="Lanun Gants"}
	sets.precast.JA["Random Deal"] = {body="Lanun Frac"}
	sets.precast.JA["Snake Eye"] = {legs="Lanun Culottes"}
	sets.precast.JA["Triple Shot"] = {body="Chasseur's Frac"}
	

	-- Corsair Rolls
	sets.precast.JA["Phantom Roll"] = set_combine(sets.idle.PDT,{
			head="Lanun Tricorne", 
			hands="Chasseur's Gants", lring="Barataria Ring", rring="Luzaf's Ring",
			back="Camulus Mantle", legs="Desultor Tassets"})
	sets.precast.JA["Double-Up"] = set_combine(sets.precast.JA["Phantom Roll"])
	
	sets.precast.JA["Caster's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {legs="Chasseur's Culottes"})
	sets.precast.JA["Courser's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {feet="Chasseur's Bottes"})
	sets.precast.JA["Blitzer's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {head="Chass. Tricorne"})
	sets.precast.JA["Tactician's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {body="Chasseur's Frac"})
	sets.precast.JA["Allies' Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {hands="Chasseur's Gants"})

	-- Quick Draw 
	sets.precast.QD = {}
	
	-- Elemental Shots
	sets.precast.QD.MAB = {
			-- Baetyl Pendant
			head="Blood Mask", neck="Stoicheion Medal", lear="Friomisi Earring", rear="Crematio Earring",
			--  Samnuha Coat Leyline Gloves Fenrir Ring +1 Fenrir Ring +1
			body="Lanun Frac", hands="Taeon Gloves", lring="Shiva Ring", rring="Shiva Ring",
			-- Adhe. Gamashes +1 
			back="Gunslinger's Cape", waist="Hachirin-no-Obi", legs="Iuitl Tights +1", feet="Lanun Boots"}
		
	--Light/Dark Shot
	sets.precast.QD.ACC = {
			-- Waylayer's Scarf
			head="Meghanada Visor", neck="Iqabi Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
			-- Mirke Wadecors  Longshot Ring  Arvina Ringlet +1
			body="Lanun Frac", hands="Chasseur Gants", lring="Perception Ring", rring="Sangoma Ring",
			-- Eschan Stone 
			back="Gunslinger's Cape", waist="Aquiline Belt", legs="Meghanada Chausses", feet="Chasseur's Boots"}
				
	-- RA Sets
	sets.precast.Snapshot = {ammo=TPBullet,
			-- Aurora Beret +1
			head="Chass. Tricorne", 
			Body="Skopos Jerkin", hands="Lanun Gants",
			-- Chas. Culottes +1
			back="Navarch's Mantle", waist="Impulse Belt", legs="Nahtirah Trousers", feet="Meg. Jam. +1"}
	
	-- Eminent Gun
	sets.RA = { ammo=TPBullet,
			head="Chass. Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Enervating Earring",
			body="Chasseur's Frac", hands="Chasseur's Gants", lring="Hajduk Ring", rring="Hajduk Ring",
			back="Gunslinger's Cape", waist="Buccaneer's Belt", legs="Feast Hose", feet="Meg. Jam +1"}
					
	sets.RA.Acc = { ammo=TPBullet,
			head="Chass. Tricorne", neck="Iqabi Necklace", lear="Clearview Earring", rear="Enervating Earring",
			body="Chasseur's Frac", hands="Lanun Gants", lring="Hajduk Ring", rring="Hajduk Ring",
			back="Kayapa Cape", waist="Buccaneer's Belt", legs="Feast Hose", feet="Taeon Boots"}

	-- Armageddon 
	sets.RA.Armageddon = { ammo=TPBullet,
			head="Lanun Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Enervating Earring",
			body="Lanun Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
			back="Terebellum Mantle", waist="Buccaneer's Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

	sets.RA.Armageddon.Acc = { ammo=TPBullet,
			head="Lanun Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Enervating Earring",
			Body="Lanun Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
			back="Kayapa Cape", waist="Buccaneer's Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

	--Barrage
	sets.precast.JA["Barrage"] =  set_combine(sets.RA.Acc)

	-- Melee TP 
	sets.TP = { 
			-- Adhe. Bonnet +1 Defiant Collar 
			head="Carmine Mask +1", neck="Iqabi Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
			-- Adhemar Jacket +1 Adhemar Wrist. +1 lring="Petrov Ring"
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
			-- Bleating Mantle Windbuffet Belt +1 Adhe. Gamashes +1
			back="Atheling Mantle", waist="Windbuffet Belt", legs="Samnuha Pants", feet="Meg. Jam. +1"}

	-- Melee Accuracy TP
	sets.TP.Acc = {	
			-- Adhe. Bonnet +1 Defiant Collar Telos Earring Zennaroi Earring
			head="Carmine Mask +1", neck="Iqabi Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
			-- Adhemar Jacket +1 Adhemar Wrist. +1 lring="Petrov Ring" Cacoethic Ring +1
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			-- Letalis Mantle  Adhe. Gamashes +1
			back="Atheling Mantle", waist="Anguinus Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}

	-- Weaponskills
	-- Melee WS
	sets.precast.WS = {
			head="Meghanada Visor", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Wanion Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}
	
	sets.precast.WS.Acc = {}
	
	-- Sword
	sets.precast.WS["Savage Blade"] = {
			head="Meghanada Visor", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			back="Buquwik Cape", waist="Wanion Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}

	sets.precast.WS["Requiescat"] = {
			head="Meghanada Visor", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Meghanada Tabard", hands="Meg. Gloves +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
			back="Vespid Mantle", waist="Fotia Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}
					
	-- Dagger
	sets.precast.WS["Exenterator"] = {
			head="Meghanada Visor", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Meghanada Tabard", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Fotia Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}
	
	-- RA WS
	sets.precast.RAWS = {
			-- rear="Moonshade Earring or Ishvara Earring"
			head="Meghanada Visor", neck="Fotia Gorget", lear="Enervating Earring", rear="Clearview Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
			back="Gunslinger's Cape", waist="Fotia Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}
	
	-- Physical
	sets.precast.RAWS['Last Stand'] = set_combine(sets.precast.RAWS,{
			-- Ishvara Earring
			head="Meghanada Visor", neck="Fotia Gorget", lear="Enervating Earring", rear="Moonshade Earring",
			-- Carmine Fin. Ga. +1
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
			-- Camulus's Mantle
			back="Gunslinger's Cape", waist="Fotia Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"})
	
	-- Magical
	sets.precast.RAWS['Wildfire'] = set_combine(sets.precast.RAWS,{
			-- Taeon Chapeau Baetyl Pendant
			head="Chasseur Tricorne", neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Earring",
			-- Samnuha Coat/Carmine Mail +1 Carmine Fin. Gauntlets +1 Arvina Ringlet +1
			body="Lanun Frac", hands="Meg. Gloves +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
			-- Camulus's Mantle Eschan Stone Adhe. Gamashes +1
			back="Gunslinger's Cape", waist="Aquiline Belt", legs="Lak. Trews", feet="Lanun Boots"})

	sets.precast.RAWS['Leaden Salute'] = set_combine(sets.precast.RAWS,{
			-- Pixie Earring +1 Baetyl Pendant
			head="Lanun Tricorne", neck="Stoicheion Medal", lear="Friomisi Earring", rear="Moonshade Earring",
			-- Samnuha Coat Carmine Mail +1  Carmine Fin. Gauntlets +1 Arvina Ringlet +1
			body="Lanun Frac", hands="Meg. Gloves +1", lring="Shiva Ring", rring="Archon Ring",
			back="Gunslinger's Cape", waist="Aquiline Belt", legs="Lak. Trews", feet="Lanun Boots"})
end