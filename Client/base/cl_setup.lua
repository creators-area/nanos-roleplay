-- Visual Setup
NanosRP.HUD = WebUI("NanosRP HUD", "file://UI/hud.html", false)
Events.Subscribe("NanosRP::SetupVisual", function() 
    local ply = Client.GetLocalPlayer()
    NanosRP.HUD:SetVisible(true)
    NanosRP.HUD:CallEvent("NanosRP::InitVisual", ply:GetName())
end)