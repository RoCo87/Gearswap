-- Feary's Brd LUA
-- Created: 1/18/2014
-- Updated: 4/17/2014
-- To Do:
-- update for mules instrument.
--
--includes
	include('include/functions.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
	-- Get BRD gearsets
	include('Gearsets/BRD_Gearsets.lua')
	
-- Define Default Values for Variables
	PDT = 0
	MDT = 0
	ACC = 0
	ShadowType = 'None'
	Gjallarhorn = 1
end 

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end

function pretarget(spell)
	if spell.type == 'BardSong' then
		if buffactive.Pianissimo then
			--Default to stpc
			change_target("<stpc>")
		elseif buffactive.Tenuto then
			-- Default to me
			change_target("<me>")
		else
			if spell.target.type == "SELF" then
				-- Default to me
				change_target("<me>")
			else
				change_target("<stnpc>")
			end
		end
	end
end
-- Rules
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
	end
end

function status_change(new,old)
-- Auto set
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

-- Gain or lose buffs 
function buff_change(buff,g_or_l)
	-- Global Status Values
	include('include/status.lua')
end

function precast(spell,arg)
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
-- Weaponskills
	 elseif spell.type == 'Weaponskill' then
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
-- Magic
	elseif spell.type:endswith('Magic') then
		-- Cure casting time
		if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
			equip(sets.precast.Cure)
		else
			equip(sets.precast.Fastcast)
		end
		-- Cancel Sneak
		if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		end		
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.Fastcast)
-- BardSongs
	elseif spell.type == 'BardSong' then
		if buffactive.Nightingale then
			-- Dummy Songs
			if spell.name == "Fowl Aubade" then
				equip({range="Daurdabla"})
			elseif spell.name == "Herb Pastoral" then
				equip({range="Daurdabla"})
			else
				equip(sets.midcast.Buffsong)
			end
		else
			-- Magian Staff
			if Fastcast.Staff[spell.element] and player.inventory[Fastcast.Staff[spell.element]] then
				equip(sets.precast.Fastcast.Song, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast.Song,{main="Felibre's Dague"})
			end	
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

function midcast(spell,arg)
-- Healing Magic
	if spell.skill == 'HealingMagic' then
		-- Cure Curaga
		if spell.english:startswith('Cure') then
			-- Elemental Obi
			if (spell.element == world.day_element) or (spell.element == world.weather_element) or (spell.element == buffactive[elements.storm_of[spell.element]]) and player.inventory[elemental.Obi[spell.element]] then
				equip(sets.midcast.Cure, {waist=elemental.Obi[spell.element], back="Twilight Cape"})
			else
				equip(sets.midcast.Cure)
			end
		elseif spell.english:startswith("Curaga") then
			equip(sets.midcast.Curaga)	
		elseif spell.english:startswith('Reraise') then
			equip(sets.midcast.ConserveMP)
		else
			equip(sets.midcast.Recast)
		end
-- Enhancing Magic
	elseif spell.skill == 'EnhancingMagic' then
		if spell.name == 'Phalanx' then
			equip(sets.midcast.Phalanx) 
		elseif spell.name == 'Stoneskin' then
			equip(sets.midcast.Stoneskin)
			if buffactive.Stoneskin then
				windower.ffxi.cancel_buff(36)
			end
		elseif spell.name == 'Blink' then
			equip(sets.midcast.Blink)
		elseif spell.name == 'Aquaveil' then
			equip(sets.midcast.Aquaveil)
		elseif spell.name == 'Haste' then
			equip(sets.midcast.Hastespell)
		elseif spell.english:wcmatch('Reraise*') then
			equip(sets.midcast.ConserveMP)
		else
			equip(sets.midcast.ConserveMP)
		end
-- Enfeebling Magic
	elseif spell.skill == 'EnfeeblingMagic' then
		if spell.english:startswith('Dia') then
			equip(sets.midcast.Dia)
		elseif spell.english:wcmatch('Paralyze*|Slow*|Addle') then
			equip(sets.midcast.enfeebling)
		else
			equip(sets.midcast.Macc)
		end
-- Divine Magic
	elseif spell.skill == 'DivineMagic' then
		if spell.english:startswith('Banish') then
			equip(sets.midcast.Macc)
		elseif spell.english:startswith('Holy') then
			equip(sets.midcast.Macc)
		elseif spell.name == 'Repose' then
			equip(sets.midcast.Macc)
		elseif spell.name == 'Flash' then
			equip(sets.midcast.Macc)
		end
