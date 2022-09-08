function Player:getJob()
    return self:GetValue("NanosRP::Job", 0)
end

function Player:getJobName()
    return NanosRP.Jobs[self:getJob()].name
end

function Player:getJobSalary()
    return NanosRP.Jobs[self:getJob()].salary
end

Events.Subscribe("NanosRP::SendJobs", function(jobs)
    NanosRP.Jobs = jobs
end)