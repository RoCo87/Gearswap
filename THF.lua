<<<<<<< HEAD
-- Feary's THF LUA
-- Date: 4/5/2014
-- To Do:
--	Account for Hide + SA or TA
-- 	account for sata?
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
	-- Get THF Gearsets
	include('Gearsets/THF_Gearsets.lua')
	
-- Define Default Values for Variables
	TH = 0
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
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
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
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
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
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
			end
		else
			if Mode >= 4 then
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
				if Mode == 4 then
					equip(sets.idle.Standard,sets.idle.Evasion)
				else
					equip(sets.idle.Standard)
				end
			end
		end
	elseif command == 'TH' then
		if TH == 0 then
			TH = 1
			windower.add_to_chat(121,'Treasure Hunter Locked')
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard,sets.TH)	
			end
		else
			TH = 0
			windower.add_to_chat(121,'Treasure Hunter Unlocked')
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)	
			end
		end
	end
end
	
function status_change(new,old)
-- Autoset
    if T{'Idle','Resting'}:contains(new) then
		windower.add_to_chat(121,'Idle/Resting Set')
		if TH == 1 then
			if Mode == 4 then
				equip(sets.idle.Standard,sets.idle.Evasion,sets.TH)
			else
				equip(sets.idle.Standard,sets.TH)
			end
		else
			if Mode == 4 then
				equip(sets.idle.Standard,sets.idle.Evasion)
			else
				equip(sets.idle.Standard)
			end
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
		else
			previous_set()
		end
	end
end

-- Gain or lose buffs 
function buff_change(buff,g_or_l)
-- Sneak Attack
	if buff == 'Sneak Attack' and g_or_l == false then
		previous_set()
	end
-- Trick Attack
	if buff == 'Trick Attack' and g_or_l == false then
       previous_set()
	end

-- Flee
	if buff == 'Flee' and g_or_l == true then
		if Mode == 4 then
		 equip(sets.idle.PDT,sets.idle.Evasion,{feet="Pillager's Poulaines"})
		else
			equip(sets.idle.PDT,{feet="Pillager's Poulaines"})
		end
	end
	if buff == 'Flee' and g_or_l == false then
		if Mode == 4 then
			equip(sets.idle.PDT,sets.idle.Evasion,{feet="Pillager's Poulaines"})
		else
			equip(sets.idle.PDT,{feet="Pillager's Poulaines"})
		end
	end
	
-- Feint
	if buff == 'Feint' and g_or_l == false then
        equip({legs="Plunderer's Culottes"})
		if player.status == 'Engaged' then
			previous_set()
		else	
			if Mode == 4 then
				equip(sets.idle.Standard,sets.idle.Evasion)
			else
				equip(sets.idle.Standard)
			end
		end
	end
end

function precast(spell,arg)
 -- Generic equip command for all Job Abilities and Weaponskills
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			if S{'Sneak Attack', 'Trick Attack'}:contains(spell.english) then
				if spell.english == "Sneak Attack" then
					if TH == 1 then
						if buffactive['Feint'] then
							equip(sets.precast.JA["Sneak Attack"],sets.TH,{legs="Plunderer's Culottes"})
						else
							equip(sets.precast.JA["Sneak Attack"],sets.TH)
						end
					else
						if buffactive['Feint'] then
							equip(sets.precast.JA["Sneak Attack"],{legs="Plunderer's Culottes"})
						else
							equip(sets.precast.JA["Sneak Attack"])
						end
					end
				end
				if spell.english == "Trick Attack" then
					if TH == 1 then
						if buffactive['Feint'] then
							equip(sets.precast.JA["Trick Attack"],sets.TH,{legs="Plunderer's Culottes"})
						else
							equip(sets.precast.JA["Trick Attack"],sets.TH)
						end
					else
						if buffactive['Feint'] then
							equip(sets.precast.JA["Trick Attack"],{legs="Plunderer's Culottes"})
						else
							equip(sets.precast.JA["Trick Attack"])
						end
					end
				end
			else
				equip(sets.precast.JA[spell.name])
			end
		end
   elseif spell.type == 'Weaponskill' then
		if  player.status == 'Engaged' then
			if player.TP >= 100 then
				if spell.target.distance <= 5 then
					if spell.english:wcmatch("Mercy Stroke|Rudra's Storm") then
						if buffactive["Sneak Attack"] then
							equip(sets.precast.WS.SA[spell.name])
						elseif buffactive["Trick Attack"] then
							equip(sets.precast.WS.TA[spell.name])
						else
							cancel_spell()
							windower.add_to_chat(121,'Cancelled - '..spell.name..' - Need to Stack with Sneak Attack or Trick Attack')
						end
					else
						if Mode >= 1 then
							if sets.precast.WS.Acc[spell.name] then
								equip(sets.precast.WS.Acc[spell.name])
							else
								equip(sets.precast.WS)
							end
						else
							if sets.precast.WS[spell.name] then
								equip(sets.precast.WS[spell.name])
							else
								equip(sets.precast.WS)
							end
						end
					end
				else
					cancel_spell()
					windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
				end
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.TP..'tp is Not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
 -- Ninjutsu spell gear handling(Precast)
    elseif spell.skill == 'Ninjutsu' then
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
			equip(sets.TP.Acc)
		end
	end
