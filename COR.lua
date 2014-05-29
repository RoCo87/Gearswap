<<<<<<< HEAD
-- Feary's COR LUA
-- Created: 3/10/2014
-- Last Updated: 4/22/2014
-- To Do List
-- Triple Shot?
--
--
--includes
	include('include/functions.lua')
	
-- Gear Sets 
function get_sets()
	-- Ammo 
	-- Rare Quick Draw Ammo
	QDBullets = T{"Omphalos Bullet","Animikii Bullet"}
	-- Ammo
	QDBullet = {ammo="Animikii Bullet"}
	TPBullet = {ammo="Bullet"}
	WSBullet = {ammo="Achiyal. Bullet"}
	MBullet = {ammo="Bullet"}
	-- Luzaf's Ring - 1 to use
	luzaf = 1
	
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
-- Get COR Gearsets
	include('Gearsets/COR_Gearsets.lua')   

end
-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

function self_command(command)
   -- Lock PDT
	if command == 'PDT' then
		if PDT == 1 then
			-- make sure other values are set to default
			-- Unlock PDT/MDT Variables
			PDT = 0
			MDT = 0
			-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121,'PDT Set UnLocked')
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
		-- Unlock PDT/MDT Variables
			PDT = 0
			MDT = 0
			-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
			windower.add_to_chat(121,'MDT Set UnLocked')
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
			windower.add_to_chat(121,'PDT/MDT Set UnLocked')
		else
			if Mode >= 3 then
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
				if Mode == 0 then
					windower.add_to_chat(121,'Melee TP Set')
				elseif Mode == 1 then
					windower.add_to_chat(121,'Ranged TP Set')
				elseif Mode == 2 then
					windower.add_to_chat(121,'Melee Acc TP Set')
				elseif Mode == 3 then
					windower.add_to_chat(121,'Ranged Acc TP Set')
				end
				equip(sets.idle.Standard)
			end
		end
	elseif commmand == "luzaf" then
		if lufaz == 1 then
			lufaz = 0
		else
			lufaz = 1
		end
	end
end

-- Gain or lose buffs 
function buff_change(buff,g_or_l)
	include('include/status.lua')
	-- gain = true losebuff = false
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
		if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
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
		else
			-- Equip previous TP set 
				previous_set()
		end
    end
end

function precast(spell,arg)
-- Range Attack 
    if spell.name == 'Ranged' then
		-- Check for Rare Quick Draw Bullet
		if QDBullets:contains(player.equipment.ammo) then
			windower.add_to_chat(121, 'Canceled RA - '..player.equipment.ammo..' Equipped')
			equip(TPBullet)
			cancel_spell()
		else
			equip(sets.precast.Snapshot)
		end
-- Cor Rolls
	elseif spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
		if player.inventory["Luzaf's Ring"] or player.wardrobe["Luzaf's Ring"] and luzaf == 1 then
			if spell.english:wcmatch('Caster\'s Roll|Courser\'s Roll|Blitzer\'s Roll|Tactician\'s Roll|Allies\' Roll') then
				equip(sets.precast.JA[spell.name],{rring="Luzaf's Ring"})
			else
				equip(sets.precast.JA["Phantom Roll"],{rring="Luzaf's Ring"})
			end
		else
			if spell.english:wcmatch('Caster\'s Roll|Courser\'s Roll|Blitzer\'s Roll|Tactician\'s Roll|Allies\' Roll') then
				equip(sets.precast.JA[spell.name])
			else
				equip(sets.precast.JA["Phantom Roll"])
			end
		end
-- Quick Draw
	elseif spell.type == "CorsairShot" then
		if spell.english:wcmatch('Dark Shot|Light Shot') then
			equip(sets.precast.QD.ACC,QDBullet)
		else
			equip(sets.precast.QD.MAB,QDBullet)
		end
