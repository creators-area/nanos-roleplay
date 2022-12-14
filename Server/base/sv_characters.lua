local torsoBones = {
    ["spine_01"] = true,
    ["spine_02"] = true,
    ["spine_03"] = true,
}

local function SpawnCharacter(ply)
    local plyCharacter = Character(Vector(400, 0, 1100), Rotator())
    plyCharacter:SetHealth(100)
    plyCharacter:SetArmor(0)
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

Character.Subscribe("TakeDamage", function(self, damage, bone)
    if torsoBones[bone] then
        local damageTook = damage
        local charArmor = self:GetArmor()
        if charArmor >= damageTook then
            self:SetArmor(charArmor - damageTook)
        else
            local damageHealth = damageTook - charArmor
            self:SetArmor(0)
            self:SetHealth(self:GetHealth()-damageHealth)
        end
    end
end)

-- Disable Aiming when Crouching and Proning
if not NanosRP.CrouchProneAim then
    Character.Subscribe("StanceModeChanged", function(self, old_state, new_state)
        self:SetCanAim(new_state ~= StanceMode.Proning and new_state ~= StanceMode.Crouching) -- Disable aiming when newstate is not idle

        if new_state == StanceMode.Proning or new_state == StanceMode.Crouching then
          self:SetWeaponAimMode(0) -- Force stop aiming when crouching or proning
        end
      end)
end

-- Disable Aiming when character is not on the ground
if NanosRP.RealisticAim then
    Character.Subscribe("FallingModeChanged", function(self, old_state, new_state)
      self:SetCanAim(new_state == FallingMode.None) -- Disable Aiming when is not on the ground

      if new_state ~= FallingMode.None then
        self:SetWeaponAimMode(0) -- Force Disable Aiming when not on the ground
      end
    end)
end

-- For reload package
for _, ply in ipairs(Player.GetAll()) do
    SpawnCharacter(ply)
end