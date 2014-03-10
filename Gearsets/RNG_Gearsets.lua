-- RNG Gear_sets
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
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(1,1)
			elseif player.sub_job == 'SAM' then
				set_macro_page(1,2)
			elseif player.sub_job == 'WAR' then
				set_macro_page(1,3)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(1,4)
			end
		else
			set_macro_page(1,1)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Repulse Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Manibozho Jerkin", hands="Iuitl Wristbands", lring=Aug.Darkring1, rring=Aug.Darkring2,
                back="Engulfer Cape", waist="Flume Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Orion Socks"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Merman's Earring", feet="Orion Socks"})
-- Melee TP 
sets.TP = { 
				head="Uk'uxkaj Cap", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Thaumas Coat", hands="Manibozho Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Manibozho Brais", feet="Manibozho Boots"}
-- Melee Accuracy TP
sets.TP.Acc = {
				head="Whirlpool Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Manibozho Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Manibozho Brais", feet="Manibozho Boots"}

-- RA Sets
sets.precast.Snapshot = {head="Arcadian Beret",
                body="Sylvan Caban +2", hands="Iuitl Wristbands",
                waist="Impulse Belt", legs="Nahtirah Trousers", feet="Arcadian Socks"}
-- Echidna's Bow
sets.RA = { head="Arcadian Beret", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Orion Jerkin", hands="Orion Bracers", lring="Rajas Ring", rring="Arewe Ring +1",
            back="Sylvan Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks"}
				
-- Eminent Gun RAACC
sets.RA.Acc = { head="Arcadian Beret", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Orion Jerkin", hands="Orion Bracers", lring="Arewe Ring +1", rring="Arewe Ring +1",
                back="Kayapa Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks"}

sets.RA.Gun= { head="Arcadian Beret", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
            body="Orion Jerkin", hands="Orion Bracers", lring="Rajas Ring", rring="Arewe Ring +1",
            back="Sylvan Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks"}
				
-- Eminent Gun RAACC
sets.RA.Acc.Gun = { head="Arcadian Beret", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Orion Jerkin", hands="Orion Bracers", lring="Arewe Ring +1", rring="Arewe Ring +1",
                back="Kayapa Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks"}


-- JA
sets.precast.JA["Barrage"] =  {head="Arcadian Beret", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Orion Jerkin", hands="Orion Bracers", lring="Rajas Ring", rring="Arewe Ring +1",
                back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks"}
sets.precast.JA["Eagle Eye Shot"] = set_combine(sets.RA.Acc, {legs="Arcadian Braccae"})
sets.precast.JA["Overkill"] = {}

sets.precast.JA["Shadowbind"] = {hands="Orion Bracers"}
sets.precast.JA["Sharpshot"] = {legs="Orion Braccae"}
sets.precast.JA["Double Shot"] = {body="Sylvan Gapette +2"}
sets.precast.JA["Velocity Shot"] = {legs="Sylvan Caban +2"}
sets.precast.JA["Camouflage"] = {head="Orion Jerkin"}
sets.precast.JA["Scavenge"] = {feet="Orion Socks"}
sets.precast.JA["Bounty Shot"] = {hands="Syl. Glvltte. +2"}
sets.precast.JA["Unlimited Shot"] = {feet="Sylvan Bottln. +2"}
sets.precast.JA["Flashy Shot"] = {}
sets.precast.JA["Stealth Shot"] = {feet="Arcadian Socks"}

-- Weaponskills
-- Melee
sets.precast.WS = {}
-- Range
sets.precast.RAWS = {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Orion Jerkin", hands="Orion Bracers", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks"}
-- Bow WS
sets.precast.RAWS['Jishnu\'s Radiance'] = {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Orion Jerkin", hands="Orion Bracers", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks"}

sets.precast.RAWS['Last Stand'] = {
				head="Uk'uxkaj Cap", neck="Light Gorget", lear="Clearview Earring", rear="Flame Pearl",
                body="Orion Jerkin", hands="Orion Bracers", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks"}
					
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.misc.Fastcast = set_combine(sets.idle.PDT, {head="Athos's Chapeau", lear="Loquac. Earring", rring="Prolix Ring",})

sets.misc.Utsusemi = set_combine(sets.misc.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {hands="Buremete Gloves", waist="Chuq'aba Belt"}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}


elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

end