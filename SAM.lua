<<<<<<< HEAD
-- Feary's SAM LUA
-- Date: 4/8/2014
-- To Do:
--	
-- 	
-- 	
--includes
	include('include/functions.lua')
	include('include/status.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	-- Get SAM Gearsets
	include('Gearsets/SAM_Gearsets.lua')
	
-- Define Default Values for Variables
	-- STP Bow does not go here, only bows for Namas/Apex that us sets.TP.Bow, have to test the other bow.
	Bow = T{"Yoichinoyumi", "Speleogen Bow"}
	Ammo = {ammo="Demon Arrow"}
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
end -- End gear sets
-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end
-- Rules
function self_command(command)
-- Lock PDT
	if command == 'PDT' then
		if PDT == 1 then
			windower.add_to_chat(121,'PDT Unlocked')
			-- make sure other values are set to default
			PDT = 0
			-- Unlock MDT set and equip Current TP set
			MDT = 0
			-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
		-- Make sure other values are set to default
			MDT = 0
		-- Set PDT set and equip it
			PDT = 1
			equip(sets.idle.PDT)
			windower.add_to_chat(121,'PDT Set Locked')
		end
--  Lock MDT
	elseif command == 'MDT' then
		if MDT == 1 then
		-- make sure other values are set to default
			PDT = 0
		-- Unlock MDT set and equip Current TP set
			MDT = 0
			windower.add_to_chat(121,'MDT Unlocked')
		-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
		-- make sure other values are set to default
			PDT = 0
		-- lock MDT set and equip it
			MDT = 1
			equip(sets.idle.MDT)
			windower.add_to_chat(121,'MDT Set Locked')
		end
	elseif command == 'TP' then
		if PDT == 1 or MDT == 1 then
			-- Reset to Default
			PDT = 0
			MDT = 0
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
			if Mode >= 2 then
			-- Reset to 0
				Mode = 0
			else
			-- Increment by 1
				Mode = Mode + 1
			end
			-- Place me in previous set
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		end
	elseif command == 'twilight' then
		-- Twilight Helm/Mail logic
		if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
			enable('head','body')
			if player.status == "Engaged" then
				-- equip appropriate set
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121, 'Twilight Unequipped')
		else
			equip({head="Twilight Helm",body="Twilight Mail"})
		end
	end
end
	
function status_change(new,old)
-- Autoset
    if T{'Idle','Resting'}:contains(new) then
		slot_lock()
		windower.add_to_chat(121,'Idle/Resting Set')
		if player.hpp <= 30 or buffactive['Weakness'] then
			windower.send_command('gs c twilight')
		elseif PDT == 1 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			equip(sets.idle.Standard)
		end
	elseif new == 'Engaged' then
		if PDT == 1 or MDT == 1 then
			if PDT == 1 and MDT == 0 then
				windower.add_to_chat(121,'PDT Locked')
				equip(sets.idle.PDT)
			elseif MDT == 1 and PDT == 0 then
				windower.add_to_chat(121,'MDT Locked')
				equip(sets.idle.MDT)
			else
				MDT = 0
				PDT = 0
			end
		elseif player.hpp <= 30 or buffactive['Weakness'] then
			windower.send_command('gs c twilight')
			slot_lock()
			previous_set()
		else
			 -- Automatically activate Hasso when engaging if Seigan isn't active
            if not buffactive.Hasso and not buffactive.Seigan and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[138] < 1 then
			   windower.send_command('hasso')
            end
			slot_lock()
			previous_set()
