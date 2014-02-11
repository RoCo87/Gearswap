-- Feary's Brd LUA
--
--
--
--
--

-- Gear Sets 
function get_sets()

-- Get WHM gearsets
	include('Gearsets/BRD_Gearsets.lua')
	
-- Define Default Values for Variables
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
		 windower.add_to_chat(121,'PDT Set')
--  Lock MDT
	elseif command == 'MDT' then
	-- make sure other values are set to default
		PDT = 0
		Mode = 0
	-- lock MDT set and equip it
		MDT = 1
		equip(sets.idle.MDT)
		windower.add_to_chat(121,'MDT Set')
	elseif command == 'TP' then
		-- set to default if mode is greater than 3
			PDT = 0
			MDT = 0
			Mode = 0
	end
end

function status_change(new,old)
-- Auto set
    if T{'idle','Resting'}:contains(new) then
		equip(sets.idle.Standard)
	elseif new == 'Engaged' and Mode == 0 then
		equip(sets.TP)
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
