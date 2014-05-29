<<<<<<< HEAD
-- Feary's BLM LUA
-- Created - 4/11/2014
-- To do list
-- - Obi Staves cape ring
-- 	sorceror's ring
--
--includes
	include('include/functions.lua')
	include('include/status.lua')
	
-- Gear Sets 
function get_sets()
--includes
	--include('include/autoexec.lua')
	include('include/binds.lua')
-- Get RDM gearsets
	include('Gearsets/Geo_Gearsets.lua')
	
-- Define Default Values for Variables
	Mode = 0
	PDT = 0
	MDT = 0
	Skill = 0
	ShadowType = 'None'
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
--  Lock MDT
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
			end
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
	elseif command == 'skill' then
	-- toggle
		if skill == 0 then
			-- set it on
			skill = skill + 1
		else
			-- set if off
			skill = 0
		end
	elseif command == "idle" then
		if idle == 0 then
			-- Idle is Refresh gear
			idle = idle + 1
		else
			idle = 0
		end
	elseif command == "t" then
		if twilight == 0 then
			twilight = twilight + 1
			-- Twilight Gear
			equip({head="Empty",body="Twilight Cloak"})
			disable('head,body')
			windower.add_to_chat(121,"Twilight Cloak Locked")
		else
			enable('head,body')
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
				if buffactive['Mana Wall'] then
					equip(sets.idle.Standard,{feet="Goetia Sabots"})
				else
					equip(sets.idle.Standard)
				end
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

function buff_change(buff,g_or_l)
-- Global Status Values
	include('include/status.lua')
end

function pretarget(spell)
	if spell.type == 'Geomancy' then
		if spell.english:startswith('Indi') then
			if spell.validtarget == "Self" then
				-- Default to me
				change_target("<me>")
			end
		elseif spell.english:startswith('Geo') then
			if spell.validtarget == "Self, Party" then
				change_target("<stpc>")
			else
				change_target("<stnpc>")
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
		if spell.name == "Mending Halation" then
			windower.send_command("wait 3;input /p Casting %Spell - HP Return in 3 secs. Gather together!")
		elseif spell.name == "Radial Arcana" then
			windower.send_command("wait 3;input /p Casting %Spell - HP Return in 3 secs. Gather together!")
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
	elseif spell.type == 'Geomancy' then
		if pet.isvalid then
			cancel_spell()
			windower.send_command('Full Cicle;wait 1;'..spell.name)
		else
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast)
			end
		end		
-- Magic
	elseif spell.type:endswith('Magic') then
		if spell.skill:startswith("Healing") then
			-- Cure casting time
			if spell.english:wcmatch('Cure*') or spell.english:wcmatch("Curaga*") then
				equip(sets.precast.Cure)
			else
				equip(sets.precast.Fastcast)
			end
		elseif spell.skill:startswith("Enhancing") then
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast)
			end
			-- Cancel Sneak
			if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
				windower.ffxi.cancel_buff(71)
				cast_delay(0.3)
			end
		elseif spell.skill:startswith("Elemental") then
			if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element],head="Empty", body="Twilight Cloak"})
				else
					equip(sets.precast.Fastcast, {head="Empty", body="Twilight Cloak"})
				end				
			else
				if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]]) then
					equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
				else
					equip(sets.precast.Fastcast)
				end
			end
		else
			if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]]) then
				equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
			else
				equip(sets.precast.Fastcast)
			end
		end
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]]) then
			equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
		else
			equip(sets.precast.Fastcast)
		end
-- BardSongs
	elseif spell.type == 'BardSong' then
		if Fastcast.Staff[spell.element] and (player.inventory[Fastcast.Staff[spell.element]] or player.wardrobe[Fastcast.Staff[spell.element]]) then
			equip(sets.precast.Fastcast, {main=Fastcast.Staff[spell.element]})
		else
			equip(sets.precast.Fastcast)
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
-- Geomancy
	if spell.skill == 'Geomancy' then
		equip(sets.midcast.Geomancy)
		if buffactive["Lasting Emanation"] then
		end
		if buffactive["Ecliptic Attriction"] then
		end
		if buffactive["Collimated Fervor"] then
		end
		if buffactive["Dematerilize"] then
		end
		if buffactive["Bolster"] then
		end
		if spell.english:wcmatch('Indi*') then
			if spell.validtarget == "Self" then
				windower.add_to_chat(121,"===== Self AOE =====")
			end
		elseif spell.english:wcmatch('Geo*') then
			if spell.validtarget == "Self, Party" then
				windower.add_to_chat(121,"Cast %Spell on a Party Member to make Loupon at this location")
			else
				windower.add_to_chat(121,"Cast %Spell on a Party Member to make Loupon at this location")
			end
		end
