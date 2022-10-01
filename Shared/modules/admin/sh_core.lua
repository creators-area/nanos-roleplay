function Player:getRank()
    return self:GetValue("NanosRP::Rank", "user")
end

function Player:isNoclipping()
    return self:GetValue("NanosRP::Noclip", false)
end


function Player:isGodmode()
    return self:GetValue("NanosRP::Godmode", false)
end

function Player:isVanishing()
    return self:GetValue("NanosRP::Vanish", false)
end