=======
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
--Ionis Zones
--Anahera Blade (4 hit): 52
--Tsurumaru (4 hit): 49
--Kogarasumaru (or generic 450 G.katana) (5 hit): 40
--Amanomurakumo/Masamune 437 (5 hit): 46
--
--Non Ionis Zones:
--Anahera Blade (4 hit): 52
--Tsurumaru (5 hit): 24
--Kogarasumaru (5 hit): 40
--Amanomurakumo/Masamune 437 (5 hit): 46

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()
    state.CombatForm = get_combat_form()
    state.CombatWeapon = get_combat_weapon()
    
    state.Buff.Sekkanoki = buffactive.sekkanoki or false
    state.Buff.Sengikori = buffactive.sengikori or false
    state.Buff['Third Eye'] = buffactive['Third Eye'] or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    options.OffenseModes = {'Normal', 'Mid', 'Acc'}
    options.DefenseModes = {'Normal', 'PDT', 'Reraise'}
    options.WeaponskillModes = {'Normal', 'Mid', 'Acc'}
    options.CastingModes = {'Normal'}
    options.IdleModes = {'Normal'}
    options.RestingModes = {'Normal'}
    options.PhysicalDefenseModes = {'PDT', 'Reraise'}
    options.MagicalDefenseModes = {'MDT'}
    
    state.Defense.PhysicalMode = 'PDT'
    
    gear.RAarrow = "Tulfaire Arrow"
    
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
    send_command('bind ^[ input /lockstyle on')
    
    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function file_unload()
    if binds_on_unload then
    	binds_on_unload()
    end
    
    send_command('unbind ^`')
    send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto",hands="Saotome Kote +2"}
    sets.precast.JA.Seigan = {head="Unkai kabuto +2"}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto"}
    sets.precast.JA['Third Eye'] = {head="Unkai kabuto +2", legs="Sakonji Haidate"}
    --sets.precast.JA['Blade Bash'] = {hands="Saotome Kote +2"}
    
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        --ammo="Paeapua",
        head="Otomi Helm",
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Phorcys Korazin",
        hands="Mikinaak Gauntlets",
        ring1="Rajas Ring",
        ring2="Pyrosoul Ring",
        back="Buquwik Cape",
        waist="Windbuffet Belt",
        legs="Wakido Haidate +1",
        feet="Sakonji Sune-ate +1"
    }
    sets.precast.WS.Mid = set_combine(sets.precast.WS, {
        head="Yaoyotl Helm",
        body="Sakonji Domaru +1"
    })
    sets.precast.WS.Acc = set_combine(sets.precast.WS.Mid, {
        ring2="Mars's Ring",
        legs="Mikinaak Cuisses",
        feet="Wakido Sune-Ate +1"
    })
    
    sets.precast.WS['Namas Arrow'] = {
        ammo=gear.RAarrow,
        head="Lithelimb Cap",
        neck="Aqua Gorget",
        ear1="Flame Pearl",
        ear2="Flame Pearl",
        body="Phorcys Korazin",
        hands="Unkai Kote +2",
        back="Buquwik Cape",
        ring1="Rajas Ring",
        ring2="Pyrosoul Ring",
        waist="Light Belt",
        legs="Wakido Haidate +1",
        feet="Wakido Sune-ate +1"
    }
    sets.precast.WS['Namas Arrow'].Mid = set_combine(sets.precast.WS['Namas Arrow'], {
        head="Sakonji Kabuto +1",
        body="Kyujutsugi",
    })
    sets.precast.WS['Namas Arrow'].Acc = set_combine(sets.precast.WS['Namas Arrow'].Mid, {
        ring2="Hajduk Ring"
    })
    
    sets.precast.WS['Apex Arrow'] = set_combine(sets.precast.WS['Namas Arrow'], {
        neck="Breeze Gorget",
        body="Kyujutsugi",
        ring2="Stormsoul Ring"
    })
    sets.precast.WS['Apex Arrow'].Mid = sets.precast.WS['Apex Arrow']
    sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {
        head="Sakonji Kabuto +1"
    })
    
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {
        hands="Boor Bracelets",
        neck="Aqua Gorget", 
        waist="Light Belt"
    })
    sets.precast.WS['Tachi: Fudo'].Mid = set_combine(sets.precast.WS['Tachi: Fudo'], {
        head="Yaoyotl Helm",
        ring2="Mars's Ring"
    })
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS['Tachi: Fudo'].Mid, {
        body="Sakonji Domaru +1",
        feet="Wakido Sune-Ate +1"
    })
    
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {
        feet="Wakido Sune-Ate +1",
        neck="Breeze Gorget",
        waist="Windbuffet Belt"
    })
    sets.precast.WS['Tachi: Shoha'].Mid = set_combine(sets.precast.WS.Acc, {
        neck="Breeze Gorget",
        ring2="Mars's Ring",
        waist="Thunder Belt"
    })
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS['Tachi: Shoha'].Mid, {
        body="Sakonji Domaru +1",
        feet="Wakido Sune-Ate +1"
    })
    
    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {
        neck="Snow Gorget",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring"
    })
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {
        neck="Snow Gorget",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring"
    })
    -- CHR Mod
    sets.precast.WS['Tachi: Ageha'] = {
        head="Sakonji Kabuto +1",
        neck="Justice Torque",
        ear1="Psystorm Earring",
        ear2="Lifestorm Earring",
        body="Unkai Domaru +2",
        hands="Wakido Kote +1",
        ring1="Rajas Ring",
        ring2="Pyrosoul Ring",
        back="Buquwik Cape",
        waist="Soil Belt",
        legs="Wakido Haidate +1",
        feet="Scamp's Sollerets"
    }
    
    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Flame Gorget",waist="Light Belt"})
    
    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {neck="Aqua Gorget",waist="Windbuffet Belt"})
    
    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Breeze Gorget",waist="Windbuffet Belt"})
    
    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {neck="Shadow Gorget",waist="Soil Belt"})
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
    	head="Otomi Helm",
        body="Kyujutsugi",
    	legs="Wakido Haidate +1",
        feet="Otronif Boots +1"
    }
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
        head="Twilight Helm",
        body="Twilight Mail",
        ring2="Paguroidea Ring"
    }
    
    sets.idle.Town = {
        --main="Anahera Blade", 
        --sub="Pole Grip",
        head="Otomi helm",
        neck="Iqabi Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Sakonji Domaru +1",
        hands="Wakido Kote +1",
        ring1="Patricius Ring",
        ring2="K'ayres Ring",
        back="Takaha Mantle",
        waist="Windbuffet Belt",
        legs="Wakido Haidate +1",
        feet="Danzo Sune-ate"
    }
    
    sets.idle.Field = set_combine(sets.idle.Town, {
        neck="Twilight Torque",
        ring1="Patricius Ring",
        ring2="Paguroidea Ring",
        head="Twilight Helm",
        body="Twilight Mail",
        back="Shadow Mantle",
        feet="Danzo Sune-ate"
    })
    
    sets.idle.Weak = set_combine(sets.idle.Field, {
        head="Twilight Helm",
    	body="Twilight Mail"
    })
    sets.idle.Yoichi = set_combine(sets.idle.Field, {
    	ammo=gear.RAarrow
    })
    
    -- Defense sets
    sets.defense.PDT = {
        head="Lithelimb Cap",
        neck="Twilight Torque",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Sakonji Domaru +1",
        hands="Wakido Kote +1",
        ring1="Dark Ring",
        ring2="Patricius Ring",
        back="Shadow Mantle",
        waist="Windbuffet Belt",
        legs="Wakido Haidate +1",
        feet="Otronif Boots +1"
    }
    
    sets.defense.Reraise = set_combine(sets.defense.PDT, {
    	head="Twilight Helm",
    	body="Twilight Mail"
    })
    
    sets.defense.MDT = sets.defense.PDT
    
    sets.Kiting = {feet="Danzo Sune-ate"}
    
    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
    
    -- Engaged sets
    
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group 
    -- 4-hit
    -- Tsurumaru needs 49 stp w/ ionis 
    -- Anahera needs 52 stp anywhere 
    
    -- I generally use Anahera outside of Adoulin areas, so this set aims for 47 STP + 5 from Anahera (52 total)
    -- Note, this set assumes use of Cibitshavore (hence the arrow as ammo)
    sets.engaged = {
        sub="Pole Grip",
        ammo=gear.RAarrow,
        head="Otomi Helm",
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Sakonji Domaru +1",
        hands="Wakido Kote +1",
        ring1="Rajas Ring", 
        ring2="K'ayres Ring", 
        back="Atheling Mantle", 
        waist="Windbuffet Belt",
        legs="Wakido Haidate +1",
        feet="Otronif boots +1"
    }
    
    sets.engaged.Mid = set_combine(sets.engaged, {
        head="Yaoyotl Helm",
        neck="Iqabi Necklace", 
        waist="Dynamic Belt"
    })
    
    sets.engaged.Acc = set_combine(sets.engaged.Mid, { 
        head="Sakonji Kabuto +1",
        ring2="Mars's Ring",
        feet="Wakido Sune-Ate +1",
        back="Takaha Mantle"
    })
    
    sets.engaged.Yoichi = set_combine(sets.engaged, { 
        sub="Bloodrain Strap",
        ammo=gear.RAarrow
    })
    
    sets.engaged.Yoichi.Mid = set_combine(sets.engaged.Yoichi, {
        head="Yaoyotl Helm",
        neck="Iqabi Necklace",
        waist="Dynamic Belt"
    })
    
    sets.engaged.Yoichi.Acc = set_combine(sets.engaged.Yoichi.Mid, {
        head="Sakonji Kabuto +1",
        ring2="Mars's Ring",
        feet="Wakido Sune-Ate +1",
        back="Takaha Mantle"
    })
    
    sets.engaged.PDT = set_combine(sets.engaged, { 
        head="Lithelimb Cap", 
        neck="Twilight Torque",
        ring1="Patricius Ring",
        back="Shadow Mantle",
        feet="Otronif boots +1"
    })
    
    sets.engaged.Yoichi.PDT = set_combine(sets.engaged.PDT,  {
        sub="Bloodrain Strap",
        ammo=gear.RAarrow
    })
    
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, { 
         head="Lithelimb Cap",
         ring1="Patricius Ring",
         ring2="Dark Ring"
    })
    
    sets.engaged.Reraise = set_combine(sets.engaged.PDT, {
        head="Twilight Helm", 
        body="Twilight Mail",
        ring2="Paguroidea Ring"
    })
    
    sets.engaged.Reraise.Yoichi = set_combine(sets.engaged.Reraise, {
        sub="Bloodrain Strap",
        ammo=gear.RAarrow
    })
    
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Reraise, {
        hands="Miki. Gauntlets",
        ring1="Patricius Ring",
        feet="Wakido Sune-Ate +1", 
        waist="Dynamic Belt"
    })
    
    sets.engaged.Acc.Reraise.Yoichi = set_combine(sets.engaged.Acc.Reraise, {
        sub="Bloodrain Strap",
        ammo=gear.RAarrow
    })
    	
    -- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills and 1% gear haste. 
    -- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
    -- GK with merits and capped skill = 682 base accuracy. Tsurumaru has +15 acc
    
    -- This set aims for Tsurumaru 4-hit. 19% DA, 25% haste
    -- Assumes use of Cibitshavore
    sets.engaged.Adoulin = {
        sub="Pole Grip",
        ammo=gear.RAarrow,
        head="Otomi Helm",
        neck="Asperity Necklace", -- 3
        ear1="Bladeborn Earring", -- 1 
        ear2="Steelflash Earring", -- 1
        body="Sakonji Domaru +1", -- 8
        hands="Wakido Kote +1", -- 5
        ring1="Rajas Ring", -- 5
        ring2="K'ayres Ring", -- 5
        back="Atheling Mantle", -- 10
        waist="Windbuffet Belt",
        legs="Wakido Haidate +1", -- 7
        feet="Otronif Boots +1" -- 7
    }
    sets.engaged.Adoulin.Mid = set_combine(sets.engaged.Adoulin, { -- 840.5 accuracy
        head="Yaoyotl Helm",
        neck="Iqabi Necklace",
        waist="Dynamic Belt"
    })
    
    sets.engaged.Adoulin.Acc = set_combine(sets.engaged.Adoulin.Mid, { 
        sub="Bloodrain Strap",
        ring1="Patricius Ring",
        ring2="Mars's Ring",
        feet="Wakido Sune-Ate +1",
        back="Takaha Mantle"
    })
    
    sets.engaged.Adoulin.PDT = set_combine(sets.engaged.Adoulin, {
        head="Lithelimb Cap",
        neck="Twilight Torque",
        ring1="Patricius Ring",
        ring2="Dark Ring",
        back="Shadow Mantle"
    })
    
    sets.engaged.Adoulin.Acc.PDT = set_combine(sets.engaged.Adoulin.Acc, {
        head="Lithelimb Cap",
        neck="Twilight Torque",
        ring2="Dark Ring"
    })
    
    -- Tsurumaru 4-hit 19% DA, 28% haste 
    sets.engaged.Adoulin.Yoichi = {
        sub="Bloodrain Strap",
        ammo=gear.RAarrow,
        head="Otomi Helm",
        neck="Asperity Necklace", -- 3
        ear1="Bladeborn Earring", -- 1 
        ear2="Steelflash Earring", -- 1
        body="Sakonji Domaru +1", -- 8
        hands="Wakido Kote +1", -- 5
        ring1="Rajas Ring", -- 5
        ring2="K'ayres Ring", -- 5
        back="Atheling Mantle", -- 10
        waist="Cetl Belt", -- needed to cap haste
        legs="Wakido Haidate +1", -- 7
        feet="Sakonji Sune-Ate +1" -- 8
    }
    
    sets.engaged.Adoulin.Yoichi.Mid = set_combine(sets.engaged.Adoulin.Yoichi, {
        ammo=gear.RAarrow,
        head="Yaoyotl Helm",
        neck="Iqabi Necklace",
        waist="Dynamic Belt",
        feet="Otronif Boots +1"
    })
    
    sets.engaged.Adoulin.Yoichi.Acc = set_combine(sets.engaged.Adoulin.Yoichi.Mid, {
        ammo=gear.RAarrow,
        ring1="Patricius Ring",
        ring2="Mars's Ring",
        back="Takaha Mantle"
    })
    
    sets.engaged.Adoulin.Yoichi.PDT = set_combine(sets.engaged.Adoulin.PDT, {
        sub="Bloodrain Strap",
        ammo=gear.RAarrow
    })
    
    sets.engaged.Adoulin.Yoichi.Acc.PDT = set_combine(sets.engaged.Adoulin.Yoichi.Acc, { 
        head="Lithelimb Cap",
        neck="Twilight Torque",
        ring2="Dark Ring"
    })
    
    sets.engaged.Adoulin.Reraise = set_combine(sets.engaged.Adoulin, {
        head="Twilight Helm",
        body="Twilight Mail",
    })
    sets.engaged.Adoulin.Yoichi.Reraise = set_combine(sets.engaged.Adoulin.Reraise, {
        ammo=gear.RAarrow
    })
    sets.engaged.Adoulin.Acc.Reraise = set_combine(sets.engaged.Adoulin.Acc, {
        head="Twilight Helm",
        body="Twilight Mail"
    })
    sets.engaged.Adoulin.Yoichi.Acc.Reraise = set_combine(sets.engaged.Adoulin.Acc.Reraise, {
        ammo=gear.RAarrow
    })
    
    sets.buff.Sekkanoki = {hands="Unkai Kote +2"}
    sets.buff.Sengikori = {}
    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate +1"}
    
    sets.thirdeye = {legs="Sakonji Haidate"}
    sets.bow = {ammo=gear.RAarrow}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
	if spell.type:lower() == 'weaponskill' then
		-- Change any GK weaponskills to polearm weaponskill if we're using a polearm.
		if player.equipment.main=='Eminent Lance' or player.equipment.main=='Quint Spear' then
			if spell.english:startswith("Tachi:") then
				send_command('@input /ws "Stardiver" '..spell.target.raw)
				eventArgs.cancel = true
			end