-- Dark Magic
	elseif spell.skill == 'DarkMagic' then
		
-- Elemental Magic
	elseif spell.skill == 'ElementalMagic' then
		
-- Ninjutsu
	elseif spell.skill == "Ninjutsu" then
		equip(sets.midcast.Recast)
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
		elseif spell.name == 'Monomi: Ichi' and buffactive.Sneak and spell.target.type == 'SELF' then
			windower.ffxi.cancel_buff(71)
		end
-- Songs
	elseif spell.skill == "Singing" then
		-- Dummy Songs
		if spell.name == "Fowl Aubade" then
			equip(sets.midcast.Recast, {range="Daurdabla"})
		elseif spell.name == "Herb Pastoral" then
			equip(sets.midcast.Recast, {range="Daurdabla"})
		else
			if player.inventory["Gjallarhorn"] then
				-- BuffSongs
				if spell.target.type == "SELF" then
					if spell.name == "Sentinal's Scherzo" then
						equip(sets.midcast.Skillsong,{range="Gjallarhorn", feet="Aoidos' Cothrn. +2"})
					else	
						-- Ballads
						if spell.name:contains('Ballad') then
							equip(sets.midcast.Buffsong,{range="Gjallarhorn", legs="Aoidos' rhing. +2"})
						elseif spell.name:contains('Minuet') then
							equip(sets.midcast.Buffsong,{range="Gjallarhorn", Body="Aoidos' Hngrln +2"})
						elseif spell.name:contains('March') then
							equip(sets.midcast.Buffsong,{range="Gjallarhorn", hands="Ad. Mnchtte +2"})
						elseif spell.name:contains('Madrigal') then
							equip(sets.midcast.Buffsong,{range="Gjallarhorn", head="Aoidos' Calot +2"})
						--Everything else
						else	
							equip(sets.midcast.Buffsong,{range="Gjallarhorn"})
						end
					end
				else
				-- Debuff
					equip(sets.midcast.Debuff,{range="Gjallarhorn"})
				end
			-- Not Ghorn
			else
			-- BuffSongs
				if spell.target.type == "SELF" then
					if spell.name == "Sentinal's Scherzo" then
						equip(sets.midcast.Skillsong,{range=Scherzo, feet="Aoidos' Cothrn. +2"})
					else
						if spell.name:contains('Ballad') then
							equip(sets.midcast.Buffsong,{range=Ballad, legs="Aoidos' rhing. +2"})
						elseif spell.name:contains('Minuet') then
							equip(sets.midcast.Buffsong,{range=Minuet, Body="Aoidos' Hngrln +2"})
						elseif spell.name:contains('March') then
							equip(sets.midcast.Buffsong,{range=March, hands="Ad. Mnchtte +2"})
						elseif spell.name:contains('Madrigal') then
							equip(sets.midcast.Buffsong,{range=Madrigal, head="Aoidos' Calot +2"})
						else	
						equip(sets.midcast.Buffsong,{range=spell.name:contains(spell.name)})
						end
					end
			-- Debuff Songs
				else
					equip(sets.midcast.Debuff,{range="Gjallarhorn"})
				end
			end
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
-- Lullaby
	if spell.name == "Foe Lullaby II" or spell.name == "Horde Lullaby II" then
		windower.send_command('wait 75;input /echo [ WARNING! Lullaby II : Will wear off within 0:15 ]')
        windower.send_command('wait 80;input /echo [ WARNING! Lullaby II : Will wear off within 0:10 ]')
        windower.send_command('wait 85;input /echo [ WARNING! Lullaby II : Will wear off within 0:05 ]')
	elseif spell.name == "Foe Lullaby" or spell.name == "Horde Lullaby" then
		windower.send_command('wait 45;input /echo [ WARNING! Lullaby : Will wear off within 0:15 ]')
        windower.send_command('wait 50;input /echo [ WARNING! Lullaby : Will wear off within 0:10 ]')
        windower.send_command('wait 55;input /echo [ WARNING! Lullaby : Will wear off within 0:05 ]')
	end
-- Convert
	if spell.name == 'Convert' then
		cancel_spell()
	end
 -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end

function previous_set()
	slot_lock()
	if Mode == 0 then
		equip(sets.TP)
		windower.add_to_chat(121,'TP Set')
	elseif Mode == 1 then
		equip(sets.TP.Acc)
		windower.add_to_chat(121,'Acc TP Set')
	end		
end

function slot_lock()
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
