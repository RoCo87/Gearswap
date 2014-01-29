-- Feary's WHM LUA
-- Date: 1/29/2014

function get_sets()
	-- Get WHM gearsets
	include('Gearsets/WHM_GearSets.lua')
	
	-- Variables 
	ShadowType = 'None'
	PDT = 0
	MDT = 0
end


function self_command(command)
-- Lock PDT
	if command == 'PDT' then
	-- Make sure other values are set to default
		MDT = 0
	-- Set PDT set and equip it
		PDT = 1
		equip(sets.idle.PDT)
--  Lock MDT
	elseif command == 'MDT' then
	-- make sure other values are set to default
		PDT = 0
	-- lock MDT set and equip it
		MDT = 1
		equip(sets.idle.MDT)
-- Unlock 
	elseif command == 'TP' then
		PDT = 0
		MDT = 0
		windower.addtochat(121, "Unlocked PDT/MDT")
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

function precast(spell,arg)
-- Job Abilities
	if spell.type == 'JobAbility' then
		if sets.precast.JA[spell.name] then
			equip(sets.precast.JA[spell.name])
		end
-- Weaponskills
	elseif spell.type == 'Weaponskill' then
		if player.TP >= 100 then
			if spell.target.distance <= 25 then
				if sets.precast.WS[spell.name] then
					equip(sets.precast.WS[spell.name])
				else
					equip(sets.precast.WS)
				end
			else
				cancelspell()
				windower.addtochat(121, 'Canceled '..spell.name..'.'..spell.target.name..' is Too Far')
			end
		else 
			windower.addtochat(121, ''..player.TP..' is not enough to WS')
		end
-- Magic
	elseif spell.type:endswith('Magic') then
		-- Cure casting time
		if spell.english:startswith('Cure') or spell.english:startswith("Curaga") then
			equip(sets.precast.Cure)
		else
			equip(sets.precast.Fastcast)
		end
		-- Cancel Sneak
		if spell.name == 'Sneak' and buffactive.Sneak and spell.target.type == 'SELF' then
			windower.ffxi.cancel_buff(71)
			cast_delay(0.3)
		-- Auspice 
		elseif spell.name == 'Auspice' then
			equip({feet="Orsn. Duckbills +2"})
		elseif spell.english:wcmatch('Protectra*') then
			equip({feet="Clr. Duckbills +2"})
		elseif spell.english:wcmatch('Shellra*') then
			equip({legs="Clr. Pantaln +2"})
		end		
-- Ninjutsu
	elseif spell.type == 'Ninjutsu' then
		equip(sets.precast.Fastcast)
-- BardSongs
	elseif spell.type == 'BardSong' then
		equip(sets.precast.Fastcast)
	end
end

function midcast(spell,arg)
-- Healing Magic
	if spell.skill == 'HealingMagic' then
		-- Cure Curaga Cura
		if spell.english:startswith('Cure') then
			equip(sets.midcast.Cure)
		elseif spell.english:startswith("Curaga") then
			equip(sets.midcast.Curaga)
		elseif spell.english:startswith('Cura') then
			equip(sets.midcast.Cura)
		-- Na Spells
		elseif spell.english:wcmatch('Paralyna|Poisona|Blindna|Silena|Cursna|Viruna|Stona') then
			if buffactive['Divine Caress'] then
				equip(sets.midcast.Naspells, sets.precast.JA[spell.name])
			elseif spell.name == 'Cursna' then
				equip(sets.midcast.Cursna)
			else
				equip(sets.midcast.Naspells)
			end
		elseif spell.name == 'Erase' then
			equip(sets.midcast.Erase)
		elseif spell.name == 'Esuna' then
			equip(sets.midcast.Esuna)
		elseif spell.name == 'Sacrifice' then
			equip(sets.midcast.Sacrifice)
		elseif spell.english:startswith('Reraise') or spell.name == 'Arise' then
			equip(sets.midcast.ConserveMP)
		else
			equip(sets.midcast.Recast)
		end
-- Enhancing Magic
	elseif spell.skill == 'EnhancingMagic' then
		if spell.name == 'Phalanx' then
			equip(sets.midcast.Phalanx) 
		elseif spell.english:wcmatch('Regen*') then
			equip(sets.midcast.Regen)
		elseif spell.english:wcmatch('BarStona|BarWatera|BarAera|BarFira|BarBlizzara|BarThundra') then
			equip(sets.midcast.BarElement)
		elseif spell.english:wcmatch('BarSleepra|BarPoisonra|BarParalyna|BarBlindra|BarSilencra|BarVira|BarPetra|BarAmnesra') then
			equip(sets.midcast.BarStatus)
		elseif spell.english:wcmatch('Boost-*') then
			equip(sets.midcast.Boost)
		elseif spell.english:endswith('Spikes') then
			equip(sets.midcast.Spikes)
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
		elseif spell.name == 'Auspice' then
			equip(sets.midcast.ConserveMP, {feet="Orsn. Duckbills +2"})
		elseif spell.english:wcmatch('Protectra*') then
			equip(sets.midcast.ConserveMP, {feet="Clr. Duckbills +2"})
		elseif spell.english:wcmatch('Shellra*') then
			equip(sets.midcast.ConserveMP, {legs="Clr. Pantaln +2"})
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
			equip(sets.midcast.Banish)
		elseif spell.english:startswith('Holy') then
			equip(sets.midcast.Holy)
		elseif spell.name == 'Repose' then
			equip(sets.midcast.Repose)
		elseif spell.name == 'Flash' then
			equip(sets.midcast.Flash)
		end
-- Dark Magic
	elseif spell.skill == 'DarkMagic' then
		if spell.name == 'Drain' then
			equip(sets.midcast.Drain)
		elseif spell.name == 'Aspir' then
			equip(sets.midcast.Aspir)
		elseif spell.name == 'Stun' then
			equip(sets.midcast.Macc)
		else
			equip(sets.midcast.DarkMagic)
		end
-- Elemental Magic
	elseif spell.skill == 'ElementalMagic' then
		if spell.english:wcmatch('Fir*|Ston*|Water*|Aero*|Blizza*|Thund*') then
			equip(sets.midcast.Nuke)
		elseif spell.english:wcmatch('Burn|Rasp|Drown|Choke|Frost|Shock') then
			equip(sets.midcast.Dot)
		else
			equip(sets.midcast.Macc)
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
        end
    elseif spell.name == 'Monomi: Ichi' and buffactive.Sneak and spell.target.type == 'SELF' then
        windower.ffxi.cancel_buff(71)
    end
end -- end midcast 

function aftercast(spell,arg)
-- Autoset
	if player.status == 'Engaged' then
		equip(sets.TP)
	else
		equip(sets.idle.Standard)
	end
-- Sleep and repose
	if spell.name == "Sleep II" or spell.name == "Repose" then
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
		windower.send_command('wait 1; input /ma "Cure V" <me>')
	end
	 -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
	end
end
