-- client.lua

local holding = false

-- Event to start holding the player
RegisterNetEvent('startHold')
AddEventHandler('startHold', function(adminId)
    local adminPed = GetPlayerPed(GetPlayerFromServerId(adminId))
    local playerPed = PlayerPedId()

    holding = true

    -- Disable player controls to stop movement
    Citizen.CreateThread(function()
        while holding do
            Citizen.Wait(0)

            -- Get admin's position and heading
            local adminCoords = GetEntityCoords(adminPed)
            local adminHeading = GetEntityHeading(adminPed)

            -- Calculate the new position in front of the admin
            local offset = 2.0
            local xOffset = math.sin(math.rad(adminHeading)) * offset
            local yOffset = math.cos(math.rad(adminHeading)) * offset
            local newCoords = vector3(adminCoords.x + xOffset, adminCoords.y + yOffset, adminCoords.z)

            -- Move the held player to the new position

            SetEntityCoords(playerPed, newCoords.x, newCoords.y, newCoords.z, false, false, false, true)
            -- Freeze the player
            FreezeEntityPosition(playerPed, true)

            -- Optional: Prevent player from moving by disabling controls
            DisableControlAction(0, 32, true) -- W (move forward)
            DisableControlAction(0, 33, true) -- S (move backward)
            DisableControlAction(0, 34, true) -- A (move left)
            DisableControlAction(0, 35, true) -- D (move right)
        end
    end)
end)

-- Event to stop holding the player
RegisterNetEvent('stopHold')
AddEventHandler('stopHold', function()
    holding = false -- Stop the loop

    -- Unfreeze the player
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, false)

    -- Enable player controls again
    Citizen.CreateThread(function()
        EnableControlAction(0, 32, true) -- W (move forward)
        EnableControlAction(0, 33, true) -- S (move backward)
        EnableControlAction(0, 34, true) -- A (move left)
        EnableControlAction(0, 35, true) -- D (move right)
    end)
end)
