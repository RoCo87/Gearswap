-- Feary's COR Gear_sets
-- Created:
-- Last Modified: 9/4/2014
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
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Lanun Frac", hands="Umuthi Gloves", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Lanun Boots"}

sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Lanun Tricorne",
				body="Lak. Frac", hands="Lanun Gants",
				legs="Lanun Culottes", feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", 
				feet="Hermes' Sandals"})
-- Melee TP 
sets.TP = { 
			head="Taeon Chapeau", neck="Asperity Necklace", lear="Heartseeker Earring", rear="Dungeon Earring",
            body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"}

-- Melee Accuracy TP
sets.TP.Acc = {	
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Taeon Tights", feet="Taeon Boots"}

-- RA Sets
sets.precast.Snapshot = {ammo="TPBullet",
				head="Nvrch. Tricorne +2n", 
				Body="Skopos Jerkin", hands="Lanun Gants",
                back="Navarch's Mantle", waist="Impulse Belt", legs="Nahtirah Trousers", feet="Wurrukatte Boots"}
-- Eminent Gun
-- Chass. Tricorne,Chasseur's Frac,Chasseur's Gants,Gunslinger's Cape
sets.RA = { ammo="TPBullet",
			head="Lanun Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Lak. Frac", hands="Lanun Gants", lring="Hajduk Ring", rring="Hajduk Ring",
            back="Kayapa Cape", waist="Buccaneer's Belt", legs="Feast Hose", feet="Taeon Boots"}
				
sets.RA.Acc = { ammo="TPBullet",
			head="Nvrch. Tricorne +2", neck="Iqabi Necklace", lear="Clearview Earring", rear="Volley Earring",
            body="Lak. Frac", hands="Lanun Gants", lring="Hajduk Ring", rring="Hajduk Ring",
            back="Kayapa Cape", waist="Buccaneer's Belt", legs="Feast Hose", feet="Taeon Boots"}

-- Armageddon 
sets.RA.Armageddon = { ammo="TPBullet",
			head="Lanun Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Lanun Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
            back="Terebellum Mantle", waist="Buccaneer's Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.RA.Armageddon.Acc = { ammo="TPBullet",
			head="Lanun Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Lanun Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
            back="Kayapa Cape", waist="Buccaneer's Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}



-- JA
sets.precast.JA["Wild Card"] = {feet="Lanun Bottes"}
sets.precast.JA["Cutting Cards"] = {}

sets.precast.JA["Fold"] = {hands="Lanun Gants"}
sets.precast.JA["Random Deal"] = {body="Lanun Frac"}
sets.precast.JA["Snake Eye"] = {legs="Lanun Culottes"}
sets.precast.JA["Triple Shot"] = {body="Nvrch. Frac +2"}
sets.precast.JA["Double-Up"] = set_combine(sets.precast.JA["Phantom Roll"])

-- Corsair Rolls
sets.precast.JA["Phantom Roll"] = {head="Lanun Tricorne", hands="Nvrch. Gants +2", legs="Desultor Tassets", rring="Luzaf's Ring"}
sets.precast.JA["Caster's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {legs="Nvrch. Culottes +2"})
sets.precast.JA["Courser's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {feet="Navarch's Bottes +2"})
sets.precast.JA["Blitzer's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {head="Navarch's Tricorne +2"})
sets.precast.JA["Tactician's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {body="Navarch's Frac +2"})
sets.precast.JA["Allies' Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {hands="Navarch's Gants +2"})

-- Quick Draw 
sets.precast.QD = {}
--Light/Dark Shot
sets.precast.QD.ACC = {
				head="Blood Mask", neck="Stoicheion Medal", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Lanun Frac", hands="Schutzen Mittens", lring="Garuda Ring +1", rring="Sangoma Ring",
                back="Navarch's Mantle", waist="Aquiline Belt", legs="Thur. Tights +1", feet="Lanun Boots"}
-- Elemental Shots
-- Deviant Necklace, Gunslinger's Cape
sets.precast.QD.MAB = {
				head="Blood Mask", neck="Stoicheion Medal", lear="Friomisi Earring", rear="Novio earring",
                body="Lanun Frac", hands="Taeon Gloves", lring="Icesoul Ring", rring="Icesoul Ring",
                back="Toro Cape", waist="Hachirin-no-Obi", legs="Iuitl Tights", feet="Lanun Boots"}

sets.precast.JA["Barrage"] =  set_combine(sets.RA.Acc)

-- Weaponskills
-- Melee WS
sets.precast.WS = {
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"}

sets.precast.WS["Requiescat"] = {
				head="Taeon Chapeau", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Atheling Mantle", waist="Fortia Belt", legs="Taeon Tights", feet="Taeon Boots"}
sets.precast.WS["Exenterator"] = {
				head="Taeon Chapeau", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Fortia Belt", legs="Taeon Tights", feet="Taeon Boots"}

-- RA WS
sets.precast.RAWS = {
				head="Lanun Tricorne", neck="Fortia Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Terebellum Mantle", waist="Fortia Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}
sets.precast.RAWS['Wildfire'] = {
				head="Lanun Tricorne", neck="Stoicheion Medal", lear="Novio Earring", rear="Friomisi Pearl",
                body="Lanun Frac", hands="Thur. Gloves +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Toro Cape", waist="Aquiline Belt", legs="Nahtirah Trousers", feet="Lanun Boots"}

sets.precast.RAWS['Last Stand'] = {
				head="Lanun Tricorne", neck="Fortia Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Terebellum Mantle", waist="Fortia Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}
					
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Haruspex Hat +1", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}
end