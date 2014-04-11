-- Include to Replaces AutoExec Plugin
--
--
--
--

-- Events
function register_event()
	-- Day Change
	--windower.register_event('day_change', day_change)
	
	-- Light Luggage
	--windower.register_event('zone_change', light_luggage)
	
	-- G15 Keyboard
	--windower.register_event('job_change', G15)
end

-- Functions
function day_change(day)
	day = world.day
	windower.add_to_chat(121, '=='..day..'==')
end

function light_luggage()
	if player.name == 'Feary' then
		-- Delve and Skirmish
		if world.zone == "Cirdas Caverns [U]" then
			windower.add_to_chat(121, "Light Luggage - Feary's Delve Profile")
			windower.send_command('ll profile Feary_Delve')
		elseif world.zone == "Yorcia* [U]" then
		windower.add_to_chat(121, "Light Luggage - Feary's Delve Profile")
			windower.send_command('ll profile Feary_Delve')
		-- Abyssea
		elseif world.zone:wcmatch('Abyssea*') then
			windower.add_to_chat(121, "Light Luggage - Feary's Abyssea Profile")
			windower.send_command('ll profile Feary_Abyssea')
		-- Dynamis
		elseif world.zone:wcmatch('Dynamis*') then
			windower.add_to_chat(121, "Light Luggage - Feary's Dynamis Profile")
			windower.send_command('ll profile Feary_Dynamis')
		-- HNM
		elseif world.zone:wcmatch('Valley*') then
			windower.add_to_chat(121, "Light Luggage - Feary's HNM Profile")
			windower.send_command('ll profile Feary_HNM')
		elseif world.zone:wcmatch('Dragon*') then
			windower.add_to_chat(121, "Light Luggage - Feary's HNM Profile")
			windower.send_command('ll profile Feary_HNM')
		elseif world.zone:wcmatch('*Behemoth*') then
			windower.add_to_chat(121, "Light Luggage - Feary's HNM Profile")
			windower.send_command('ll profile Feary_HNM')
		-- Sky
		elseif world.zone:wcmatch("Ru'Aun*") then
			windower.add_to_chat(121, "Light Luggage - Feary's Sky Profile")
			windower.send_command('ll profile Feary_Sky')
		elseif world.zone:wcmatch("The Shrine of*") then
			windower.add_to_chat(121, "Light Luggage - Feary's Sky Profile")
			windower.send_command('ll profile Feary_Sky')
		-- Sea
		elseif world.zone:wcmatch("Al'Taieu*") then
			windower.add_to_chat(121, "Light Luggage - Feary's Sea Profile")
			windower.send_command('ll profile Feary_Sea')
		elseif world.zone:wcmatch("The Garden of Ru*") then
			windower.add_to_chat(121, "Light Luggage - Feary's Sea Profile")
			windower.send_command('ll profile Feary_Sea')
		elseif world.zone:wcmatch("The Garden of Hu'X*") then
			windower.add_to_chat(121, "Light Luggage - Feary's Sea Profile")
			windower.send_command('ll profile Feary_Sea')
		-- Limbus
		elseif world.zone:wcmatch("Apollyon") then
			windower.add_to_chat(121, "Light Luggage - Feary's Limbus Profile")
			windower.send_command('ll profile Feary_Limbus')
		elseif world.zone:wcmatch("Temenos") then
			windower.add_to_chat(121, "Light Luggage - Feary's Limbus Profile")
			windower.send_command('ll profile Feary_Limbus')
		-- Neo Nyzul
		elseif world.zone:wcmatch("Nyzul*") then
			windower.add_to_chat(121, "Light Luggage - Feary's Nyzul Profile")
			windower.send_command('ll profile Feary_Nyzul')
		-- Salvage
		elseif world.zone:wcmatch("*Remenants") then
			windower.add_to_chat(121, "Light Luggage - Feary's Salvage Profile")
			windower.send_command('ll profile Feary_Salvage')
		-- Einherjar
		elseif world.zone:wcmatch("Hazhalm Testing Grounds") then
			windower.add_to_chat(121, "Light Luggage - Feary's Einherjar Profile")
			windower.send_command('ll profile Feary_Einherjar')
		-- WalkofEchoes
		elseif world.zone:wcmatch("Walk of Echoes") then
			windower.add_to_chat(121, "Light Luggage - Feary's Walk of Echoes Profile")
			windower.send_command('ll profile Feary_WalkofEchoes')
		-- Provenance
		elseif world.zone:wcmatch("Provenance") then
			windower.add_to_chat(121, "Light Luggage - Feary's Provenance Profile")
			windower.send_command('ll profile Feary_Provenance')
		-- Legion
		elseif world.zone:wcmatch("*Legion") then
			windower.add_to_chat(121, "Light Luggage - Feary's Legion Profile")
			windower.send_command('ll profile Feary_Legion')
		-- Meebles
		elseif world.zone:wcmatch("Ghoyu's Reverie") then
			windower.add_to_chat(121, "Light Luggage - Feary's Meebles Profile")
			windower.send_command('ll profile Feary_Meebles')
		elseif world.zone:wcmatch("Ruhotz Silvermines") then
			windower.add_to_chat(121, "Light Luggage - Feary's Meebles Profile")
			windower.send_command('ll profile Feary_Meebles')
		elseif world.zone:wcmatch("Everbloom Hollow") then
			windower.add_to_chat(121, "Light Luggage - Feary's Meebles Profile")
			windower.send_command('ll profile Feary_Meebles')
		else
			windower.add_to_chat(121, "Light Luggage - Feary's Defualt Profile")
			windower.send_command('ll profile defualt')
		end
	end
