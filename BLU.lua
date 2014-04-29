-- Feary BLU Lua
-- Created: 4/26/2014
-- Last Updated: 4/26/2014
-- To Do List:
--
--
--
--includes
	include('include/functions.lua')
	
-- Gear Sets 
function get_sets(spell)
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
-- Get BLU gearsets
	include('Gearsets/BLU_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	Skill = 0
	ShadowType = 'None'
	
	-- Maps Blue Mage spell Stats per spell for the midcast function, can expand mapping as needed
	-- Options - STR, STRAcc, VIT, AGI, MND, CurePot, Nuke, Macc, Recast
    bluSpellStats = T{["Amorphic Spikes"]="STR", ["Bloodrake"]="STR", ["Disseverment"]="STR", ["Glutinous Dart"]="STR", ["Goblin Rush"]="STR",
                ["Heavy Strike"]="STRAcc", ["Paralyzing Triad"]="STR", ["Ram Charge"]="STR", ["Vanity Dive"]="STR", ["Vertical Cleave"]="STR",
                ["Whirl of Rage"]="STR",
                ["Cannonball"]="VIT", ["Delta Thrust"]="VIT", ["Quad. Continuum"]="VIT",
                ["Benthic Typhoon"]="AGI", ["Final Sting"]="AGI", ["Spiral Spin"]="AGI",
                ["Magic Hammer"]="MND", ["Mind Blast"]="MND"}
    bluSpells = T{["Animating Wail"]="Recast", ["Battery Charge"]="Recast", ["Cocoon"]="Recast", ["Nat. Meditation"]="Recast", ["Winds of Promy."]="Recast",
                ["Magic Fruit"]="CurePot", ["Plenilune Embrace"]="CurePot", ["White Wind"]="CurePot",
                ["Sudden Lunge"]="STRAcc", ["Head Butt"]="STRAcc"}
end 
-- Called when this job file is unloaded (eg: job change)
function file_unload()
	clear_binds()
end
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
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
		-- Make sure other values are set to default
			MDT = 0
		-- Set PDT set and equip it
			PDT = 1
			equip(sets.idle.PDT)
			windower.add_to_chat(121,'PDT Set Locked')
		end
-- Lock MDT
	elseif command == 'MDT' then
		if MDT == 1 then
		-- make sure other values are set to default
			PDT = 0
		-- Unlock MDT set and equip Current TP set
			MDT = 0
			windower.add_to_chat(121,'MDT Unlocked')
		-- Place Me in my previous set.
			if player.status == 'Engaged' then
				previous_set()
			else
				equip(sets.idle.Standard)
			end
		else
		-- make sure other values are set to default
			PDT = 0
		-- lock MDT set and equip it
			MDT = 1
			equip(sets.idle.MDT)
			windower.add_to_chat(121,'MDT Set Locked')
		end
-- Reset	
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
				windower.add_to_chat(121,'PDT/MDT Set UnLocked')
			end
		else
			if Mode >= 3 then
			-- Reset to 0
				Mode = 0
			else
			-- Increment by 1
				Mode = Mode + 1
			end
			if Mode == 0 then
				windower.add_to_chat(121,'TP Set')
			elseif Mode == 1 then
				windower.add_to_chat(121,'Acc TP Set')
			elseif Mode == 2 then
				windower.add_to_chat(121,'Buffed TP Set')
			elseif Mode == 3 then
				windower.add_to_chat(121,'Hybrid TP Set')
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
		if new == "Resting" then
			equip(sets.Resting)
		else
			if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				equip(sets.idle.Standard)
			end
		end
	elseif new == 'Engaged' then
		slot_lock()
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
	-- Global Status
	include('include/status.lua')
end

function precast(spell,arg)
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
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
-- Magic
	elseif spell.type:endswith('Magic') then
		-- Blue Magic 
		if spell.skill:startswith("Blue") then
			equip(sets.precast.BlueMagic)
		-- Healing Magic
		elseif spell.skill:startswith("Healing") then
			-- Cure casting time
			if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		-- Enhancing Magic 
		elseif spell.skill:startswith("Enhancing") then
			equip(sets.precast.Fastcast)
			-- Cancel Sneak
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
				cast_delay(0.3)
			end
		elseif spell.skill:startswith('Elemental') then
			equip(sets.precast.Fastcast)
		else
			equip(sets.precast.Fastcast)
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

function midcast(spell,act)
-- BlueMagic
	if spell.skill == 'BlueMagic' then
		print('midcast')
		print(sets.midcast.BlueMagic[bluSpellStats[spell.english]])
		  if bluSpellStats[spell.english] then
            equip(sets.midcast.BlueMagic[bluSpellStats[spell.english]])
            if buffactive['Chain Affinity'] then
                equip(sets.misc['Chain Affinity'])
            end
            if buffactive.Efflux then
                equip(sets.misc.Efflux)
            end
		elseif bluSpells[spell.english] then
            equip(sets.midcast.BlueMagic[bluSpells[spell.english]])
        else
            equip(sets.midcast.BlueMagic)
        end
-- Healing Magic
	elseif spell.skill == 'HealingMagic' then
		-- Add Light Obi Twilight Cape and Chatoyant Staff
		-- Cure Curaga Cura
		if spell.english:startswith('Cure') then
			equip(sets.midcast.BlueMagic.CurePot)
		elseif spell.english:startswith("Curaga") then
			equip(sets.midcast.BlueMagic.CurePot)	
		elseif spell.english:startswith('Reraise') then
			equip(sets.midcast.ConserveMP)
		else
			equip(sets.midcast.Recast)
		end
-- Enhancing Magic
	elseif spell.skill == 'EnhancingMagic' then
		print(test)
		equip(sets.midcast.ConserveMP)
-- Enfeebling Magic
	elseif spell.skill == 'EnfeeblingMagic' then
		if spell.english:startswith('Dia') then
			equip(sets.midcast.BlueMagic.Macc)
		elseif spell.english:wcmatch('Paralyze*|Slow*|Addle') then
			equip(sets.midcast.BlueMagic.Macc)
		else
			equip(sets.midcast.BlueMagic.Macc)
		end
-- Divine Magic
	elseif spell.skill == 'DivineMagic' then
		if spell.english:startswith('Banish') then
			equip(sets.midcast.BlueMagic.Macc)
		elseif spell.english:startswith('Holy') then
			equip(sets.midcast.BlueMagic.Macc)
		elseif spell.name == 'Repose' then
			equip(sets.midcast.BlueMagic.Macc)
		elseif spell.name == 'Flash' then
			equip(sets.midcast.BlueMagic.Macc)
		end
-- Dark Magic
	elseif spell.skill == 'DarkMagic' then
		equip(sets.midcast.BlueMagic.Macc)
-- Elemental Magic
	elseif spell.skill == 'ElementalMagic' then
		
		equip(sets.midcast.BlueMagic.Macc)
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
		equip(sets.midcast.BlueMagic.Macc)
	end
end

function aftercast(spell)
	if areas.Town:contains(world.zone) then
		windower.add_to_chat(121, "Town Gear")
		equip(sets.misc.Town)
	else
		if player.status == 'Engaged' then
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
		else
			slot_lock()
			if PDT == 1 or buffactive['Weakness'] or player.hpp < 30 then
				equip(sets.idle.PDT)
			elseif MDT == 1 then
				equip(sets.idle.MDT)
			else
				equip(sets.idle.Standard)
			end
		end
	end
-- Sleep Timers
	if spell.name == "Sleep II" or spell.name == "Sleepga II" or spell.name == "Repose" or spell.name == "Dream Flower" then
		windower.send_command('wait 75;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:15 ]')
        windower.send_command('wait 80;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:10 ]')
        windower.send_command('wait 85;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:05 ]')
	elseif spell.name == "Sleep" or spell.name == "Sleepga" then
		windower.send_command('wait 45;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:15 ]')
        windower.send_command('wait 50;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:10 ]')
        windower.send_command('wait 55;input /echo [ WARNING! '..spell.name..' : Will wear off within 0:05 ]')
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

function previous_set()
	slot_lock()
	if Mode == 0 then
		equip(sets.TP)
		windower.add_to_chat(121,'TP Set')
	elseif Mode == 1 then
		equip(sets.TP.Acc)
		windower.add_to_chat(121,'Acc TP Set')
	elseif Mode == 2 then
		equip(sets.TP.Buffed)
		windower.add_to_chat(121,'Buffed TP Set')
	elseif Mode == 3 then
		equip(sets.TP.Hybrid)
		windower.add_to_chat(121,'Hybrid TP Set')
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
