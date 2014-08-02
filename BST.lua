-- Feary's BST LUA
-- Created: 7/26/2014
-- Last Update: 7/26/2014
-- To Do List
--
--
-- includes
	include('include/functions.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	-- Get BST Gearsets
	include('Gearsets/'..player.name..'/BST_Gearsets.lua')

-- Define Default Values for Variables
	PetJug = ""
	PetFood = ""
	Master = 1
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	-- Complete list of Ready moves to use with Sic & Ready Recast -5 Desultor Tassets.
	ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
		'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
		'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
		'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
		'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
		'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
		'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
		'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','1000 Needles',
		'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
		'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
		'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
		'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
		'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
		'Zealous Snort'}

	-- List of Ready buff moves to use with Ferine Manoplas +1 or +2.
	tp_based_moves = S{'Sic','Rage','Rhino Guard','Metallic Body','Bubble Curtain','Scissor Guard','Secretion',
		'Water Wall','Wild Carrot','Fantod','Harden Shell','Zealous Snort'}

	-- List of abilities to reference for applying Treasure Hunter +1 via Chaac Belt.
	TH = S{'Feral Howl','Quickstep','Box Step','Stutter Step','Desperate Flourish','Violent Flourish',
		'Animated Flourish','Provoke','Dia','Dia II','Flash','Bio','Bio II','Sleep','Sleep II',
		'Drain','Aspir','Dispel','Steal','Mug'}
end 

function file_unload()
	clear_binds()
end

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
			if Mode >= 1 then
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

function buff_change(buff,g_or_l)
	-- Global Statuses
	include('include/status.lua')
end

function status_change(new,old)
    if T{'Idle'}:contains(new) then
		if PDT == 1 then
			if buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT,{head="Twilight Helm",body="Twilight Mail"})
			else
				equip(sets.idle.PDT)
			end
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			-- Equip apporiate sets
				previous_set()
		end
	elseif new == 'Resting' then
		equip(sets.Resting)
	elseif new == 'Engaged' then
		-- Engaged Sets
		if PDT == 1 then
			if buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT,{head="Twilight Helm",body="Twilight Mail"})
			else
				equip(sets.idle.PDT)
			end
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			-- Equip apporiate sets
				previous_set()
		end
    end
end

function precast(spell,arg)
    -- Job Abilities
	if spell.type == 'JobAbility' then
		if spell.name == 'Convert' then
			cancel_spell()
		elseif sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	-- Pet Commands 
	elseif spell.type == 'PetCommand' then
		if pet.isvalid == true then
		
		else
			cancel_spell()
		end
	-- Weaponskills
	elseif spell.type == 'WeaponSkill' then
		if player.status == 'Engaged' then
			if player.tp >= 100 then
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
				windower.add_to_chat(121, ''..player.tp..' TP is not enough to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
	elseif spell.type:endswith('Magic') then
		-- Cancel Sneak
		if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		end	
    -- Magic spell gear handling(Precast)
    elseif spell.type == 'Ninjutsu' then
        equip(sets.misc.Fastcast)
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
		elseif windower.wc_match(spell.name,'*Flourish') then
			equip(sets.misc.flourish)
		end
    end
end

function pet_precast(spell,arg)
	if ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
		eq/rjsuip(sets.midcast.Pet.ReadyRecast)
	end
end

function midcast(spell,arg)	
	-- Pet Command
	if spell.type == 'PetCommand' then
		if pet.isvalid == true then

		end
	elseif spell.type:endswith('Magic') then
		
    elseif spell.type == 'Ninjutsu' then
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

function pet_midcast(spell,arg)
	
end

function aftercast(spell,arg)
	-- Leaving Pet Gear on and using Pet Aftercast
	if pet_midaction() == true then
		
	else
	-- Engaged
		if player.status == 'Engaged' then
			if PDT == 1 then
				if buffactive['Weakness'] or player.hpp < 30 then
					equip(sets.idle.PDT,{head="Twilight Helm",body="Twilight Mail"})
				else
					equip(sets.idle.PDT)
				end
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				previous_set()
			end
		else
			if PDT == 1 then
				if buffactive['Weakness'] or player.hpp < 30 then
					equip(sets.idle.PDT,{head="Twilight Helm",body="Twilight Mail"})
				else
					equip(sets.idle.PDT)
				end
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				equip(sets.idle.Standard)
			end
		end
		-- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
		if spell and spell.name == 'Utsusemi: Ni' then
			ShadowType = 'Ni'
		elseif spell and spell.name == 'Utsusemi: Ichi' then
			ShadowType = 'Ichi'
		end
	end
end

function pet_aftercast(spell,arg)
-- Engaged
	if player.status == 'Engaged' or spell.english:wcmatch("Stone|Bar") then
		if PDT == 1 then
			if buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT,{head="Twilight Helm",body="Twilight Mail"})
			else
				equip(sets.idle.PDT)
			end
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			previous_set()
		end
	else
		if PDT == 1 then
			if buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT,{head="Twilight Helm",body="Twilight Mail"})
			else
				equip(sets.idle.PDT)
			end
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			equip(sets.idle.Standard)
		end
	end
end

function previous_set()
	slot_lock()
	if master = 1 then
		if Mode == 1 then
			equip(sets.TP.Acc)
		else
			equip(sets.TP)
		end
	-- Pet
	else
		if pet.status = "Engaged" then
			if player.status = "Engaged" then
				equip(sets.TP.Pet)
			else
			pet.status = "E
		elseif pet.status = "Idle" then
			if player.status = "Engaged" then
			
			else
			
			end
		end
	end
end

function slot_lock()
    -- Twilight Helm/Mail logic
    if player.equipment.head == 'Twilight Helm' and player.equipment.body == 'Twilight Mail' then
        disable('head','body')
    else
        enable('head','body')
    end
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