>>>>>>> 350651d138613e0284a151783dde05907eb9fe78
		end
	end
end

<<<<<<< HEAD
-- Gain or lose buffs 
function buff_change(buff,g_or_l)
-- Global Status Values
	include('include/status.lua')
end

function precast(spell,arg)
	if spell.type == "JobAbility" then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
   elseif spell.type == "WeaponSkill" then
		if player.status == 'Engaged' then
			if player.TP >= 100 then
				-- Situational spell logic for Warrior sub job
				if (spell.name == 'Namas Arrow' or spell.name == 'Requiescat' or spell.name == 'Tachi: Fudo' or spell.name == 'Tachi: Kaiten' or spell.name == 'Tachi: Shoha') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
					windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
					cancel_spell()
					return
				end
				-- Ranged WS
				if ranged_weaponskills:contains(spell.name) then
					-- Check Ranged WS Distance
					if spell.target.distance <= ranged_weaponskills_Distance[spell.name] then
						if sets.precast.RAWS[spell.name] then
							equip(sets.precast.RAWS[spell.name],Ammo)
						else
							equip(sets.precast.RAWS,Ammo)
						end
						-- Layered this way to allow for proper equiping of gear when any combo of the below buffs are in effect
						if buffactive.Sekkanoki then
							equip(sets.precast.JA["Sekkanoki"])
							if buffactive.Sengikori then
								equip(sets.precast.JA["Sengikori"])
							end
						end
						if buffactive['Meikyo Shisui'] then
							equip(sets.precast.JA['Meikyo Shisui'])
						end	
					else
						cancel_spell()
						windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
					end
				-- Check WS Distance
				else
					if spell.target.distance <= 5 then
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name])
						else
							equip(sets.precast.WS)
						end
						-- Layered this way to allow for proper equiping of gear when any combo of the below buffs are in effect
						if buffactive.Sekkanoki then
							equip(sets.precast.JA["Sekkanoki"])
							if buffactive.Sengikori then
								equip(sets.precast.JA["Sengikori"])
							end
						end
						if buffactive['Meikyo Shisui'] then
							equip(sets.precast.JA['Meikyo Shisui'])
						end	
					else
						cancel_spell()
						windower.add_to_chat(121,''..spell.target..'is too far to ws')
					end
				end					
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.TP..'tp is Not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
	elseif spell.type == 'Ninjutsu' then
			equip(sets.misc.FastCast)
			if windower.wc_match(spell.name,'Utsusemi*') then
				equip(sets.misc.Utsusemi)
			end
	else
		-- Special handling to remove Dancer sub job Sneak effect
		if spell.name == 'Spectral Jig' and buffactive.Sneak then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		elseif windower.wc_match(spell.name,'Curing*') then
			equip(sets.misc.Waltz)
		elseif windower.wc_match(spell.name,'*Step') then
			equip(sets.misc.Steps)
		end
	end
