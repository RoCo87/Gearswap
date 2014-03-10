--[[
    !! Special thanks to everyone that helped me with the code and to better understand it !!
]]

function get_sets()
    windower.send_command('input /macro book 18; wait .1; input /macro set 1; input /echo [ Job Changed to RNG ]')
    windower.send_command('@bind f10 input /range <t>')
    windower.send_command('input /blockhelp on')


    -- Start defining actual gear sets to be used below --
    -- Miscellaneous sets
    sets.misc = {}
    sets.misc.DT = {}
    sets.misc.DT.None = {}
    sets.misc.DT.Active = {
                head="Iuitl Headgear", neck="Twilight Torque",
                body="Iuitl Vest", hands="Iuitl Wristbands", lring="Dark Ring", rring="Defending Ring",
                back="Mollusca Mantle", waist="Flume Belt", legs="Iuitl Tights +1", feet="Iuitl Gaiters"}

    sets.misc.Barrage = {
                hands="Orion Bracers +1",
                legs="Desultor Tassets"}

    sets.misc.Movement = {
                feet="Orion socks +1"}

    sets.misc.Utsusemi = {
                neck="Magoraga Beads",}


    -- Precast sets --
    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA['Bounty Shot'] = {
                hands="Syl. Glvltte. +2"}
    sets.precast.JA.Camouflage = {
                body="Orion Jerkin +1"}
    sets.precast.JA['Eagle Eye Shot'] = {
                legs="Arcadian Braccae"}
    sets.precast.JA.Scavenge = {
                feet="Orion Socks +1"}
    sets.precast.JA.Shadowbind = {
                hands="Orion Bracers +1"}
    sets.precast.JA.Sharpshot = {
                legs="Orion Braccae +1"}

    sets.precast.PreShot = {
                head="Orion Beret +1",
                body="Sylvan Caban +2", hands="Iuitl Wristbands",
                waist="Impulse Belt", legs="Nahtirah Trousers"}

    sets.precast.WS = {}
    sets.precast.WS['Jishnu\'s Radiance'] = {
                head="Orion Beret +1", neck="Light Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Light Belt", legs="Manibozho Brais", feet="Orion socks +1"}
    sets.precast.WS['Namas Arrow'] = {
                head="Orion Beret +1", neck="Light Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Orion Jerkin +1", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Buquwik Cape", waist="Light Belt", legs="Nahtirah Trousers",  feet="Orion socks +1"}

    sets.precast.FastCast = {
                head="Athos's Chapeau", neck="Orunmila's Torque", lear="Loquac. Earring",
                body="Mirke Wardecors", hands="Thaumas Gloves", lring="Prolix Ring"}


    -- Midcast sets (none needed in this file) --
    sets.midcast = {}


    -- Aftercast sets labeled to show either melee or idle --
    sets.melee = {}
    sets.melee.TP = {}
    sets.melee.TP.Normal = {
                head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Clearview Earring", rear="Volley Earring",
                body="Orion Jerkin +1", hands="Manibozho Gloves", lring="Rajas Ring", rring="Pyrosoul Ring",
                back="Lutian Cape", waist="Elanid Belt", legs="Nahtirah Trousers", feet="Orion socks +1"}
    sets.melee.TP.Accuracy = set_combine(sets.melee.TP.Normal, {
                hands="Buremte Gloves", lring="Hajduk Ring", rring="Paqichikaji Ring",
                legs="Orion Braccae +1"})

    sets.idle = set_combine(sets.misc.DT.Active, {
                back="Shadow Mantle"})


    IdleMode = 'DT'
    DTMode = 'None'
    TPMode = 'Normal'
    ShadowType = 'None'
end


function self_command(str)
    -- Use an in game macro "/con gs c DTMode" to toggle Damage Taken set
    if str == 'DTMode' then
        if DTMode == 'None' then
            DTMode = 'Active'
        else
            DTMode = 'None'
        end
        windower.add_to_chat(8,'Damage taken set to: '..DTMode)
        gear_modes()
    -- Use an in game macro "/con gs c TPMode" to cycle through Normal and Accuracy sets
    elseif str == 'TPMode' then
        if TPMode == 'Normal' then
            TPMode = 'Accuracy'
        else
            TPMode = 'Normal'
        end
        windower.add_to_chat(8,'Engaged melee set mode: '..TPMode)
        gear_modes()
    end
end

-- User created bridge for built in aftercast and status_change functions,
-- also self_command references listed above to help handle mode changes for situation needs
function gear_modes()
    -- Sequential gear sets used to easier allow for changing player needs
    if player.status == 'Engaged' then
        equip(sets.melee.TP[TPMode], sets.misc.DT[DTMode])
    else
        equip(sets.idle, sets.misc.DT[DTMode], sets.misc.Movement)
    end
end

-- Used to disable slots for items such as Reraise Earring among other things
function slot_disabling()
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


----------- Start of ----------
------ built in functions -----
function status_change(new,old)
    if T{'Idle','Engaged'}:contains(new) then
        if player.status == 'Engaged' then
            -- Gear info each time you Engage, useful if using DressUp or BlinkMeNot
            windower.add_to_chat(8,player.name..':   Melee = '..TPMode..'   |   Damage Taken = '..DTMode)
            -- Automatically activate Velocity Shot when engaging
            if not buffactive['Velocity Shot'] and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and windower.ffxi.get_ability_recasts()[129] < 1 then
                windower.send_command('velocityshot')
            end
        end
        gear_modes()
        slot_disabling()
    end
end

function precast(spell,arg)
    slot_disabling()
    if (spell.name == 'Jishnu\'s Radiance' or spell.name == 'Namas Arrow') and not buffactive.Berserk and not buffactive.Amnesia and not buffactive.Obliviscence and not buffactive.Paralysis and player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] < 1 then
        windower.send_command('berserk; wait 1; warcry; wait 1; '..spell.name..' '..spell.target.raw)
        cancel_spell()
        return
    end

    if spell.name == 'Ranged' then
        equip(sets.precast.PreShot)
    end

    -- Generic equip command for all Job Abilities and Weaponskills
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif sets.precast.WS[spell.name] then
        equip(sets.precast.WS[spell.name])
    end

    -- Magic spell gear handling(Precast)
    if spell.skill == 'Ninjutsu' then
        equip(sets.precast.FastCast)
        if windower.wc_match(spell.name,'Utsusemi*') then
            equip(sets.precast.FastCast, sets.misc.Utsusemi)
        end
    end

    -- Special handling to remove Dancer sub job Sneak effect
    if spell.name == 'Spectral Jig' and buffactive.Sneak then
        windower.ffxi.cancel_buff(71)
        cast_delay(0.3)
    end
end

function midcast(spell,arg)
    if spell.name == 'Ranged' then
        equip(sets.melee.TP[TPMode])
        if buffactive.Barrage then
            equip(sets.misc.Barrage)
        end
    end

    -- Gear change to Damage Taken set when in midcast of Utsusemi
    -- Special handling to remove Utsusemi, Sneak, and Stoneskin effects if they are active
    if windower.wc_match(spell.name,'Utsusemi*') then
        equip(sets.misc.DT.Active, sets.misc.Utsusemi)
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
    gear_modes()
    -- Changes shadow type variable to allow cancel Copy Image if last cast was Utsusemi: Ni
    if spell and spell.name == 'Utsusemi: Ni' then
        ShadowType = 'Ni'
    elseif spell and spell.name == 'Utsusemi: Ichi' then
        ShadowType = 'Ichi'
    end
end