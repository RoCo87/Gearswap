-- Derion's THF Gear_sets
-- Created: 4/5/2014
-- Last Modified: 7/14/2016
-- To Do List 
--
--
--
--

if player.name == 'Derion' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(5,1)
			elseif player.sub_job == 'WAR' then
				set_macro_page(5,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(5,3)
			elseif player.sub_job == 'DRK' then 
				set_macro_page(5,4)
			end
		else
			set_macro_page(5,1)
		end
		
	-- Auto Sets
	-- Standard/idle
	sets.idle.PDT = { 
			head="Iuitl Headgear +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
			body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring=Aug.Darkring1.Derion, rring="",
			-- Flume Belt
			back="Repulse Mantle", waist="", legs="Meghanada Chausses", feet="Meg. Jambeaux"}

	sets.idle.MDT = { 
			head="Iuitl Headgear +1", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
			body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring=Aug.Darkring1.Derion, rring="Shadow Ring",
			back="Engulfer Cape", waist="", legs="Iuitl Tights +1", feet="Meg. Jambeaux"}

	sets.misc.Town = set_combine(sets.idle.PDT, { 
					feet="Fajin Boots"})
					
	sets.idle.Standard = set_combine(sets.idle.PDT, {
					head="Shaded Spectacles", neck="Goldsmith's Torque", lear="Merman's Earring", rear="Merman's Earring", 
					body="Goldsmith's Smock", lring="Craftkeeper's Ring", rring="Craftmaster's Ring",
					feet="Fajin Boots"})

	sets.lockstyle = set_combine(sets.misc.Town,sets.idle.Standard,{})

	sets.idle.Gold = set_combine(sets.idle.Standard, {
					head="Shaded Spectacles", neck="Goldsmith's Torque",
					body="Goldsmith's Smock", lring="Craftkeeper's Ring", rring="Craftmaster's Ring",
					})
					
	-- Full Evasion
	sets.idle.Evasion = set_combine(sets.idle.PDT,{
				head="Iuitl Headgear +1", neck="Torero Torque", lear="Musical Earring", rear="Novia Earring",
				body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
				back="Boxer's Mantle", waist="Twilight Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"})

	sets.TH = {
				hands="Plun. Armlets",
				feet="Skulk. Poulaines"}

	-- Precast	
	sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				-- neck=Voltsurge Torque rear="Enchntr. Earring +1
				head="Haruspex Hat", lear="Loquac. Earring", 
				-- body="Taeon Tabard hands="Thaumas Gloves",
				lring="Prolix Ring",
				-- legs="Enif Cosciales"
				back="Repulse Mantle", waist="Twilight Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"})

	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

	sets.misc.Waltz = {rring="Asklepian Ring"}
	sets.misc.Steps = set_combine({head="Iuitl Headgear +1", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
				body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Hurch'lan Sash", legs="Iuitl Tights +1", feet="Meg. Jambeaux"})
	sets.misc.flourish = {}
	
	-- Midcast
	sets.midcast.Fastcast = set_combine(sets.idle.PDT,{
				-- neck=Voltsurge Torque rear="Enchntr Earring +1
				head="Haruspex Hat", lear="Loquac. Earring", 
				-- body="Taeon Tabard hands="Thaumas Gloves",
				lring="Prolix Ring",
				-- legs="Enif Cosciales"
				back="Repulse Mantle", waist="Twilight Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"})

	-- TP Sets 
	sets.TP = { ranged="Raider's Bmrng.",
				head="Meghanada Visor", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses", feet="Meg. Jambeaux"}

	-- Accuracy TP Set
	sets.TP.Acc = {	ranged="Raider's Bmrng.",
				head="Meghanada Visor", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses", feet="Meg. Jambeaux"}

	-- Alliance Buffed
	sets.TP.Buffed = {ranged="Raider's Bmrng.",
				head="Meghanada Visor", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Epona's Ring",
				back="Atheling Mantle", waist="Twilight Belt", legs="Meg. Chausses", feet="Meg. Jambeaux"}

	-- Hybrid DT/Acc
	sets.TP.Hybrid = set_combine(sets.idle.PDT,{ranged="Raider's Bmrng.",
				head="Iuitl Headgear +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",	
				back="Atheling Mantle", waist="Twilight Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"})

	-- RA Sets
	sets.precast.Snapshot = {hands="Iuitl Wristbands +1", legs="Nahtirah Trousers", feet="Meg. Jambeaux"}

	sets.RA = {}
					
	-- JA
	sets.precast.JA["Perfect Dodge"] = {hands="Plunderer's Armlets"}
	sets.precast.JA["Larceny"] = {}

	sets.precast.JA["Steal"] = {head="Plun. Bonnet",hands="Pillager's Armlets", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
	sets.precast.JA["Mug"] = {head="Plun. Bonnet"}
	sets.precast.JA["Feint"] = {legs="Plun. Culottes"}
	sets.precast.JA["Flee"] = {feet="Pillager's Poulaines"}
	sets.precast.JA["Hide"] = {body="Pillager's Vest"}
	sets.precast.JA["Ambush"] = {body="Plunderer's Vest"}
	sets.precast.JA["Assassin's Charge"] = {feet="Plunderer's Poulaines"}
	sets.precast.JA["Accomplice"] = {head="Raider's Bonnet +2"}
	sets.precast.JA["Collaborator"] = {head="Raider's Bonnet +2"}
	sets.precast.JA["Conspirator"] = {body="Raider's Vest +2"}
	sets.precast.JA["Bully"] = {}
	sets.precast.JA["Despoil"] = {legs="Raider's Culottes +2",feet="Skulk. Poulaines"}

	-- Solo Sneak Attack 
	sets.precast.JA["Sneak Attack"] = {
			head="Meghanada Visor", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
			body="Meghanada Cuirie", hands="Meghanada Gloves", lring="Rajas Ring", rring="Ramuh Ring",
			back="Gounded Mantle", waist="Wanion Belt", legs="Meg. Chausses", feet="Meg. Jambeaux"}
	-- Solo Trick Attack
	sets.precast.JA["Trick Attack"] = {
			head="Iuitl Headgear +1", neck="Houyi's Gorget", lear="Dudgeon Earring", rear="Bladeborn earring",
			body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Stormsoul Ring", rring="Garuda Ring",
			back="Vespid Mantle", waist="Twilight Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"}

	-- Weaponskills
	sets.precast.WS = {
			head="Iuitl Headgear +1", neck="Agasaya's Collar", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Espial Gambison", hands="Espial Bracers", lring="Ifrit Ring", rring="Ifrit Ring",
			back="Atheling Mantle", waist="Wanion Belt", legs="Espial Hose", feet="Espial Socks"}
	sets.precast.WS.SA = {
			head="Iuitl Headgear +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Wanion Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"}
	sets.precast.WS.TA = {
			head="Iuitl Headgear +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Wanion Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"}
	
	sets.precast.WS.Acc = {
					head="Pill. Bonnet +1", neck="Iqabi Necklace", lear="Brutal Earring", rear="Moonshade Earring",
					body="Pillager's Vest +1", hands="Taeon Gloves", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"}

	sets.precast.WS.Acc.SA = {}

	sets.precast.WS.Acc.TA = {}
	
	-- Mercy Stroke
	sets.precast.WS["Mercy Stroke"] = {
			head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Pyrosoul Ring",
			back="Vespid Mantle", waist="Prosilio Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}

	sets.precast.WS.SA["Mercy Stroke"] = {
			head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Pillager's Vest", hands="Raid. Armlets +2", lring="Rajas Ring", rring="Pyrosoul Ring",
			back="Vespid Mantle", waist="Prosilio Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}

	sets.precast.WS.TA["Mercy Stroke"] = {
			head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Pyrosoul Ring",
			back="Vespid Mantle", waist="Prosilio Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
	
	-- Rudra's Storm
	sets.precast.WS["Rudra's Storm"] = {
			head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Ramuh Ring",
			back="Vespid Mantle", waist="Prosilio Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
	sets.precast.WS.SA["Rudra's Storm"] = {
			head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Ramuh Ring",
			back="Vespid Mantle", waist="Prosilio Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
	sets.precast.WS.TA["Rudra's Storm"] = {
			head="Pillager's Bonnet", neck="Shadow Gorget", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Pillager's Vest", hands="Pillager's Armlets", lring="Rajas Ring", rring="Ramuh Ring",
			back="Vespid Mantle", waist="Prosilio Belt", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
	-- Acc 	
	sets.precast.WS.Acc["Rudra's Storm"] = {
					head="Pill. Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Pillager's Culottes", feet="Taeon Boots"}
	sets.precast.WS.Acc.SA["Rudra's Storm"] = {
					head="Pill. Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Pillager's Culottes", feet="Taeon Boots"}
	sets.precast.WS.Acc.TA["Rudra's Storm"] = {
					head="Pill. Bonnet +1", neck="Fotia Gorget", lear="Kuwunga Earring", rear="Moonshade Earring",
					body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Pillager's Culottes", feet="Taeon Boots"}

	-- Exenterator
	sets.precast.WS["Exenterator"] = {
			head="Whirlpool Mask", neck="Justiciar's Torque", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Pillager's Vest", hands="Pillager's Armlets", lring="Stormsoul Ring", rring="Epona's Ring",
			back="Vespid Mantle", waist="Prosilio Belt", legs="Nahtirah Trousers", feet="Pillager's Poulaines"}

	sets.precast.WS.Acc["Exenterator"] = {
			head="Whirlpool Mask", neck="Justiciar's Torque", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Iuitl Vest +1", hands="Pillager's Armlets", lring="Stormsoul Ring", rring="Epona's Ring",
			back="Vespid Mantle", waist="Prosilio Belt", legs="Nahtirah Trousers", feet="Pillager's Poulaines"}

	-- Evisceration
	sets.precast.WS["Evisceration"] = {
			head="Iuitl Headgear +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Wanion Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"}

	sets.precast.WS.Acc["Evisceration"] = {
			head="Iuitl Headgear +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
			body="Iuitl Vest +1", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Wanion Belt", legs="Iuitl Tights +1", feet="Meg. Jambeaux"}

	-- Dancing Edge
	sets.precast.WS["Dancing Edge"] = {
					head="Skulker's Bonnet", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
					body="Pillager's Vest +1", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
					back="Atheling Mantle", waist="Wanion Belt", legs="Pillager's Culottes", feet="Taeon Boots"}
	
	-- Aeolian Edge
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
			-- neck="Fotia Gorget", lear="Crematio Earring",
			head="Meghanada Visor",  lear="Hecate Earring", rear="Friomisi Earring",
			--  Shiva Ring +1 Shiva Ring +1 
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Shiva Ring", rring="Shiva Ring",
			-- back=Aug.Cape.THF.WS 
			waist="Wanion Belt", legs="Meghanada Chausses", feet="Meghanada Jambeaux"})
end