end

function midcast(spell,arg)
	if spell.type == 'Ninjutsu' then	
		-- Utsusemi
		if windower.wc_match(spell.name,'Utsusemi*') then
			-- Equip PDT then Utsusemi Gear sets
			equip(sets.idle.PDT, sets.misc.Utsusemi)
			if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' then
				if buffactive['Copy Image'] then
					windower.ffxi.cancel_buff(66)
				elseif buffactive['Copy Image (2)'] then
					windower.ffxi.cancel_buff(444)
				elseif buffactive['Copy Image (3)'] then
					windower.ffxi.cancel_buff(445)
				elseif buffactive['Copy Image (4+)'] then
					windower.ffxi.cancel_buff(446)
				end
			end
		elseif spell.name == 'Monomi: Ichi' or spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
			windower.ffxi.cancel_buff(71)
		end
	end
end

function aftercast(spell,arg)
-- Autoset
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if player.status == 'Engaged' then
			slot_lock()
			-- Equip appropriate TP set
				previous_set()
		else
			slot_lock()
			equip(sets.idle.Standard)
		end
	end
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function previous_set(spell)
	if player.equipment.range == "Yoichinoyumi" then
		if Mode == 0 then
			equip(sets.TP.Bow)
			windower.add_to_chat(121,'Bow TP Set')
		elseif Mode == 1 then 
			equip(sets.TP.Bow.Acc)
			windower.add_to_chat(121,'Bow Acc Set')
		elseif Mode == 2 then 
			equip(sets.TP.Bow.Buffed)
			windower.add_to_chat(121,'Buffed Bow Acc Set')
		end		
	else
		if Mode == 0 then
			equip(sets.TP)
			windower.add_to_chat(121,'TP Set')
		elseif Mode == 1 then 
			equip(sets.TP.Acc)
			windower.add_to_chat(121,'Acc Set')
		elseif Mode == 2 then 
			equip(sets.TP.Buffed)
			windower.add_to_chat(121,'Buffed Set')
		end
	end