-- JobAbility
	elseif spell.type == "JobAbility" then
		-- Generic equip command for all Job Abilities and Weaponskills
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	elseif spell.type == "WeaponSkill" then
		-- Ranged Weaponskills
		if ranged_weaponskills:contains(spell.name) then
			if player.status == 'Engaged' then
				if player.TP >= 100 then
					if spell.target.distance >= ranged_weaponskills.Distance[spell.name] then
						if sets.precast.RAWS[spell.name] then
							equip(sets.precast.RAWS[spell.name])
						else
							equip(sets.precast.RAWS)
						end
					else
						cancel_spell()
						windower.add_to_chat(121,''..spell.target..'is too far to ws')
					end
				else 
					cancel_spell()
					windower.add_to_chat(121, ''..player.TP..'TP is not enough to WS')
				end
			else
				windower.add_to_chat(121, 'You must be Engaged to WS')
				cancel_spell()
			end
		else
			-- Melee Weaponskills
			if player.status == 'Engaged' then
				if player.TP >= 100 then
					if spell.target.distance <= 5 then
						if sets.precast.WS[spell.name] then
							equip(sets.precast.WS[spell.name])
						else
							equip(sets.precast.WS)
						end
					else
						cancel_spell()
						windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
					end
				else 
					cancel_spell()
					windower.add_to_chat(121, ''..player.TP..'TP is not enough to WS')
				end
			else
				cancel_spell()
				windower.add_to_chat(121, 'You must be Engaged to WS')
			end
		end
	elseif spell.type == "Ninjustu" then
		-- Magic spell gear handling(Precast)
		if spell.skill == 'Ninjutsu' then
			equip(sets.precast.Fastcast)
			if windower.wc_match(spell.name,'Utsusemi*') then
				equip(sets.misc.Utsusemi)
			end
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
		elseif windower.wc_match(spell.name,'*Flourish') then
			equip(sets.misc.flourish)
		end
	end
end

function midcast(spell,arg)
    if spell.name == 'Ranged' then
		if buffactive.Barrage then
            equip(sets.precast.JA["Barrage"])
        end
		-- Acc Sets 
		if Mode == 1 or Mode == 3 then
			if player.equipment.range == "Armageddon" then
				equip(sets.RA.Armageddon.Acc)
			elseif player.equipment.range == "Eminent Gun" then
				equip(sets.RA.Acc)
			end
		else
			if player.equipment.range == "Armageddon" then
				equip(sets.RA.Armageddon)
			elseif player.equipment.range == "Eminent Gun" then
				equip(sets.RA)
			end
		end
    end

	if spell.type == "Ninjutsu" then
		-- Gear change to Damage Taken set when in midcast of Utsusemi
		-- Special handling to remove Utsusemi, Sneak, and Stoneskin effects if they are active
		if windower.wc_match(spell.name,'Utsusemi*') then
			equip(sets.misc.Utsusemi)
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
-- Auto sets
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if PDT == 1 or MDT == 1 or buffactive['Weakness'] then
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
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		end
	end
   -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    end
end

function previous_set()
	slot_lock()
	if Mode == 0 then
		equip(sets.TP)
		windower.add_to_chat(121,'Melee TP Set')
	elseif Mode == 1 then
		if player.equipment.range == "Armageddon" then
			equip(sets.RA.Armageddon)
		elseif player.equipment.range == "Eminent Gun" then
			equip(sets.RA)
		end
		windower.add_to_chat(121,'Ranged TP Set')
	elseif Mode == 2 then
		equip(sets.TP.Acc)
		windower.add_to_chat(121,'Melee Acc TP Set')
	elseif Mode == 3 then
		if player.equipment.range == "Armageddon" then
			equip(sets.RA.Armageddon.Acc)
		elseif player.equipment.range == "Eminent Gun" then
			equip(sets.RA.Acc)
		end
		windower.add_to_chat(121,'Ranged Acc TP Set')
	end		
end

function slot_lock()
    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on left ear')
    elseif player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on right ear')
    else
        enable('left_ear','right_ear')
    end
end
=======
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file to go with this.

--[[
	gs c toggle luzaf -- Toggles use of Luzaf Ring on and off
	
	Offense mode is melee or ranged.  Used ranged offense mode if you are engaged
	for ranged weaponskills, but not actually meleeing.
	Acc on offense mode (which is intended for melee) will currently use .Acc weaponskill
	mode for both melee and ranged weaponskills.  Need to fix that in core.
--]]


