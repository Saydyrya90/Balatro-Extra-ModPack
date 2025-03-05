local alias__G_UIDEF_use_and_sell_buttons = G.UIDEF.use_and_sell_buttons;
function G.UIDEF.use_and_sell_buttons(card)
    if (card.ability.set == "Alchemical" or card.ability.name == "c_ReduxArcanum_philosopher_stone") and (G.STATE == G.STATES.SMODS_BOOSTER_OPENED or G.STATE == G.STATES.SPECTRAL_PACK) and (card.area == G.pack_cards and G.pack_cards) then
        return {
            n = G.UIT.ROOT,
            config = { padding = 0, colour = G.C.CLEAR },
            nodes = {
                { n = G.UIT.R, config = { mid = true }, nodes = {} },
                {
                    n = G.UIT.R,
                    config = { ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5 * card.T.w - 0.15, minh = 0.8 * card.T.h, maxw = 0.7 * card.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_select_alchemical' },
                    nodes = {
                        { n = G.UIT.T, config = { text = localize("b_select"), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } }
                    }
                },
            }
        }
    end

    local ret = alias__G_UIDEF_use_and_sell_buttons(card)
    return ret
end

G.FUNCS.can_select_alchemical = function(e)
    if (e.config.ref_table.edition and e.config.ref_table.edition.negative) or #G.consumeables.cards < G.consumeables.config.card_limit then
        e.config.colour = G.C.GREEN
        e.config.button = 'use_card'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end