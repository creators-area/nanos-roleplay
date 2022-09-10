Input.Register("NanosRP - Open Inventory", "K")
Input.Register("NanosRP - Grab Object", "M")

local InventoryBool = false
NanosRP.Inventory = WebUI("NanosRP Inventory", "file://UI/inventory.html", false)

Input.Bind("NanosRP - Open Inventory", InputEvent.Pressed, function()
    if not InventoryBool then
        InventoryBool = true
        Events.CallRemote("NanosRP::GetInventory")
    else
        InventoryBool = false
        NanosRP.Inventory:SetVisible(false) 
        Client.SetMouseEnabled(false)
        Client.SetInputEnabled(true)
    end
end)

Input.Bind("NanosRP - Grab Object", InputEvent.Pressed, function()
    local lookedEntity = GetEyeTrace().Entity
    if lookedEntity then
        if lookedEntity:GetType() == "Weapon" then
            Events.CallRemote("NanosRP:GrabItem", lookedEntity)
        end
    end
end)

Events.Subscribe("NanosRP::GetInventory", function(inventory) 
    print(inventory)
    NanosRP.Inventory:SetVisible(true)
    NanosRP.Inventory:BringToFront()
    NanosRP.Inventory:CallEvent("NanosRP::InitInventory")
    Client.SetMouseEnabled(true)
    Client.SetInputEnabled(false)
end)