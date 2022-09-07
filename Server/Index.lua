NanosRP = NanosRP or {}

print("Starting server packages...")

Package.Require("base/sv_database.lua")

Package.Require("base/sv_characters.lua")
Package.Require("base/sv_server.lua")
Package.Require("base/sv_setup.lua")

print("Server packages loaded!")

-- Reload package command
command.Add("ReloadPackage", function()
    Server.ReloadPackage("nanos-roleplay")
end)