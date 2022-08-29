local function SpawnCharacter(ply)
    local plyCharacter = Character(Vector(0, 0, 100))
    ply:Possess(plyCharacter)
end
Player.Subscribe("Spawn", SpawnCharacter)

-- When a player disconnects, destroy the character
Player.Subscribe("Destroy", function(player)
    local plyCharacter = player:GetControlledCharacter()
    if not IsValid(plyCharacter) then return end
    plyCharacter:Destroy()
end)

-- When a character die, respawn it
Character.Subscribe("Death", function(self)
    local ply = self:GetPlayer()
    if not IsValid(ply) then self:Destroy() return end
    Timer.SetTimeout(function()
        self:Destroy()
        if not IsValid(ply) then return end
        SpawnCharacter(ply)
    end, 5000)
end)


-- For reload package
for _, ply in ipairs(Player.GetAll()) do
    SpawnCharacter(ply)
end