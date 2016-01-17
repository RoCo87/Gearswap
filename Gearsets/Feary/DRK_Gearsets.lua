-- DRK Gear_sets
-- Created: 7/13/2014
-- Last Modified: 7/13/2014
-- To Do List
-- adjust magic sets.
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
				set_macro_page(15,1)
			elseif player.sub_job == 'SAM' then
				set_macro_page(15,2)
			elseif player.sub_job == 'WAR' then
				set_macro_page(15,3)
			elseif player.sub_job == 'DNC' then 
				set_macro_page(15,4)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(15,5)
			elseif player.sub_job == 'MNK' then 
				set_macro_page(15,6)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(15,8)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(15,8)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(15,8)
			end
		else
			set_macro_page(15,2)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Cizin Mail +1", hands="Cizin Mufflers +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Cizin Breeches +1", feet="Cizin Greaves +1"}

sets.idle.MDT = { ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Cizin Mail +1", hands="Cizin Mufflers +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Nierenschutz", legs="Cizin Breeches +1", feet="Cizin Greaves +1"}

sets.misc.Town = set_combine(sets.idle.PDT, {legs="Blood Cuisses"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Etiolation Earring",
				legs="Blood Cuisses"})

sets.Enmity = {}

-- Scythe TP set
sets.TP = { ammo="Vanir Battery",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Xaddi Mail", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Cetl Belt", legs="Cizin Breeches +1", feet="Mikinaak Greaves"}
sets.TP.Acc = { ammo="Vanir Battery",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Xaddi Mail", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Cetl Belt", legs="Cizin Breeches +1", feet="Mikinaak Greaves"}

-- GreatSword
sets.TP.GS = {ammo="Vanir Battery",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Xaddi Mail", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Cetl Belt", legs="Cizin Breeches +1", feet="Mikinaak Greaves"}


sets.TP.GS.Acc = set_combine(sets.TP.GS,{ammo="Vanir Battery",
			head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Xaddi Mail", hands="Cizin Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Cetl Belt", legs="Cizin Breeches +1", feet="Mikinaak Greaves"})

-- JA
sets.precast.JA["Blood Weapon"] = {body="Abyss Cuirass +2"}
sets.precast.JA["Soul Enslavement"] = {}

sets.precast.JA["Souleater"] = {head="Chaos Burgeonet"}
sets.precast.JA["Last Resort"] = {feet="Abyss Sollerets +2"}
sets.precast.JA["Arcane Circle"] = {feet="Chaos Sollerets"}
sets.precast.JA["Arcane Crest"] = {}
sets.precast.JA["Dark Seal"] = {head="Abyss Burgeonet +2"}
sets.precast.JA["Weapon Bash"] = {hands="Chaos Gauntlets"}
sets.precast.JA["Diabolic Eye"] = {hands="Abyss Gauntlets +2"}
sets.precast.JA["Nether Void"] = {legs="Bale Flanchard +2"}

sets.precast.JA["Provoke"] = {}
sets.precast.JA["Berserk"] = {}
sets.precast.JA["Defender"] = {}
sets.precast.JA["Warcry"] = {}
sets.precast.JA["Aggressor"] = {}

-- Magic 
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				head="Cizin Helm +1", lear="Loquac. Earring", 
				rring="Prolix Ring"})
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {})

sets.midcast.DarkMagic = {
				head="Ignominy Burgeonet", neck="Aesir Torque", lear="Dark Earring",
				body="Demon's Harness", hands="Avesta Bangles", lring="Archon Ring", rring="Diabolos's Ring",
				back="Merciful Cape", legs="Bale Flanchard +2", feet="Igno. Sollerets"}
sets.midcast.Aspir = set_combine(sets.midcast.DarkMagic,{
			head="Appetence Crown"})
sets.midcast.Absorb = set_combine(sets.midcast.DarkMagic, {})
sets.midcast.Dread = {body="Bale Cuirass +2"}

sets.midcast.Macc = {}
sets.midcast.INT = set_combine(sets.midcast.Macc,{})

sets.midcast.Elemental = set_combine(sets.midcast.Macc,{})
sets.midcast.MAB = set_combine(sets.midcast.Elemental,{})

-- Weaponskills
sets.precast.WS = {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"}
-- Scythe
sets.precast.WS["Insurgency"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"})
sets.precast.WS["Guillotine"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"})
sets.precast.WS["Entropy"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"})
sets.precast.WS["Catastrophe"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"})
sets.precast.WS["Cross Reaper"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Ejekamal Boots"})

-- GreatSword
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"})
sets.precast.WS["Torcleaver"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"})
sets.precast.WS["Scourge"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Miki. Breastplate", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Miki. Cuisses", feet="Mikinaak Greaves"})

			
-- Misc Sets

sets.misc.Waltz = set_combine(sets.idle.PDT,{})
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

end