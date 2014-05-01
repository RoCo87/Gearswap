-- SAM Gearsets
-- Created 4/16/2014
-- last Update: 4/30/2014
-- To Do:
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
				set_macro_page(17,1)
			elseif player.sub_job == 'WAR' then
				set_macro_page(17,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(17,3)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(17,4)
			elseif player.sub_job == 'RNG' then 
				set_macro_page(17,5)
			elseif player.sub_job == 'RUN' then 
				set_macro_page(17,6)
			end
		else
			set_macro_page(17,1)
		end

-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Otronif Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Otronif Harness", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Repulse Mantle", waist="Flume Belt", legs="Otronif Brais +1", feet="Otronif Boots"}

sets.idle.MDT = { 
				head="Otronif Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Otronif Harness", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Engulfer Cape", waist="Flume Belt", legs="Otronif Brais +1", feet="Otronif Boots"}

sets.idle.Evasion = {}

sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Danzo Sune-Ate"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Danzo Sune-Ate"})
-- TP 
sets.TP = { ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Wakido Domaru", hands="Wakido Kote", lring="Rajas Ring", rring="K'ayres Ring",
                back="Takaha Mantle", waist="Cetl Belt", legs="Wakido Haidate", feet="Otronif Boots"}
sets.TP.Acc = { ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Wakido Domaru", hands="Sankoji Kote", lring="Rajas Ring", rring="K'ayres Ring",
                back="Takaha Mantle", waist="Dynamic Belt +1", legs="Unkai Haidate +2", feet="Otronif Boots"}
sets.TP.Buffed = { ammo="Hagneia Stone",
				head="Yaoyotl Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Wakido Domaru", hands="Otronif Gloves +1", lring="Rajas Ring", rring="K'ayres Ring",
                back="Takaha Mantle", waist="Cetl Belt", legs="Unkai Haidate +2", feet="Otronif Boots"}

-- Bow TP
sets.TP.Bow = { range="Yoichinoyumi", ammo="Tulfaire Arrow",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Wakido Domaru", hands="Wakido Kote", lring="Rajas Ring", rring="K'ayres Ring",
                back="Takaha Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Otronif Boots"}
sets.TP.Bow.Acc = { range="Yoichinoyumi", ammo="Tulfaire Arrow",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Wakido Domaru", hands="Wakido Kote", lring="Rajas Ring", rring="K'ayres Ring",
                back="Takaha Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Otronif Boots"}
sets.TP.Bow.Buffed = { range="Yoichinoyumi", ammo="Tulfaire Arrow",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Wakido Domaru", hands="Wakido Kote", lring="Rajas Ring", rring="K'ayres Ring",
                back="Takaha Mantle", waist="Windbuffet Belt", legs="Otronif Brais +1", feet="Otronif Boots"}

-- JA
sets.precast.JA["Meikyo Shisui"] = {feet="Sakonji Sune-ate"}
sets.precast.JA["Yaegasumi"] = {}

sets.precast.JA["Meditate"] = set_combine(sets.idle.PDT, {
				head="Wakido Kabuto",
				hands="Sakonji Kote",})
sets.precast.JA["Hasso"] = {hands="Wakido Kote",legs="Unkai Haidate +2"}
sets.precast.JA["Third Eye"] = {legs="Saotome Haidate"}
sets.precast.JA["Seigan"] = {head="Unkai Kabuto +2"}
sets.precast.JA["Blade Bash"] = {hands="Sakonji Kote"}
sets.precast.JA["Sekkanoki"] = {hands="Unkai Kote +2"}
sets.precast.JA["Sengikori"] = {feet="Unkai Sune-ate +2"}
sets.precast.JA["Hagakore"] = {feet="Hes. Gaiters"}
sets.precast.JA["Konzen-ittai"] = {}
sets.precast.JA["Warding Circle"] = {head="Wakido Kabuto"}

-- Weaponskills
sets.precast.WS = {
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Mikinaak Cuisses", feet="Sakonji Sune-Ate"}
sets.precast.WS['Tachi: Fudo'] = {
				head="Otomi Helm", neck="Light Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Light belt", legs="Wakido Haidate", feet="Sakonji Sune-Ate"}
sets.precast.WS['Tachi: Shoha'] = {
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Wakido Haidate", feet="Sakonji Sune-Ate"}
sets.precast.WS['Tachi: Gekko'] = {
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Mikinaak Cuisses", feet="Sakonji Sune-Ate"}
sets.precast.WS['Tachi: Rana'] = {
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Windbuffet Belt", legs="Mikinaak Cuisses", feet="Sakonji Sune-Ates"}
sets.precast.WS['Tachi: Kaiten'] = {
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Boor Bracelets", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Wakido Haidate", feet="Sakonji Sune-Ate"}
sets.precast.WS['Requiescat'] = {
				head="Otomi Helm", neck="Shadow Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Miki. Gauntlets", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Buquwik Cape", waist="Shadow Belt", legs="Mikinaak Cuisses", feet="Sakonji Sune-Ate"}
-- Ranged Weaponskill
sets.precast.RAWS = {
				head="Sakonji Kabuto", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Unkai Kote +2", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Wanion Belt", legs="Wakido Haidate", feet="Sakonji Sune-Ate"}
sets.precast.RAWS['Apex Arrow'] = {
				head="Sakonji Kabuto", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Unkai Kote +2", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Wanion Belt", legs="Wakido Haidate", feet="Sakonji Sune-Ate"}
sets.precast.RAWS['Namas Arrow'] = {
				head="Sakonji Kabuto", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Phorcys Korazin", hands="Unkai Kote +2", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Wanion Belt", legs="Wakido Haidate", feet="Sakonji Sune-Ate"}

-- Misc Sets
sets.misc.Fastcast = set_combine(sets.idle.PDT, {
				lear="Loquac. Earring",
                rring="Prolix Ring",
               })
sets.misc.Utsusemi = set_combine(sets.misc.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.Acc,{})
sets.misc.flourish = {}

				
elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

else

end