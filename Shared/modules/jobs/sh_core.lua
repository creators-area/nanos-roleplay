function Player:getJob()
    return self:GetValue("NanosRP::Job", 0)
end

function Player:getJobName()
    return NanosRP.Jobs[self:getJob()].name
end