-- BST Gear_sets
-- Created: 7/26/2014
-- Last Modified: 7/26/2014
-- To Do
--
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
			if player.sub_job == 'NIN' then
				set_macro_page(14,1)
			elseif player.sub_job == 'WAR' then
				set_macro_page(14,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(14,3)
			elseif player.sub_job == 'SAM' then 
				set_macro_page(14,4)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(14,5)
			end
		else
			set_macro_page(14,3)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Felistris Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.idle.MDT = {
				head="Felistris Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Nierenschutz", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT, {feet="Skadi's Jambeaux"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Etiolation Earring", 
				feet="Skadi's Jambeaux"})

sets.Resting = set_combine(sets.idle.PDT,{
				head="Twilight Helm",
				body="Twilight Mail"})
				
-- Pet Priority - Master Idle - Pet Idle
sets.idle.Pet = {
				head="Twilight Helm", neck="", lear="", rear="",
				body="Twilight Mail", hands="Regimen Mittens", lring="", rring="",
				back="Pastoralist's Mantle", waist="Isa Belt", legs="Nukumi Quijotes", feet=""}
				
-- Pet Priority - Master Idle - Pet Engaged
sets.idle.Pet.TP  = {
				head="Monster Helm +2", neck="Ferine Necklace", lear="Ferine Earring", rear="Domes. Earring",
				body="Monster Jackcoat +2", hands="Regimen Mittens",
				back="Ferine Mantle", waist="Hurch'lan Sash", legs="Monster Trousers +2", feet="Armada Sollerets"}

-- Master Priority - TP set
sets.TP = {	ammo="Paeapua",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="SteelFlash Earring",
			body="Gorney Haubert +1", hands="Xaddi Gauntlets", lring="Rajas ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Windbuffet Belt", legs="Xaddi Cuisses",feet="Ejekamal Boots"}

-- Master Priority - Acc TP set
sets.TP.Acc = {	ammo="Paeapua",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="SteelFlash Earring",
			body="Gorney Haubert +1", hands="Buremte Gloves", lring="Rajas ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Windbuffet Belt", legs="Xaddi Cuisses",feet="Ejekamal Boots"}

-- Pet Priority - Master Engaged - Pet Engaged - TP set
sets.TP.Pet = {	ammo="Paeapua",
			head="Monster Helm +2", neck="Asperity Necklace", lear="Bladeborn Earring", rear="SteelFlash Earring",
			body="Monster Jackcoat +2", hands="Regimen Mittens", lring="Rajas ring", rring="Epona's Ring",
			back="Atheling Mantle", waist="Hurch'lan Sash", legs="Monster Trousers +2",feet="Armada Sollerets"}

sets.TP.Pet.Tank = {ammo="Paeapua",
			head="Monster Helm +2", neck="Shepherd's Chain", lear="Bladeborn Earring", rear="SteelFlash Earring",
			body="Monster Jackcoat +2", hands="Monster Gloves +2", lring="Rajas ring", rring="Epona's Ring",
			back="Oneiros Cappa", waist="Isa Belt", legs="Nukumi Quijotes",feet="Ejekamal Boots"}

-- JA
sets.precast.JA["Familiar"] = {legs="Monster Trousers +2"}
sets.precast.JA["Unleash"] = {}

sets.precast.JA["Killer Instinct"] = {head="Monster Helm +2"}
sets.precast.JA["Feral Howl"] = {body="Monster Jackcoat +2"}
sets.precast.JA["Call Beast"] = {hands="Monster Gloves +2"}
sets.precast.JA["Tame"] = {
				head="Beast Helm", lear="Tamer's Earring",
				legs="Stout Kecks"}
sets.precast.JA["Spur"] = {feet="Ferine Ocreae +2"}

-- Reward + MND
sets.precast.JA["Reward"] = {
				head="Stout Bonnet", neck="Morgana's Choker", lear="Enchntr. Earring +1", rear="",
				body="Beast Jackcoat", hands="Beast Gloves", lring="", rring="",
				back="Pastoralist's Mantle", waist="Crudelist Belt", legs="Monster Trousers +2", feet="Monster Gaiters +2"}
-- Charm + CHR 
sets.precast.JA["Charm"] = {
				head="Beast Helm", neck="Ferine Necklace",
				body="Monster Jackcoat +2", hands="Monster Gloves +2",
				legs="Monster Trousers +2", feet="Monster Gaiters +2"}
				
-- Ready/Sic Moves 
sets.midcast.Pet = {head="Beast Helm"}
sets.midcast.Pet.Favorable = {head="Ferine Cabasset +2"}
sets.midcast.Pet.TPBonus = {hands="Ferine Manoplas +2"}
sets.midcast.Pet.Recast = {legs="Desultor Tassets"}
	
sets.midcast.Pet.WS = {
		neck="Ferine Necklace",ear1="Sabong Earring",ear2="Domesticator's Earring",
		body="", hands="Regimen Mittens",lring="",rring="",
		back="Ferine Mantle",waist="Hurch'lan Sash", legs="", feet="Beast Gaiters"}


-- Weaponskills
sets.precast.WS = {ammo="Vanir battery",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn earring", rear="Steelflash Earring",
			body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
			back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"}
sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Ginsen",
			head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn earring", rear="Steelflash Earring",
			body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
			back="Atheling Mantle", waist="Dynamic Belt +1", legs="Miki. Cuisses", feet="Mikinaak Greaves"})

-- Ruinator
sets.precast.WS["Ruinator"] = set_combine(sets.precast.WS, {ammo="Vanir battery",
			head="Otomi Helm", neck="Asperity Necklace", lear="Brutal earring", rear="Flame Pearl",
			body="Gorney Haubert +1", hands="Buremete Gloves", lring="Rajas Ring", rring="Epona's Ring",
			back="Buquwik Cape", waist="Fotia Belt", legs="Gor. Brayettes +1", feet="Ejekamal Boots"})
sets.precast.WS.Acc["Ruinator"] = set_combine(sets.precast.WS, {ammo="Ginsen",
			head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn earring", rear="Steelflash Earring",
			body="Gorney Haubert +1", hands="Buremete Gloves", lring="Rajas Ring", rring="Epona's Ring",
			back="Buquwik Cape", waist="Fotia Belt", legs="Miki. Cuisses", feet="Ejekamal Boots"})

-- Primal Rend	
sets.precast.WS["Primal Rend"] = set_combine(sets.precast.WS, {})
sets.precast.WS["Cloudsplitter"] = set_combine(sets.precast.WS, {})

-- Onslaught
sets.precast.WS["Onslaught"] = set_combine(sets.precast.WS,{})
sets.precast.WS.Acc["Onslaught"] = set_combine(sets.precast.WS, {})
				
-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				head="Cizin Helm", lear="Loquac. Earring", 
				rring="Prolix Ring"})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = set_combine(sets.idle.PDT,{})
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}
end