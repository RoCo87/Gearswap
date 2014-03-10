-- MNK Gear_sets
--
--
--
--

if player.name == 'Feary' then
-- includes
	include('utility.lua')
	include('mappings.lua')
	include('equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'war' then
				set_macro_page(1,1)
			elseif player.sub_job == 'nin' then
				set.macro_page(1,2)
			elseif player.sub_job == 'dnc' then
				set.macro_page(1,3)
			elseif player.sub_job == 'drg' then 
				set.macro_page(1,4)
			elseif player.sub_job == 'whm' then 
				set.macro_page(1,5)
			elseif player.sub_job == 'run' then 
				set.macro_page(1,6)
			end
		else
			set.macro_page(1,1)
		end
		
-- Augmented Gear
Aug = {}
Aug.Darkring1 = {name="Dark Ring",augments={"Physical Damage Taken -5%, Magical Damage Taken -3%"}}
Aug.Darkring2 = {name="Dark Ring",augments={"Physical Damage Taken -4%, Magical Damage Taken -4%"}}

sets.misc = {}
-- Auto Sets
-- Standard/idle
sets.idle = {}
sets.idle.PDT = { 
				head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Repulse Mantle", waist="Black Belt", legs="Otronif Brais", feet="Otronif Boots"}

sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Engulfer Cape", waist="Black Belt", legs="Nahtirah Trousers", feet="Manibozho Boots"}

sets.idle.Regen = set_combine(sets.idle.PDT, {body="Melee Cyclas +2"})
sets.idle.Evasion = {
				head="Uk'uxkaj Cap", neck="Torero Torque", lear="Musical earring", rear="Novia Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Boxer's Mantle", waist="Scouter's Rope",  legs="Otronif Brais", feet="Manibozho Boots"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Hermes' Sandals"})
-- TP 
sets.TP = { ammo="Hagneia Stone",
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Manibozho Brais", feet="Manibozho Boots"}
-- Accuracy TP
sets.TP.MidAcc = { ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Manibozho Brais", feet="Manibozho Boots"}
-- High Accuracy TP
sets.TP.HighAcc = { ammo="Honed Tathlum",
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Otronif Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Manibozho Brais", feet="Manibozho Boots"}

-- Hybrid PDT/TP
sets.TP.Hybrid = set_combine(sets.TP, sets.idle.PDT)
				
-- Hundred Fists
sets.TP.HF = set_combine(sets.TP,{body="Tantra Cyclas +2"})

-- Impetus Sets
sets.TP.Impetus = set_combine(sets.TP, { ammo="Hagneia Stone",
                body="Tantra Cyclas +2", waist="Twilight Belt"})
sets.TP.MidAcc.Impetus = set_combine(sets.TP.MidAcc, {ammo="Honed Tathlum", body="Tantra Cyclas +2",
				waist="Hurch'lan Sash"})
sets.TP.HighAcc.Impetus =  set_combine(sets.TP.HighAcc, { ammo="Honed Tathlum",
				head="Whirlpool Mask", body="Tantra Cyclas +2", waist="Hurch'lan Sash"})

-- JA
sets.precast = {}
sets.precast.JA = {}
sets.precast.JA["Formless Strikes"] = {body="Mel. Cyclas +2"}
sets.precast.JA["Chakra"] = set_combine(sets.idle.PDT, { ammo="Tantra Tahtlum",
				head="Whirlpool Mask",
				body="Manibozho Jerkin", hands="Mel. Gloves +2", 
				legs="Nahtirah Trousers"})
sets.precast.JA["Chi Blast"] = set_combine(sets.idle.PDT, {
				head="Uk'uxkaj Cap", neck="Morgana's Choker",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="", waist="", legs="Nahtirah Trousers"})
sets.precast.JA["Impetus"] = {body="Tantra Cyclas +2"}
sets.precast.JA["Hundred Fists"] = {legs="Mel. Hose +2"}
sets.precast.JA["Focus"] = {head="Temple Crown"}
sets.precast.JA["Dodge"] = {feet="Temple Gaiters"}
sets.precast.JA["Boost"] = {hands="Temple Gloves"}
sets.precast.JA["Counterstance"] = {feet="Mel. Gaiters +2"}
sets.precast.JA["Mantra"] = {feet="Mel. Gaiters +2"}

-- Weaponskills
sets.precast.WS = {ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Anguinus Belt",  legs="Manibozho Brais", feet="Manibozho Boots"}
sets.precast.WS['Victory Smite'] = { ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"}

sets.precast.WS.Impetus = {}
sets.precast.WS.Impetus['Victory Smite'] = { ammo="Honed Tathlum",
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Tantra Cyclas +2", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Manibozho Brais", feet="Manibozho Boots"}

sets.precast.WS['Final Heaven'] = set_combine(sets.precast.WS)

sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {ammo="Potestas Bomblet",
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Thundersoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})

sets.precast.WS.MidAcc = {}
sets.precast.WS.HighAcc = {}
sets.precast.WS.MidAcc['Shijin Spiral'] = set_combine(sets.precast.WS['Shijin Spiral'], {
				head="Uk'uxkaj Cap", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Thundersoul Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Anguinus Belt", legs="Manibozho Brais", feet="Manibozho Boots"})
sets.precast.WS.HighAcc['Shijin Spiral'] = set_combine(sets.precast.WS['Shijin Spiral'], {ammo="Potestas Bomblet",
				head="Whirlpool Mask", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="Mars's Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Anguinus Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})

sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt",  legs="Manibozho Brais", feet="Manibozho Boots"})
sets.precast.WS["Asuran Fists"] = set_combine(sets.precast.WS, {neck="Shadow Gorget", waist="Anguinus Belt"})

-- Midcast Sets
sets.midcast = {}

-- Aftercast
sets.aftercast = {}

-- Misc Sets
sets.misc.Fastcast = set_combine(sets.idle.PDT, {
				head="Athos's Chapeau", neck="Magoraga Beads", lear="Loquac. Earring", rear="Novia Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves", lring="", rring="Prolix Ring",
                back="Repulse Mantle", waist="Black Belt", legs="", feet=""})
sets.misc.Utsusemi = set_combine(sets.misc.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = {}
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end