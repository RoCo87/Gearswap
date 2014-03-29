-- Feary's RDM LUA
--
--
--
--
--

-- Gear Sets 
function get_sets()
-- Get RDM gearsets
	include('Gearsets/RDM_Gearsets.lua')
	
-- Define Default Values for Variables
	PDT = 0
	MDT = 0
	skill = 0
	ShadowType = 'None'
end 

-- Rules
function self_command(command)
-- Lock PDT
	if command == 'PDT' then
	-- Make sure other values are set to default
		MDT = 0
	-- Set PDT set and equip it
		PDT = 1
		equip(sets.idle.PDT)
		windower.add_to_chat(121,'PDT Set')
--  Lock MDT
	elseif command == 'MDT' then
	-- make sure other values are set to default
		PDT = 0
	-- lock MDT set and equip it
		MDT = 1
		equip(sets.idle.MDT)
		windower.add_to_chat(121,'MDT Set')
-- Reset	
	elseif command == 'TP' then
	-- set to default if mode is greater than 3
			PDT = 0
			MDT = 0	
	elseif command == 'Skill' then
	-- toggle
		if skill == 0 then
		-- set it on
			skill = 1
		else
		-- set if off
			skill = 0
		end
	end
end

function status_change(new,old)
-- Auto set
    if T{'idle','Resting'}:contains(new) then
		equip(sets.idle.Standard)
	elseif new == 'Engaged' then
		equip(sets.TP)
	end
end

-- Gain or lose buffs 
function buff_change(buff,g_or_l)

end

function pretarget(spell)
	
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
		-- Chainspell
		if buffactive.Chainspell or buffactive.Spontaneity then
			-- Don't need Fastcast
			if spell.name == 'Stun' then
				equip(sets.midcast.Stun)
			elseif spell.skill:startswith('Elemental') then
				equip(sets.midcast.Nuke)
			else
				equip(sets.midcast.Macc)
			end
		else
			if spell.skill:startswith("Healing") then
				-- Cure casting time
				if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
					equip(sets.precast.Cure)
				else
					equip(sets.precast.Fastcast)
				end
			elseif spell.skill:startswith("Enhancing") then
				equip(sets.precast.Fastcast)
				-- Cancel Sneak
				if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
					windower.ffxi.cancel_buff(71)
					cast_delay(0.3)
				end
			elseif spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
				equip(sets.midcast.Macc, {head="Empty", body="Twilight Cloak"})
			else
				equip(sets.precast.Fastcast)
			end
		end
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.Fastcast)
-- BardSongs
	elseif spell.type == 'BardSong' then
		equip(sets.precast.Fastcast)
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
		-- Add Light Obi Twilight Cape and Chatoyant Staff
		-- Cure Curaga Cura
		if spell.english:startswith('Cure') then
			equip(sets.midcast.Cure)
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
		elseif spell.name:wcmatch("Gain*") then
			equip(sets.midcast.Enhancing)
		elseif spell.name == "Temper" then
			equip(sets.midcast.Enhancing)
		elseif spell.english:contains("Spikes") then
			equip(sets.midcast.INT, {legs="Vitivation Tights"})
		elseif spell.english:contains("Refresh") then
			equip(sets.midcast.ConserveMP,{legs="Estqr. Fuseau +2"})
		elseif spell.name == 'Stoneskin' then
			equip(sets.midcast.Stoneskin)
			if buffactive.Stoneskin then
				windower.ffxi.cancel_buff(36)
			end
		elseif spell.name == 'Blink' then
			equip(setes.midcast.Blink)
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
		-- Maybe account for saboteur
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
		if spell.name == "Drain" then
			equip(sets.midcast.Aspir) 
		elseif spell.name == "Aspir" then
			equip(sets.midcast.Aspir)
		elseif spell.name == "Stun" then
			equip(sets.midcast.Macc)
		else
			equip(sets.midcast.Macc)
		end
-- Elemental Magic
	elseif spell.skill == 'ElementalMagic' then
		if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
			equip(sets.midcast.Macc, {head="Empty", body="Twilight Cloak"})
		else
			-- accounts for obis staffs cape ring
			if skill == 1 then
				equip(sets.midcast.Elemental) 
			else
				equip(sets.midcast.Nuke)
			end
		end
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
			
	end
end 

function aftercast(spell,arg)
	if buffactive.Chainspell then
		-- do nothing
	else
	-- Autoset
		if player.status == 'Engaged' then
			equip(sets.TP)
		else
			equip(sets.idle.Standard)
		end
	end
-- Lullaby
	if spell.name == "Sleep II" or spell.name == "Sleepga II" then
		windower.send_command('wait 75;input /echo [ WARNING! Sleep : Will wear off within 0:15 ]')
        windower.send_command('wait 80;input /echo [ WARNING! Sleep : Will wear off within 0:10 ]')
        windower.send_command('wait 85;input /echo [ WARNING! Sleep : Will wear off within 0:05 ]')
	elseif spell.name == "Sleep" or spell.name == "Sleepga" then
		windower.send_command('wait 45;input /echo [ WARNING! Sleep : Will wear off within 0:15 ]')
        windower.send_command('wait 50;input /echo [ WARNING! Sleep : Will wear off within 0:10 ]')
        windower.send_command('wait 55;input /echo [ WARNING! Sleep : Will wear off within 0:05 ]')
	end
-- Convert
	if spell.name == 'Convert' then
	  windower.send_command('wait 2;input /ma "Cure IV" me')
	end
 -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end