end

function midcast(spell,arg)
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

function aftercast(spell,arg)
-- Autoset
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if player.status == 'Engaged' then
			if S{'Sneak Attack', 'Trick Attack', 'Feint'}:contains(spell.english) then
				-- Do nothing 
			else
				-- Equip Previous TP set
				previous_set()
			end
		else
			if buffactive["Flee"] then
				equip(sets.idle.Standard,{feet="Pillager's Poulaines"})
			else
				if not S{'Sneak Attack', 'Trick Attack', 'Feint'}:contains(spell.english) then
					if Mode == 4 then
						equip(sets.idle.Standard,sets.idle.Evasion)
					else
						equip(sets.idle.Standard)
					end
				end
			end
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
	if TH == 1 then
		if buffactive["Feint"] then
			if Mode == 0 then
				equip(sets.TP,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.Acc,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Buffed,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Hybrid Evasion Set')
			elseif Mode == 4 then
					equip(sets.idle.Evasion,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Full Evasion Lock')
			end	
		else
			if Mode == 0 then
				equip(sets.TP,sets.TH)
				windower.add_to_chat(121,'TH locked - TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.Acc,sets.TH)
				windower.add_to_chat(121,'TH locked - Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Buffed,sets.TH)
				windower.add_to_chat(121,'TH locked - Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid,sets.TH)
				windower.add_to_chat(121,'TH locked - Hybrid Evasion Set')
			elseif Mode == 4 then
				equip(sets.idle.Evasion,sets.TH)
				windower.add_to_chat(121,'TH locked - Full Evasion Set')
			end	
		end
	else
		if buffactive["Feint"] then
			if Mode == 0 then
				equip(sets.TP,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Feint - TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.Acc,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Feint - Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Buffed,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Feint - Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Fient - Hybrid Evasion Set')
			elseif Mode == 4 then
				equip(sets.idle.Evasion,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Fient - Full Evasion Set')
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
				windower.add_to_chat(121,'Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid)
				windower.add_to_chat(121,'Hybrid Evasion Set')
			elseif Mode == 4 then
				equip(sets.idle.Evasion)
				windower.add_to_chat(121,'Full Evasion Set')
			end		
		end
	end	
=======
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
	state.Buff['Trick Attack'] = buffactive['trick attack'] or false
	state.Buff['Feint'] = buffactive['feint'] or false
	
	-- TH mode handling
	options.TreasureModes = {'None','Tag','SATA','Fulltime'}
	state.TreasureMode = 'Tag'

	tag_with_th = false	
	tp_on_engage = 0
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.OffenseModes = {'Normal', 'Acc', 'iLvl'}
	options.DefenseModes = {'Normal', 'Evasion', 'PDT'}
	options.RangedModes = {'Normal', 'TH', 'Acc'}
	options.WeaponskillModes = {'Normal', 'Acc', 'Att', 'Mod'}
	options.IdleModes = {'Normal'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'Evasion', 'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.RangedMode = 'TH'
	state.Defense.PhysicalMode = 'Evasion'

	-- Additional local binds
	send_command('bind ^` input /ja "Flee" <me>')
	send_command('bind ^= gs c cycle treasuremode')
	send_command('bind !- gs c cycle targetmode')

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
	
	sets.TreasureHunter = {hands="Plunderer's Armlets +1", feet="Raider's Poulaines +2"}
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Collaborator'] = {}
	sets.precast.JA['Accomplice'] = {}
	sets.precast.JA['Flee'] = {}
	sets.precast.JA['Hide'] = {}
	sets.precast.JA['Conspirator'] = {} -- {body="Raider's Vest +2"}
	sets.precast.JA['Steal'] = {}
	sets.precast.JA['Despoil'] = {}
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
	sets.precast.JA['Feint'] = {hands="Plunderer's Armlets +1"} -- {legs="Assassin's Culottes +2"}
	
	sets.precast.JA['Sneak Attack'] = {
		head="Uk'uxkaj Cap",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
		body="Manibozho Jerkin",
        hands="Raider's Armlets +2",
        ring1="Thundersoul Ring",
        ring2="Epona's Ring",
		back="Atheling Mantle",
        waist="Cetl Belt",
        legs="Manibozho Brais",
        feet="Qaaxo Leggings"
    }

	sets.precast.JA['Trick Attack'] = {
		head="Felistris Mask",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
		body="Manibozho Jerkin",
        hands="Iuitl Wristbands +1",
        ring1="Stormsoul Ring",
        ring2="Epona's Ring",
		back="Canny Cape",
        waist="Elanid Belt",
        legs="Nahtirah Trousers",
        feet="Iuitl Gaiters"
    }


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Whirlpool Mask",
		legs="Nahtirah Trousers",
        feet="Iuitl Gaiters"
    }
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- Fast cast sets for spells
	
	sets.precast.FC = {}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Ranged snapshot gear
	sets.precast.RangedAttack = {hands="Iuitl Wristbands +1",legs="Nahtirah Trousers"}

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	gear.default.weaponskill_neck = "Asperity Necklace"
	gear.default.weaponskill_waist = "Cetl Belt"
	sets.precast.WS = {
		head="Felistris Mask",
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
		body="Qaaxo Harness",
        hands="Iuitl Wristbands +1",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
		back="Atheling Mantle",
        waist="Elanid Belt",
        legs="Nahtirah Trousers",
        feet="Qaaxo Leggings"
    }
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
            head="Whirlpool Mask",
            back="Canny Cape"
    })

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
            neck="Breeze Gorget",
            ring1="Stormsoul Ring",
		    legs="Nahtirah Trousers", 
            waist="Elanid Belt"
    })
	sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {
            head="Whirlpool Mask",
            back="Canny Cape"
    })
	sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {waist="Thunder Belt"})
	sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {neck="Breeze Gorget"})
	sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {neck="Breeze Gorget"})
	sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {neck="Breeze Gorget"})

	sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {neck="Breeze Gorget", waist="Thunder Belt"})
	sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {head="Whirlpool Mask"})
	sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {waist="Thunder Belt"})
	sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {neck="Breeze Gorget"})
	sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {neck="Breeze Gorget"})
	sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {neck="Breeze Gorget"})

	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
            head="Uk'uxkaj Cap",
            neck="Shadow Gorget",
		    ear1="Brutal Earring",
            ear2="Trux Earring",
            ring1="Thundersoul Ring",
            waist="Light Belt",
            back="Rancorous Mantle"
    })
	sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {
            head="Whirlpool Mask",
            back="Canny Cape"
    })
	sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {waist="Soil Belt"})
	sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {neck="Shadow Gorget"})
	sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {neck="Shadow Gorget"})
	sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {neck="Shadow Gorget"})

	sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {neck="Breeze Gorget",
		ear1="Brutal Earring",ear2="Trux Earring"})
	sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {head="Whirlpool Mask"})
	sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {waist="Thunder Belt"})
	sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {neck="Breeze Gorget"})
	sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {neck="Breeze Gorget"})
	sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {neck="Breeze Gorget"})

	sets.precast.WS['Aeolian Edge'] = {
		neck="Atzintli Necklace",
        ear1="Friomisi Earring",
        ear2="Hecate's Earring",
		body="Manibozho Jerkin",
        hands="Iuitl Wristbands +1",
        ring1="Rajas Ring",
        ring2="Stormsoul Ring",
		back="Toro Cape",
        waist="Thunder Belt",
        legs="Iuitl Tights",
        feet="Iuitl Gaiters"
    }
	
        -- Midcast Sets
	sets.midcast.FastRecast = {
		head="Felistris Mask",
        hands="Iuitl Wristbands +1",
		waist="Hurch'lan Sash"
    }
		
	-- Specific spells
	sets.midcast.Utsusemi = {
		head="Felistris Mask",
        hands="Iuitl Wristbands +1",
		waist="Hurch'lan Sash"
    }

	-- Ranged gear -- acc + TH
	sets.midcast.RangedAttack = {
		head="Uk'uxkaj Cap",
        neck="Huani Collar",
        ear1="Clearview Earring",
        ear2="Volley Earring",
		body="Thaumas Coat",
        hands="Iuitl Wristbands +1",
        ring1="Rajas Ring",
        ring2="Hajduk Ring",
		back="Libeccio Mantle",
        waist="Aquiline Belt",
        legs="Nahtirah Trousers",
        feet="Iuitl Gaiters"
    }

	sets.midcast.RangedAttack.TH = set_combine(sets.midcast.RangedAttack, set.TreasureHunter)

	sets.midcast.RangedAttack.Acc = sets.midcast.RangedAttack
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {ring2="Paguroidea Ring"}
	

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle = {
		head="Felistris Mask",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
		body="Qaaxo Harness",
        hands="Iuitl Wristbands +1",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
		back="Shadow Mantle",
        waist="Patentia Sash",
        legs="Nahtirah Trousers",
        feet="Trotter Boots"
    }

	sets.idle.Town = set_combine(sets.idle, {
        ring1="Patricius Ring",
		back="Canny Cape"
    })
	
	sets.idle.Weak = sets.idle.Town
	
	sets.ExtraRegen = {ring2="Paguroidea Ring"}

	-- Defense sets

	sets.defense.Evasion = {
		head="Felistris Mask",
        neck="Asperity Necklace",
		body="Qaaxo Harness",
        hands="Plunderer's Armlets +1",
        ring1="Patricius Ring",
        ring2="Epona's Ring",
		back="Canny Cape",
        waist="Patentia Sash",
        legs="Iuitl Tights",
        feet="Qaaxo Leggings"
    }

	sets.defense.PDT = {
		head="Lithelimb Cap",
        neck="Twilight Torque",
		body="Qaaxo Harness",
        hands="Iuitl Wristbands +1",
        ring1="Patricius Ring",
        ring2="Epona's Ring",
		back="Shadow Mantle",
        waist="Patentia Sash",
        legs="Iuitl Tights",
        feet="Qaaxo Leggings"
    }

	sets.defense.MDT = {
		head="Whirlpool Mask",
        neck="Twilight Torque",
		body="Qaaxo Harness",
        hands="Iuitl Wristbands +1",
        ring1="Dark Ring",
        ring2="Epona's Ring",
		back="Atheling Mantle",
        waist="Hurch'lan Sash",
        legs="Nahtirah Trousers",
        feet="Qaaxo Leggings"
    }

	sets.Kiting = {feet="Trotter Boots"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
		head="Felistris Mask",
        neck="Asperity Necklace",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
		body="Thaumas Coat",
        hands="Iuitl Wristbands +1",
        ring1="Rajas Ring",
        ring2="Epona's Ring",
		back="Canny Cape",
        waist="Patentia Sash",
        legs="Manibozho Brais",
        feet="Plunderer's Poulaines"
    }
	sets.engaged.Acc = set_combine(sets.engaged, {
		head="Whirlpool Mask",
        neck="Rancor Collar",
        ring1="Patricius Ring",
        hands="Plunderer's Armlets +1",
        waist="Hurch'lan Sash",
        feet="Qaaxo Leggings"
    })
	sets.engaged.iLvl = set_combine(sets.engaged, {
		body="Qaaxo Harness",
        ring1="Patricius Ring"
    })
	sets.engaged.Evasion = set_combine(sets.engaged, {
		body="Qaaxo Harness",
        ring1="Patricius Ring",
        hands="Plunderer's Armlets +1",
        feet="Qaaxo Leggings"
    })
    sets.engaged.Evasion.iLvl = sets.engaged.Evasion
	sets.engaged.Acc.Evasion = set_combine(sets.engaged.Evasion, {
		head="Whirlpool Mask",
        waist="Hurch'lan Sash"
    })
	sets.engaged.PDT = {
		head="Lithelimb Cap",
        neck="Twilight Torque",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
		body="Qaaxo Harness",
        hands="Iuitl Wristbands +1",
        ring1="Dark Ring",
        ring2="Epona's Ring",
		back="Shadow Mantle",
        waist="Patentia Sash",
        legs="Iuitl Tights",
        feet="Qaaxo Leggings"
    }
	sets.engaged.Acc.PDT = sets.engaged.PDT

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'Waltz' then
		refine_waltz(spell, action, spellMap, eventArgs)
	end
    if spell.name == 'Spectral Jig' and buffactive.sneak then
            -- If sneak is active when using, cancel before completion
            send_command('cancel 71')
    end
