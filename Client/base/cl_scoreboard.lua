Input.Register("NanosRP - Scoreboard", "Tab")
NanosRP.Scoreboard = WebUI("NanosRP Scoreboard", "file://UI/scoreboard.html", false)

function NanosRP.AddScbPlayers(bool)
    for k, player in pairs(Player.GetAll()) do
        if bool then
            NanosRP.Scoreboard:CallEvent("NanosRP:AddPlayer", player:GetName(), player:getJobName(), player:GetPing())
        else
            NanosRP.Scoreboard:CallEvent("NanosRP:RemovePlayers")
        end
    end
end

Input.Bind("NanosRP - Scoreboard", InputEvent.Released, function()
    NanosRP.Scoreboard:SetVisible(false)
    NanosRP.Scoreboard:CallEvent("NanosRP:RemovePlayers")
end)

Input.Bind("NanosRP - Scoreboard", InputEvent.Pressed, function()
    NanosRP.AddScbPlayers(true)
    NanosRP.Scoreboard:SetVisible(true)
    NanosRP.Scoreboard:BringToFront()
end)