-- Feary's MNK LUA
-- Date: 1/18/2014
--
--

-- Gear Sets 
function get_sets()

-- Get MNK Gearsets
	include('Gearsets/Mnk_Gearsets.lua')
	
-- Define Default Values for Variables
	boostCount = 0
	Mode = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
end -- End gear sets

-- Rules
function self_command(command)
-- Lock PDT
	if command == 'PDT' then
		if PDT == 1 then
			windower.add_to_chat(121,'TP Set Locked')
			if Mode == 0 then
				equip(sets.TP)
				windower.add_to_chat(121,'TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.MidAcc)
				windower.add_to_chat(121,'MidAcc Set')
			elseif Mode == 2 then
				equip(sets.TP.HighAcc)
				 windower.add_to_chat(121,'HighAcc Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid)
				windower.add_to_chat(121,'Hybrid Set')
			end
			-- make sure other values are set to default
			PDT = 0
			-- Unlock MDT set and equip Current TP set
			MDT = 0
		else
		-- Make sure other values are set to default
			MDT = 0
		-- Set PDT set and equip it
			PDT = 1
			equip(sets.idle.PDT)
			windower.add_to_chat(121,'PDT Set')
		end
--  Lock MDT
	elseif command == 'MDT' then
		if MDT == 1 then
		-- make sure other values are set to default
			PDT = 0
		-- Unlock MDT set and equip Current TP set
			MDT = 0
			windower.add_to_chat(121,'TP Set Locked')
			if Mode == 0 then
				equip(sets.TP)
				windower.add_to_chat(121,'TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.MidAcc)
				windower.add_to_chat(121,'MidAcc Set')
			elseif Mode == 2 then
				equip(sets.TP.HighAcc)
				 windower.add_to_chat(121,'HighAcc Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid)
				windower.add_to_chat(121,'Hybrid Set')
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
			PDT = 0
			MDT = 0
			if Mode == 0 then
				equip(sets.TP)
				windower.add_to_chat(121,'TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.MidAcc)
				windower.add_to_chat(121,'MidAcc Set')
			elseif Mode == 2 then
				equip(sets.TP.HighAcc)
				 windower.add_to_chat(121,'HighAcc Set')
			elseif Mode == 3 then
				equip(sets.TP.Hybrid)
				windower.add_to_chat(121,'Hybrid Set')
			end
		else
			if Mode == 0 then
			-- check defaults
				PDT = 0
				MDT = 0
			-- Increment by 1 for MidAcc set
				Mode = 1
				equip(sets.TP.MidAcc)
				windower.add_to_chat(121,'MidAcc Set')
			elseif Mode == 1 then 
			-- check defaults
				PDT = 0
				MDT = 0
			-- Increment by 1 for HighAcc set
				Mode = 2
				equip(sets.TP.HighAcc)
				 windower.add_to_chat(121,'HighAcc Set')
			elseif Mode == 2 then
			-- check defaults
				PDT = 0
				MDT = 0
			-- Increment by 1 for Hybrid set
				Mode = 3
				equip(sets.TP.Hybrid)
				 windower.add_to_chat(121,'Hybrid Set')
			elseif Mode == 3 then
			-- check defaults
				PDT = 0
				MDT = 0
			-- Increment by 1 for TP set
				Mode = 0
				equip(sets.TP)
				 windower.add_to_chat(121,'TP Set')
			else
			-- set to default if mode is greater than 3
				PDT = 0
				MDT = 0
				Mode = 0
			end
		end
	elseif command == 'testing' then
		windower.add_to_chat(121,'PDT:'..PDT..'MDT:'..MDT..'Mode:'..Mode..)
	end
end
	
function status_change(new,old)
-- Autoset
    if T{'Idle','Resting'}:contains(new) then
		equip(sets.idle.Standard)
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
			-- Automatically activate Impetus when engaging
            if not buffactive.Impetus and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[31] < 1 then
                windower.send_command('impetus')
            end
			-- Equip TP
			if Mode == 0 then	
				if buffactive == 'Hundred Fists' then
					windower.add_to_chat(121,'Hundred Fists')
					equip(sets.TP.HF)
				else
					windower.add_to_chat(121,'TP')
					equip(sets.TP)
				end
			elseif Mode == 1 then
				windower.add_to_chat(121,'MidAcc TP')
				equip(sets.TP.MidAcc)
			elseif Mode == 2 then
				windower.add_to_chat(121,'HighAcc TP')
				equip(sets.TP.HighAcc)
			elseif Mode == 3 then
				windower.add_to_chat(121,'Hybrid TP')
				equip(sets.TP.Hybrid)
			end
		end
	end
end

-- Gain or lose buffs 
function buff_change(buff,g_or_l)
-- gain = true losebuff = false
	if buff == 'Boost' and g_or_l == false then
        boostCount = 0
	end
	if buff == 'Max HP Boost' and g_or_l == true then
		windower.send_command('input /p ===== Mantra On =====')
	end
	if buff == 'Formless Strikes' and g_or_l == true then
		windower.send_command('input /p ===== Formless Strikes On =====')
	end
	if buff == 'Hundred Fists' and g_or_l == true then
		windower.send_command('input /p ===== Hundred Fists On =====')
	end
end

function precast(spell,arg)
 -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
   elseif sets.precast.WS[spell.name] then
		if  player.status == 'Engaged' then
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
				windower.add_to_chat(121, ''..player.TP..'Not enough TP to WS')
			end
		else
			cancel_spell()
			windower.add_to_chat(121, 'You must be Engaged to WS')
		end
    end

 -- Ninjutsu spell gear handling(Precast)
    if spell.skill == 'Ninjutsu' then
        equip(sets.misc.FastCast)
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.misc.Utsusemi)
        end
    end


 -- Special handling to remove Dancer sub job Sneak effect
    if spell.name == 'Spectral Jig' and buffactive.Sneak then
        windower.ffxi.cancel_buff(71)
        cast_delay(0.3)
    elseif windower.wc_match(spell.name,'Curing*') then
        equip(sets.misc.Waltz)
    elseif windower.wc_match(spell.name,'*Step') then
        equip(sets.TP.HighAcc)
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
			if Mode == 0 then
				if buffactive == 'Hundred Fists' then
					equip(sets.TP.HF)
				else
					equip(sets.TP)
				end
			elseif Mode == 1 then
				equip(sets.TP.MidAcc)
			elseif Mode == 2 then
				equip(sets.TP.HighAcc)
			elseif Mode == 3 then
				equip(sets.TP.Hybrid
			end
		else
			equip(sets.idle.Standard)
		end
	end
-- Utsusemi Variable Sets
	if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    elseif spell and spell.name == 'Boost' then
        boostCount = boostCount +1
        windower.add_to_chat(8,'Boost Count - [ '..boostCount..' / 12 ] ('..math.floor(100*boostCount/12)..'% Boosted!)')
    end
end


