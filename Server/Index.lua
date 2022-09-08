NanosRP = NanosRP or {}

print("Start Server Package ...")

Package.Require("base/sv_database.lua")

Package.Require("base/sv_characters.lua")
Package.Require("base/sv_server.lua")
Package.Require("base/sv_setup.lua")
Package.Require("base/sv_players.lua")

Package.Require("modules/jobs/sv_core.lua")
Package.Require("modules/money/sv_core.lua")

print("End Server Package ...")

Events.Call("NanosRP::GamemodeLoaded")

-- Reload package command
command.Add("ReloadPackage", function()
    Server.ReloadPackage("nanos-roleplay")
end)