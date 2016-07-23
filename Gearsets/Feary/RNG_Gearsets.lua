-- RNG Gear_sets
-- Created: 3/10/2014
-- Last Updated: 02/03/2015
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
	
-- Auto macro sets off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if ranged_Bow:contains(player.equipment.range) then
				if player.sub_job == 'NIN' then
					set_macro_page(13,1)
				elseif player.sub_job == 'SAM' then
					set_macro_page(13,2)
				elseif player.sub_job == 'WAR' then
					set_macro_page(13,3)
				elseif player.sub_job == 'DRG' then 
					set_macro_page(13,4)
				end
			elseif ranged_Gun:contains(player.equipment.range) then
				if player.sub_job == 'NIN' then
					set_macro_page(13,5)
				elseif player.sub_job == 'SAM' then
					set_macro_page(13,6)
				elseif player.sub_job == 'WAR' then
					set_macro_page(13,7)
				elseif player.sub_job == 'DRG' then 
					set_macro_page(13,8)
				end
			end			
		else
			set_macro_page(13,3)
		end
		
-- Auto Sets
-- Standard/idle
		sets.idle.PDT = { 
				head="Meghanada Visor", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
				body="Meghanada Cuirie", hands="Meg. Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
				back="Repulse Mantle", waist="Flume Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}

		sets.idle.MDT = { 
				head="Meghanada Visor", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
				body="Meghanada Cuirie", hands="Meg. Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
				back="Engulfer Cape +1", waist="Flume Belt", legs="Meghanada Chausses", feet="Meg. Jam. +1"}

		sets.misc.Town = set_combine(sets.idle.PDT,{
				feet="Fajin Boots"})
						
		sets.idle.Standard = set_combine(sets.idle.PDT, {
						lear="Merman's Earring", rear="Etiolation Earring", 
						feet="Fajin Boots"})
						
		-- Precast				
		sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				-- neck="Voltsurge Torque", 
				head="Carmine Mask +1", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				-- Leyline Gloves
				body="Taeon Tabard", hands="Thaumas Gloves", lring="Prolix Ring",
				-- Belenus Cape 
				waist="Twilight Belt", legs="Taeon Tights", feet="Carmine Greaves +1"})

		sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

		-- JA
		sets.precast.JA.Acc = {}

		-- Barrage 
		sets.precast.JA["Barrage"] =  {
						head="Arcadian Beret +1", neck="Gaudryi Necklace", lear="Tripudio Earring", rear="Enervating Earring",
						body="Kyujutsugi", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
						back="Lutian Cape", waist="Scout's Belt", legs="Aetosaur Trousers +1", feet="Orion Socks +1"}

		sets.precast.JA.Acc["Barrage"] =  {
						head="Arcadian Beret +1", neck="Gaudryi Necklace", lear="Tripudio Earring", rear="Enervating Earring",
						body="Kyujutsugi", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
						back="Lutian Cape", waist="Scout's Belt", legs="Aetosaur Trousers +1", feet="Orion Socks +1"}
		-- Eagle Eye Shot
		sets.precast.JA["Eagle Eye Shot"] = set_combine(sets.RA, {legs="Arcadian Braccae +1"})

		sets.precast.JA.Acc["Eagle Eye Shot"] = set_combine(sets.RA.Acc, {legs="Arcadian Braccae +1"})

		-- Overkill
		sets.precast.JA["Overkill"] = {
						head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
						body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Garuda Ring +1",
						back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

		sets.precast.JA.Acc["Overkill"] = set_combine(sets.RA.Acc, {
						head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
						body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Garuda Ring +1 ", rring="Garuda Ring +1",
						back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"})

		sets.precast.JA["Shadowbind"] = {hands="Orion Bracers +1"}
		sets.precast.JA["Sharpshot"] = {legs="Orion Braccae +1"}
		sets.precast.JA["Double Shot"] = {body="Amini Gapette"}
		sets.precast.JA["Velocity Shot"] = {legs="Amini Caban"}
		sets.precast.JA["Camouflage"] = {head="Orion Jerkin +1"}
		sets.precast.JA["Scavenge"] = {feet="Orion Socks +1"}
		sets.precast.JA["Bounty Shot"] = {hands="Amini Glovelettes"}
		sets.precast.JA["Unlimited Shot"] = {feet="Amini Bottillons"}
		sets.precast.JA["Flashy Shot"] = {hands="Arc. Bracers +1"}
		sets.precast.JA["Stealth Shot"] = {feet="Arcadian Socks +1"}

		-- Melee TP 
		sets.TP = { 
						head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
						body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
						back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"}
		-- Melee Accuracy TP
		sets.TP.Acc = {
						head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
						body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Ramuh Ring +1",
						back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Taeon Tights", feet="Taeon Boots"}

		-- RA Sets
		-- Snapshot - Caps at 80 from any source.
		sets.precast.Snapshot = {
						head="Amini Gapette",
						body="Amini Caban", hands="Iuitl Wristbands +1",
						back="Lutian Cape", waist="Impulse Belt", legs="Nahtirah Trousers", feet="Arcadian Socks +1"}
		sets.precast.Snapshot.Overkill = set_combine(sets.precast.Snapshot,{
						head="Orion Beret +1",
						body="Amini Caban", hands="Arc. Bracers +1",
						waist="Impulse Belt", legs="Nahtirah Trousers", feet="Arcadian Socks +1"})

		-- Bow
		-- Needs 42+ STP For 3/4 Hit, Goal is 50.
		-- Current: 46 + Recycle
		sets.RA = { 
					head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
					body="Amini Caban", hands="Amini Glovelettes", lring="Rajas Ring", rring="K'ayres Ring",
					back="Lutian Cape", waist="Patentia Sash", legs="Amini Brague", feet="Arcadian Socks +1"}
						
		-- Current- 33 STP
		sets.RA.Acc = {
					head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
					body="Kyujutsugi", hands="Amini Glovelettes", lring="Garuda Ring +1", rring="Garuda Ring +1",
					back="Lutian Cape", waist="Patentia Sash", legs="Feast Hose", feet="Orion Socks +1"}
						
		-- Gun
		sets.RA.Gun = { 
					head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
					body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Garuda Ring +1",
					back="Lutian Cape", waist="Patentia Sash", legs="Nahtirah Trousers", feet="Orion Socks +1"}
						
		sets.RA.Acc.Gun = { 
					head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
					body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
					back="Lutian Cape", waist="Patentia Sash", legs="Nahtirah Trousers", feet="Orion Socks +1"}

		-- Weaponskills
		-- Melee
		sets.precast.WS = set_combine(sets.TP,{})

		sets.precast.WS.Acc = set_combine(sets.TP.Acc,{})

		-- Range Attack WS
		sets.precast.RAWS = {
						head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
						body="Amini Caban", hands="Arc. Bracers +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
						back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

		sets.precast.RAWS.Acc = set_combine(sets.precast.RAWS,{})

		-- Bow WS
		-- Jishnu's Radiance
		sets.precast.RAWS['Jishnu\'s Radiance'] = {
						head="Amini Gapette", neck="Fotia Gorget", lear="Moonshade Earring", rear="Vulcan's Pearl",
						body="Orion Jerkin +1", hands="Arc. Bracers +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
						back="Buquwik Cape", waist="Fotia Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

		sets.precast.RAWS.Acc['Jishnu\'s Radiance'] = {
						head="Amini Gapette", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
						body="Orion Jerkin +1", hands="Arc. Bracers +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
						back="Buquwik Cape", waist="Fotia Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
		-- Namas Arrow			
		sets.precast.RAWS['Namas Arrow'] = {
						head="Arcadian Beret +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
						body="Kyujutsugi", hands="Arc. Bracers +1", lring="Rajas Ring", rring="Ifrit Ring +1",
						back="Buquwik Cape", waist="Fotia Belt", legs="Nahtirah Trousers", feet="Arcadian Socks +1"}

		sets.precast.RAWS.Acc['Namas Arrow'] = {
						head="Arcadian Beret +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
						body="Kyujutsugi", hands="Arc. Bracers +1", lring="Rajas Ring", rring="Ifrit Ring +1",
						back="Buquwik Cape", waist="Fotia Belt", legs="Nahtirah Trousers", feet="Arcadian Socks +1"}

		-- Gun/Crossbow WS
		sets.precast.RAWS['Last Stand'] = {
						head="Amini Gapette", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
						body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Ifrit Ring +1",
						back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

		sets.precast.RAWS['Coronach'] = {
						head="Amini Gapette", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
						body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Ifrit Ring +1",
						back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

		sets.precast.RAWS['Wildfire'] = {
						head="Amini Gapette", neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Earring",
						body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
						back="Toro Cape", waist="Aquiline Belt", legs="Arcadian Braccae +1", feet="Arcadian Socks +1"}

		sets.precast.RAWS['Trueflight'] = {
						head="Amini Gapette", neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Earring",
						body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
						back="Toro Cape", waist="Aquiline Belt", legs="Arcadian Braccae +1", feet="Arcadian Socks +1"}
							
end