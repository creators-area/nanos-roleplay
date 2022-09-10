NanosRP.HUD = WebUI("NanosRP HUD", "file://UI/hud.html")

local ply, char

local function updatePlayerHUD(health)
    if not IsValid(NanosRP.HUD) then return end
    NanosRP.HUD:CallEvent("NanosRP::InitVisual", ply:GetName(), health or char:GetHealth(), char:GetArmor(), ply:getMoney(), ply:getJobName(), ply:getJobSalary(), ply:getHunger())
end

Events.Subscribe("NanosRP::UpdateHUD", function()
    updatePlayerHUD()
end)

local arrayChange = {
    ["NanosRP::Money"] = true,
    ["NanosRP::Hunger"] = true,
}

Player.Subscribe("ValueChange", function(self, key, value)
    if not arrayChange[key] then return end
    updatePlayerHUD()
end)

local function startCharacter(ply, character)
    char = character
    updatePlayerHUD()
    character:Subscribe("HealthChanged", function(_, _, new)
        updatePlayerHUD(new)
    end)
end

local function startLocalPlayer(localPlayer)
    if not IsValid(localPlayer) then return end
    ply = localPlayer

    --[[
        if the player die and respawn with a new character, update the HUD information
    ]]
    ply:Subscribe("Possess", startCharacter)

    --[[
        if the player is already possessing a character, update the HUD information
    ]]
    local char = ply:GetControlledCharacter()
    if not IsValid(char) then return end
    startCharacter(ply, char)
end

Client.Subscribe("SpawnLocalPlayer", startLocalPlayer)
startLocalPlayer(Client.GetLocalPlayer())

-- Character Event to refresh HUD variables