-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	-- Whether to use Luzaf's Ring
	state.LuzafRing = false
	state.warned = false

	define_roll_values()
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.OffenseModes = {'Ranged', 'Melee', 'Acc'}
	options.RangedModes = {'Normal', 'Acc'}
	options.WeaponskillModes = {'Normal', 'Acc', 'Att', 'Mod'}
	options.CastingModes = {'Normal', 'Resistant'}
	options.IdleModes = {'Normal'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.Defense.PhysicalMode = 'PDT'

	gear.RAbullet = "Adlivun Bullet"
	gear.WSbullet = "Adlivun Bullet"
	gear.MAbullet = "Adlivun Bullet"
	gear.QDbullet = "Animikii Bullet"
	--gear.QDbullet = "Adlivun Bullet"
	options.ammo_warning_limit = 15

	-- Additional local binds
	-- Cor doesn't use hybrid defense mode; using that for ranged mode adjustments.
	send_command('bind ^f9 gs c cycle RangedMode')

	send_command('bind ^` input /ja "Double-up" <me>')
	send_command('bind !` input /ja "Bolter\'s Roll" <me>')


	-- Default macro set/book
	set_macro_page(6, 1)
end


-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end

	send_command('unbind ^`')
	send_command('unbind !`')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets

	-- Precast sets to enhance JAs
	
	sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +2"}
	sets.precast.JA['Snake Eye'] = {legs="Commodore Culottes +1"}
	sets.precast.JA['Wild Card'] = {feet="Commodore Bottes +2"}
	sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
	sets.precast.JA['Fold'] = {body="Commodore Gants +2"}

	
	sets.precast.CorsairRoll = {head="Commodore's Tricorne +1",hands="Navarch's Gants +2"}
	
	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +1"})
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Navarch's Bottes +2"})
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne +1"})
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Navarch's Frac +2"})
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Navarch's Gants +2"})
	
	sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
	
	sets.precast.CorsairShot = {}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Whirlpool Mask",
		body="Iuitl Vest",
        hands="Iuitl Wristbands +1",
		legs="Nahtirah Trousers",
        feet="Iuitl Gaiters"
    }
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


	sets.precast.RangedAttack = {
        ammo=gear.RAbullet,
		hands="Iuitl Wristbands +1",
		back="Navarch's Mantle",
        waist="Impulse Belt",
        legs="Nahtirah Trousers",
        feet="Wurrukatte Boots"
    }
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Lithelimb Cap",
        neck=gear.ElementalGorget,
        ear1="Volley Earring",
        ear2="Clearview Earring",
		body="Lanun Frac",
        hands="Iuitl Wristbands +1",
        ring1="Rajas Ring",
        ring2="Stormsoul Ring",
		back="Buquwik Cape",
        waist=gear.ElementalBelt,
        legs="Nahtirah Trousers",
        feet="Iuitl Gaiters"
    }


	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = sets.precast.WS

	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
        ammo=gear.WSbullet,
        body="Iuitl Vest",
        ear1="Flame Pearl",
        ear2="Flame Pearl"
    })
	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {
        ammo=gear.WSbullet,
        body="Navarch's Frac +2",
        ear1="Volley Earring",
        ear2="Clearview Earring",
        back="Libeccio Mantle",
        ring1="Hajduk Ring",
        ring2="Paqichikaji Ring"
    })

	sets.precast.WS['Wildfire'] = {
        ammo=gear.MAbullet,
		head="Umbani Cap",
        neck="Stoicheion Medal",
        ear1="Crematio Earring",
        ear2="Friomisi Earring",
		body="Lanun Frac",
        hands="Iuitl Wristbands +1",
        ring1="Acumen Ring",
        ring2="Stormsoul Ring",
		back="Toro Cape",
        waist="Aquiline Belt",
        legs="Shneddick Tights",
        feet="Iuitl Gaiters"
    }

	sets.precast.WS['Leaden Salute'] = sets.precast.WS['Wildfire']
	
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Whirlpool Mask",
		body="Iuitl Vest",
        hands="Iuitl Wristbands +1",
		legs="Iuitl Tights",
        feet="Iuitl Gaiters"
    }
		
	-- Specific spells
	sets.midcast.Utsusemi = sets.midcast.FastRecast

	sets.midcast.CorsairShot = {
        ammo=gear.QDbullet,
		head="Umbani Cap",
        neck="Atzintli Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
		body="Lanun Frac",
        hands="Iuitl Wristbands +1",
        ring1="Acumen Ring",
        ring2="Stormsoul Ring",
		back="Toro Cape",
        waist="Aquiline Belt",
        legs="Shneddick Tights",
        feet="Navarch's Bottes +2"
    }

	sets.midcast.CorsairShot.Acc = set_combine(sets.midcast.CorsairShot, {
        head="Umbani Cap",
        hands="Sigyn's Bazubands",
		body="Navarch's Frac +2",
        ear1="Lifestorm Earring",
        ear2="Psystorm Earring",
        back="Navarch's Mantle"
    })

    sets.midcast.CorsairShot['Light Shot'] = sets.midcast.CorsairShot.Acc
	sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']


	-- Ranged gear
	sets.midcast.RangedAttack = {
        ammo=gear.RAbullet,
		head="Umbani Cap",
        neck="Ocachi Gorget",
        ear1="Clearview Earring",
        ear2="Volley Earring",
		body="Lanun Frac",
        hands="Sigyn's Bazubands",
        ring1="Rajas Ring",
        ring2="Hajduk Ring",
		back="Libeccio Mantle",
        waist="Commodore Belt",
        legs="Aetosaur Trousers +1",
        feet="Iuitl Gaiters"
    }

	sets.midcast.RangedAttack.Acc = set_combine(sets.midcast.RangedAttack, {
        neck="Iqabi Necklace",
        hands="Navarch's Gants +2",
        ring1="Paqichikaji Ring"
    })
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {ring2="Paguroidea Ring"}

	-- Idle sets
	sets.idle = {
        ammo=gear.RAbullet,
		head="Lithelimb Cap",
        neck="Twilight Torque",
        ear1="Volley Earring",
        ear2="Clearview Earring",
		body="Lanun Frac",
        hands="Iuitl Wristbands +1",
        ring1="Patricius Ring",
        ring2="Dark Ring",
		back="Shadow Mantle",
        waist="Commodore Belt",
        legs="Crimson Cuisses",
        feet="Iuitl Gaiters"
    }

	sets.idle.Town = {
        range="Vanir Gun",
        ammo=gear.RAbullet,
		head="Lithelimb Cap",
        neck="Ocachi Gorget",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
		body="Navarch's Frac +2",
        hands="Sigyn's Bazubands",
        ring1="Dark Ring",
        ring2="Paguroidea Ring",
		back="Shadow Mantle",
        waist="Commodore Belt",
        legs="Crimson Cuisses",
        feet="Iuitl Gaiters"}
	
	-- Defense sets
	sets.defense.PDT = set_combine(sets.idle, {
        head="Lithelimb Cap",
        neck="Twilight Torque",
		legs="Nahtirah Trousers"
    })

	sets.defense.MDT = sets.defense.PDT

	sets.Kiting = {legs="Crimson Cuisses"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged.Melee = {
        ammo=gear.RAbullet,
		head="Whirlpool Mask",
        neck="Iqabi Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
		body="Thaumas Coat",
        hands="Iuitl Wristbands +1",
        ring1="Patricius Ring",
        ring2="Epona's Ring",
		back="Atheling Mantle",
        waist="Cetl Belt",
        legs="Manibozho Brais",
        feet="Manibozho Boots"
    }
	
	sets.engaged.Acc = set_combine(sets.engaged.Melee, {
        ring2="Mars's Ring",
        waist="Hurch'lan Sash"
    })

	sets.engaged.Melee.DW = set_combine(sets.engaged.Melee, {
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        waist="Nusku's Sash"
    })

	sets.engaged.Acc.DW = set_combine(sets.engaged.Melee.DW, {
        ear1="Dudgeon Earring",ear2="Heartseeker Earring",waist="Hurch'lan Sash"
    })

	sets.engaged.Ranged = {
        ammo=gear.RAbullet,
		head="Navarch's tricorne +1",
        neck="Ocachi Gorget",
        ear1="Clearview Earring",
        ear2="Volley Earring",
		body="Navarch's Frac +2",
        hands="Iuitl Wristbands +1",
        ring1="Rajas Ring",
        ring2="Hajduk Ring",
		back="Navarch's Mantle",
        waist="Commodore Belt",
        legs="Nahtirah Trousers",
        feet="Iuitl Gaiters"
    }
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	-- Check that proper ammo is available if we're using ranged attacks or similar.
	if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
		do_bullet_checks(spell, spellMap, eventArgs)
	end

	-- gear sets
	if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing then
		equip(sets.precast.LuzafRing)
	elseif spell.type == 'CorsairShot' and state.CastingMode == 'Resistant' then
		classes.CustomClass = 'Acc'
	elseif spell.type == 'Waltz' then
		refine_waltz(spell, action, spellMap, eventArgs)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.type == 'CorsairRoll' and not spell.interrupted then
		display_roll_info(spell)
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, action, default_wsmode)
	--if buffactive['Transcendancy'] then
	--	return 'Brew'
	--end
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
	if newStatus == 'Engaged' and player.equipment.main == 'Chatoyant Staff' then
		state.OffenseMode = 'Ranged'
	end
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)

