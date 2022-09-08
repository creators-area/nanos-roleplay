-- Register keybind for opening inventory
Input.Register("NanosRP - Open Inventory", "K")
Input.Register("NanosRP - Grab Object", "M")

local InventoryBool = false
NanosRP.Inventory = WebUI("NanosRP Inventory", "file://UI/inventory.html", false)

Input.Bind("NanosRP - Open Inventory", InputEvent.Pressed, function()
    if not InventoryBool then
        InventoryBool = true
        NanosRP.Inventory:SetVisible(true)
        Client.SetMouseEnabled(true)
        Client.SetInputEnabled(false)
    else
        InventoryBool = false
        NanosRP.Inventory:SetVisible(false) 
        Client.SetMouseEnabled(false)
        Client.SetInputEnabled(true)
    end
end)

Input.Bind("NanosRP - Grab Object", InputEvent.Pressed, function()
    local lookedEntityType = GetEyeTrace().Entity:GetType()
    if lookedEntityType == "Weapon" or lookedEntityType == "Entity" then 
        print(lookedEntityType)
    end
end)