end


-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'Step' or spell.type == 'Flourish1' then
		if state.TreasureMode ~= 'None' then
			equip(sets.TreasureHunter)
		end
	elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' then
		if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' or tag_with_th then
			equip(sets.TreasureHunter)
		end
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		-- Default base equipment layer of fast recast.
		equip(sets.midcast.FastRecast)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	-- Update the state of certain buff JAs if the action wasn't interrupted.
	if not spell.interrupted then
		if state.Buff[spell.name] ~= nil then
			state.Buff[spell.name] = true
		end
		
		-- Don't let aftercast revert gear set for SA/TA/Feint
		if S{'Sneak Attack', 'Trick Attack', 'Feint'}:contains(spell.english) then
			eventArgs.handled = true
		end
		
		-- If this wasn't an action that would have used up SATA/Feint, make sure to put gear back on.
		if spell.type:lower() ~= 'weaponskill' and spell.type:lower() ~= 'step' then
			-- If SA/TA/Feint are active, put appropriate gear back on (including TH gear).
			if state.Buff['Sneak Attack'] then
				equip(sets.precast.JA['Sneak Attack'])
				if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' or tag_with_th then
					equip(sets.TreasureHunter)
				end
				eventArgs.handled = true
			elseif state.Buff['Trick Attack'] then
				equip(sets.precast.JA['Trick Attack'])
				if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' or tag_with_th then
					equip(sets.TreasureHunter)
				end
				eventArgs.handled = true
			elseif state.Buff['Feint'] then
				equip(sets.precast.JA['Feint'])
				if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' or tag_with_th then
					equip(sets.TreasureHunter)
				end
				eventArgs.handled = true
			end
		end
		
		if spell.target and spell.target.type == 'Enemy' then
			tag_with_th = false
			tp_on_engage = 0
		elseif (spell.type == 'Waltz' or spell.type == 'Samba') and tag_with_th then
			-- Update current TP if we spend TP before we actually hit the mob
			tp_on_engage = player.tp
		end
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets construction.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, action, spellMap)
	local wsmode = ''
	if state.Buff['Sneak Attack'] then
		wsmode = 'SA'
	end
	if state.Buff['Trick Attack'] then
		wsmode = wsmode .. 'TA'
	end
	
	if wsmode ~= '' then
		return wsmode
	end
