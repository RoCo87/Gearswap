-- Derion's COR Gear Sets
-- Created: 3/10/2014
-- Last Modified:7/21/2016
-- To Do List
--
--
--
--
--

if player.name == 'Derion' then
-- includes
	
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
				head="Meghanada Visor", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring=Aug.Darkring1.Derion, rring="",
				-- waist="Flume Belt",
				back="Repulse Mantle", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}

		sets.idle.MDT = { 
				head="Meghanada Visor", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring=Aug.Darkring1.Derion, rring="",
				-- waist="Flume Belt"
				back="Engulfer Cape",  legs="Meghanada Chausses", feet="Meghanada Jambeaux"}

		sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Shaded Spectacles", neck="Goldsmith's Torque",
				body="Goldsmith's Smock",
				waist="Goldsmith's Belt", feet="Hermes' Sandals"})
						
		sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", 
				feet="Hermes' Sandals"})

		-- Precast
		sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				-- neck="Voltsurge Torque", rear="Enchntr. Earring +1",
				head="Haruspex Hat", lear="Loquac. Earring",  
				-- body="Taeon Tabard", hands="Leyline Gloves", 
				rring="Prolix Ring",
				--back="Camulus's Mantle", legs="Taeon Tights", feet="Carmine Greaves"
				waist="Twilight Belt"})
		sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.ACC)
		sets.misc.flourish = {}
		
		-- JA
		sets.precast.JA["Wild Card"] = {feet="Lanun Bottes"}
		sets.precast.JA["Cutting Cards"] = {}

		sets.precast.JA["Fold"] = {hands="Lanun Gants"}
		sets.precast.JA["Random Deal"] = {body="Lanun Frac"}
		sets.precast.JA["Snake Eye"] = {legs="Lanun Culottes"}
		sets.precast.JA["Triple Shot"] = {body="Nvrch. Frac +2"}
		
		-- Corsair Rolls
		sets.precast.JA["Phantom Roll"] = set_combine(sets.idle.PDT,{
				head="Lanun Tricorne", 
				hands="Nvrch. Gants +2", lring="Barataria Ring", rring="Luzaf's Ring",
				--  legs="Desultor Tassets"
				back="Camulus's Mantle"})
		sets.precast.JA["Double-Up"] = set_combine(sets.precast.JA["Phantom Roll"])
		
		sets.precast.JA["Caster's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {legs="Nvrch. Culottes +2"})
		sets.precast.JA["Courser's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {feet="Navarch's Bottes +2"})
		sets.precast.JA["Blitzer's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {head="Navarch's Tricorne +2"})
		sets.precast.JA["Tactician's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {body="Navarch's Frac +2"})
		sets.precast.JA["Allies' Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {hands="Navarch's Gants +2"})
		
		-- Quick Draw 
		sets.precast.QD = {}
		--Light/Dark Shot
		sets.precast.QD.ACC = {
				--  neck="Stoicheion Medal",
				head="Meghanada Visor", lear="Lifestorm Earring", rear="Psystorm Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Perception Ring", rring="Sangoma Ring",
				-- waist="Aquiline Belt",
				back="Navarch's Mantle",  legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
		-- Elemental Shots
		sets.precast.QD.MAB = {
				--  neck="Stoicheion Medal",
				head="Meghanada Visor", lear="Hecate's Earring", rear="Friomisi earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Garuda Ring", rring="Garuda Ring",
				-- waist="Aquiline Belt",
				back="Toro Cape", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}

		sets.precast.JA["Barrage"] =  set_combine(sets.RA.Acc)

		-- Melee TP 
		sets.TP = { 
				head="Meghanada Visor", neck="Asperity Necklace", lear="Brual Earring", rear="Suppanomimu",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Anguinus Belt", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}

		-- Melee Accuracy TP
		sets.TP.Acc = {	
				head="Meghanada Visor", neck="Asperity Necklace", lear="Heartseeker Earring", rear="Zennaroi Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Cacoethic Ring", rring="Ramuh Ring",
				back="Atheling Mantle", waist="Anguinus Belt", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}

		-- RA Sets
		sets.precast.Snapshot = {ammo=TPBullet,
				head="Nvrch. Tricorne +2", 
				-- Lanun Gants 
				body="Skopos Jerkin", hands="Iuitl Wristbands +1",
				-- Camulus's Mantle legs="Chas. Culottes"
				back="Navarch's Mantle", waist="Impulse Belt", legs="Navarch's Culottes +2", feet="Meghanada Jambeaux"}
		
		-- Eminent Gun
		sets.RA = { ammo=TPBullet,
				--  lear="Clearview Earring", rear="Volley Earring",
				head="Meghanada Visor", neck="Peacock Amulet",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Cacoethic Ring",
				-- waist="Buccaneer's Belt",
				back="Camulus's Mantle", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
						
		sets.RA.Acc = { ammo=TPBullet,
				--  lear="Clearview Earring", rear="Volley Earring",
				head="Meghanada Visor", neck="Peacock Amulet",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Cacoethic Ring",
				-- waist="Buccaneer's Belt",
				back="Camulus's Mantle", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
				
		-- Armageddon 
		sets.RA.Armageddon = {ammo=TPBullet,
				--  lear="Clearview Earring", rear="Volley Earring",
				head="Meghanada Visor", neck="Peacock Amulet",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Cacoethic Ring",
				-- waist="Buccaneer's Belt",
				back="Camulus's Mantle", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
				
		sets.RA.Armageddon.Acc = { ammo=TPBullet,
				--  lear="Clearview Earring", rear="Volley Earring",
				head="Meghanada Visor", neck="Peacock Amulet",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Cacoethic Ring",
				-- waist="Buccaneer's Belt",
				back="Camulus's Mantle", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}

		-- Weaponskills
		-- Melee WS
		sets.precast.WS = {
				head="Meghanada Visor", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Wanion Belt", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
		-- Sword
		sets.precast.WS["Savage Blade"] = {
				head="Meghanada Visor", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Wanion Belt", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
		
		sets.precast.WS["Requiescat"] = {
				head="Meghanada Visor", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Wanion Belt", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
		-- Dagger
		sets.precast.WS["Exenterator"] = {
				head="Meghanada Visor", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Wanion Belt", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}

		-- RA WS
		sets.precast.RAWS = {
				--  lear="Bladeborn Earring", rear="Steelflash Earring",
				head="Meghanada Visor", neck="Peacock Amulet",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Garuda Ring", rring="Garuda Ring",
				-- back="Atheling Mantle", waist="Wanion Belt",
				legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
		sets.precast.RAWS['Wildfire'] = {
				--  neck="Stoicheion Medal",
				head="Meghanada Visor", lear="Hecate Earring", rear="Friomisi Earring",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Garuda Ring", rring="Garuda Ring",
				-- waist="Aquiline Belt",
				back="Toro Cape",  legs="Meghanada Chausses", feet="Meghanada Jambeaux"}

		sets.precast.RAWS['Last Stand'] = {
				-- lear="Clearview Earring", rear="Volley Earring",
				head="Meghanada Visor", neck="Light Gorget", 
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Garuda Ring", rring="Garuda Ring",
				-- back="Terebellum Mantle",
				waist="Light Belt", legs="Meghanada Chausses", feet="Meghanada Jambeaux"}
end