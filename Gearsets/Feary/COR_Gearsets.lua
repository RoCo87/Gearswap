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
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Lanun Tricorne",
				body="Lanun Frac", hands="Lanun Gants",
				legs="Lanun Culottes", feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", 
				feet="Hermes' Sandals"})
-- Melee TP 
sets.TP = { 
			head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Thaumas Coat", hands="Manibozho Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Celt Belt", legs="Manibozho Brais", feet="Manibozho Boots"}

-- Melee Accuracy TP
sets.TP.Acc = {	
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Buremte Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Manibozho Brais", feet="Manibozho Boots"}

-- RA Sets
sets.precast.Snapshot = {ammo="TPBullet",
				head="Nvrch. Tricorne +2", 
				hands="Lanun Gants",
                back="Navarch's Mantle", waist="Impulse Belt", legs="Nahtirah Trousers"}
-- Eminent Gun
sets.RA = { ammo="TPBullet",
			head="Lanun Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Lanun Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
            back="Terebellum Mantle", waist="Buccaneer's Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}
				
sets.RA.Acc = { ammo="TPBullet",
			head="Nvrch. Tricorne +2", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Lanun Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
            back="Kayapa Cape", waist="Buccaneer's Belt", legs="Thur. tights +1", feet="Iuitl Gaiters"}

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
				head="Whirlpool Mask", neck="Stoicheion Medal", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Lanun Frac", hands="Schutzen Mittens", lring="Garuda Ring +1", rring="Sangoma Ring",
                back="Navarch's Mantle", waist="Aquiline Belt", legs="Thur. Tights +1", feet="Lanun Boots"}
-- Elemental Shots
sets.precast.QD.MAB = {
				head="Whirlpool Mask", neck="Stoicheion Medal", lear="Friomisi Earring", rear="Novio earring",
                body="Lanun Frac", hands="Schutzen Mittens", lring="Demon's Ring", rring="Demon's Ring",
                back="Toro Cape", waist="Aquiline Belt", legs="Iuitl Tights", feet="Lanun Boots"}

sets.precast.JA["Barrage"] =  set_combine(sets.RA.Acc)

-- Weaponskills
-- Melee WS
sets.precast.WS = {
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Buremte Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.precast.WS["Requiescat"] = {
				head="Whirlpool Mask", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Buremte Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Atheling Mantle", waist="Fortia Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}
sets.precast.WS["Exenterator"] = {
				head="Whirlpool Mask", neck="Fortia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Buremte Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Fortia Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

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