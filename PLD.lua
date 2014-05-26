-- Feary's PLD LUA
-- Created: 4/1/2014
-- Last Update: 5/12/2014
-- To Do List
-- Chiv Check TP
--
--includes
	include('include/functions.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	-- Get PLD Gearsets
	include('Gearsets/PLD_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	-- Magical Shield
	mshield = "Aegis"
	-- Physical Shield
	pshield = "Ochain"
	-- Defualt Shield
	Shield = "Ochain"
	
end 

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
	elseif command == "shield" then
		-- use a toggle
		if player.equipment.sub == "Aegis" then
			Shield = "Ochain"
			equip({sub="Ochain"})
			windower.add_to_chat(121,'Ochain')
		elseif player.equipment.sub == "Ochain" then
			Shield = "Aegis"
			equip({sub="Aegis"})
			windower.add_to_chat(121,'Aegis')
		end
	elseif command == "w" then
		equip({main="Buramenk'ah", sub=Shield})
	elseif command == "clear_binds" then
		clear_binds()
	end
end

function status_change(new,old)
	if player.equipment.main == 'empty' then
		equip({main="Buramenk'ah", sub=Shield})
	elseif player.equipment.sub == 'empty' then
		equip({main="Buramenk'ah", sub=Shield})
	end
-- Autoset
    if T{'Idle','Resting'}:contains(new) then
		slot_lock()
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
 
function buff_change(buff,g_or_l)
	-- Global Status Values
	include('include/status.lua')
end

function precast(spell,arg)
	if spell.type == 'JobAbility' then
		if spell.name == 'Convert' then
			cancel_spell()
		elseif sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	elseif spell.type == 'WeaponSkill' then
		if player.status == 'Engaged' then
			if player.TP >= 100 then
				if spell.target.distance <= 5 then
					if Mode == 1 then
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
				else
					cancel_spell()
					windower.add_to_chat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
				end
			else 
				cancel_spell()
				windower.add_to_chat(121, ''..player.TP..'Not enough TP to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
	elseif spell.type:endswith('Magic') then
		if spell.skill == 'Healing Magic' then
			if spell.english:wcmatch("Cure*") and (player.name == spell.target.name) then
				equip(sets.precast.HPDown)
			else
				equip(sets.misc.Fastcast)
			end
		elseif spell.skill == 'Enhancing Magic' then
			equip(sets.misc.Fastcast)
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
			end
		elseif spell.skill == 'Divine Magic' then
			equip(sets.misc.Fastcast)
		elseif spell.skill == 'Blue Magic' then
			equip(sets.misc.Fastcast,sets.Enmity)
		elseif spell.skill == 'Elemental Magic' then
			equip(sets.misc.Fastcast)
		end
	elseif spell.type == 'Ninjutsu' then
		-- Ninjutsu spell gear handling(Precast)
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
	if spell.type:endswith('Magic') then
		if spell.skill == 'Healing Magic' then
			-- Self Cure 
			if spell.english:wcmatch("Cure*") and (player.name == spell.target.name) then
				equip(sets.Cure)
			else
				equip(sets.Cure)
			end
		elseif spell.skill == 'Enhancing Magic' then
			if spell.name == "Reprisal" then
				equip(sets.Recast,sets.misc.Fastcast)
			elseif spell.name == "Phalanx" then
				equip(sets.Recast,sets.Enmity,sets.midcast.EnhancingMagic)
			else
				equip(sets.recast,sets.Enmity,sets.misc.Fastcast)
			end
		elseif spell.skill == 'Divine Magic' then
			if spell.name == "Flash" then
				equip(sets.midcast.DivineMagic,sets.Enmity,sets.misc.Fastcast)
			elseif spell.english:wcmatch('Banish*') then
				equip(sets.midcast.DivineMagic,sets.Enmity,sets.misc.Fastcast)
			elseif spell.english:wcmatch('Holy*') then
				equip(sets.midcast.DivineMagic,sets.Enmity,sets.misc.Fastcast)
			elseif spell.english:wcmatch('Enlight') then
				equip(sets.midcast.DivineMagic,sets.Enmity,sets.misc.Fastcast)	
			else
				equip(sets.Recast,sets.Enmity,sets.misc.Fastcast)
			end
		elseif spell.skill == 'Blue Magic' then
			equip(sets.misc.Fastcast)
		elseif spell.skill == 'Elemental Magic' then
			equip(sets.misc.Fastcast)
		end
    elseif spell.type == 'Ninjutsu' then
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
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
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

function previous_set()
	slot_lock()
	if player.equipment.sub == mshield then
		if buffactive["Cover"] then
			if Mode == 0 then
				equip(sets.TP,{magicalshield},{body="Cab. Surcoat"})
				windower.add_to_chat(121,'Aegis - Cover - TP Set')
			elseif Mode == 1 then
				equip(sets.TP.Acc,{magicalshield},{body="Cab. Surcoat"})
				windower.add_to_chat(121,'Aegis - Cover - Acc TP Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid,{magicalshield},{body="Cab. Surcoat"})
				windower.add_to_chat(121,'Aegis - Cover - Hybrid TP Set')
			end
		else
			if Mode == 0 then
				equip(sets.TP)
				windower.add_to_chat(121,'Aegis - TP Set')
			elseif Mode == 1 then
				equip(sets.TP.Acc,{magicalshield})
				windower.add_to_chat(121,'Aegis - Acc TP Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid,{magicalshield})
				windower.add_to_chat(121,'Aegis - Hybrid TP Set')
			end
		end
	elseif player.equipment.sub == pshield then
		if buffactive["Cover"] then
			if Mode == 0 then
				equip(sets.TP,{physicalshield},{body="Cab. Surcoat"})
				windower.add_to_chat(121,'Ochain - Cover - TP Set')
			elseif Mode == 1 then
				equip(sets.TP.Acc,{physicalshield},{body="Cab. Surcoat"})
				windower.add_to_chat(121,'Ochain - Cover - Acc TP Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid,{physicalshield},{body="Cab. Surcoat"})
				windower.add_to_chat(121,'Ochain - Cover - Hybrid TP Set')
			end
		else
			if Mode == 0 then
				equip(sets.TP)
				windower.add_to_chat(121,'Ochain - TP Set')
			elseif Mode == 1 then
				equip(sets.TP.Acc,{physicalshield})
				windower.add_to_chat(121,'Ochain - Acc TP Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid,{physicalshield})
				windower.add_to_chat(121,'Ochain - Hybrid TP Set')
			end
		end
	else
		equip(sets.idle.PDT)
		windower.add_to_chat(121, "No Known Shield Equipped. Equiping PDT")
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

