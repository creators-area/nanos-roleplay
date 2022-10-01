if not NanosRP.UseAdminMode then return end

Input.Register("NanosRP - Toggle Noclip", "N")
Input.Register("NanosRP - Toggle Godmode", "B")
Input.Register("NanosRP - Toggle Vanish", "G")

Input.Bind("NanosRP - Toggle Noclip", InputEvent.Pressed, function()
    Events.CallRemote("NanosRP::ToggleNoclip")
end)

Input.Bind("NanosRP - Toggle Godmode", InputEvent.Pressed, function()
    Events.CallRemote("NanosRP::ToggleGodmode")
end)
Input.Bind("NanosRP - Toggle Vanish", InputEvent.Pressed, function()
    Events.CallRemote("NanosRP::ToggleVanish")
end)