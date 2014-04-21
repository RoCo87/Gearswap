-- Feary's COR LUA
-- Date: 3/10/2014
--
--
--includes
	include('include/functions.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
-- Get COR Gearsets
	include('Gearsets/COR_Gearsets.lua')   
	
-- Define Default Values for Variables
	Mode = "Melee"
	ACC = 0
	PDT = 0
	MDT = 0
	ShadowType = 'None'
	
	QDBullet = {ammo="Animikii Bullet"}
	TPBullet = {ammo="Achiyal. Bullet"}
	WSBullet = {ammo="Achiyal. Bullet"}
	MBullet = {ammo="Bullet"}
	
end
-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
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
		equip(sets.RA)
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
		equip(sets.RA.Acc)
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
    -- Gear info each time you Engage, useful if using DressUp or BlinkMeNot
        windower.add_to_chat(8,player.name..': Mode = '..Mode..' | PDT = '..PDT..' | MDT ='..MDT..' | ACC = '..ACC)
	-- Engaged sets
		if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
			equip(sets.idle.PDT)
		elseif MDT == 1 then
			equip(sets.idle.MDT)
		else
		-- Set ACC Sets
			if ACC == 1 then
				if Mode == "Melee" then
					equip(sets.TP.Acc)	
				else
					if player.equipment.range == "Armageddon" then
						equip(sets.RA.Armageddon.Acc)
					elseif player.equipment.range == "Eminent Gun" then
						equip(sets.RA.Acc)
					end
				end
			elseif ACC == 0 then
				if Mode == "Melee" then
					equip(sets.TP)	
				else
					if player.equipment.range == "Armageddon" then
						equip(sets.RA.Armageddon)
					elseif player.equipment.range == "Eminent Gun" then
						equip(sets.RA)
					end
				end
			end
		end
    end
end

function precast(spell,arg)
	-- Cor Rolls
	if spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
		if spell.english:wcmatch('Caster\'s Roll|Courser\'s Roll|Blitzer\'s Roll|Tactician\'s Roll|Allies\' Roll') then
			equip(sets.precast.JA[spell.name])
		else
			equip(sets.precast.JA["Phantom Roll"])
		end
	end
	
	-- Quick Draw
	if spell.type == "CorsairShot" then
		if player.equipment.ammo == QDBullet then
			if spell.english:wcmatch('Dark Shot|Light Shot') then
				equip(sets.precast.QD.ACC,{QDBullet})
			else
				equip(sets.precast.QD.MAB,{QDBullet})
			end
		else
			cancel_spell()
			windower.add_to_chat(121, QDBullet..'is not Equipped. Canceled')
		end
	end
	
	-- Range Attack 
    if spell.name == 'Ranged' then
		if player.equipment.ammo == QDBullet then
			windower.add_to_chat(121, 'Canceled RA - '..player.equipment.ammo..' Equipped')
			cancel_spell()
			equip({TPBullet})
		else
			equip(sets.precast.Snapshot)
		end
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
-- Auto sets
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if player.status == 'Engaged' then
			if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				if ACC == 1 then
					if Mode == "Melee" then
						equip(sets.TP.Acc)
					else
						if player.equipment.range == "Armageddon" then
							equip(sets.RA.Armageddon.Acc)
						elseif player.equipment.range == "Eminent Gun" then
							equip(sets.RA.Acc)
						end
					end
				else
					if Mode == "Melee" then
						equip(sets.TP)
					else
						if player.equipment.range == "Armageddon" then
							equip(sets.RA.Armageddon)
						elseif player.equipment.range == "Eminent Gun" then
							equip(sets.RA)
						end
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
   -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    end
end