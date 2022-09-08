NanosRP = NanosRP or {}

World.SpawnDefaultSun()

print("Starting client packages...")

Package.Require("base/cl_setup.lua")

-- Loading HUD and inventory
Package.Require("base/cl_hud.lua")
Package.Require("base/cl_inventory.lua")

print("Client packages loaded!")