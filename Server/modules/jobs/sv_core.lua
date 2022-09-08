NanosRP.Jobs = {}

NanosRP.Jobs[0] = {
	name = "NO JOB",
	salary = 0,
}

local function reloadJobs()
	NanosRP:Query([[CREATE TABLE IF NOT EXISTS `NanosRP_Jobs` (
		`id` INTEGER PRIMARY KEY AUTOINCREMENT,
		`globalName` TEXT,
		`name` TEXT,
		`description` TEXT,
		`slot` INTEGER,
		`salary` INTEGER,
		`model` JSON,
		`color` JSON,
		`weapons` JSON
	)]], function()
		NanosRP:Select("SELECT * FROM `NanosRP_Jobs`", function(result)
			if result and result[1] then
				for k, v in ipairs(NanosRP.Jobs) do
					_ENV[v.globalName] = #NanosRP.Jobs + 1
					NanosRP.Jobs[_ENV[v.globalName]] = v
				end
			end
		end)
	end)
end

reloadJobs()

local function addNewJobDataBase(job)
	if not job.globalName then
		error("The job global name is missing")
	end
	if not job.name then
		error("The job name is missing")
	end

	NanosRP:Query("INSERT INTO `NanosRP_Jobs` (`globalName`, `name`, `description`, `slot`, `salary`, `model`, `color`, `weapons`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", function()
		reloadJobs()
	end, job.globalName, job.name, job.description or "", job.slot or 0, job.salary or 0, JSON.stringify(job.model or {}), JSON.stringify(job.color or Color(255, 255, 255)), JSON.stringify(job.weapons or {}))
end

local function addNewJobLua(job)
	if not job.globalName then
		error("The job global name is missing")
	end
	if not job.name then
		error("The job name is missing")
	end

	local id = #NanosRP.Jobs + 1
	_ENV[job.globalName] = id
	NanosRP.Jobs[id] = job
end

addNewJobLua({
	globalName = "JOB_CITIZEN",
	name = "Citoyen",
	description = "Vous êtes un citoyen lambda, vous n'avez aucun métier.",
	salary = 0,
	slot = 0
})

NanosRP.DefaultJob = JOB_CITIZEN

function Player:setJob(index)
	if not NanosRP.Jobs[index] then return end
	local job = NanosRP.Jobs[index]
	Server.BroadcastChatMessage(self:GetName() .. " est maintenant " .. job.name)
	self:SetValue("Job", index, true)
end

Events.Subscribe("NanosRP::PlayerLoaded", function(ply)
	Events.CallRemote("NanosRP::SendJobs", ply, NanosRP.Jobs)
end)

Timer.SetInterval(function()
	for _, v in ipairs(Player.GetAll()) do
		v:addMoney(v:getJobSalary())
		Server.SendChatMessage(v, "Tu as reçu " .. v:getJobSalary() .. "$")
	end
end, 1000 * 60 * 5)