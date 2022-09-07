NanosRP = NanosRP or {}

print("Start Server Package ...")

Package.Require("base/sv_database.lua")

Package.Require("base/sv_characters.lua")
Package.Require("base/sv_server.lua")
Package.Require("base/sv_setup.lua")

print("End Server Package ...")

-- Reload package command
command.Add("ReloadPackage", function()
    Server.ReloadPackage("nanos-roleplay")
end)


Package.RequirePackage("nanos-world-weapons")

-- Spawning the AK47
local my_ak47 = NanosWorldWeapons.AK47(Vector(1035, 154, 300), Rotator())