-- server.lua

-- Define a function to handle the hold command
    local function handleHoldCommand(source, targetId, action)
        -- Verify the target is a valid player
        if GetPlayerPing(targetId) == 0 then
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0 },
                multiline = true,
                args = { "System", "Player not found!" }
            })
            return
        end
    
        -- ACE permission check
        if not IsPlayerAceAllowed(source, "group.admin") then
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0 },
                multiline = true,
                args = { "System", "You don't have permission to use this command." }
            })
            return
        end
    
        -- Inform the admin and target of the action
        local message = action == "hold" and "Holding player " .. tostring(targetId) .. "." or "Releasing player " .. tostring(targetId) .. "."
        TriggerClientEvent('chat:addMessage', source, {
            color = { 0, 255, 0 },
            multiline = true,
            args = { "System", message }
        })
    
        -- Trigger the client-side event to start or stop holding
        if action == "hold" then
            TriggerClientEvent('startHold', targetId, source) -- Pass the admin's ID to the target
        else
            TriggerClientEvent('stopHold', targetId)
        end
    end
 
    -- Register /hold command
    RegisterCommand('hold', function(source, args, rawCommand)
        -- Check if an ID was provided

        local targetId = tonumber(args[1])
        if not targetId then
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0 },
                multiline = true,
                args = { "System", "You must provide a target player ID!" }
            })
            return
        end
    
        handleHoldCommand(source, targetId, "hold")
    end, true)
    


    -- Register /unhold command
    RegisterCommand('unhold', function(source, args, rawCommand)
        -- Check if an ID was provided
        local targetId = tonumber(args[1])
        if not targetId then
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0 },
                multiline = true,
                args = { "System", "You must provide a target player ID!" }
            })
            return
        end
    
        handleHoldCommand(source, targetId, "unhold")
    end, true)

    TriggerEvent('chat:addSuggestions', {
        {
            name='/hold',
            help='Holds Player(s), Infront of ped who exectued command',
            params={
                { name="ID", help="ID of the player you want to hold" }
            }
        },
        {
            name='/unhold',
            help='Reverses effects of /hold',
            params={
                { name="ID", help="ID of player you wish to unhold" }
            }
        },
    })
