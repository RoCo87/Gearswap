-- SAM Gearsets
--
--
--
--

if player.name == 'Feary' then
	-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')

	-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'war' then
				set_macro_page(17,1)
			elseif player.sub_job == 'nin' then
				set_macro_page(17,2)
			elseif player.sub_job == 'dnc' then
				set_macro_page(17,3)
			elseif player.sub_job == 'drg' then 
				set_macro_page(17,4)
			elseif player.sub_job == 'whm' then 
				set_macro_page(17,5)
			elseif player.sub_job == 'run' then 
				set_macro_page(17,6)
			end
		else
			set_macro_page(17,1)
		end
		
elseif player.name == 'Derion' then

elseif player.name == 'Aniyah' then

elseif player.name == 'Firetoplay' then

else

end