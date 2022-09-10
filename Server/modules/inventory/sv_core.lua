Events.Subscribe("NanosRP:GrabItem", function(ply, item)
    NanosRP:Select("SELECT * FROM `NanosRP_Players` WHERE `steamid` = ?", function(result)
        if result[1] then
            NanosRP.Inv = result[1].inventory
            if NanosRP.Inv == "" then
                NanosRP.Inv = item:GetAssetName()
            else
                NanosRP.Inv = NanosRP.Inv..";"..item:GetAssetName()
            end

            NanosRP:Query("UPDATE NanosRP_Players SET inventory = ? WHERE steamid = ?;", function(affected_rows)
                if affected_rows == 1 then
                    item:Destroy()
                end
            end, NanosRP.Inv, ply:GetSteamID())
        end
    end, ply:GetSteamID())
end)

Events.Subscribe("NanosRP::GetInventory", function(ply) 
    NanosRP:Select("SELECT `inventory` FROM `NanosRP_Players` WHERE `steamid` = ?", function(result)
        local stringInventory = result[1].inventory
        local tblInventory = JSON.stringify(NanosRP.Explode(";", stringInventory))
        Events.CallRemote("NanosRP::GetInventory", ply, tblInventory)
    end, ply:GetSteamID())
end)