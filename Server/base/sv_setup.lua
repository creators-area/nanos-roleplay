NanosRP.SpawnPoints = NanosRP.SpawnPoints or {}

NanosRP:Query([[CREATE TABLE IF NOT EXISTS NanosRP_Spawn (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    posX INTEGER,
    posY INTEGER,
    posZ INTEGER,
    rotX INTEGER,
    rotY INTEGER,
    rotZ INTEGER
)]], function()
    NanosRP:Select("SELECT * FROM NanosRP_Spawn", function(result)
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