-- PLD Gearsets
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

	-- sets Macros: 0ff = 0  On = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'war' then
				set_macro_page(16,1)
			elseif player.sub_job == 'nin' then
				set_macro_page(16,2)
			elseif player.sub_job == 'dnc' then
				set_macro_page(16,3)
			elseif player.sub_job == 'drg' then 
				set_macro_page(16,4)
			elseif player.sub_job == 'whm' then 
				set_macro_page(16,5)
			elseif player.sub_job == 'run' then 
				set_macro_page(16,6)
			end
		else
			set_macro_page(16,1)
		end
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { ammo="Angha Gem",
				head="Yaoyotl Helm", neck="Twilight Torque",
                body="Cab. Surcoat", hands="Cizin Mufflers", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Repulse Mantle", waist="Flume Belt", legs="Cab. Breeches", feet="Rev. Leggings"}

sets.idle.MDT = { ammo="Demonry Stone",
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Cab. Surcoat", hands="Cizin Mufflers", lring=Aug.Darkring1, rring="Shadow Ring",
                back="Engulfer Cape", waist="Creed Baudrier", legs="Cab. Breeches", feet="Rev. Leggings"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				legs="Blood Cuisses"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Hermes' Sandals"})
-- TP 
sets.TP = { 
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Pak Corselet", hands="Cab. Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Cizin Breeches", feet="Whirlpool Greaves"}
sets.TP.Acc = {
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Pak Corselet", hands="Buremte Gloves", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.TP.Hybrid = {
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Pak Corselet", hands="Buremte Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Repulse Mantle", waist="Dynamic Belt +1", legs="Cizin Breeches", feet="Cizin Greaves"}
-- Precast 
sets.Enmity = set_combine(sets.idle.PDT,{ ammo="Paeapua",
				head="Cab. Coronet",
				body="Cab. Surcoat",hands="Cab. Breeches",
				back="Valor Cape", waist="Creed Baudrier", legs="Cab. Leggings"})

sets.HPDown = set_combine(sets.idle.PDT,{
				head="Cizin Helm", lear="Loquac. Earring",
				rring="Prolix Ring"})
-- Midcast
sets.Recast = set_combine(sets.TP,{})

sets.Cure = set_combine(sets.Recast,{
				head="Yaoyotl Helm", neck="Phalaina Locket", lear="Creed Earring",
				body="Reverence Surcoat",hands="Buremte Gloves",lring="Meridian Ring",rring="K'ayres Ring",
				back="Valor Cape", waist="Creed Baudrier", legs="Cab. Breeches", feet="Cab. Leggings"})

sets.midcast.DivineMagic = set_combine(sets.Recast,{body="Reverence Surcoat"})

sets.midcast.EnhancingMagic = set_combine(sets.Recast,{})

-- JA
sets.precast.JA["Invincible"] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
sets.precast.JA["Intervene"] = set_combine(sets.Enmity,{
				hands="Cab. Gauntlets",lear="Knightly Earring"})
				
sets.precast.JA["Chivalry"] = set_combine(sets.idle.PDT,{
				head="Yaoyotl Helm", 
				body="Cab. Surcoat", hands="Cab. Gauntlets", lring="Aquasoul Ring", rring="Aquasoul Ring",
				 legs="Cab. Breeches", feet="Whirlpool Greaves"})
sets.precast.JA["Rampart"] = set_combine(sets.Enmity,{
				head="Cab. Coronet", 
				body="Cab. Surcoat", hands="Cab. Gauntlets",
				back="Valor Cape", waist="Flume Belt"  legs="Cab. Breeches", feet="Whirlpool Greaves"})
sets.precast.JA["Sentinel"] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
sets.precast.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings"})
sets.precast.JA["Fealty"] = set_combine(sets.Enmity,{body="Cab. Surcoat"})
sets.precast.JA["Shield Bash"] = set_combine(sets.Enmity,{
				hands="Cab. Gauntlets",lear="Knightly Earring"})

-- WS
sets.precast.WS = {ammo="",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Zoran's Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Requiescat'] = { ammo="",
				head="Yaoyotl Helm", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Atheling Mantle", waist="Shadow Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS.Acc['Requiescat'] = { ammo="",
				head="Yaoyotl Helm", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Vespid Mantle", waist="Shadow Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Chant du Cygne'] = {ammo="",
				head="Yaoyotl Helm", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Thundersoul Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS.Acc['Chant du Cygne'] = {ammo="",
				head="Yaoyotl Helm", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Mars's Ring",
                back="Vespid Mantle", waist="Wanion Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}

-- Misc Sets
sets.misc.Fastcast = set_combine(sets.idle.PDT, {
				head="Cizin Helm", lear="Loquac. Earring",
                rring="Prolix Ring",
                })
sets.misc.Utsusemi = set_combine(sets.misc.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.MidAcc,{})
sets.misc.flourish = {}

elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

else

end