-- Healing Magic
	elseif spell.skill == 'Healing Magic' then
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
	elseif spell.skill == 'Enhancing Magic' then
		if spell.name == 'Phalanx' then
			equip(sets.midcast.Phalanx) 
		elseif spell.english:contains("Spikes") then
			equip(sets.midcast.INT)
		elseif spell.english:contains("Refresh") then
			equip(sets.midcast.ConserveMP)
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
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.Macc)
-- Divine Magic
	elseif spell.skill == 'Divine Magic' then
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
	elseif spell.skill == 'Dark Magic' then
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
	elseif spell.skill == 'Elemental Magic' then
		if spell.name == "Impact" or player.equipment.body == "Twilight Cloak" then
			equip(sets.midcast.Macc, {head="Empty", body="Twilight Cloak"})
		elseif spell.english:wcmatch('Frost|Drown|Rasp|Burn|Shock|Choke') then
			equip(sets.midcast.Elemental)
		else
			if Skill == 1 then
				equip(sets.midcast.Elemental) 
			else
				-- Zodiac Ring Check
				if spell.element == world.day_element and (player.inventory["Zodiac Ring"] or player.wardrobe["Zodiac Ring"]) then
					-- Weather Check
					if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
						-- Inventory Checks
						if player.inventory[elemental.Obi[spell.element]] or player.wardrobe[elemental.Obi[spell.element]] then
							-- yes ring yes obi Yes Cape 
							if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke, {waist=elemental.Obi[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
								end
							else
							-- yes ring yes obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],rring="Zodiac Ring"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],rring="Zodiac Ring"})
								end
							end
						else
							-- yes ring no obi yes cape
							if player.inventory["Twilight Cape"] or player.inventory["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{back="Twilight Cape",rring="Zodiac Ring"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape",rring="Zodiac Ring"})
								end
							else
							-- yes ring no obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{rring="Zodiac Ring"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],rring="Zodiac Ring"})
								end
							end							
						end
					else
					-- yes ring no obi no cape
						if not spell.english:wcmatch('*IV') then
							-- Nuke Staff
							equip(sets.midcast.Nuke,{rring="Zodiac Ring"})
						else
							-- Magian Staves
							equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],rring="Zodiac Ring"})
						end
					end	
				-- Day Match No Ring 
				elseif spell.element == world.day_element then
					-- Weather Check
					if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
						-- Inventory checks
						if player.inventory[elemental.Obi[spell.element]] or player.wardrobe[elemental.Obi[spell.element]] then
							-- no ring yes obi Yes Cape 
							if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],back="Twilight Cape"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape"})
								end
							else
						-- no ring yes obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element]})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element]})
								end
							end
						else
							-- no ring no obi yes cape
							if player.inventory["Twilight Cape"] or player.inventory["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{back="Twilight Cape"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape"})
								end
							else
							-- no ring no obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke)
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
								end
							end							
						end
					-- No Weather Match
					else
					-- no ring no obi no cape
						if not spell.english:wcmatch('*IV') then
							-- Nuke Staff
							equip(sets.midcast.Nuke)
						else
							-- Magian Staves
							equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
						end
					end				
				-- NO Day Match and no Ring 
				else
					-- Weather Check
					if spell.element == world.weather_element or spell.element == buffactive[elements.storm_of[spell.element]] then
						-- Inventory checks
						if player.inventory[elemental.Obi[spell.element]] or player.wardrobe[elemental.Obi[spell.element]] then
							-- no ring yes obi Yes Cape 
							if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element],back="Twilight Cape"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element],back="Twilight Cape"})
								end
							else
						-- no ring yes obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{waist=elemental.Obi[spell.element]})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],waist=elemental.Obi[spell.element]})
								end
							end
						else
							-- no ring no obi yes cape
							if player.inventory["Twilight Cape"] or player.wardrobe["Twilight Cape"] then
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke,{back="Twilight Cape"})
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element],back="Twilight Cape"})
								end
							else
							-- no ring no obi no cape
								if not spell.english:wcmatch('*IV') then
									-- Nuke Staff
									equip(sets.midcast.Nuke)
								else
									-- Magian Staves
									equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
								end
							end							
						end
					else
					-- no ring no obi no cape
						if not spell.english:wcmatch('*IV') then
							-- Nuke Staff
							equip(sets.midcast.Nuke)
						else
							-- Magian Staves
							equip(sets.midcast.Nuke,{main=Fastcast.Staff[spell.element]})
						end
					end				
				end
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
		equip(sets.midcast.Macc)
	end
end -- end midcast

function aftercast(spell,arg)
	if spell.name == "Impact" then 
		twilight = 0
		enable('head,body')
		windower.add_to_chat(121,'Twilight Unlocked')
		return
	end
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
-- Lullaby
	if spell.name == "Sleep II" or spell.name == "Sleepga II" or spell.name == "Repose" then
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
	  windower.send_command('wait 2;input /ma "Cure *IV" me')
	end
-- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
	-- Add to chat 
	if spell.type == "JobAbility" then
		if spell.name == "Full Circle" then
			windower.add_to_chat(121, 'Releasing Loupan - Returned some MP')
		elseif spell.name == "Lasting Emanation" then
			windower.add_to_chat(121,'%spell - Decreases HP consumed')
			windower.send_command('wait 120;input [%spell]/[Ecliptic Attrition]  Ready in 3 Minutes')
			windower.send_command('wait 240;input /echo [%spell]/[Ecliptic Attrition]  Ready in 1 Minutes')
			windower.send_command('wait 300;input /echo [%spell]/[Ecliptic Attrition]  Ready!')
		elseif spell.name == "Ecliptic Attraction" then
			windower.add_to_chat(121,'%Spell - Loupon Potency +25%')
			windower.send_command('wait 120;input [%spell]/[Lasting Emanation]  Ready in 3 Minutes')
			windower.send_command('wait 240;input /echo [%spell]/[Lasting Emanation]  Ready in 1 Minutes')
			windower.send_command('wait 300;input /echo [%spell]/[Lasting Emanation] Ready!')
		elseif spell.name == "Collimated Fervor" then
			windower.add_to_chat(121,'%Spell - Enhances Nukes by Direction Job trait')
		elseif spell.name == "Life Cycle" then
			windower.add_to_chat(121,'%Spell - Distributes one fourth of your HP to heal your luopan.')
		elseif spell.name == "Blaze of Glory" then
			windower.add_to_chat(121,'%Spell - Loupon Potency +50%')
		elseif spell.name == "Dematerialize" then
			windower.add_to_chat(121,'Loupon DT')
		elseif spell.name == "Theurgic Focus" then
			windower.add_to_chat(121,"%Spell - Increases next Nuke by +50 MAB")
		elseif spell.name == "Concetric Pulse" then
			windower.add_to_chat(121,"%Spell - Dismiss Loupon and Deals Damage")
		elseif spell.name == "Mending Halation" then
			windower.send_command("wait 3;input /p Casting %Spell - HP Return in 3 secs. Gather together!")
			windower.send_command("wait 120;input /echo [%spell] Ready in 3 Minutes")
			windower.send_command("wait 240;input /echo [%spell] Ready in 1 Minutes")
			windower.send_command("wait 300;input /echo [%spell] Ready!")
		elseif spell.name == "Radial Arcana" then
			windower.send_command("wait 3;input /p Casting %Spell - HP Return in 3 secs. Gather together!")
			windower.send_command("wait 120;input /echo [%spell] Ready in 3 Minutes")
			windower.send_command("wait 240;input /echo [%spell] Ready in 1 Minutes")
			windower.send_command("wait 300;input /echo [%spell] Ready!")
		end
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
=======
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
-- NOTE: This is Mote's GEO.lua with added support for nuking like a boss

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()

