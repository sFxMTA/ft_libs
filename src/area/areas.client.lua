--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--

local areas = {}

--
--
--
function AddArea(...)

    local args = {...}
    local count = #args
    local array = {}

    if count == 1 and type(args[1]) == "table" then

        for name, value in pairs(args[1]) do
            areas[name] = {}

            local trigger = value.trigger
            local blip = value.blip
            local marker = value.marker

            for key, location in pairs(value.locations) do
                local newArea = {}
                newArea.x = location.x
                newArea.y = location.y
                newArea.z = location.z
                newArea.blip = copy(blip)
                newArea.marker = copy(marker)
                newArea.trigger = copy(trigger)
                areas[name][key] = area.new(name .. "_" .. key, newArea)
                Citizen.Wait(10)
            end
            Citizen.Wait(10)

        end

    elseif count == 2 then

        local name = args[1]
        local value = args[2]
        areas[name] = {}

        local trigger = value.trigger
        local blip = value.blip
        local marker = value.marker

        for key, location in pairs(value.locations) do
            local newArea = {}
            newArea.x = location.x
            newArea.y = location.y
            newArea.z = location.z
            newArea.blip = copy(blip)
            newArea.marker = copy(marker)
            newArea.trigger = copy(trigger)
            areas[name][key] = area.new(name .. "_" .. key, newArea)
            Citizen.Wait(10)
        end

    end

end

function RemoveArea(...)

    local args = {...}
    local count = #args
    local array = {}

    if count == 1 and type(args[1]) == "table" then

        for _, name in ipairs(args[1]) do

            if areas[name] ~= nil then

                for _, area in pairs(areas[name]) do
                    area:Disable()
                    area:Remove()
                    Citizen.Wait(10)
                end

                areas[name] = nil
            end
            Citizen.Wait(10)

        end

    elseif count == 1 then

        local name = args[1]

        if areas[name] ~= nil then

            for _, area in pairs(areas[name]) do
                area:Disable()
                area:Remove()
                Citizen.Wait(10)
            end

            areas[name] = nil

        end

    end

end

function EnableArea(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for _, name in ipairs(args[1]) do

            if areas[name] ~= nil then
                for _, area in pairs(areas[name]) do
                    area:Enable()
                    area.enable = true
                    Citizen.Wait(10)
                end
            end
            Citizen.Wait(10)

        end

    elseif count == 1 then

        local name = args[1]
        if areas[name] ~= nil then
            for _, area in pairs(areas[name]) do
                area:Enable()
                area.enable = true
                Citizen.Wait(10)
            end
        end

    end

end

function DisableArea(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for _, name in ipairs(args[1]) do

            if areas[name] ~= nil then
                for _, area in pairs(areas[name]) do
                    area:Disable()
                    area.enable = false
                    Citizen.Wait(10)
                end
            end
            Citizen.Wait(10)

        end

    elseif count == 2 then

        local name = args[1]
        if areas[name] ~= nil then
            for _, area in pairs(areas[name]) do
                area:Disable()
                area.enable = false
                Citizen.Wait(10)
            end
        end

    end

end

function SwitchArea(...)

    local args = {...}
    local count = #args

    if count == 1 and type(args[1]) == "table" then

        for name, status in ipairs(args[1]) do

            if areas[name] ~= nil then
                for _, area in pairs(areas[name]) do
                    if status == false then
                        area:Disable()
                        area.enable = false
                    elseif status == true then
                        area:Enable()
                        area.enable = true
                    end
                    Citizen.Wait(10)
                end
            end
            Citizen.Wait(10)

        end

    elseif count == 2 then

        local name = args[1]
        if areas[name] ~= nil then
            for _, area in pairs(areas[name]) do
                area:Disable()
                Citizen.Wait(10)
            end
        end

    end

end
