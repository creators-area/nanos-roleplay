local function getCommandArgs(text)
    local cmd
    local args = {}
    for word in string.gmatch(text, "%w+") do
        if not cmd then
            cmd = word
        else
            args[#args + 1] = word
        end
    end
    return cmd, args;
end

command = {}
command.List = {}

-- Add a command
function command.Add(commandName, callback)
    command.List[commandName] = callback
end

-- Remove a command
function command.Remove(commandName)
    command.List[commandName] = nil
end

function command.Run(ply, text)
    local cmd, args = getCommandArgs(text)

    if not cmd then return end

    -- Log the command run by the player
    if Server then
        if ply and ply:IsValid() then
            Package.Log(ply:GetName() .. " try to run the command : " .. cmd)
        end
    end

    -- Check if the command is available
    if not command.List[cmd] then return end
    command.List[cmd](ply, table.unpack(args))
    return false -- Command found
end

if Server then

    -- A player run a command
    Events.Subscribe("PlayerCommand", function(ply, text)
        command.Run(ply, text)
    end)    

    -- The server run a command
    Server.Subscribe("Console", function(text)
        return command.Run(nil, text)
    end)

elseif Client then

    Client.Subscribe("Console", function(text)
        Events.CallRemote("PlayerCommand", text)
        return command.Run(Client.GetLocalPlayer(), text)
    end)

end