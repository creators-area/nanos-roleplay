NanosRP = NanosRP or {}

print("Starting server packages...")

Package.Require("base/sv_database.lua")

Package.Require("base/sv_characters.lua")
Package.Require("base/sv_server.lua")
Package.Require("base/sv_setup.lua")
Package.Require("base/sv_players.lua")

Package.Require("modules/jobs/sv_core.lua")
Package.Require("modules/money/sv_core.lua")
Package.Require("modules/hunger/sv_core.lua")
Package.Require("modules/inventory/sv_core.lua")

Package.Require("modules/admin/sv_admincmds.lua")
Package.Require("modules/admin/sv_admincore.lua")
Package.Require("modules/admin/sv_adminconfig.lua")

print("Server packages loaded!")

Events.Call("NanosRP::GamemodeLoaded")

-- Reload package command
command.Add("ReloadPackage", function()
    Server.ReloadPackage("nanos-roleplay")
end)