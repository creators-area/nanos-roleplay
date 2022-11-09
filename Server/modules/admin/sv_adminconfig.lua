if not NanosRP.UseAdminMode then return end

NanosRP.Ranks = {
    ["superadmin"] = {
        ban = true,
        kick = true,
        freeze = true,
        teleport = true,
        go_to = true,
        noclip = true,
        godmode = true,
        vanish = true,
    },
    ["admin"] = {
        ban = false,
        kick = true,
        freeze = true,
        teleport = true,
        go_to = true,
        noclip = true,
        godmode = true,
        vanish = true,
    },
    ["user"] = {
        ban = false,
        kick = false,
        freeze = false,
        teleport = false,
        go_to = false,
        noclip = false,
        godmode = false,
        vanish = false,
    },
}