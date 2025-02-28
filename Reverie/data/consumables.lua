Reverie.consumables = {
    {
        key = "reverie",
        set = "Spectral",
        atlas = "Cine",
        order = 1,
        name = "Reverie",
        pos = {
            x = 1,
            y = 1
        },
        cost = 4,
        hidden = true,
        soul_set = "Cine",
        can_use = function (self, card)
            return G.STATE == G.STATES.SHOP and G.shop
        end,
        use = Reverie.use_cine,
        set_sprites = function(self, card, front)
            card.ignore_base_shader = { ticket = true }
        end,
        draw = function(self, card, layer)
            if not card.ARGs then
                card.ARGS = card.ARGS or {}
            end
            if not card.ARGS.send_to_shader then
                card.ARGS.send_to_shader = card.ARGS.send_to_shader or {}
                card.ARGS.send_to_shader[1] = math.min(card.VT.r*3, 1) + math.sin(G.TIMERS.REAL/28) + 1 + (card.juice and card.juice.r*20 or 0) + card.tilt_var.amt
                card.ARGS.send_to_shader[2] = G.TIMERS.REAL

                for k, v in pairs(card.children) do
                    v.VT.scale = card.VT.scale
                end
            end
            if not (card.edition and card.edition.negative) then
                card.ARGS.send_to_shader = card.ARGS.send_to_shader or {}
                card.ARGS.send_to_shader[3] = card.omit_top_half or 0
                card.ARGS.send_to_shader[4] = card.omit_bottom_half or 0

                card.children.center:draw_shader("dvrprv_ticket", nil, card.ARGS.send_to_shader)
            end
            if card.edition and card.edition.negative then
                card.ARGS.send_to_shader[3] = card.omit_top_half or 0
                card.ARGS.send_to_shader[4] = card.omit_bottom_half or 0

                card.children.center:draw_shader("dvrprv_cine_negative", nil, card.ARGS.send_to_shader)
            end
        end
    }
}

for _, v in pairs(Reverie.consumables) do
    SMODS.Consumable(v)
end