end

function customize_idle_set(idleSet)
	if player.hpp < 80 then
		idleSet = set_combine(idleSet, sets.ExtraRegen)
	end
	
	return idleSet
end

function customize_melee_set(meleeSet)
	if state.TreasureMode == 'Fulltime' or tag_with_th then
		meleeSet = set_combine(meleeSet, sets.TreasureHunter)
	end
	
	return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
	check_range_lock()
	
	-- If engaging, put on TH gear.
	-- If disengaging, turn off TH tagging.
	if newStatus == 'Engaged' and state.TreasureMode ~= 'None' then
		equip(sets.TreasureHunter)
		tag_with_th = true
		tp_on_engage = player.tp
		send_command('wait 3;gs c update th')
	elseif oldStatus == 'Engaged' then
		tag_with_th = false
		tp_on_engage = 0
	end

	-- If SA/TA/Feint are active, don't change gear sets
	if satafeint_active() then
		eventArgs.handled = true
	end
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain

		if not satafeint_active() then
			handle_equipping_gear(player.status)
		end
	end
end

-- Called when the player's subjob changes.
function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

-------------------------------------------------------------------------------------------------------------------
-- Hooks for TH mode handling.
-------------------------------------------------------------------------------------------------------------------

-- Request job-specific mode tables.
-- Return true on the third returned value to indicate an error: that we didn't recognize the requested field.
function job_get_option_modes(field)
	if field == 'Treasure' then
		return options.TreasureModes, state.TreasureMode
	end
