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
	-- Make sure other values are set to default
		MDT = 0
		Mode = 0
	-- Set PDT set and equip it
		PDT = 1
		equip(sets.idle.PDT)
		windower.add_to_chat(121,'PDT Set Locked')
--  Lock MDT
	elseif command == 'MDT' then
	-- make sure other values are set to default
		PDT = 0
		Mode = 0
	-- lock MDT set and equip it
		MDT = 1
		equip(sets.idle.MDT)
		windower.add_to_chat(121,'MDT Set Locked')
	elseif command == 'TP' then
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
end
	
function status_change(new,old)
-- Auto set
    if T{'idle','Resting'}:contains(new) then
		equip(sets.idle.Standard)
	elseif new == 'Engaged' and Mode == 0 then
		if buffactive == 'Hundred Fists' then
			equip(sets.TP.HF)
		else
			equip(sets.TP)
		end
	elseif new == 'Engaged' and Mode == 1 then
		equip(sets.TP.MidAcc)
	elseif new == 'Engaged' and Mode == 2 then
		equip(sets.TP.HighAcc)
	elseif new == 'Engaged' and Mode == 3 then
		equip(sets.TP.Hybrid)
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
end

function aftercast(spell,arg)
-- Autoset
	if player.status == 'Engaged' and Mode == 0 then
		if Buffactive == 'Hundred Fists' then
			equip(sets.TP.HF)
		else
			equip(sets.TP)
		end
	elseif player.status == 'Engaged' and Mode == 1 then
		equip(sets.TP.MidAcc)
	elseif player.status == 'Engaged' and Mode == 2 then
		equip(sets.TP.HighAcc)
	elseif player.status == 'Engaged' and Mode == 3 then
		equip(sets.TP.Hybrid)
	else
		equip(sets.idle.Standard)
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
				windower.add_to_chat(121, ''..player.TP..'TP is not enough to WS')
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

