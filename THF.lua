-- Feary's THF LUA
-- Date: 4/5/2014
--
--

-- Gear Sets 
function get_sets()

-- Get THF Gearsets
	include('Gearsets/THF_Gearsets.lua')
	
-- Define Default Values for Variables
	TH = 0
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
			windower.add_to_chat(121,'PDT Unlocked')
			-- make sure other values are set to default
			PDT = 0
			-- Unlock MDT set and equip Current TP set
			MDT = 0
			-- Place Me in my previous set.
			previous_set()
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
		-- Place me in my previous set
			previous_set()
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
			previous_set()
		else
			if Mode >= 2 then
			-- Reset to 0
				Mode = 0
			else
			-- Increment by 1
				Mode =+ 1
			end
			-- Place me in previous set
			previous_set()
		end
	elseif command == 'TH' then
		if TH == 0 then
			TH = 1
		else
			TH = 0
		end
	end
end
	
function status_change(new,old)
-- Autoset
    if T{'Idle','Resting'}:contains(new) then
		windower.add_to_chat(121,'Idle/Resting Set')
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
			previous_set()
		end
	end
end

-- Gain or lose buffs 
function buff_change(buff,g_or_l)
-- Sneak Attack
	if buff == 'Sneak Attack' and g_or_l == true then
		if TH == 1 then
			equip(sets.precast.JA["Sneak Attack"],sets.TH)
		else
			equip(sets.precast.JA["Sneak Attack"])
		end
	end
	if buff == 'Sneak Attack' and g_or_l == false then
		previous_set()
	end
-- Trick Attack
	if buff == 'Trick Attack' and g_or_l == true then
		if TH == 1 then
			equip(sets.precast.JA["Trick Attack"],sets.TH)
		else
			equip(sets.precast.JA["Trick Attack"])
		end
	end
	if buff == 'Trick Attack' and g_or_l == false then
       previous_set()
	end

-- Flee
	if buff == 'Flee' and g_or_l == true then
		 equip(sets.idle.PDT,{feet="Pillager's Poulaines"})
	end
	if buff == 'Flee' and g_or_l == false then
        equip(sets.idle.PDT,{feet="Pillager's Poulaines"})
	end
	
-- Fient
	if buff == 'Fient' and g_or_l == true then
		 equip(sets.idle.PDT,{legs="Plunderer's Culottes"})
	end
	if buff == 'Fient' and g_or_l == false then
        equip(sets.idle.PDT,{legs="Plunderer's Culottes"})
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
			previous_set()
		else
			if buffactive["Flee"] then
				equip(sets.idle.Standard,{feet="Pillager's Poulaines"})
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
				equip(sets.TP.Evasion,sets.TH,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TH locked - Hybrid Evasion Set')
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
				equip(sets.TP.Evasion,sets.TH)
				windower.add_to_chat(121,'TH locked - Hybrid Evasion Set')
			end	
		end
	else
		if buffactive["Feint"] then
			if Mode == 0 then
				equip(sets.TP,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'TP Set')
			elseif Mode == 1 then 
				equip(sets.TP.Acc,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Acc Set')
			elseif Mode == 2 then
				equip(sets.TP.Buffed,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Alliance Buff Set')
			elseif Mode == 3 then
				equip(sets.TP.Evasion,{legs="Plunderer's Culottes"})
				windower.add_to_chat(121,'Hybrid Evasion Set')
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
				equip(sets.TP.Evasion)
				windower.add_to_chat(121,'Hybrid Evasion Set')
			end		
		end
	end	
end