end

-- Set job-specific mode values.
-- Return true if we recognize and set the requested field.
function job_set_option_mode(field, val)
	if field == 'Treasure' then
		state.TreasureMode = val
		return true
	end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	check_range_lock()

	if state.TreasureMode == 'None' then
		tag_with_th = false
		tp_on_engage = 0
	elseif tag_with_th and player.tp ~= tp_on_engage then
		tag_with_th = false
		tp_on_engage = 0
	elseif cmdParams[1] == 'th' and player.status == 'Engaged' then
		send_command('wait 3;gs c update th')
	end
	
	-- Update the current state of state.Buff, in case buff_change failed
	-- to update the value.
	state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
	state.Buff['Trick Attack'] = buffactive['trick attack'] or false
	state.Buff['Feint'] = buffactive['feint'] or false

	-- Don't allow normal gear equips if SA/TA/Feint is active.
	if satafeint_active() then
		eventArgs.handled = true
	end
end


-- Handle notifications of general user state change.
function job_state_change(stateField, newValue)
	if stateField == 'TreasureMode' then
		local prevRangedMode = state.RangedMode
		
		if newValue == 'Tag' or newValue == 'SATA' then
			state.RangedMode = 'TH'
		elseif state.OffenseMode == 'Acc' then
			state.RangedMode = 'Acc'
		else
			state.RangedMode = 'Normal'
		end
		
		if state.RangedMode ~= prevRangedMode then
			add_to_chat(121,'Ranged mode is now '..state.RangedMode)
		end
	elseif stateField == 'OffenseMode' then
		if state.TreasureMode == 'None' or state.TreasureMode == 'Fulltime' then
			local prevRangedMode = state.RangedMode

			if newValue == 'Acc' then
				state.RangedMode = 'Acc'
			else
				state.RangedMode = 'Normal'
			end
			
			if state.RangedMode ~= prevRangedMode then
				add_to_chat(121,'Ranged mode is now '..state.RangedMode)
			end
		end
	elseif stateField == 'Reset' then
		state.RangedMode = 'TH'
	end
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local defenseString = ''
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end

		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..'  '
	end
	
	add_to_chat(122,'Melee: '..state.OffenseMode..'/'..state.DefenseMode..'  WS: '..state.WeaponskillMode..'  '..
		defenseString..'Kiting: '..on_off_names[state.Kiting]..'  TH: '..state.TreasureMode)

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
	if player.equipment.range ~= 'empty' then
		disable('range', 'ammo')
	else
		enable('range', 'ammo')
	end
end

-- Function to indicate if any buffs have been activated that we don't want to equip gear over.
function satafeint_active()
	return state.Buff['Sneak Attack'] or state.Buff['Trick Attack'] or state.Buff['Feint']
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'WAR' then
		set_macro_page(5, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 5)
	else
		set_macro_page(5, 2)
	end
>>>>>>> 350651d138613e0284a151783dde05907eb9fe78
end