end
function G15()
	if player.name == "Feary" then
		-- WAR
		if player.main_job == "war" then
			windower.send_command('exec Feary/war/g15/m1/default.txt;exec Feary/war/g15/m2/default.txt;exec Feary/war/g15/m3/default.txt;exec Feary/war/g13/m1/default.txt;exec Feary/war/g13/m2/default.txt;exec Feary/war/g13/m3/default.txt')
		-- MNK
		elseif player.main_job == "mnk" then
			windower.send_command('exec Feary/mnk/g15/m1/default.txt;exec Feary/mnk/g15/m2/default.txt;exec Feary/mnk/g15/m3/default.txt;exec Feary/mnk/g13/m1/default.txt;exec Feary/mnk/g13/m2/default.txt;exec Feary/mnk/g13/m3/default.txt')
		-- WHM
		elseif player.main_job == "WHM" then
			windower.send_command('exec Feary/whm/g15/m1/default.txt;exec Feary/whm/g15/m2/default.txt;exec Feary/whm/g15/m3/default.txt;exec Feary/whm/g13/m1/default.txt;exec Feary/whm/g13/m2/default.txt;exec Feary/whm/g13/m3/default.txt')
		-- BLM
		elseif player.main_job == "BLM" then
			windower.send_command('exec Feary/blm/g15/m1/default.txt;exec Feary/blm/g15/m2/default.txt;exec Feary/blm/g15/m3/default.txt;exec Feary/blm/g13/m1/default.txt;exec Feary/blm/g13/m2/default.txt;exec Feary/blm/g13/m3/default.txt')
		-- RDM
		elseif player.main_job == "RDM" then
			windower.send_command('exec Feary/rdm/g15/m1/default.txt;exec Feary/rdm/g15/m2/default.txt;exec Feary/rdm/g15/m3/default.txt;exec Feary/rdm/g13/m1/default.txt;exec Feary/rdm/g13/m2/default.txt;exec Feary/rdm/g13/m3/default.txt')
		-- THF
		elseif player.main_job == "THF" then
			windower.send_command('exec Feary/thf/g15/m1/default.txt;exec Feary/thf/g15/m2/default.txt;exec Feary/thf/g15/m3/default.txt;exec Feary/thf/g13/m1/default.txt;exec Feary/thf/g13/m2/default.txt;exec Feary/thf/g13/m3/default.txt')
		-- PLD
		elseif player.main_job == "PLD" then
			windower.send_command('exec Feary/pld/g15/m1/default.txt;exec Feary/pld/g15/m2/default.txt;exec Feary/pld/g15/m3/default.txt;exec Feary/pld/g13/m1/default.txt;exec Feary/pld/g13/m2/default.txt;exec Feary/pld/g13/m3/default.txt')
		-- DRK
		elseif player.main_job == "DRK" then
			windower.send_command('exec Feary/drk/g15/m1/default.txt;exec Feary/drk/g15/m2/default.txt;exec Feary/drk/g15/m3/default.txt;exec Feary/drk/g13/m1/default.txt;exec Feary/drk/g13/m2/default.txt;exec Feary/drk/g13/m3/default.txt')
		-- BST
		elseif player.main_job == "BST" then 
			windower.send_command('exec Feary/bst/g15/m1/default.txt;exec Feary/bst/g15/m2/default.txt;exec Feary/bst/g15/m3/default.txt;exec Feary/bst/g13/m1/default.txt;exec Feary/bst/g13/m2/default.txt;exec Feary/bst/g13/m3/default.txt')
		-- BRD 
		elseif player.main_job == "BRD" then
			windower.send_command('exec Feary/brd/g15/m1/default.txt;exec Feary/brd/g15/m2/default.txt;exec Feary/brd/g15/m3/default.txt;exec Feary/brd/g13/m1/default.txt;exec Feary/brd/g13/m2/default.txt;exec Feary/brd/g13/m3/default.txt')
		-- RNG
		elseif player.main_job == "RNG" then
			windower.send_command('exec Feary/rng/g15/m1/default.txt;exec Feary/rng/g15/m2/default.txt;exec Feary/rng/g15/m3/default.txt;exec Feary/rng/g13/m1/default.txt;exec Feary/rng/g13/m2/default.txt;exec Feary/rng/g13/m3/default.txt')
		-- SAM
		elseif player.main_job == "SAM" then
			windower.send_command('exec Feary/sam/g15/m1/default.txt;exec Feary/sam/g15/m2/default.txt;exec Feary/sam/g15/m3/default.txt;exec Feary/sam/g13/m1/default.txt;exec Feary/sam/g13/m2/default.txt;exec Feary/sam/g13/m3/default.txt')
		-- NIN
		elseif player.main_job == "NIN" then
			windower.send_command('exec Feary/nin/g15/m1/default.txt;exec Feary/nin/g15/m2/default.txt;exec Feary/nin/g15/m3/default.txt;exec Feary/nin/g13/m1/default.txt;exec Feary/nin/g13/m2/default.txt;exec Feary/nin/g13/m3/default.txt')
		-- DRG 
		elseif player.main_job == "DRG" then
			windower.send_command('exec Feary/drg/g15/m1/default.txt;exec Feary/drg/g15/m2/default.txt;exec Feary/drg/g15/m3/default.txt;exec Feary/drg/g13/m1/default.txt;exec Feary/drg/g13/m2/default.txt;exec Feary/drg/g13/m3/default.txt')
		-- SMN
		elseif player.main_job == "SMN" then
			windower.send_command('exec Feary/smn/g15/m1/default.txt;exec Feary/smn/g15/m2/default.txt;exec Feary/smn/g15/m3/default.txt;exec Feary/smn/g13/m1/default.txt;exec Feary/smn/g13/m2/default.txt;exec Feary/smn/g13/m3/default.txt')
		-- BLU
		elseif player.main_job == "BLU" then
			windower.send_command('exec Feary/blu/g15/m1/default.txt;exec Feary/blu/g15/m2/default.txt;exec Feary/blu/g15/m3/default.txt;exec Feary/blu/g13/m1/default.txt;exec Feary/blu/g13/m2/default.txt;exec Feary/blu/g13/m3/default.txt</register>')
		-- COR
		elseif player.main_job == "COR" then
			windower.send_command('exec Feary/cor/g15/m1/default.txt;exec Feary/cor/g15/m2/default.txt;exec Feary/cor/g15/m3/default.txt;exec Feary/cor/g13/m1/default.txt;exec Feary/cor/g13/m2/default.txt;exec Feary/cor/g13/m3/default.txt')
		-- PUP
		elseif player.main_job == "PUP" then
			windower.send_command('exec Feary/pup/g15/m1/default.txt;exec Feary/pup/g15/m2/default.txt;exec Feary/pup/g15/m3/default.txt;exec Feary/pup/g13/m1/default.txt;exec Feary/pup/g13/m2/default.txt;exec Feary/pup/g13/m3/default.txt')
		-- SCH
		elseif player.main_job == "SCH" then
			windower.send_command('exec Feary/sch/g15/m1/default.txt;exec Feary/sch/g15/m2/default.txt;exec Feary/sch/g15/m3/default.txt;exec Feary/sch/g13/m1/default.txt;exec Feary/sch/g13/m2/default.txt;exec Feary/sch/g13/m3/default.txt')
		-- DNC
		elseif player.main_job == "DNC" then
			windower.send_command('exec Feary/dnc/g15/m1/default.txt;exec Feary/dnc/g15/m2/default.txt;exec Feary/dnc/g15/m3/default.txt;exec Feary/dnc/g13/m1/default.txt;exec Feary/dnc/g13/m2/default.txt;exec Feary/dnc/g13/m3/default.txt')
		-- GEO
		elseif player.main_job == "GEO" then
			windower.send_command('exec Feary/geo/g15/m1/default.txt;exec Feary/geo/g15/m2/default.txt;exec Feary/geo/g15/m3/default.txt;exec Feary/geo/g13/m1/default.txt;exec Feary/geo/g13/m2/default.txt;exec Feary/geo/g13/m3/default.txt')
		-- RUN
		elseif player.main_job == "RUN" then
			windower.send_command('exec Feary/run/g15/m1/default.txt;exec Feary/run/g15/m2/default.txt;exec Feary/run/g15/m3/default.txt;exec Feary/run/g13/m1/default.txt;exec Feary/run/g13/m2/default.txt;exec Feary/run/g13/m3/default.txt')
		end
	end
end

function storm_elements()

end