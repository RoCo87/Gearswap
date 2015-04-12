-- PLD Gearsets
-- Created:4/1/2014
-- Last Modified: 7/19/2014
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

	-- sets Macros: 0ff = 0  On = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(16,1)
			elseif player.sub_job == 'DNC' then
				set_macro_page(16,2)
			elseif player.sub_job == 'WAR' then
				set_macro_page(16,3)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(16,4)
			elseif player.sub_job == 'whm' then 
				set_macro_page(16,5)
			elseif player.sub_job == 'run' then 
				set_macro_page(16,6)
			end
		elseif automacroset == 2 then
			set_macro_page(16,2)
		else
			windower.send_command('input /macro book 16')
		end
-- Auto Sets
physicalshield = {sub="Ochain"}
magicalshield = {sub="Aegis"}

-- Standard/idle
sets.idle.PDT = { ammo="Angha Gem",
				head="Rev. Coronet +1", neck="Twilight Torque", lear="Ethereal Earring",
                body="Cab. Surcoat +1", hands="Umuthi Gloves", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Cab. Breeches", feet="Rev. Leggings +1"}

sets.idle.MDT = { ammo="Vanir Battery",
				head="Cizin Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Cab. Surcoat +1", hands="Reverence Gauntlets", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Creed Baudrier", legs="Cizin Breeches", feet="Cab. Leggings"}

sets.idle.MDT.Shell = { ammo="Vanir Battery",
				head="Cizin Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Cab. Surcoat +1", hands="Reverence Gauntlets", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Creed Baudrier", legs="Cizin Breeches", feet="Cab. Leggings"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				legs="Blood Cuisses"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", legs="Blood Cuisses"})
-- TP 
sets.TP = { 	ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Xaddi Mail", hands="Cizin Mufflers +1", lring="Rajas Ring", rring="K'ayres Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Cizin Breeches +1", feet="Ejekamal Boots"}
sets.TP.Acc = { ammo="Ginsen",
				head="Yaoyotl Helm", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Xaddi Mail", hands="Buremte Gloves", lring="Rajas Ring", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Dynamic Belt +1", legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.TP.Hybrid = { ammo="Angha Gem",
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Cab. Surcoat +1", hands="Buremte Gloves", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Dynamic Belt +1", legs="Cizin Breeches +1", feet="Cizin Greaves"}			
sets.Weakened = { ammo="Angha Gem",
				head="Rev. Coronet +1", neck="Twilight Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Cab. Surcoat +1", hands="Cab. Gauntlets", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Cizin Breeches +1", feet="Cizin Greaves"}
				
-- Precast 
sets.precast.Fastcast = set_combine(sets.idle.PDT, {ammo="Incantor Stone",
				head="Cizin Helm", neck="Voltsurge torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Nuevo Coselete", hands="Buremte Gloves", lring="Veneficium Ring", rring="Prolix Ring",
                waist="Goading Belt", legs="Enif Cosciales", feet="Ejekamal Boots"
				})
sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {waist="Siegel Sash"})
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

-- Enmity Caps at ?, Gear caps at 120, Current is 
sets.Enmity = set_combine(sets.idle.PDT,{ ammo="Paeapua",
				head="Cab. Coronet", neck="Atzintli Necklace", lear="Trux Earring", rear="Pluto's Pearl",
				body="Cab. Surcoat +1", hands="Cab. Gauntlets +1", lring="Supersheer Earring", rring="Apeile Ring +1",
				back="Fravashi Mantle", waist="Creed Baudrier", legs="Cab. Breeches", feet="Cab. Leggings"})

sets.HPDown = set_combine(sets.idle.PDT,{
				head="Cizin Helm", lear="Loquac. Earring",
				rring="Prolix Ring"})
-- Midcast
sets.midcast.Recast = set_combine(sets.precast.Fastcast,{})

-- Healing Magic 
sets.midcast.Cure = set_combine(sets.midcast.Recast,{ammo="Paeapua",
				head="Yaoyotl Helm", neck="Phalaina Locket", lear="Ethereal Earring", rear="Knightly Earring",
				body="Reverence Surcoat",hands="Buremte Gloves",lring="Meridian Ring",rring="K'ayres Ring",
				back="Fravashi Mantle", waist="Chuq'aba Belt", legs="Reverence Breeches", feet="Cab. Leggings"})
sets.midcast.Cure.Self = set_combine(sets.midcast.Cure,{ammo="Paeapua",
				head="Shabti Armet", neck="Phalaina Locket", lear="Ethereal Earring", rear="Knightly Earring",
				body="Reverence Surcoat",hands="Buremte Gloves",lring="Meridian Ring",rring="K'ayres Ring",
				back="Fravashi Mantle", waist="Chuq'aba Belt", legs="Reverence Breeches", feet="Cab. Leggings"})

-- Divine Magic - Enlight 490 Goal
sets.midcast.DivineMagic = set_combine(sets.midcast.Recast,{
				head="Kahin Turban", neck="Nesanica Torque", lear="Beatific Earring", rear="Divine Earring",
				body="Reverence Surcoat", hands="Paragon Mufflers", lring="Globidonta Ring", 
				back="Altruistic Cape", waist="Cascade Belt", legs="Kaiser Diechlings", feet="Templar Sabotons"})

sets.midcast.DivineMagic.Flash = set_combine(sets.midcast.DivineMagic,{ammo="Paeapua",
				head="Cizin Helm", neck="Atzintli Necklace", lear="Trux Earring", rear="Pluto's Pearl",
				body="Reverence Surcoat", hands="Cab. Gauntlets +1", lring="Supersheer Earring", rring="Apeile Ring +1",
				back="Fravashi Mantle", waist="Goading Belt", legs="Cab. Breeches", feet="Cab. Leggings"})
				
sets.midcast.EnhancingMagic = set_combine(sets.midcast.Recast,{
				neck="Colossus's Torque", lear="Augment. Earring", rear="Andoaa Earring",
				body="Shabti Cuirass",
				back="Merciful Cape", waist="Bishop Sash", legs="Rev. Breeches +1"})

sets.midcast.EnhancingMagic.Phalanx = set_combine(sets.midcast.EnhancingMagic,{})

-- JA
sets.precast.JA["Invincible"] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
sets.precast.JA["Intervene"] = set_combine(sets.precast.JA["Shield Bash"],{
				hands="Cab. Gauntlets +1",lear="Knightly Earring"})
-- MND			
sets.precast.JA["Chivalry"] = set_combine(sets.idle.PDT,{hands="Cab. Gauntlets +1"},{
				head="Yaoyotl Helm", neck="Phalaina Locket",
				body="Cab. Surcoat +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
				legs="Cab. Breeches", feet="Whirlpool Greaves"})
-- VIT
sets.precast.JA["Rampart"] = set_combine(sets.Enmity,{
				head="Cab. Coronet", 
				body="Cab. Surcoat +1", hands="Cab. Gauntlets +1",
				waist="Chuq'aba Belt", legs="Cab. Breeches", feet="Rev. Leggings +1"})
sets.precast.JA["Sentinel"] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
sets.precast.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
sets.precast.JA["Fealty"] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
sets.precast.JA["Shield Bash"] = set_combine(sets.Enmity,{
				hands="Cab. Gauntlets +1",lear="Knightly Earring"})

-- WS
sets.precast.WS = {
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Zoran's Belt", legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Requiescat'] = { ammo="",
				head="Yaoyotl Helm", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Atheling Mantle", waist="Fortia Belt", legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Chant du Cygne'] = {ammo="",
				head="Yaoyotl Helm", neck="Fortia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Savage Blade'] = {ammo="",
				head="Yaoyotl Helm", neck="Fortia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}
sets.precast.WS['Atonement'] = set_combine(sets.precast.WS, sets.Enmity,{
				neck="Fortia Gorget", rear="Moonshade Earring",
                body="Phorcys Korazin", 
				waist="Fortia Belt"})

sets.precast.WS.Acc = {}
sets.precast.WS.Acc['Requiescat'] = {ammo="Aqua Sachet",
				head="Yaoyotl Helm", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Vespid Mantle", waist="Fortia Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}

sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Ginsen",
				head="Yaoyotl Helm", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Mars's Ring",
                back="Vespid Mantle", waist="Wanion Belt",  legs="Miki. Cuisses", feet="Whirlpool Greaves"}

-- Misc Sets
sets.misc.Waltz = set_combine(sets.precast.JA["Chivalry"],{})
sets.misc.Steps = set_combine(sets.TP.Acc,{})
sets.misc.flourish = {}
end