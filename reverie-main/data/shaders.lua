Reverie.shaders = {
    {
        key = "cine_polychrome",
        path = "cine_polychrome.fs"
    },
    {
        key = "cine_negative",
        path = "cine_negative.fs"
    },
    {
        key = "ticket",
        path = "ticket.fs"
    },
    {
        key = "ticket_negative",
        path = "ticket_negative.fs"
    },
    {
        key = "ticket_polychrome",
        path = "ticket_polychrome.fs"
    }
}

for _, v in pairs(Reverie.shaders) do
    SMODS.Shader(v)
end