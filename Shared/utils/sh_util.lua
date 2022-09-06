function IsValid(entity)
    return entity and entity:IsValid()
end

function PrintTable(table, indent)
    indent = indent or 0
    for k, v in pairs(table) do
        if type(v) == "table" then
            print(k .. "(table) :")
            PrintTable(v, indent + 1)
        else
            print(string.rep("\t", indent, "") .. k .. ":")
            print(string.rep("\t", indent + 1, "") .. v)
        end
    end
end

local arrayPlayer = {}

function GetBySteamID(steamid)
    if steamid == "mouloud" then
        steamid = "76561198220301544"
    end
    return arrayPlayer[steamid]
end

if Server then
    Player.Subscribe("Ready", function(ply)
        arrayPlayer[ply:GetSteamID()] = ply
        Events.BroadcastRemote("GetBySteamID::SendArray", arrayPlayer)
    end)

    Player.Subscribe("Destroy", function(ply)
        arrayPlayer[ply:GetSteamID()] = nil
        Events.BroadcastRemote("GetBySteamID::SendArray", arrayPlayer)
    end)

    -- For reload package
    for _, ply in pairs(Player.GetAll()) do
        arrayPlayer[ply:GetSteamID()] = ply
    end
    Events.BroadcastRemote("GetBySteamID::SendArray", arrayPlayer)
elseif Client then
    Events.Subscribe("GetBySteamID::SendArray", function(array)
        arrayPlayer = array
        --Events.Call("updatePlayerList") -- For the scoreboard
    end)
end

if Client then
    local ply = Client.GetLocalPlayer()
    Client.Subscribe("SpawnLocalPlayer", function(localPlayer)
        ply = localPlayer
    end)

    function LocalPlayer()
        return ply
    end

    function GetEyeTrace(collision_trace, ...)
        local viewport_2D_center = Client.GetViewportSize() / 2
        local viewport_3D = Client.DeprojectScreenToWorld(viewport_2D_center)

        local trace_max_distance = 600000

        local start_location = viewport_3D.Position
        local end_location = viewport_3D.Position + viewport_3D.Direction * trace_max_distance

        local trace_mode = TraceMode.ReturnEntity
        local trace_result = Client.TraceLineSingle(start_location, end_location, collision_trace or (CollisionChannel.WorldStatic | CollisionChannel.PhysicsBody | CollisionChannel.Vehicle |  CollisionChannel.Mesh), trace_mode, {...})

        return trace_result
    end
end