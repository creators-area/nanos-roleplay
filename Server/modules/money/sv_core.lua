NanosRP:AddPlayerColumn("money", "BIGINT", 0)

function Player:addMoney(money, callback)
    local oldMoney = self:getMoney()
    local newMoney = self:getMoney() + money
    self:SetValue("NanosRP::Money", newMoney)
    NanosRP:Query("UPDATE `NanosRP_Players` SET `money` = ? WHERE `steamid` = ?", function()
        Events.Call("NanosRP::ValueUpdate", self, "NanosRP::Money", oldMoney, newMoney)
        if not callback then return end
        callback(newMoney)
    end, newMoney, self:GetSteamID())
end

function Player:setMoney(money, callback)
    local oldMoney = self:getMoney()
    local newMoney = money
    self:SetValue("NanosRP::Money", newMoney)
    NanosRP:Query("UPDATE `NanosRP_Players` SET `money` = ? WHERE `steamid` = ?", function()
        Events.Call("NanosRP::ValueUpdate", self, "NanosRP::Money", oldMoney, newMoney)
        if not callback then return end
        callback(newMoney)
    end, newMoney, self:GetSteamID())
end