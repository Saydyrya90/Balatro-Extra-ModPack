local jd_def = JokerDisplay.Definitions

jd_def["j_ReduxArcanum_studious_joker"] = { -- Studious Joker
    text = {
        { text = "+" },
        { ref_table = "card.ability", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT }
}
jd_def["j_ReduxArcanum_bottled_buffoon"] = { -- Bottled Buffoon
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "active" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.active = card.ability.loyalty_remaining == 0 and
            localize("k_active") or
            (card.ability.loyalty_remaining .. "/" .. card.ability.extra.every)
    end
}
jd_def["j_ReduxArcanum_mutated_joker"] = { -- Studious Joker
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "total_chips", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.CHIPS }
}
jd_def["j_ReduxArcanum_essence_of_comedy"] = { -- Constellation
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability", ref_value = "x_mult", retrigger_type = "exp" }
            }
        }
    }
}
jd_def["j_ReduxArcanum_shock_humor"] = { -- Shock Humor
    text = {
        { text = "" },
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
    },
    text_config = { colour = G.C.SECONDARY_SET.Alchemical },
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        local count = 0
        for _, scoring_card in pairs(G.hand.highlighted) do
            local scoring_card_enhancement = SMODS.get_enhancements(scoring_card)
            if scoring_card_enhancement["m_steel"] or scoring_card_enhancement["m_gold"] or scoring_card_enhancement["m_stone"] then
                count = count + 1
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end
}
-- jd_def["j_ReduxArcanum_breaking_bozo"] = { -- Shock Humor
--     text = {
--         { text = "+" },
--         { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
--     },
--     text_config = { colour = G.C.SECONDARY_SET.Alchemical },
--     extra = {
--         {
--             { text = "(" },
--             { ref_table = "card.joker_display_values", ref_value = "odds" },
--             { text = ")" },
--         }
--     },
--     extra_config = { colour = G.C.GREEN, scale = 0.3 },
-- }
jd_def["j_ReduxArcanum_chain_reaction"] = { -- Chain Reaction
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "active" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.active = (card.ability.active and localize("jdis_active") or localize("jdis_inactive"))
    end
}
jd_def["j_ReduxArcanum_catalyst_joker"] = { -- Catalyst Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
            }
        }
    },
    calc_function = function(card)
        card.joker_display_values.x_mult = card.ability.extra.slots + card.ability.extra.bonus * (#G.consumeables.cards or 0)
    end
}
