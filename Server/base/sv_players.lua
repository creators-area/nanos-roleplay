NanosRP:Query([[CREATE TABLE IF NOT EXISTS `NanosRP_Players` (
		`steamid` TEXT,
		`firstName` TEXT,
		`lastName` TEXT,
        `inventory` TEXT,
        `money` BIGINT,
        `rank` TEXT
	)]], function()

end)

NanosRP.Modules = {}

function NanosRP:AddPlayerColumn(name, type, default, callback)
    NanosRP:Query("ALTER TABLE `NanosRP_Players` ADD COLUMN " .. name .. " " .. type .. " DEFAULT " .. default, callback)
    NanosRP.Modules[name] = true
end

function Player:createData()
    NanosRP:Query("INSERT INTO `NanosRP_Players` (`steamid`, `firstName`, `lastName`, `inventory`, `money`, `rank`) VALUES (?, ?, ?, ?, ?, ?)", function()
        self:loadData()
    end, self:GetSteamID(), "NO", "NO", "", 0, "user")
end

function Player:loadData()
    NanosRP:Select("SELECT * FROM `NanosRP_Players` WHERE `steamid` = ?", function(result)
        if result and result[1] then
            for k, v in pairs(result[1]) do
                if NanosRP.Modules[k] then
                    self:SetValue("NanosRP::" .. k, v)
                end
            end
            self:setJob(JOB_CITIZEN)
            self:setHunger(100)
            Events.Call("NanosRP::PlayerLoaded", self)
        else
            self:createData()
        end
    end, self:GetSteamID())
end

Player.Subscribe("Spawn", function(ply)
    ply:loadData()
end)

Events.Subscribe("NanosRP::GamemodeLoaded", function(ply)
    for _, v in pairs(Player.GetAll()) do
        v:loadData()
    end
end)