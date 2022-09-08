function Player:getMoney()
    return self:GetValue("NanosRP::Money", 0)
end

function Player:canAfford(money)
    return self:getMoney() >= money
end