end

function slot_lock()
    -- Twilight Helm/Mail logic
    if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail'then
        disable('head','body')
		windower.add_to_chat(121,'Twilight Locked')
    else
        enable('head','body')
    end
    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(121,'Reraise Earring equiped on left ear')
    elseif player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(121,'Reraise Earring equiped on right ear')
    else
        enable('left_ear','right_ear')
=======
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Third Eye' and not buffactive.Seigan then
        cancel_spell()
        send_command('@wait 0.5;input /ja Seigan <me>')
        send_command('@wait 1;input /ja "Third Eye" <me>')
    end
end
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type:lower() == 'weaponskill' then
		if state.Buff.Sekkanoki then
			equip(sets.buff.Sekkanoki)
		end
		if state.Buff.Sengikori then
			equip(sets.buff.Sengikori)
		end
		if state.Buff['Meikyo Shisui'] then
			equip(sets.buff['Meikyo Shisui'])
		end
	end
    if spell.english == "Third Eye" then
        -- Third Eye gearset is only called if we're in PDT mode
        if state.DefenseMode == 'PDT' then
            equip(sets.thirdeye)
        end
    end
    if spell.name == 'Spectral Jig' and buffactive.sneak then
            -- If sneak is active when using, cancel before completion
            send_command('cancel 71')
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		equip(sets.midcast.FastRecast)
	end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	-- Effectively lock these items in place.
	if state.DefenseMode == 'Reraise' or
		(state.Defense.Active and state.Defense.Type == 'Physical' and state.Defense.PhysicalMode == 'Reraise') then
		equip(sets.Reraise)
	end
    if state.Buff['Third Eye'] then
        if state.DefenseMode == 'PDT' then
            equip(sets.thirdeye)
        end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if not spell.interrupted then
		if state.Buff[spell.english] ~= nil then
			state.Buff[spell.english] = true
		end

	end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff['Third Eye'] then
        if state.DefenseMode == 'PDT' then
    	    meleeSet = set_combine(meleeSet, sets.thirdeye)
        end
    end
    if player.equipment.range == 'Yoichinoyumi' then
        meleeSet = set_combine(meleeSet, sets.bow)
    end
    return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Engaged' and state.DefenseMode == 'PDT' then
        if state.Buff['Third Eye'] then
            equip(sets.thirdeye)
        end
    end
    -- prevents equipping gear
    --if seigan_thirdeye_active() then
        --eventArgs.handled = true
    --end
