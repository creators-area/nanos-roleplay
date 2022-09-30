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

print("Server packages loaded!")

Events.Call("NanosRP::GamemodeLoaded")

-- Reload package command
command.Add("ReloadPackage", function()
    Server.ReloadPackage("nanos-roleplay")
end)


Package.RequirePackage("nanos-world-weapons")

local weapon = NanosWorldWeapons.AK47(Vector(200, 0, 300), Rotator())

weapon:SetAmmoSettings(100000, 1000)
weapon:SetDamage(100)
weapon:SetSpread(0)
weapon:SetRecoil(0)
weapon:SetBulletSettings(1, 20000, 20000, Color(100, 58, 0))
weapon:SetSightTransform(Vector(0, 0, -1), Rotator(-1.5, 0, 0))
weapon:SetLeftHandTransform(Vector(22, 0, 9), Rotator(0, 60, 90))
weapon:SetRightHandOffset(Vector(-10, 0, 0))
weapon:SetHandlingMode(HandlingMode.DoubleHandedWeapon)
weapon:SetCadence(0.01)
weapon:SetWallbangSettings(500000, 2)

weapon:SetParticlesBulletTrail("nanos-world::P_Bullet_Trail")
weapon:SetParticlesBarrel("nanos-world::P_Weapon_BarrelSmoke")
weapon:SetParticlesShells("nanos-world::P_Weapon_Shells_762x39")

weapon:SetSoundDry("nanos-world::A_Rifle_Dry")
weapon:SetSoundLoad("nanos-world::A_Rifle_Load")
weapon:SetSoundUnload("nanos-world::A_Rifle_Unload")
weapon:SetSoundZooming("nanos-world::A_AimZoom")
weapon:SetSoundAim("nanos-world::A_Rattle")
weapon:SetSoundFire("nanos-world::A_AK47_Shot")

weapon:SetAnimationCharacterFire("nanos-world::AM_Mannequin_Sight_Fire")
weapon:SetAnimationReload("nanos-world::AM_Mannequin_Reload_Rifle")
weapon:SetAnimationFire("nanos-world::A_AK47_Fire")

weapon:SetMagazineMesh("nanos-world::SM_AK47_Mag_Empty")
weapon:SetCrosshairMaterial("nanos-world::MI_Crosshair_Regular")