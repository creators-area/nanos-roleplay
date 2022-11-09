NanosRP.SpawnPoints = NanosRP.SpawnPoints or {}

NanosRP:Query([[CREATE TABLE IF NOT EXISTS `NanosRP_Spawn` (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `posX` INTEGER,
    `posY` INTEGER,
    `posZ` INTEGER,
    `rotX` INTEGER,
    `rotY` INTEGER,
    `rotZ` INTEGER
)]], function()
    NanosRP:Select("SELECT * FROM `NanosRP_Spawn`", function(result)
        if result and result[1] then
            NanosRP.SpawnPoints = result
        end
    end)
end)

Player.Subscribe("Spawn", function(ply)
    if #NanosRP.SpawnPoints == 0 and ply:GetSteamID() == NanosRP.Owner then
        Events.CallRemote("NanosRP::SpawnPoint::Create", ply)
    end
end)

Events.Subscribe("NanosRP::SpawnPoint::Create", function(ply, pos, rot)
    if ply:GetSteamID() ~= NanosRP.Owner then
        return
    end
    NanosRP:Insert("INSERT INTO `NanosRP_Spawn` (`posX`, `posY`, `posZ`, `rotX`, `rotY`, `rotZ`) VALUES (?, ?, ?, ?, ?, ?)", pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, function()
        NanosRP:Select("SELECT * FROM `NanosRP_Spawn`", function(result)
            if result and result[1] then
                NanosRP.SpawnPoints = result
            end
        end)
    end)
end)

Events.Subscribe("NanosRP::SpawnPoint::Remove", function(ply, id)
    if ply:GetSteamID() ~= NanosRP.Owner then
        return
    end
    NanosRP:Delete("DELETE FROM `NanosRP_Spawn` WHERE `id` = ?", id, function()
        NanosRP:Select("SELECT * FROM `NanosRP_Spawn`", function(result)
            if result and result[1] then
                NanosRP.SpawnPoints = result
            end
        end)
    end)
end)