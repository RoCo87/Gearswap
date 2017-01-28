-- Feary's COR Gear_sets
-- Created: 03/10/2014
-- Last Modified: 7/25/2016
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
				set_macro_page(1,10)
			elseif player.sub_job == 'NIN' then
				set_macro_page(2,10)
			elseif player.sub_job == 'RNG' then
				set_macro_page(3,10)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(4,10)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(6,10)
			elseif player.sub_job == 'BRD' then 
				set_macro_page(5,10)	
			end
		else
			set_macro_page(1,10)
		end
		
-- Auto Sets
-- Standard/idle
	sets.idle.PDT = { 
			head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
			back="Repulse Mantle", waist="Flume Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	sets.idle.MDT = { 
			head="Meghanada Visor +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
			back="Engulfer Cape +1", waist="Flume Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
			
	sets.idle.Standard = set_combine(sets.idle.PDT, {
			legs="Carmine Cuisses +1"})
					
	sets.misc.Town = set_combine(sets.idle.PDT, {
			head="Lanun Tricorne",
			body="Lak. Frac", hands="Lanun Gants",
			legs="Carmine Cuisses +1"})
	
	-- Precast ..
	sets.precast.Fastcast = set_combine(sets.idle.PDT, {
			-- neck="Voltsurge Torque",
			head="Carmine Mask +1",  lear="Loquac. Earring", rear="Enchntr. Earring +1", 
			--  hands="Leyline Gloves", 
			body="Taeon Tabard", rring="Prolix Ring",
			--back="Camulus's Mantle", legs="Taeon Tights", 
			waist="Twilight Belt", feet="Carmine Greaves +1"})

	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})
							
	sets.misc.Waltz = {
			rring="Asklepian Ring",
			legs="Dashing Subligar"}
	sets.misc.Steps = {}
	sets.misc.flourish = {}

	-- JA
	sets.precast.JA["Wild Card"] = {feet="Lanun Bottes"}
	sets.precast.JA["Cutting Cards"] = {}

	sets.precast.JA["Fold"] = {hands="Lanun Gants"}
	sets.precast.JA["Random Deal"] = {body="Lanun Frac"}
	sets.precast.JA["Snake Eye"] = {legs="Lanun Culottes"}
	sets.precast.JA["Triple Shot"] = {
			body="Chasseur's Frac",
			back="Camulus's Mantle"}
	

	-- Corsair Rolls
	sets.precast.JA["Phantom Roll"] = set_combine(sets.idle.PDT,{
			head="Lanun Tricorne", 
			hands="Chasseur's Gants", lring="Barataria Ring", rring="Luzaf's Ring",
			back="Camulus's Mantle", legs="Desultor Tassets"})
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
			-- Camulus's Mantle        Belt     Mummu Kecks +1         Adhe. Gamashes +1 
			back="Gunslinger's Cape", waist="Salire Belt", legs="Meg. Chausses +1", feet="Adhemar Gamashes"}
		
	--Light/Dark Shot
	sets.precast.QD.ACC = {
			-- Sanctity Necklace 
			head="Meghanada Visor +1", neck="Iqabi Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
			-- Mirke Wadecors  Arvina Ringlet +1
			body="Lanun Frac", hands="Chasseur's Gants", lring="Stikini Ring", rring="Stikini Ring",
			-- Eschan Stone Mummu Kecks +1
			back="Gunslinger's Cape", waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Chasseur's Bottes"}
				
	-- RA Sets
	sets.precast.Snapshot = {ammo=TPBullet,
			-- Taeon Chapeau
			head="Chass. Tricorne", 
			-- Carmine Fin. Gauntlets +1
			body="Skopos Jerkin", hands="Lanun Gants",
			-- Aug.Cape.COR.Snapshot Chas. Culottes +1 Taeon Boots 
			back="Navarch's Mantle", waist="Impulse Belt", legs="Nahtirah Trousers", feet="Meg. Jam. +1"}
	
	-- Eminent Gun
	sets.RA = { ammo=TPBullet,
			head="Meghanada Visor +1", neck="Gaudryi Necklace", lear="Clearview Earring", rear="Enervating Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Hajduk Ring", rring="Hajduk Ring",
			-- Aug.Cape.COR.TP
			back="Gunslinger's Cape", waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
					
	sets.RA.Acc = { ammo=TPBullet,
			head="Meghanada Visor +1", neck="Iqabi Necklace", lear="Clearview Earring", rear="Enervating Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Hajduk Ring", rring="Hajduk Ring",
			-- Aug.Cape.COR.TP
			back="Gunslinger's Cape", waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
			
	-- Armageddon 
	sets.RA.Armageddon = { ammo=TPBullet,
			head="Meghanada Visor +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Enervating Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Hajduk Ring", rring="Hajduk Ring",
			-- Aug.Cape.COR.TP
			back="Gunslinger's Cape", waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
			
	sets.RA.Armageddon.Acc = { ammo=TPBullet,
			head="Meghanada Visor +1", neck="Iqabi Necklace", lear="Clearview Earring", rear="Enervating Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Hajduk Ring", rring="Hajduk Ring",
			-- Aug.Cape.COR.TP
			back="Gunslinger's Cape", waist="Kwahu Kachina Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
			
	--Barrage
	sets.precast.JA["Barrage"] =  set_combine(sets.RA.Acc)

	-- Melee TP 
	sets.TP = { 
			-- Adhe. Bonnet +1 Defiant Collar 
			head="Carmine Mask +1", neck="Iqabi Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
			-- Adhemar Jacket +1 Adhemar Wrist. +1 lring="Petrov Ring"
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
			-- Windbuffet Belt +1 Adhe. Gamashes +1
			back="Camulus's Mantle", waist="Windbuffet Belt", legs="Samnuha Tights", feet="Meg. Jam. +1"}

	-- Melee Accuracy TP
	sets.TP.Acc = {	
			-- Adhe. Bonnet +1 Defiant Collar Telos Earring Zennaroi Earring
			head="Carmine Mask +1", neck="Iqabi Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
			-- Adhemar Jacket +1 Adhemar Wrist. +1 lring="Petrov Ring" Cacoethic Ring +1
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
			-- Camulus's Mantle Adhe. Gamashes +1
			back="Ground. Mantle +1", waist="Anguinus Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	-- Weaponskills
	-- Melee WS
	sets.precast.WS = {
			head="Meghanada Visor +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
			back=Aug.Cape.COR.Melee.WS, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	sets.precast.WS.Acc = {
			head="Meghanada Visor +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
			back=Aug.Cape.COR.Melee.WS, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	-- Sword
	sets.precast.WS["Savage Blade"] = {
			head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
			-- Aug.Cape.COR.Melee.WS
			back="Buquwik Cape", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	sets.precast.WS["Requiescat"] = {
			head="Meghanada Visor +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
			-- Aug.Cape.COR.Melee.WS
			back="Vespid Mantle", waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
					
	-- Dagger
	sets.precast.WS["Exenterator"] = {
			head="Meghanada Visor +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
			-- Aug.Cape.COR.Melee.WS
			back="Atheling Mantle", waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	-- RA WS
	sets.precast.RAWS = {
			--  or Ishvara Earring"
			head="Meghanada Visor +1", neck="Fotia Gorget", lear="Enervating Earring", rear="Moonshade Earring",
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
			-- Aug.Cape.COR.WS
			back="Gunslinger's Cape", waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	-- Physical
	sets.precast.RAWS['Last Stand'] = set_combine(sets.precast.RAWS,{
			-- Ishvara Earring
			head="Meghanada Visor +1", neck="Fotia Gorget", lear="Enervating Earring", rear="Moonshade Earring",
			-- Laksa. Frac +3 
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
			-- Aug.Cape.COR.WS
			back="Gunslinger's Cape", waist="Fotia Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
	
	-- Magical
	sets.precast.RAWS['Wildfire'] = set_combine(sets.precast.RAWS,{
			-- Taeon Chapeau Baetyl Pendant
			head="Chass. Tricorne", neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Earring",
			-- Laksa. Frac +3/Carmine Mail +1 Arvina Ringlet +1
			body="Lanun Frac", hands="Meg. Gloves +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
			-- Aug.Cape.COR.WS Eschan Stone Adhe. Gamashes +1
			back="Gunslinger's Cape", waist="Salire Belt", legs="Lak. Trews", feet="Lanun Boots"})

	sets.precast.RAWS['Leaden Salute'] = set_combine(sets.precast.RAWS,{
			-- Pixie Earring +1 Baetyl Pendant
			head="Lanun Tricorne", neck="Stoicheion Medal", lear="Friomisi Earring", rear="Moonshade Earring",
			-- Samnuha Coat Carmine Mail +1  Carmine Fin. Gauntlets +1 Arvina Ringlet +1
			body="Lanun Frac", hands="Meg. Gloves +1", lring="Shiva Ring", rring="Archon Ring",
			-- Aug.Cape.COR.WS
			back="Gunslinger's Cape", waist="Salire Belt", legs="Lak. Trews", feet="Lanun Boots"})

end