end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    options.CastingModes = {'Normal', 'Resistant', 'Proc'}
	options.OffenseModes = {'Normal'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.IdleModes = {'Normal', 'PDT'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.Defense.PhysicalMode = 'PDT'
    state.OffenseMode = 'None'
	
	-- Default macro set/book
	set_macro_page(1, 6)
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	
	-- Fast cast sets for spells
	
	sets.precast.FC = {
		head="Nahtirah Hat",ear2="Loquacious Earring",
		body="Vanir Cotehardie",ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}

	sets.precast.FC.Cure = {
		head="Nahtirah Hat",ear2="Loquacious Earring",
		body="Heka's Kalasiris",ring1="Prolix Ring",
		back="Pahtli Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"}) 

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Flash Nova'] = {
		head="Hagondes Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring2="Strendu Ring",
		back="Toro Cape",waist="Snow Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

	sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}
	
	
	-- Midcast Sets
	
	sets.midcast.FastRecast = {
		head="Zelus Tiara",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Bokwus Gloves",ring1="Prolix Ring",
		back="Swith Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
		
	sets.midcast.Geomancy = {range="Filiae Bell", body="Bagua Tunic", hands="Geomancy Mitaines",
        back="Lifestream Cape", legs="Bagua Pants"}

	sets.midcast.Cure = {
		body="Heka's Kalasiris",hands="Bokwus Gloves",
		back="Swith Cape",legs="Nares Trews",feet="Hagondes Sabots"}

	sets.midcast.Protectra = {ring1="Sheltered Ring"}

	sets.midcast.Shellra = {ring1="Sheltered Ring"}

	sets.midcast['Enhancing Magic'] = { sub="Fulcio Grip", neck="Colossus's Torque", body="Anhur Robe",
        hands="Ayao's Gloves"
    }
    sets.midcast.Stoneskin = sets.midcast['Enhancing Magic']

    sets.midcast.Macc = { main="Antinian Staff", sub="Mephitis Grip", ammo="Aureole",
        head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
        body="Bokwus Robe", hands="Hagondes Cuffs", lring="Balrahn's Ring", rring="Sangoma Ring",
        back="Lifestream Cape", waist="Demonry Sash", legs="Bokwus Slops", feet="Bokwus Boots"}
    
    sets.midcast['Enfeebling Magic'] = sets.midcast.Macc
    sets.midcast.ElementalEnfeeble = sets.midcast.Macc

    sets.midcast['Dark Magic']  = set_combine(sets.midcast.Macc, {
        head="Bagua Galero", neck="Aesir Torque",
        body="Geomancy Tunic", back="Merciful Cape",
        waist="Fucho-no-Obi"
    })
    sets.midcast.Aspir = set_combine(sets.midcast['Dark Magic'], { lring="Excelsis Ring" })
    sets.midcast.Drain = sets.midcast.Aspir
    sets.midcast.Stun = sets.midcast.Macc

	-- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast.LowTierNuke = {main="Lehbrailg +2",sub="Wizzan Grip",ammo="Witchstone",
        head="Hagondes Hat",neck="Stoicheion Medal",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Strendu Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}
    
    sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, {
        ear1="Psystorm Earring", ear2="Lifestorm Earring",
        feet="Bokwus Boots"
    })
    
    -- Idle set when doing procs. Fast cast gear, minimal nuke gear. Won't change out of this for nukes.
    sets.midcast.LowTierNuke.Proc = {main="Earth Staff", sub="Wizzan Grip",ammo="Impatiens",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Manasa Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Swith Cape",waist="Witful Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    
    -- Custom classes for high-tier nukes.
    sets.midcast.HighTierNuke = {main="Lehbrailg +2",sub="Wizzan Grip",ammo="Witchstone",
        head="Hagondes Hat",neck="Stoicheion Medal",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Strendu Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}
    
    sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.HighTierNuke, {
        ear1="Psystorm Earring", ear2="Lifestorm Earring",
        feet="Bokwus Boots"
    })

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {head="Nefer Khat +1",neck="Wiglen Gorget",
		body="Heka's Kalasiris",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		legs="Nares Trews",feet="Chelona Boots +1"}
	

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",range="Matre Bell",
		head="Nefer Khat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Herald's Gaiters"}
	
	sets.idle.Field = {main="Bolelabunga",sub="Genbu's Shield",range="Matre Bell",
		head="Nefer Khat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Herald's Gaiters"}

	sets.idle.Field.PDT = {main="Bolelabunga",sub="Genbu's Shield",range="Matre Bell",
		head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Herald's Gaiters"}

	sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",range="Matre Bell",
		head="Nefer Khat +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Nares Trews",feet="Herald's Gaiters"}
	
	-- Defense sets

	sets.defense.PDT = {range="Matre Bell",
		head="Hagondes Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.defense.MDT = {range="Matre Bell",
		head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

	sets.Kiting = {feet="Herald's Gaiters"}
	
    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {range="Matre Bell",
		head="Zelus Tiara",neck="Peacock Charm",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sekhmet Corset"
    end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)

end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
        if not spellMap:match('TierNuke$') then
		    -- Default base equipment layer of fast recast.
		    equip(sets.midcast.FastRecast)
        end

        if spell.skill == 'Elemental Magic' and state.CastingMode == 'Proc' then
            add_to_chat(15, 'Proc mode, no damage gear for midcast.')
            eventArgs.handled = true
        end
	end
end

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)

end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)

end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
    end
end

function customize_idle_set(idleSet)
	return idleSet
end

function customize_melee_set(meleeSet)
	return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_status_change(newStatus,oldStatus)

end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	--handle_equipping_gear(player.status)
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'OffenseMode' then
        if newValue == 'Normal' then
            disable('main','sub')
        else
            enable('main','sub')
        end
    elseif stateField == 'Reset' then
        if state.OffenseMode == 'None' then
            enable('main','sub')
        end
    end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)

end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)

end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local meleeString = ''
    if state.OffenseMode == 'Normal' then
        meleeString = 'Melee: Weapons locked, '
    end
    
    local defenseString = ''
    if state.Defense.Active then
        local defMode = state.Defense.PhysicalMode
        if state.Defense.Type == 'Magical' then
            defMode = state.Defense.MagicalMode
        end
    
        defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
    end
    
    add_to_chat(122,meleeString..'Casting ['..state.CastingMode..'], Idle ['..state.IdleMode..'], '..defenseString..
    'Kiting: '..on_off_names[state.Kiting])
    
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------


>>>>>>> 350651d138613e0284a151783dde05907eb9fe78
