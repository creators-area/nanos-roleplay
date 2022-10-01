NanosRP = NanosRP or {}

World.SpawnDefaultSun()

print("Starting client packages...")

Package.Require("base/cl_setup.lua")

-- Loading HUD, inventory and scoreboard
Package.Require("base/cl_hud.lua")
Package.Require("base/cl_inventory.lua")
Package.Require("base/cl_scoreboard.lua")

-- Loading CL Administration commands
Package.Require("modules/admin/cl_admincmds.lua")

print("Client packages loaded!")