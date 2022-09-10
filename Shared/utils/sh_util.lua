function IsValid(entity)
    return entity and entity:IsValid()
end

function PrintTable(table)
    print(NanosUtils.Dump(table))
end

local arrayPlayer = {}

function GetBySteamID(steamid)
    if steamid == "mouloud" then
        steamid = "76561198220301544"
    end
    return arrayPlayer[steamid]
end

function NanosRP.Explode(separator, str)
	if separator == "" then return totable(str) end

	local ret = {}
	local curp = 1

	for i = 1, string.len(str) do
		local startp, endp = string.find(str, separator, curp)
		if not startp then break end
		ret[i] = string.sub(str, curp, startp - 1)
		curp = endp + 1
	end

	ret[#ret + 1] = string.sub(str, curp)

	return ret
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