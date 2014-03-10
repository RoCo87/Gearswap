function get_sets()

-- Get RNG Gearsets
	include('Gearsets/RNG_Gearsets.lua')   
	
-- Define Default Values for Variables
	Mode = "None"
	ACC = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	
end


function self_command(command)
   -- Lock PDT
	if command == 'PDT' then
	-- Make sure other values are set to default
		MDT = 0
	-- Set PDT set and equip it
		PDT = 1
		equip(sets.idle.PDT)
		windower.add_to_chat(121,'PDT Set Locked')
--  Lock MDT
	elseif command == 'MDT' then
	-- make sure other values are set to default
		PDT = 0
	-- lock MDT set and equip it
		MDT = 1
		equip(sets.idle.MDT)
		windower.add_to_chat(121,'MDT Set Locked')
	elseif command == 'TP' then
		ACC = 0
		PDT = 0
		MDT = 0
		if player.equipment.range == "Echidna's Bow" then
			equip(sets.RA)
		elseif player.equipment.range == "Eminent Gun" then
			equip(sets.RA.Gun)
		end
		windower.add_to_chat(121,'TP Set Locked')
	elseif command == 'ACC' then
		-- Use a toggle
		if ACC == 1 then
			ACC = 0
		else
			Acc = 1
		end
		PDT = 0
		MDT = 0
		if player.equipment.range == "Echidna's Bow" then
			equip(sets.RA.Acc)
		elseif player.equipment.range == "Eminent Gun" then
			equip(sets.RA.Acc.Gun)
		end
		windower.add_to_chat(121,'ACC Set Locked')
	elseif command == "Mode" then
		-- use a toggle
		if Mode =="Melee" then
			-- set it to default
			Mode = "None"
			windower.add_to_chat(121,'Mode Normal')
		else
			Mode = "Melee"
			windower.add_to_chat(121,'Mode Melee')
		end
	end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
		if PDT == 1 or buffactive['Weakness'] or player.hpp == 30 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			equip(sets.idle.Standard)
		end
	elseif new == 'Engaged' then
         -- Gear info each time you Engage, useful if using DressUp or BlinkMeNot
            windower.add_to_chat(8,player.name..': Mode = '..Mode..' | PDT = '..PDT..' | MDT ='..MDT..' | ACC = '..ACC)
            -- Automatically activate Velocity Shot when engaging
            if not buffactive['Velocity Shot'] and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[129] < 1 then
                windower.send_command('velocityshot')
            end
			
			if PDT == 1 or buffactive['Weakness'] or player.hpp == 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
			-- Set ACC Sets
				if ACC == 1 then
					if Mode == "Melee" then
					equip(sets.TP.Acc)	
					else
						equip(sets.RA.Acc)
					end
					elseif ACC == 0 then
					if Mode == "Melee" then
						equip(sets.TP)	
					else
						equip(sets.RA)
					end
				end
			end
    end
end

function precast(spell,arg)
	-- when /war Make sure Berserk is up when using a WS
    if (spell.name == 'Jishnu\'s Radiance' or spell.name == 'Namas Arrow') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
        windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
        cancel_spell()
        return
    end

    if spell.name == 'Ranged' then
        equip(sets.precast.Snapshot)
    end

    -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif sets.precast.WS[spell.name] then
        equip(sets.precast.WS[spell.name])
	elseif sets.precast.RAWS[spell.name] then
        equip(sets.precast.RAWS[spell.name])
    end

    -- Magic spell gear handling(Precast)
    if spell.skill == 'Ninjutsu' then
        equip(sets.precast.Fastcast)
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
        equip(sets.misc.Steps)
	elseif windower.wc_match(spell.name,'*Flourish') then
        equip(sets.misc.flourish)
    end
end

function midcast(spell,arg)
    if spell.name == 'Ranged' then
		if ACC == 1 then
			if player.equipment.range == "Echidna's Bow" then
				equip(sets.RA.Acc)
			elseif player.equipment.range == "Eminent Gun" then
				equip(sets.RA.Acc.Gun)
			end
		else
			if player.equipment.range == "Echidna's Bow" then
				equip(sets.RA)
			elseif player.equipment.range == "Eminent Gun" then
				equip(sets.RA.Gun)
			end
		end
        if buffactive.Barrage then
            equip(sets.precast.JA["Barrage"])
        end
    end

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

function aftercast(spell,arg)
	-- 
	if player.status == 'Engaged' then
		if PDT == 1 or buffactive['Weakness'] then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.PDT)
		else
			if ACC == 1 then
				if Mode == "Melee" then
					equip(sets.TP.Acc)
				else
					if player.equipment.range == "Echidna's Bow" then
						equip(sets.RA.Acc)
					elseif player.equipment.range == "Eminent Gun" then
						equip(sets.RA.Acc.Gun)
					end
				end
			else
				if Mode == "Melee" then
					equip(sets.TP.Acc)
				else
					if player.equipment.range == "Echidna's Bow" then
						equip(sets.RA)
					elseif player.equipment.range == "Eminent Gun" then
						equip(sets.RA.Gun)
					end
				end
			end
		end
	else
		if PDT == 1 or buffactive['Weakness'] then
			equip(sets.idle.PDT)
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