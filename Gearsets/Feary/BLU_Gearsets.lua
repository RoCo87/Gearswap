-- BLU Gearsets
-- Created: 4/26/2014
-- Last Updated: 6/13/2014
-- To Do List:
-- Spell.Interrupted 
--
--
--

if player.name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		
		

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {ammo="Staunch Tathlum",
				head="Aya. Zucchetto +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Ayanmo Corazza +1", hands="Aya. Manopolas +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Shadow Mantle", waist="Flume Belt", legs="Aya. Cosciales +1", feet="Aya. Gambieras +1"}
		sets.idle.MDT = {ammo="Staunch Tathlum",
				head="Aya. Zucchetto +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Ayanmo Corazza +1", hands="Aya. Manopolas +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="", waist="Flume Belt", legs="Aya. Cosciales +1", feet="Aya. Gambieras +1"}			
		
		sets.Resting = set_combine(sets.idle.PDT, {})
		
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				--Amalric Coif
				lear="Merman's Earring", rear="Etiolation Earring",
				legs="Carmine Cuisses +1"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				neck="Carpenter's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="Craftmaster's Ring",
				waist="Carpenter's Belt", legs="Carmine Cuisses +1"})		
		sets.lockstyle = set_combine{sets.misc.Town}
		sets.idle.Fishing = set_combine(sets.idle.Standard,{range="Lu Sh. F. Rod +1", ammo="Sinking Minnow",
				head="Tlahtlamah Glasses", neck="Fisherman's Torque",
				body="Fisherman's Smock", hands="Kachina Gloves", lring="Noddy Ring", rring="Puffin Ring",
				waist="Fisherman's Belt", legs="Fisherman's Hose", feet="Waders"})
		sets.idle.Wood = set_combine(sets.idle.Standard,{
				neck="Carpenter's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="Craftmaster's Ring",
				waist="Carpenter's Belt"})		
				 
		-- JA
		sets.precast.JA["Azure Lore"] = {hands="Luhlaza Bazubands"}
		sets.precast.JA["Unbridled Wisdom"] = {}
		
		sets.precast.JA["Unbridled Learning"] = {}
		sets.precast.JA["Chain Affinity"] = {head="Hashishin Kavuk", feet="Assimilator's Charuqs"}
		sets.precast.JA["Burst Affinity"] = {legs="Mirage Shalwar", feet="Mavi Basmak +2"}
		sets.precast.JA["Efflux"] = {legs="Hashishin Tayt"}
		sets.precast.JA["Diffusion"] = {feet="Luhlaza Charuqs"}
		sets.precast.JA["Convergence"] = {head="Luhlaza Keffiyeh"}
		sets.precast.JA["Enchainment"] = {body="Luhlaza Jubbah"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Staunch Tathlum",
				head="Carmine Mask +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                -- Kishar Ring
				body="Luhlaza Jubbah", hands="Leyline Gloves", rring="Prolix Ring",
				-- 
                back=Aug.Cape.BLU.FC, waist="Witful Belt", legs="Lengo Pants", feet="Carmine Greaves +1"}
		sets.precast.BlueMagic = set_combine(sets.precast.Fastcast,{body="Hashishin Mintan"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
			back="Pahtli Cape"})
		
		-- Misc
		sets.misc.Waltz = {
				-- Head
				rring="Asklepian Ring",
				legs="Dashing Subligar",}
		sets.misc.Steps = {ammo="Mantoptera Eye",
				head="Carmine Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ramuh Ring +1", rring="Patricius Ring",
				back=Aug.Cape.BLU.TP, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}
		sets.misc.flourish = {}
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {
			waist="Witful Belt"})
		sets.midcast.ConserveMP = {feet="Carmine Greaves +1"}
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {ammo="Ginsen",
				-- Herculean Helm 4TA Lissome Necklace Telos Earring 
                head="Adhemar Bonnet", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Herculean Vest 4TA  Herculean Gloves 4TA lring="Petrov Ring"
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Rajas Ring", rring="Epona's Ring",
                -- Herculean Boots 4TA
				back=Aug.Cape.BLU.TP, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet="Carmine Greaves +1"})
		-- Accuracy - Need 1200 Acc - 100 = 1100
		sets.TP.Acc = set_combine(sets.TP, {ammo="Ginsen",
              	-- Herculean Helm 4TA Lissome Necklace Telos Earring 
                head="Carmine Mask +1", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Herculean Vest 4TA  Herculean Gloves 4TA lring="Petrov Ring"
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Rajas Ring", rring="Ramuh Ring +1",
                -- Herculean Boots 4TA
				back=Aug.Cape.BLU.TP, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})
		-- Alliance Buffs - Haste + March x2 
		sets.TP.Buffed = set_combine(sets.TP, {ammo="Ginsen",
              	-- Herculean Helm 4TA Lissome Necklace Telos Earring 
                head="Adhemar Bonnet", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Herculean Vest 4TA  Herculean Gloves 4TA lring="Petrov Ring"
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Rajas Ring", rring="Epona's Ring",
                -- Herculean Boots 4TA
				back=Aug.Cape.BLU.TP, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet="Carmine Greaves +1"})
				
		--  DT/Acc
		sets.TP.Hybrid = set_combine(sets.idle.PDT, {ammo="Ginsen",
                -- Adhemar Bonnet 	
                head="Carmine Mask +1", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
				-- Adhemar Jacket  Adhemar Wristbands lring="Petrov Ring"
                body="Taeon Tabard", hands="Jhakri Cuffs +1", lring="Rajas Ring", rring="Epona's Ring",
                --
				back=Aug.Cape.BLU.TP, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet="Carmine Greaves +1"})
				
		-- Blue Magic
		-- Skill
		sets.midcast.BlueMagic = set_combine(sets.TP, {ammo="Mavi Tathlum",
                head="Luhlaza Keffiyeh",
				-- hands="Fea's Cuffs",
                body="Assimilator's Jubbah", hands="Ayao's Gages", lring="Stikini Ring", rring="Stikini Ring",
                back="Cornflower Cape", legs="Hashishin Tayt", feet="Luhlaza Charuqs"})
		sets.idle.BlueMagic = {}
		sets.idle.BlueMagic.Learn = set_combine(sets.midcast.BlueMagic,{hands="Assim. Bazu.", back="Atheling Mantle"})
		
		-- Recast
		sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast,{hands="Hashi. Bazubands"})
		
		-- STR
		sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {ammo="Mantoptera Eye",
				-- Caro Necklace Tati Earring +1 Tati Earring +1
                head="Jhakri Coronal +1", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
				-- Shukuyu Ring 
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back=Aug.Cape.BLU.WS, waist="Prosilio Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"})
		
		-- STR Accuracy - I.E Heavy Strike
		sets.midcast.BlueMagic.STRAcc = set_combine(sets.midcast.BlueMagic, sets.midcast.BlueMagic.STR)		
		
		-- Dex 
		sets.midcast.BlueMagic.DEX = set_combine(sets.midcast.BlueMagic, sets.midcast.BlueMagic.STR,{
				back=Aug.Cape.BLU.TP})
		
		-- VIT
		sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic, sets.midcast.BlueMagic.STR)
		
		-- AGI
		sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic, sets.midcast.BlueMagic.STR)
		
		-- MND
		sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, sets.midcast.BlueMagic.STR)
		
		-- INT
		sets.midcast.BlueMagic.INT = set_combine(sets.midcast.BlueMagic, {ammo="Dosis Tathlum",
				-- Herculean MAB Sanctity Necklace
                head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                -- Almaric Jacket
				body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
				-- Yamabuki-no-Obi
                back=Aug.Cape.BLU.MB, waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"})
		-- CHR
		sets.midcast.BlueMagic.CHR = set_combine(sets.midcast.BlueMagic, {ammo="Dosis Tathlum",
				-- Herculean MAB Sanctity Necklace
                head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                -- Almaric Jacket
				body="Jhakri Robe +1", hands="Amalric Gages", lring="Shiva Ring +1", rring="Shiva Ring +1",
				-- Yamabuki-no-Obi
                back=Aug.Cape.BLU.MB, waist="Wanion Belt", legs="Amalric Slops", feet="Amalric Nails"})
		-- Macc
		sets.midcast.BlueMagic.Macc = set_combine(sets.midcast.BlueMagic, {
				-- Sanctity Necklace
                head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Gwati Earring",rear="Enchntr. Earring +1",
				body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
				-- Eschan Stone
                back=Aug.Cape.BLU.MB, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"})
		-- Acc
		sets.midcast.BlueMagic.PhysMagicAcc = set_combine(sets.midcast.Macc, {
				-- Sanctity Necklace
                head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Gwati Earring",rear="Enchntr. Earring +1",
				body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
				-- Eschan Stone
                back=Aug.Cape.BLU.MB, waist="Ovate Rope", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"})

		-- Healing Cure Pot
		sets.midcast.BlueMagic.CurePot = set_combine(sets.midcast.BlueMagic.MND, {ammo="Staunch Tathlum",
				-- Mendicant's Earring 
				head="Carmine Mask +1", neck="Phalaina Locket", lear="Lifestorm Earring", rear="Enchntr. Earring +1",
				-- Vrikodata Jupon
				body="Telchine Chas.", hands="Telchine Gloves", lring="Stikini Ring", rring="Stikini Ring",
                -- Aug.Cape.BLU.Cure Luminary Sash
				back="Tempered Cape +1", waist="Chuq'aba Belt", legs="Carmine Cuisses +1", feet="Medium Sabots"})
		sets.midcast.BlueMagic.CurePot.Self = set_combine(sets.midcast.BlueMagic.CurePot, {ammo="Staunch Tathlum",
				-- Mendicant's Earring 
                head="Carmine Mask +1", neck="Phalaina Locket", lear="Lifestorm Earring", rear="Enchntr. Earring +1",
                -- Vrikodata Jupon
				body="Telchine Chas.", hands="Telchine Gloves", lring="Asklepian Ring", rring="Kunaji Ring",
                -- Aug.Cape.BLU.Cure Gishdubar Sash Telchine Braconi Cure Recieved Medium Sabots
				back="Tempered Cape +1", waist="Chuq'aba Belt",})
		
		-- White Wind
		sets.midcast.BlueMagic.WW = set_combine(sets.midcast.BlueMagic.CurePot,{})
		
		sets.midcast.BlueMagic.WW.Self = set_combine(sets.midcast.BlueMagic.CurePot.Self, {})
		
		-- Nuke
		sets.midcast.BlueMagic.Nuke = set_combine(sets.midcast.BlueMagic, {ammo="Dosis Tathlum",
                head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
                -- Yamabuki-no-Obi
				back=Aug.Cape.BLU.MB, waist="Wanion Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"})
		-- Dark
		sets.midcast.BlueMagic.Nuke.Dark = set_combine(sets.midcast.Nuke, {
				-- Pixie Hairpin +1
                head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Shiva Ring +1", rring="Archon Ring",
                -- Yamabuki-no-Obi
				back=Aug.Cape.BLU.MB, waist="Wanion Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"})
		-- Breath 
		sets.midcast.BlueMagic.Breath = set_combine(sets.midcast.BlueMagic.Nuke)
		
		
		-- Weaponskill
		sets.precast.WS = set_combine(sets.TP, {ammo="Ginsen",
				head="Jhakri Coronal +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back=Aug.Cape.BLU.WS, waist="Wanion Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"})
		sets.precast.WS.Acc = set_combine(sets.TP, {ammo="Mantoptera Eye",
				-- Lissome Necklace
				head="Jhakri Coronal +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back=Aug.Cape.BLU.WS, waist="Wanion Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"})
		
		-- Savage Blade
		sets.precast.WS['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				-- Herculean Helm STR/WSD Caro Necklace Ishvara Earring
				head="Jhakri Coronal +1", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
				-- Herculean Vest STR/WSD Shukuyu Ring 
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
				-- Herculean Trousers STR/WSD Herculean Boots STR/WSD
                back=Aug.Cape.BLU.WS, waist="Prosilio Belt", legs="Samnuha Tights", feet="Carmine Greaves +1"})
		sets.precast.WS.Acc['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				-- Herculean Helm  STR/WSD
				head="Jhakri Coronal +1", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
                -- 
				body="Jhakri Robe  +1", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
				-- Herculean Trousers STR/WSD Herculean Boots STR/WSD
                back=Aug.Cape.BLU.WS, waist="Prosilio Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})
		
		-- Expiacion
		sets.precast.WS['Expiacion'] = {ammo="Mantoptera Eye",
                -- Herculean WSD  Caro Necklace Ishvara Earring
				head="Jhakri Coronal +1", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
                -- Herculean WSD Herculean WSD Shukuyu Ring 
				body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
				--  Herculean Boots WSD 
                back=Aug.Cape.BLU.WS, waist="Prosilio Belt", legs="Samnuha Tights", feet="Taeon Boots"}
		sets.precast.WS.Acc['Expiacion'] = {ammo="Mantoptera Eye",
				--  Herculean WSD Caro Necklace Ishvara Earring
                head="Jhakri Coronal +1", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
                --  Herculean WSD
				body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                --  Herculean Feet WSD
				back=Aug.Cape.BLU.WS, waist="Prosilio Belt", legs="Samnuha Tights", feet="Taeon Boots"}
		
		-- Chant du Cygne
		sets.precast.WS['Chant du Cygne'] = {ammo="Ginsen",
                head="Adhemar Bonnet", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- Herculean Vest Adhemar Wristbands 
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ramuh Ring +1", rring="Epona's Ring",
                back=Aug.Cape.BLU.WS, waist="Fotia Belt", legs="Samnuha Tights", feet="Carmine Greaves +1"}
		sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Ginsen",
				-- Mache Earring Mache Earring
                head="Adhemar Bonnet", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- Herculean Vest Adhemar Wristbands 
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Ramuh Ring +1", rring="Epona's Ring",
                back=Aug.Cape.BLU.WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Jhakri Pigaches +1"}
		
		-- Requiescat
		sets.precast.WS['Requiescat'] = {ammo="Mantoptera Eye",
                head="Jhakri Coronal +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- lring="Rufescent Ring"
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Epona's Ring", 
				back=Aug.Cape.BLU.WS, waist="Fotia Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}
		sets.precast.WS.Acc['Requiescat'] = {ammo="Mantoptera Eye",
				-- Telos Earring Cessance Earring
				head="Jhakri Coronal +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- lring="Rufescent Ring"
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Epona's Ring",
				back=Aug.Cape.BLU.WS, waist="Fotia Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}
			
		-- Sanguine Blade
		sets.precast.WS['Sanguine Blade'] = {ammo="Dosis Tathlum",
                head="Jhakri Coronal +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Shiva Ring +1", rring="Shiva Ring +1",
                back=Aug.Cape.BLU.MB, waist="Wanion Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}
		
		-- Realmrazer
		sets.precast.WS['Realmrazer'] = {ammo="Dosis Tathlum",
                head="Jhakri Coronal +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Jhakri Robe +1", hands="Jhakri Cuffs +1", lring="Stikini Ring", rring="Stikini Ring",
                back=Aug.Cape.BLU.MB, waist="Wanion Belt", legs="Jhakri Slops +1", feet="Jhakri Pigaches +1"}	
end