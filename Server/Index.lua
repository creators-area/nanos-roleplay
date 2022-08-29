print("Start Server Package ...")

Package.Require("base/sv_characters.lua")

print("End Server Package ...")

-- Reload package command
command.Add("ReloadPackage", function()
    Server.ReloadPackage("nanos-roleplay")
end)