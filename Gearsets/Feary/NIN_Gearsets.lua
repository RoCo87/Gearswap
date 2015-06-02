-- NIN Gear_sets
-- Created: 7/13/2014
-- Last Modified: 7/13/2014
-- To Do List 
--
--
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
			if player.sub_job == 'WAR' then
				set_macro_page(20,1)
			elseif player.sub_job == 'DNC' then
				set_macro_page(20,2)
			elseif player.sub_job == 'DRK' then
				set_macro_page(20,4)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(20,3)
			end
		else
			set_macro_page(20,1)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Felistris Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Otronif Harness", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Otronif Brais +1", feet="Otronif Boots +1"}

sets.idle.MDT = { 
				head="Felistris Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Otronif Harness", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Otronif Brais +1", feet="Otronif Boots +1"}

sets.misc.Town = set_combine(sets.idle.PDT, { 
				head="Felistris Mask",
				feet="Danzo Sune-Ate"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Danzo Sune-Ate"})
-- Full Evasion
sets.idle.Evasion = set_combine(sets.idle.PDT,{
			head="Felistris Mask", neck="Torero Torque", lear="Musical Earring", rear="Novia Earring",
             body="Otronif Harness", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Fravashi Mantle", waist="Twilight Belt", legs="Otronif Brais +1",feet="Otronif Boots +1"})

sets.Enmity = {
		neck="Atzintli Necklace",
		back="Fravashi Mantle"}

-- Precast	
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
			head="Haruspex Hat +1", lear="Loquac. Earring", rear="Enchntr. Earring +1",
			hands="Thaumas Gloves", rring="Prolix Ring"})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.precast.Recast = set_combine(sets.idle.PDT,{
			head="Haruspex Hat +1", rear="Loquac. Earring",
			hands="Thaumas Gloves", rring="Prolix Ring",
			})
-- Midcast
sets.midcast.Wheel = {
			head="Mochi. Hatsuburi", neck="Stoicheion Medal", lear="Novio Earring", rear="Friomisi Earring",
			body="Ninja Chainmail", hands="Hachiya Tekko", lring="Shiva Ring", rring="Shiva Ring",
			back="Toro Cape", waist="Wanion Belt", legs="Hachiya Hakama", feet="Hachiya Kyahan"}
sets.midcast.Skill = {
			head="Hachiya Hatsuburi", 
			feet="Mochizuki Kyahan"}
sets.midcast.Enfeeb = set_combine(sets.midcast.Skill,{
			lear="Enchntr. Earring +1", rear="Gwati Earring",
			lring="Sangoma Ring", rring="Perception Ring"})
sets.midcast.Utsusemi = set_combine(sets.precast.Utsusemi,{
			waist="Twilight Belt", feet="Hattori Kyahan"})
			
-- TP Sets 
sets.TP = { ammo="Ginsen",
			head="Iga Zukin +2", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Mochi. Chainmail", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Patentia Sash", legs="Mochizuki Hakama", feet="Taeon Boots"}

-- Accuracy TP Set
sets.TP.Acc = {ammo="Ginsen",
			head="Felistris Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Thaumas Coat", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Taeon Boots"}

-- Alliance Buffed
sets.TP.Buffed = {ammo="Ginsen",
			head="Felistris Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Thaumas Coat", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Taeon Boots"}

-- Hybrid Evasion
sets.TP.Hybrid = set_combine(sets.idle.PDT,{
			head="Felistris Mask", neck="Asperity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
            body="Otronif Harness", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Otronif Boots +1"})

-- RA Sets
sets.precast.Snapshot = {legs="Nahtirah Trousers"}

sets.RA = {}
				
-- JA
sets.precast.JA["Mijin Gakure"] = {legs="Mochizuki Hakama"}
sets.precast.JA["Mikage"] = {}

sets.precast.JA["Sange"] = {body="Mochi. Chainmail"}
sets.precast.JA["Yonin"] = {legs="Iga Hakama +2"}
sets.precast.JA["Innin"] = {head="Iga Zukin +2"}
sets.precast.JA["Futae"] = {hands="Iga Tekko +2"}

-- Weaponskills
sets.precast.WS = { ammo="Ginsen",
			head="Felistris Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Otronif Harness", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Wanion Belt", legs="Otronif Brais +1", feet="Taeon Boots"}

sets.precast.WS.Acc = {}

-- Katana
-- Blade: Jin
sets.precast.WS["Blade: Jin"] = { ammo="Ginsen",
			head="Felistris Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Otronif Harness", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Anguinus Belt", legs="Otronif Brais +1", feet="Taeon Boots"}

-- Blade: Shun
sets.precast.WS["Blade: Shun"] = { ammo="Ginsen",
			head="Felistris Mask", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Otronif Harness", hands="Mochizuki Tekko", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Fortia Belt", legs="Otronif Brais +1", feet="Taeon Boots"}
-- Blade: Hi
sets.precast.WS["Blade: Hi"] = {ammo="Ginsen",
			head="Uk'uxkaj Cap", neck="Hope Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Otronif Harness", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Anguinus Belt", legs="Otronif Brais +1", feet="Taeon Boots"}

sets.precast.WS.Acc["Blade: Hi"] = {ammo="Ginsen",
			head="Uk'uxkaj Cap", neck="Hope Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Hattori Ningi", hands="Otronif Gloves +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Anguinus Belt", legs="Otronif Brais +1", feet="Taeon Boots"}	

-- Blade: Metsu	
sets.precast.WS["Blade: Metsu"] = {ammo="Ginsen",
			head="Felistris Mask", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Otronif Harness", hands="Mochizuki Tekko", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Fortia Belt", legs="Otronif Brais +1", feet="Taeon Boots"}
-- Blade: Kamu
sets.precast.WS["Blade: Kamu"] = {ammo="Ginsen",
			head="Felistris Mask", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Otronif Harness", hands="Mochizuki Tekko", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Fortia Belt", legs="Otronif Brais +1", feet="Taeon Boots"}

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.Acc)
sets.misc.flourish = {}

end