end
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    --if S{'madrigal','march'}:contains(buff:lower()) then
    	--handle_equipping_gear(player.status)
    if state.Buff[buff] ~= nil then
    	state.Buff[buff] = gain
        -- if seign or TE is up, don't swap
        if not seigan_thirdeye_active() then
            handle_equipping_gear(player.status)
        end
    end
end

-- Called when the player's subjob changes.
function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	state.CombatForm = get_combat_form()
    state.CombatWeapon = get_combat_weapon()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function get_combat_weapon()
    if player.equipment.range == 'Yoichinoyumi' then
        return 'Yoichi'
    end
end

function get_combat_form()
    if areas.Adoulin:contains(world.area) and buffactive.ionis then
    	return 'Adoulin'
    end
end

function seigan_thirdeye_active()
    return state.Buff['Seigan'] or state.Buff['Third Eye']
end

function determine_bow()
    classes.CustomMeleeGroups:clear()
    if player.equipment.range == 'Yoichinoyumi' then
        add_to_chat(121,'Yoichinoyumi Equipped!')
    	classes.CustomMeleeGroups:append('Yoichi')
    end
end
-- will try and bend this to work for cor rolls
--windower.register_event('incoming text', function(original, new, color)
--    local name, count = original:match('Additional effect: Treasure Hunter effectiveness against the (.*) increases to (%d+).')
--    if name and count then
--        mob = name
--        th:text(' '..name..'\n TH: '..count);
--        th:show()
--    end
--
--    name = original:match('%w+ defeats the (.*).')
--    if name and mob == name then
--        th:text('')
--        th:hide()
--    end
--end)

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
    	set_macro_page(1, 1)
    elseif player.sub_job == 'DNC' then
    	set_macro_page(1, 2)
    else
    	set_macro_page(1, 1)
>>>>>>> 350651d138613e0284a151783dde05907eb9fe78
    end
end

