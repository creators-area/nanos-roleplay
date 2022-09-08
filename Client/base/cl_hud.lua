NanosRP.HUD = WebUI("NanosRP HUD", "file://UI/hud.html", false)

Events.Subscribe("NanosRP::SetupVisual", function() 
    NanosRP.ply = Client.GetLocalPlayer()
    NanosRP.plyChar = NanosRP.ply:GetControlledCharacter()
    NanosRP.HUD:SetVisible(true)
    NanosRP.HUD:CallEvent("NanosRP::InitVisual", NanosRP.ply:GetName(), NanosRP.plyChar:GetHealth(), NanosRP.plyChar:GetArmor())
end)

Character.Subscribe("TakeDamage", function(self, damage, bone)
    NanosRP.HUD:CallEvent("NanosRP::InitVisual", NanosRP.ply:GetName(), self:GetHealth(), self:GetArmor())
end)

-- Character Event to refresh HUD variables
