NanosRP = NanosRP or {}

Package.Require("sh_config.lua")

print("Starting shared packages...")

Package.Require("utils/sh_util.lua")
Package.Require("utils/sh_command.lua")

Package.Require("modules/jobs/sh_core.lua")
Package.Require("modules/money/sh_core.lua")
Package.Require("modules/hunger/sh_core.lua")
Package.Require("modules/admin/sh_core.lua")

print("Shared Shared Package ...")
