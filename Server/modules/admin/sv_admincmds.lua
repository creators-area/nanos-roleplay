if not NanosRP.UseAdminMode then return end

Events.Subscribe("NanosRP::ToggleNoclip", function(ply)
    if not IsValid(ply) then return end

    if NanosRP.Ranks[ply:getRank()].noclip then
        if not ply:isNoclipping() then
            ply:setNoclip(true)
        else
            ply:setNoclip(false)
        end
    end
end)

Events.Subscribe("NanosRP::ToggleGodmode", function(ply)
    if not IsValid(ply) then return end

    if NanosRP.Ranks[ply:getRank()].godmode then
        if not ply:isGodmode() then
            ply:setGodmode(true)
        else
            ply:setGodmode(false)
        end
    end
end)

Events.Subscribe("NanosRP::ToggleVanish", function(ply)
    if not IsValid(ply) then return end

    if NanosRP.Ranks[ply:getRank()].vanish then
        if not ply:isVanishing() then
            ply:setVanish(true)
        else
            ply:setVanish(false)
        end
    end
end)