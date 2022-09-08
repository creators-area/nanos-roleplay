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

    -- Log the command ran by the player
    if Server then
        if ply and ply:IsValid() then
            Package.Log(ply:GetName() .. " tried to run command: " .. cmd)
        end
    end

    -- Check if the command is available
    if not command.List[cmd] then return end
    command.List[cmd](ply, table.unpack(args))
    return false -- Command found
end

function Character:GetArmor()
    if self then
        return self:GetValue("NanosRP_Armor")
    end
end

if Server then

    -- When a player runs a command
    Events.Subscribe("PlayerCommand", function(ply, text)
        command.Run(ply, text)
    end)    

    -- When a command is performed by the console
    Server.Subscribe("Console", function(text)
        return command.Run(nil, text)
    end)

    function Character:SetArmor(amount)
        if self then
            self:SetValue("NanosRP_Armor", amount, true)
        end
    end

elseif Client then

    Client.Subscribe("Console", function(text)
        Events.CallRemote("PlayerCommand", text)
        return command.Run(Client.GetLocalPlayer(), text)
    end)
end