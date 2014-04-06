-- Feary's PLD LUA
-- Date: 4/1/2014
--
--

-- Gear Sets 
function get_sets()

-- Get PLD Gearsets
	include('Gearsets/PLD_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	Shield = "None"
	ShadowType = 'None'
end 

function self_command(command)
   -- Lock PDT
	if command == 'PDT' then
		if PDT == 1 then
			if Mode == 0 then
				equip(sets.TP)
				windower.add_to_chat(121,'TP Set Locked')
			elseif Mode == 1 then 
				equip(sets.TP.Acc)
				windower.add_to_chat(121,'Acc TP Set')
			elseif Mode == 2 then
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
				windower.add_to_chat(121,'PDT Set Locked')
		end
--  Lock MDT
	elseif command == 'MDT' then
		if PDT == 1 then
			if Mode == 0 then
				equip(sets.TP)
				windower.add_to_chat(121,'TP Set Locked')
			elseif Mode == 1 then 
				equip(sets.TP.Acc)
				windower.add_to_chat(121,'Acc TP Set')				
			elseif Mode == 2 then
				equip(sets.TP.Hybrid)
				windower.add_to_chat(121,'Hybrid Set')
			end
		-- make sure other values are set to default
			PDT = 0
		-- Unlock MDT set and equip Current TP set
			MDT = 0
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
				equip(sets.TP.Acc)
				windower.add_to_chat(121,'Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Hybrid)
				 windower.add_to_chat(121,'Hybrid Set')
			end
		else
			if Mode == 0 then
				-- check defaults
					PDT = 0
					MDT = 0
				-- Increment by 1 for Acc set
					Mode = 1
					equip(sets.TP.Acc)
					windower.add_to_chat(121,'Acc Set')
			elseif Mode == 1 then 
				-- check defaults
					PDT = 0
					MDT = 0
				-- Increment by 1 for Hybrid set
					Mode = 2
					equip(sets.TP.Hybrid)
					windower.add_to_chat(121,'Hybrid Set')
			elseif Mode == 2 then
				-- check defaults
					PDT = 0
					MDT = 0
				-- Reset to 0 for TP set
					Mode = 0
					equip(sets.TP)
					windower.add_to_chat(121,'TP Set')
			end
		end
	elseif command == "Shield" then
		-- use a toggle
		if player.equipment.sub == "Aegis" then
			equip(sub="Ochain")
			windower.add_to_chat(121,'Ochain')
		elseif player.equipment.sub == "Ochain" then
			equip(sub="Aegis")
			windower.add_to_chat(121,'Aegis')
		end
	end
end

function status_change(new,old)
-- Autoset
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
			-- Equip TP
			if Mode == 0 then	
				windower.add_to_chat(121,'TP Set')
				equip(sets.TP)
			elseif Mode == 1 then
				windower.add_to_chat(121,'Acc TP')
				equip(sets.TP.Acc)
			elseif Mode == 2 then
				windower.add_to_chat(121,'Hybrid TP')
				equip(sets.TP.Hybrid)
			end
		end
	end
end

-- Gain or lose buffs 
function buff_change(buff,g_or_l)
	-- gain = true losebuff = false
	
end

function precast(spell,arg)
 -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
   elseif sets.precast.WS[spell.name] then
		if  player.status == 'Engaged' then
			if player.TP >= 100 then
				if spell.target.distance <= 5 then
					if Mode == 1 then
						if sets.precast.WS.Acc[spell.name] then
							equip(sets.precast.WS[spell.name])
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
				equip(sets.TP)
			elseif Mode == 1 then
				equip(sets.TP.Acc)
			elseif Mode == 2 then
				equip(sets.TP.Hybrid)
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
    end
end


