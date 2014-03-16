-- Feary's DRG LUA
-- Date: 3/15/2014
--
--

-- Gear Sets 
function get_sets()

-- Get DRG Gearsets
	include('Gearsets/DRG_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
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
		if buffactive == "Ionis" and areas.Adoulin:contains(world.area) then
			equip(sets.TP.Ionis)
			windower.add_to_chat(121,'Ionis buffed')
		else
			equip(sets.TP)
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
		if buffactive == "Ionis" and areas.Adoulin:contains(world.area) then
			equip(sets.TP.ACC.Ionis)
			windower.add_to_chat(121,'Ionis buffed')
		else
			equip(sets.TP.Acc)
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
		-- Automatically activate Hasso when engaging
		if not buffactive['Hasso'] and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[129] < 1 then
			windower.send_command('Hasso')
        end
		-- Engaged Sets
		if PDT == 1 or buffactive['Weakness'] or player.hpp == 30 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
		-- Set ACC Sets
			if ACC == 1 then
				if buffactive == "Ionis" and areas.Adoulin:contains(world.area) then
					equip(sets.TP.Acc.Ionis)
					windower.add_to_chat(121,'Ionis buffed')
				else
					equip(sets.TP.Acc)
				end
			elseif ACC == 0 then
				if buffactive == "Ionis" and areas.Adoulin:contains(world.area) then
					equip(sets.TP.Ionis)
					windower.add_to_chat(121,'Ionis buffed')
				else
					equip(sets.TP)
				end
			end
		end
    end
end

function precast(spell,arg)
    -- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
	-- Pet Commands 
	elseif spell.type == 'PetCommand' then
		if pet.isvalid == "true" then
			if spell.name == "Smiting Breath" then
				equip(sets.precast.HealingBreath)
			elseif spell.name == 'Restoring Breath' then
				equip(sets.precast.HealingBreath)
			elseif spell.name == 'Steady Wing' then
				equip(sets.precast.JA["Steady Wing"])
			end
		else
			cancel_spell()
		end
	-- Weaponskills
	elseif spell.type == 'WeaponSkill' then
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

function pet_precast(spell,arg)
	if spell.english:wcmatch('Healing Breath*') then
		equip(sets.precast.HealingBreath)
		windower.add_to_chat(121,'pet precast')
	elseif spell.english:wcmatch('*Breath') then
		equip(sets.precast.Breath)
		windower.add_to_chat(121,'pet precast')
	end
end

function midcast(spell,arg)	
	if spell.type == 'PetCommand' then
		if pet.isvalid == "true" then
			if spell.name == "Smiting Breath" then
				equip(sets.midcast.HealingBreath)
			elseif spell.name == 'Restoring Breath' then
				equip(sets.midcast.HealingBreath)
			elseif spell.name == 'Steady Wing' then
				equip(sets.precast.JA["Steady Wing"])
			end
		else
			cancel_spell()
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

function pet_midcast(spell,arg)
	if spell.english:wcmatch('Healing Breath*') then
		equip(sets.midcast.HealingBreath)
		windower.add_to_chat(121,'pet precast')
	elseif spell.english:wcmatch('*Breath') then
		equip(sets.midcast.Breath)
		windower.add_to_chat(121,'pet precast')
	end
end

function aftercast(spell,arg)
	-- Engaged
	if player.status == 'Engaged' then
		if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			if ACC == 1 then
				if buffactive == "Ionis" and areas.Adoulin:contains(world.area) then
					equip(sets.TP.Acc.Ionis)
					windower.add_to_chat(121,'Ionis buffed')
				else
					equip(sets.TP.Acc)
				end
			else
				if buffactive == "Ionis" and areas.Adoulin:contains(world.area) then
					equip(sets.TP.Ionis)
					windower.add_to_chat(121,'Ionis buffed')
				else
					equip(sets.TP)
				end
			end
		end
	else
		if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
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

function pet_aftercast(spell,arg)
-- Engaged
	if player.status == 'Engaged' then
		if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			if ACC == 1 then
				if buffactive == "Ionis" and areas.Adoulin:contains(world.area) then
					equip(sets.TP.Acc.Ionis)
					windower.add_to_chat(121,'Ionis buffed')
				else
					equip(sets.TP.Acc)
				end
			else
				if buffactive == "Ionis" and areas.Adoulin:contains(world.area) then
					equip(sets.TP.Ionis)
					windower.add_to_chat(121,'Ionis buffed')
				else
					equip(sets.TP)
				end
			end
		end
	else
		if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
			equip(sets.idle.Standard)
		end
	end
end