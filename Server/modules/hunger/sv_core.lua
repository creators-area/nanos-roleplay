Player.Subscribe("Spawn", function(ply)
    ply:SetValue("NanosRP::Hunger", 100)
end)

function Player:setHunger(newHunger)
    local oldHunger = self:getHunger()
    self:SetValue("NanosRP::Hunger", newHunger, true)
    Events.Call("NanosRP::ValueUpdate", self, "NanosRP::Hunger", oldHunger, newHunger)
end

Timer.SetInterval(function()
    for _, ply in ipairs(Player.GetAll()) do
        if not IsValid(ply:GetControlledCharacter()) then goto continue end
        if ply:GetValue("NanosRP::Hunger", 0) > 0 then
            ply:SetValue("NanosRP::Hunger", ply:GetValue("NanosRP::Hunger", 100) - 0.2, true)
        end
        ::continue::
    end
end, 1000)