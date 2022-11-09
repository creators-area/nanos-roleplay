if not NanosRP.UseAdminMode then return end

function Player:setNoclip(bool)
    local selfChar = self:GetControlledCharacter()
    if not selfChar then return end
    if bool then
        self:SetValue("NanosRP::Noclip", true)
        selfChar:SetFlyingMode(true)
        selfChar:SetCollision(CollisionType.NoCollision)
        Server.SendChatMessage(self, "Vous êtes en noclip")
    else
        self:SetValue("NanosRP::Noclip", false)
        selfChar:SetFlyingMode(false)
        selfChar:SetCollision(CollisionType.Normal)
        Server.SendChatMessage(self, "Vous n'êtes plus en noclip")
    end
end

function Player:setGodmode(bool)
    local selfChar = self:GetControlledCharacter()
    if not selfChar then return end
    if bool then
        self:SetValue("NanosRP::Godmode", true)
        self:GetControlledCharacter():SetHighFallingTime( -1 )
        selfChar:SetInvulnerable(true)
        Server.SendChatMessage(self, "Vous êtes invincible")
    else
        self:SetValue("NanosRP::Godmode", false)
        self:GetControlledCharacter():SetHighFallingTime( 1 )
        selfChar:SetInvulnerable(false)
        Server.SendChatMessage(self, "Vous n'êtes plus invincible")
    end
end

function Player:setVanish(bool)
    local selfChar = self:GetControlledCharacter()
    if not selfChar then return end
    if bool then
        self:SetValue("NanosRP::Vanish", true)
        selfChar:SetVisibility(false)
        Server.SendChatMessage(self, "Vous êtes invisible")
    else
        self:SetValue("NanosRP::Vanish", false)
        selfChar:SetVisibility(true)
        Server.SendChatMessage(self, "Vous êtes visible")
    end
end







--self:setGodmode(false)
--self:setVanish(false)





function Player:SetRank()
    NanosRP:Select("SELECT rank FROM `NanosRP_Players` WHERE `steamid` = ?", function(result)
        if result[1].rank ~= "" then
            self:SetValue("NanosRP::Rank", result[1].rank)
        else
            NanosRP:Query("UPDATE NanosRP_Players SET rank = ? WHERE steamid = ?", function() 
            end, "user", self:GetSteamID())
            self:SetValue("NanosRP::Rank", "user")
        end
    end, self:GetSteamID())
end
Player.Subscribe("Spawn", function(self)
    self:SetRank()
end)