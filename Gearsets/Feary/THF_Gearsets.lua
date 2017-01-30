-- Feary's THF Gear_sets
-- Created: 4/5/2014
-- Last Modified: 02/03/2015
-- To Do List 
--
--
--
--

if player.name == 'Feary' then
	-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
		
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

	sets.misc.Town = set_combine(sets.idle.PDT, {
					feet="Fajin Boots"})
					
	sets.idle.Standard = set_combine(sets.idle.PDT, {
					main={name="Mandau",priority=2}, sub={name="Atoyac",priority=1},
					lear="Merman's Earring", rear="Etiolation Earring", 
					feet="Fajin Boots"})
					
	sets.lockstyle = set_combine(sets.misc.Town,{
			 feet="Fajin Boots"})

	sets.idle.Fishing = set_combine(sets.idle.Standard,{range="Lu Sh. F. Rod +1", ammo="Sinking Minnow",
				head="Tlahtlamah Glasses", neck="Fisher's Torque",
				body="Fisherman's Tunica", hands="Kachina Gloves", lring="Noddy Ring", rring="Puffin Ring",
				waist="Fisherman's Belt", legs="Fisherman's Hose", feet="Waders"})

	sets.idle.Wood = set_combine(sets.idle.Standard,{
				neck="Carpenter's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="Craftmaster's Ring",
				waist="Carpenter's Belt"})		
						
	-- Full Evasion
	sets.idle.Evasion = set_combine(sets.idle.PDT,{
				head="Meghanada Visor +1", neck="Torero Torque", lear="Musical Earring", rear="Novia Earring",
				body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
				back="Fravashi Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})

	sets.TH = {
				hands="Plun. Armlets +1",
				waist="Chaac Belt", feet="Skulk. Poulaines"}

	-- Precast	
	sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				--  neck="Voltsurge Torque",
				head="Haruspex Hat +1", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				--  hands="Thaumas Gloves",
				body="Taeon Tabard", lring="Prolix Ring",
				-- legs="Enif Cosciales"
				waist="Twilight Belt"})
	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

	sets.misc.Waltz = {rring="Asklepian Ring"}

	-- Steps = Full Acc
	sets.misc.Steps = {
				head="Meghanada Visor +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Patricius Ring", rring="Ramuh Ring +1",
				back="Ground. Mantle +1", waist="Dynamic Belt +1", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	-- Magic Acc
	sets.misc.flourish = {}

	-- Midcast
	sets.midcast.Fastcast = set_combine(sets.idle.PDT,{
				head="Haruspex Hat +1", neck="Voltsurge Torque",lear="Loquac. Earring", rear="Enchntr. Earring +1",
				body="Taeon Tabard", hands="Thaumas Gloves", lring="Prolix Ring",
				back="Fravashi Mantle", waist="Twilight Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
				
	-- TP Sets 
	sets.TP = { ranged="Raider's Bmrng.",
				head="Meghanada Visor +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
				back=Aug.Cape.THF.STP, waist="Patentia Sash", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	-- Accuracy TP Set - Goal 1200 - 100(Sublime Sushi) = 1100 Acc Currently @ 1048 + 36 = 1084  Need 16(weapon)
	sets.TP.Acc = {	ammo="Ginsen",
				head="Meghanada Visor +1", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
				body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
				back=Aug.Cape.THF.STP, waist="Patentia Sash", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	-- Alliance Buffed
	-- 11 DW needed 
	sets.TP.Buffed = { ammo="Ginsen",
				head="Meghanada Visor +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
				back=Aug.Cape.THF.STP, waist="Patentia Sash", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	-- Hybrid DT/Acc
	sets.TP.Hybrid = set_combine(sets.idle.PDT,{
				head="Meghanada Visor +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
				back=Aug.Cape.THF.STP, waist="Patentia Sash", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})

	-- RA Sets
	sets.precast.Snapshot = {hands="Iuitl Wristbands +1", legs="Nahtirah Trousers", feet="Meg. Jam. +1"}

	sets.RA = {}
					
	-- JA
	sets.precast.JA["Perfect Dodge"] = {hands="Plun. Armlets +1"}
	sets.precast.JA["Larceny"] = {}

	sets.precast.JA["Steal"] = {head="Plun. Bonnet",hands="Pillager's Armlets", legs="Pillager's Culottes", feet="Pillager's Poulaines"}
	sets.precast.JA["Mug"] = {head="Plun. Bonnet"}
	sets.precast.JA["Feint"] = {legs="Plun. Culottes"}
	sets.precast.JA["Flee"] = {feet="Pillager's Poulaines"}
	sets.precast.JA["Hide"] = {body="Pillager's Vest +1"}
	sets.precast.JA["Ambush"] = {body="Plunderer's Vest"}
	sets.precast.JA["Assassin's Charge"] = {feet="Plunderer's Poulaines"}
	sets.precast.JA["Accomplice"] = {head="Skulker's Bonnet"}
	sets.precast.JA["Collaborator"] = {head="Skulker's Bonnet"}
	sets.precast.JA["Conspirator"] = {body="Raider's Vest +2"}
	sets.precast.JA["Bully"] = {}
	sets.precast.JA["Despoil"] = {legs="Raider's Culottes +2", feet="Skulker's Poulaines"}

	-- Solo Sneak Attack 
	sets.precast.JA["Sneak Attack"] = {
					head="Meghanada Visor +1", neck="Love Torque", lear="Brutal Earring", rear="Pixie Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Ramuh Ring +1", rring="Epona's Ring",
					back=Aug.Cape.THF.STP, waist="Windbuffet Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
					
	-- Solo Trick Attack
	sets.precast.JA["Trick Attack"] = {
					head="Pill. Bonnet +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Vulcan's Pearl",
					body="Pillager's Vest +1", hands="Taeon Gloves", lring="Garuda Ring +1", rring="Garuda Ring +1",
					back="Vespid Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"}

	-- Weaponskills
	sets.precast.WS = { 
					head="Meghanada Visor +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Vespid Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
		
	sets.precast.WS.SA = set_combine(sets.precast.WS,{
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back=Aug.Cape.THF.STP, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})

	sets.precast.WS.TA = set_combine(sets.precast.WS,{
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Vespid Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
		
	sets.precast.WS.Acc = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back=Aug.Cape.THF.STP, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	sets.precast.WS.Acc.SA = {}

	sets.precast.WS.Acc.TA = {}

	-- Mercy Stroke
	sets.precast.WS["Mercy Stroke"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
					back="Vespid Mantle", waist="Prosilio Belt", legs="Meg. Chausses +1", feet="Meg. Jam +1"}

	sets.precast.WS.SA["Mercy Stroke"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
					back="Vespid Mantle", waist="Prosilio Belt", legs="Meg. Chausses +1", feet="Meg. Jam +1"}

	sets.precast.WS.TA["Mercy Stroke"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
					back="Vespid Mantle", waist="Prosilio Belt", legs="Meg. Chausses +1", feet="Meg. Jam +1"}

	-- Rudra's Storm
	-- Solo
	sets.precast.WS["Rudra's Storm"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	sets.precast.WS.SA["Rudra's Storm"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	sets.precast.WS.TA["Rudra's Storm"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	sets.precast.WS.Acc["Rudra's Storm"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	sets.precast.WS.Acc.SA["Rudra's Storm"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	sets.precast.WS.Acc.TA["Rudra's Storm"] = {
					head="Meghanada Visor +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Ramuh Ring +1",
					back="Kayapa Cape", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}

	-- Exenterator
	sets.precast.WS["Exenterator"] = {
					head="Meghanada Visor +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
					back="Vespid Mantle", waist="Prosilio Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	sets.precast.WS.Acc["Exenterator"] = {
					head="Meghanada Visor +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Moonshade Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
					back="Vespid Mantle", waist="Prosilio Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	-- Evisceration
	sets.precast.WS["Evisceration"] = {
					head="Meghanada Visor +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
					back="Atheling Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	sets.precast.WS.Acc["Evisceration"] = {
					head="Meghanada Visor +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
					back="Atheling Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	-- Dancing Edge
	sets.precast.WS["Dancing Edge"] = {
					head="Meghanada Visor +1", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
					body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
					back="Atheling Mantle", waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"}
	
	-- Aeolian Edge
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
			head="Meghanada Visor +1", neck="Fotia Gorget", lear="Crematio Earring", rear="Friomisi Earring",
			--  Shiva Ring +1 Shiva Ring +1 
			body="Meghanada Cuirie", hands="Meg. Gloves +1", lring="Shiva Ring", rring="Shiva Ring",
			back=Aug.Cape.THF.WS, waist="Wanion Belt", legs="Meg. Chausses +1", feet="Meg. Jam. +1"})
	end