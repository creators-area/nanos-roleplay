NanosRP = NanosRP or {}

Package.Require("sh_config.lua")

print("Start Shared Package ...")

Package.Require("utils/sh_util.lua")
Package.Require("utils/sh_command.lua")

Package.Require("modules/jobs/sh_core.lua")
Package.Require("modules/money/sh_core.lua")

print("End Shared Package ...")