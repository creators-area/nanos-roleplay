NanosRP.Jobs = NanosRP.Jobs or {}

NanosRP.Jobs[0] = {
	name = "NO JOB",
	salary = 0,
}

function Player:getJob()
    return self:GetValue("NanosRP::Job", 0)
end

function Player:getJobName()
    return (NanosRP.Jobs[self:getJob()] and NanosRP.Jobs[self:getJob()].name) or "NO JOB"
end

function Player:getJobSalary()
    return (NanosRP.Jobs[self:getJob()] and NanosRP.Jobs[self:getJob()].salary) or 0
end

Events.Subscribe("NanosRP::SendJobs", function(jobs)
    NanosRP.Jobs = jobs
    if Client then
        Events.Call("NanosRP::UpdateHUD")
    end
end)