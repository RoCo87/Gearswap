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
		Acc = 0
		PDT = 0
		MDT = 0
		equip(sets.TP.RA)
		windower.add_to_chat(121,'TP Set Locked')
	elseif command == 'ACC' then
		Acc = 1
		PDT = 0
		MDT = 0
		equip(sets.TP.RA.ACC)
		windower.add_to_chat(121,'ACC Set Locked')
	elseif command == "Mode" then
		-- use a toggle
		if Mode =="Melee" then
			-- set it to default
			mode = "None"
		else
			mode = "Melee"
		end
	end
end

function status_change(new,old)
    if T{'Idle','Resting'}:contains(new) then
		equip(sets.idle.Standard)
	elseif new =='Engaged' then
         -- Gear info each time you Engage, useful if using DressUp or BlinkMeNot
            windower.add_to_chat(8,player.name..': PDT = '..PDT..' | MDT ='..MDT..' | ACC = '..ACC)
            -- Automatically activate Velocity Shot when engaging
            if not buffactive['Velocity Shot'] and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[129] < 1 then
                windower.send_command('velocityshot')
            end
			-- Set Acc Sets
			if Acc == 1 then
				if Mode == "Melee" then
					equip(sets.TP.Acc)	
				else
					equip(sets.TP.RA.ACC)
				end
			elseif Acc == 0 then
				if Mode == "Melee" then
					equip(sets.TP)	
				else
					equip(sets.TP.RA)
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
	if player.status == 'engaged' then
		if ACC == 1 then
			if Mode == "Melee" then
				equip(sets.TP.ACC)
			else
				if player.equipment.range == "Echidna's Bow" then
					equip(sets.RA.Acc)
				elseif player.equipment.range == "Eminent Gun" then
					equip(sets.RA.Acc.Gun)
				end
			end
		else
			if Mode == "Melee" then
				equip(sets.TP.ACC)
			else
				if player.equipment.range == "Echidna's Bow" then
					equip(sets.RA)
				elseif player.equipment.range == "Eminent Gun" then
					equip(sets.RA.Gun)
				end
			end
		end
	else
		equip(sets.idle.Standard)
	end
    -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    end
end