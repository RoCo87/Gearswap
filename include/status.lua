-- Statuses 
-- Date:
--
--
--
--

function statuses()
-- gain buffs
	if buff == 'Defense Down' and g_or_l == true then
		windower.send_command('input /p Defense Down')
	end
	if buff == 'Accuracy Down' and g_or_l == true then
		windower.send_command('input /p Accuracy Down')
	end
	if buff == 'gradual petrification' and g_or_l == true then
		windower.send_command('input /p gradual petrification will need Stona in 15;wait 10;input /p Stona in 5;wait 5;input /p Petrified Stona Please')
	end
	if buff == 'bind' and g_or_l == true then
		windower.send_command('input /p Bind')
	end
	if buff == 'Doom' and g_or_l == true then
		windower.send_command('input /p Doomed')
	end
	if buff == 'Slow' and g_or_l == true then
		windower.send_command('input /p Slowed')
	end
	if buff == 'charm' and g_or_l == true then
		windower.send_command('input /p charmed Sleep me')
	end
	if buff == 'weight' and g_or_l == true then
		windower.send_command('input /p Gravity')
	end
	if buff == 'Weakness' and g_or_l == true then
		windower.send_command('gs c twilight')
	end
-- Lose Buffs
	if S{MNK,SAM,THF,DRK,WAR,COR,DRG,PUP}:contains(player.main_job) then
		if buff == 'haste' and g_or_l == false then
			windower.send_command('input /p Haste Please')
		end
	end
	if buff == 'encumbrance' and g_or_l == false then
		previous_set()
	end
	if buff == 'Doom' and g_or_l == false then
		windower.send_command('input /p Doom off Woot -.-')
	end
	if buff == 'charm' and g_or_l == true then
		windower.send_command('input /p Uncharmed')
	end
end