end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	if newStatus == 'Engaged' and player.equipment.main == 'Chatoyant Staff' then
		state.OffenseMode = 'Ranged'
	end
end

-- Job-specific toggles.
function job_toggle(field)
	if field:lower() == 'luzaf' then
		state.LuzafRing = not state.LuzafRing
		return "Use of Luzaf Ring", state.LuzafRing
	end
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
	local defenseString = ''
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end

		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
	end
	
	local rollsize = 'Small'
	if state.LuzafRing then
		rollsize = 'Large'
	end
	
	local pcTarget = ''
	if state.PCTargetMode ~= 'default' then
		pcTarget = ', Target PC: '..state.PCTargetMode
	end

	local npcTarget = ''
	if state.SelectNPCTargets then
		pcTarget = ', Target NPCs'
	end
	

	add_to_chat(122,'Offense: '..state.OffenseMode..', Ranged: '..state.RangedMode..', WS: '..state.WeaponskillMode..
		', Quick Draw: '..state.CastingMode..', '..defenseString..'Kiting: '..on_off_names[state.Kiting]..
		', Roll Size: '..rollsize..pcTarget..npcTarget)

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
	rolls = {
		["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
		["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
		["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
		["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
		["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
		["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
		["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
		["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
		["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
		["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
		["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
		["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
		["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
		["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
		["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
		["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
		["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
		["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
		["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
		["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
		["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
		["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
		["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
		["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
		["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
		["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
		["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
		["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
		["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
	}
end

function display_roll_info(spell)
	rollinfo = rolls[spell.english]
	local rollsize = 'Small'
	if state.LuzafRing then
		rollsize = 'Large'
	end
	if rollinfo then
		add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
		add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
	end
end

-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)
	local bullet_name
	local bullet_min_count = 1
	
	if spell.type == 'WeaponSkill' then
		if spell.skill == "Marksmanship" then
			if spell.element == 'None' then
				-- physical weaponskills
				bullet_name = gear.WSbullet
			else
				-- magical weaponskills
				bullet_name = gear.MAbullet
			end
		else
			-- Ignore non-ranged weaponskills
			return
		end
	elseif spell.type == 'CorsairShot' then
		bullet_name = gear.QDbullet
	elseif spell.action_type == 'Ranged Attack' then
		bullet_name = gear.RAbullet
		if buffactive['Triple Shot'] then
			bullet_min_count = 3
		end
	end
	
	local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
	
	-- If no ammo is available, give appropriate warning and end.
	if not available_bullets then
		if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
			add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
			return
		elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
			add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
			return
		else
			add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
			eventArgs.cancel = true
			return
		end
	end
	
	-- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
	if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
		add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
		eventArgs.cancel = true
		return
	end
	
	-- Low ammo warning.
	if spell.type ~= 'CorsairShot' and not state.warned
	    and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
		add_to_chat(104, '*****************************')
		add_to_chat(104, '*****  LOW AMMO WARNING *****')
		add_to_chat(104, '*****************************')
		state.warned = true
	elseif available_bullets.count > options.ammo_warning_limit and state.warned then
		state.warned = false
	end
end

>>>>>>> 350651d138613e0284a151783dde05907eb9fe78
