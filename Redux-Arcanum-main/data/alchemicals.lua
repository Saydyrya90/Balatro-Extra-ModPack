-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--       HELPER FUNCTIONS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

function check_alchemical_prev_enhancement(given_card)
    -- sendDebugMessage(given_card.config.center.name, "ReduxArcanumDebugLogger")
    if G.deck.config.ra_manganese then
        for _, manganesed_card in ipairs(G.deck.config.ra_manganese) do
            if given_card.unique_val == manganesed_card.card_id and given_card.config.center == G.P_CENTERS.m_steel then
                return manganesed_card.prev_enhancement
            end
        end
    end
    if G.deck.config.ra_glass then
        for _, glassed_card in ipairs(G.deck.config.ra_glass) do
            if given_card.unique_val == glassed_card.card_id and given_card.config.center == G.P_CENTERS.m_glass then
                return glassed_card.prev_enhancement
            end
        end
    end
    if G.deck.config.ra_gold then
        for _, golded_card in ipairs(G.deck.config.ra_gold) do
            if given_card.unique_val == golded_card.card_id and given_card.config.center == G.P_CENTERS.m_gold then
                return golded_card.prev_enhancement
            end
        end
    end
    if G.deck.config.ra_silver then
        for _, silvered_card in ipairs(G.deck.config.ra_silver) do
            if given_card.unique_val == silvered_card.card_id and given_card.config.center == G.P_CENTERS.m_lucky then
                return silvered_card.prev_enhancement
            end
        end
    end

    return given_card.config.center
end

function check_alchemical_prev_edition(given_card)
    if G.deck.config.ra_bismuth then
        for _, bismuthed_card in ipairs(G.deck.config.ra_bismuth) do
            if given_card.unique_val == bismuthed_card.card_id and given_card.edition and given_card.edition.polychrome then
                return bismuthed_card.prev_edition
            end
        end
    end
    if G.deck.config.ra_uranium then
        for _, uraniumed_card in ipairs(G.deck.config.ra_uranium) do
            if given_card.unique_val == uraniumed_card.card_id then
                return uraniumed_card.prev_edition
            end
        end
    end

    return given_card.edition
end

function get_most_common_suit()
    -- This gets all suits defined in Steammodded to account for modded suits
    local suit_to_card_counter = {}
    for _, v in pairs(SMODS.Suits) do
        if not v.disabled then
            suit_to_card_counter[v.name] = 0
        end
    end


    if G.playing_cards then
        for _, v in pairs(G.playing_cards) do
            suit_to_card_counter[v.base.suit] = suit_to_card_counter[v.base.suit] + 1
        end
    end

    local top_suit = "";
    local top_count = -1;
    for suit, count in pairs(suit_to_card_counter) do
        if top_count < count then
            top_suit = suit
            top_count = count
        end
    end

    return top_suit
end

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--      ALCHEMICAL CARDS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.Consumable { -- Ignis
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "ignis",
    -- loc_txt = {
    --     name = 'Ignis',
    --     text = {
    --         "Gain {C:attention}+#1#{} discard#2#",
    --         "for this blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    -- loc_vars = function(self, info_queue, card)
    --     local ret = alchemical_loc_vars(self, info_queue, center)
    --     local extra = math.ceil(center.ability.extra * alchemical_get_x_mult(center))
    --     return { vars = { ret.vars[1], (extra == 1 and "") or "s" } }
    -- end,
    unlocked = true,
    discovered = false,
    config = { extra = 1 },
    cost = 3,
    pos = { x = 0, y = 0 },

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                ease_discard(card.ability.extra)
                return true
            end
        }))
    end,
}

SMODS.Consumable { -- Aqua
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "aqua",
    -- loc_txt = {
    --     name = 'Aqua',
    --     text = {
    --         "Gain {C:attention}+#1#{} hand#2#",
    --         "for this blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    -- loc_vars = function(self, info_queue, card)
    --     local ret = alchemical_loc_vars(self, info_queue, center)
    --     local extra = math.ceil(center.ability.extra * alchemical_get_x_mult(center))
    --     return { vars = { ret.vars[1], (extra == 1 and "") or "s" } }
    -- end,
    unlocked = true,
    discovered = false,
    config = { extra = 1 },
    cost = 3,
    pos = { x = 1, y = 0 },

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                ease_hands_played(card.ability.extra)
                return true
            end
        }))
    end,
}

terra = { -- Terra
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "terra",
    -- loc_txt = {
    --     name = 'Terra',
    --     text = { "Reduce blind by {C:attention}#1#%{}" }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 15 },
    cost = 3,
    pos = { x = 2, y = 0 },

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 - card.ability.extra / 100))
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                local chips_UI = G.hand_text_area.blind_chips
                G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                G.HUD_blind:recalculate()
                chips_UI:juice_up()

                if not silent then play_sound('chips2') end
                return true
            end
        }))
    end,
}
if ReduxArcanumMod.config.new_content then
    terra.config.extra = 20
end
SMODS.Consumable(terra)

SMODS.Consumable { -- Aero
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "aero",
    -- loc_txt = {
    --     name = 'Aero',
    --     text = { "Draw {C:attention}#1#{} cards" }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 4 },
    cost = 3,
    pos = { x = 3, y = 0 },

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i = 1, card.ability.extra do --draw cards from deckL
                    draw_card(G.deck, G.hand, i * 100 / 2, 'up', true)
                end
                return true
            end
        }))
    end,
}

SMODS.Consumable { -- Quicksilver
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "quicksilver",
    -- loc_txt = {
    --     name = 'Quicksilver',
    --     text = {
    --         "{C:attention}+#1#{} hand size",
    --         "for this blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 2 },
    cost = 3,
    pos = { x = 4, y = 0 },

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                G.hand:change_size(card.ability.extra)
                if not G.deck.config.quicksilver then G.deck.config.quicksilver = 0 end
                G.deck.config.quicksilver = G.deck.config.quicksilver + card.ability.extra
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        -- sendDebugMessage("Resetting quicksilver", "ReduxArcanumDebugLogger")
        G.hand:change_size(-card.ability.extra)
        if G.deck.config.quicksilver then
            G.deck.config.quicksilver = G.deck.config.quicksilver - card.ability.extra
        end
        return true
    end,

}

salt = { -- Salt
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "salt",
    -- loc_txt = {
    --     name = 'Salt',
    --     text = { "Gain {C:attention}#1#{} tag#2#" }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 1, loss = 10 },
    cost = 3,
    pos = { x = 5, y = 0 },

    use = function(self, card)
        if ReduxArcanumMod.config.new_content then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 + card.ability.loss / 100))
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate()
                    chips_UI:juice_up()

                    if not silent then play_sound('chips2') end
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for _ = 1, card.ability.extra do
                    local _tag_name
                    if G.FORCE_TAG then
                        _tag_name = G.FORCE_TAG
                    else
                        local _pool, _pool_key = get_current_pool('Tag', nil, nil, nil)
                        _tag_name = pseudorandom_element(_pool, pseudoseed(_pool_key))
                        local it = 1
                        while _tag_name == 'UNAVAILABLE' or
                            _tag_name == "tag_double" or
                            _tag_name == "tag_orbital" or
                            _tag_name == "tag_bunc_arcade" -- Bunco compat for now, otherwise draws entire deck
                        do
                            it = it + 1
                            _tag_name = pseudorandom_element(_pool, pseudoseed(_pool_key .. '_resample' .. it))
                        end
                    end

                    G.GAME.round_resets.blind_tags = G.GAME.round_resets.blind_tags or {}
                    local _tag = Tag(_tag_name, nil, G.GAME.blind)
                    add_tag(_tag)
                end
                -- Trigger immediate tags and booster tags
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        for i = 1, #G.GAME.tags do
                            G.GAME.tags[i]:apply_to_run({ type = 'immediate' })
                        end
                        for i = 1, #G.GAME.tags do
                            if G.GAME.tags[i].key == "tag_boss" then
                            else
                                if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then break end
                            end
                        end
                        return true
                    end
                }))
                return true
            end
        }))
    end,
}
SMODS.Consumable(salt)

SMODS.Consumable { -- Sulfur
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "sulfur",
    -- loc_txt = {
    --     name = 'Sulfur',
    --     text = {
    --         "Reduce hands to {C:attention}1",
    --         "Gain {C:attention}$#1#{} for each",
    --         "hand removed"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 4 },
    cost = 3,
    pos = { x = 0, y = 1 },

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()
                local prev_hands = G.GAME.current_round.hands_left
                ease_hands_played(-(prev_hands - 1))
                delay(0.5)
                ease_dollars(card.ability.extra * (prev_hands - 1), true)
                delay(0.5)
                return true
            end
        }))
    end,
}

SMODS.Consumable { -- Phosphorus
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "phosphorus",
    -- loc_txt = {
    --     name = 'Phosphorus',
    --     text = {
    --         "Return {C:attention}all{} discarded",
    --         "cards to deck"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = {},
    cost = 3,
    pos = { x = 1, y = 1 },

    use = function(self, card)
        local take_cards_from_discard = function(count)
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    for i = 1, count do --draw cards from deck
                        draw_card(G.discard, G.deck, i * 100 / count, 'up', nil, nil, 0.005, i % 2 == 0, nil,
                            math.max((21 - i) / 20, 0.7))
                    end
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                take_cards_from_discard(#G.discard.cards)
                return true
            end
        }))
    end,
}

bismuth = { -- Bismuth
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "bismuth",
    -- loc_txt = {
    --     name = 'Bismuth',
    --     text = {
    --         "Converts up to",
    --         "{C:attention}#1#{} selected cards",
    --         "to {C:dark_edition}Polychrome",
    --         "for one blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        -- if not ReduxArcanumMod.config.new_content then
        --     ret.key = self.key .. "_classic"
        -- end
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 2, select = true },
    cost = 3,
    pos = { x = 2, y = 1 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted <= card.ability.extra and #G.hand.highlighted >= 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_bismuth = G.deck.config.ra_bismuth or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                play_sound('polychrome1', 1.2, 0.7)
                for k, card in ipairs(G.hand.highlighted) do
                    local prev_edition = check_alchemical_prev_edition(card)
                    card:set_edition({ polychrome = true }, true, true)
                    card:juice_up(0.3, 0.5)
                    used_card:juice_up(0.3, 0.5)
                    table.insert(G.deck.config.ra_bismuth, { card_id = card.unique_val, prev_edition = prev_edition })
                end
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_bismuth then
            for _, bismuthed_card in ipairs(G.deck.config.ra_bismuth) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == bismuthed_card.card_id and card.edition and card.edition.polychrome then
                        card:set_edition(bismuthed_card.prev_edition, true, true)
                    end
                end
            end
            G.deck.config.ra_bismuth = {}
        end
        return true
    end,
}
if ReduxArcanumMod.config.new_content then
    -- bismuth.loc_txt.text = {
    --     "Converts the #1#",
    --     "#2# to {C:dark_edition}Polychrome{}",
    --     "for one blind"
    -- }
    bismuth.config = { extra = 1 }
    bismuth.loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        -- local extra = math.ceil(center.ability.extra * alchemical_get_x_mult(center))
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        return { vars = vars }
        -- return { vars = { (extra == 1 and "rightmost") or (ret.vars[1] .. " rightmost"), (extra == 1 and "joker") or "jokers" } }
    end
    bismuth.can_use = alchemical_can_use
    bismuth.use = function(self, used_card)
        G.deck.config.ra_bismuth = G.deck.config.ra_bismuth or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                play_sound('polychrome1', 1.2, 0.7)

                for i = #G.jokers.cards, math.max(#G.jokers.cards - used_card.ability.extra + 1, 1), -1 do
                    local right_joker = G.jokers.cards[i]

                    local prev_edition = right_joker.edition
                    right_joker:set_edition({ polychrome = true }, true, true)
                    right_joker:juice_up(0.3, 0.5)
                    used_card:juice_up(0.3, 0.5)
                    table.insert(G.deck.config.ra_bismuth,
                        { card_id = right_joker.unique_val, prev_edition = prev_edition })
                end

                return true
            end
        }))
    end
    bismuth.end_blind = function(self, card)
        if G.deck.config.ra_bismuth then
            play_sound('tarot1')
            for _, bismuthed_joker in ipairs(G.deck.config.ra_bismuth) do
                for k, joker in ipairs(G.jokers.cards) do
                    if joker.unique_val == bismuthed_joker.card_id and joker.edition and joker.edition.polychrome then
                        joker:juice_up(0.3, 0.4)
                        joker:set_edition(bismuthed_joker.prev_edition, true, true)
                    end
                end
            end
            G.deck.config.ra_bismuth = {}
        end
        return true
    end
end
SMODS.Consumable(bismuth)

SMODS.Consumable { -- Cobalt
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "cobalt",
    -- loc_txt = {
    --     name = 'Cobalt',
    --     text = {
    --         "Upgrade currently",
    --         "selected {C:attention}poker hand",
    --         "by {C:attention}#1#{} levels for one blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 2 },
    cost = 3,
    pos = { x = 3, y = 1 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted >= 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, card)
        G.deck.config.cobalt = G.deck.config.cobalt or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                local text, disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                table.insert(G.deck.config.cobalt, text)
                update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                    {
                        handname = localize(text, 'poker_hands'),
                        chips = G.GAME.hands[text].chips,
                        mult = G.GAME.hands
                            [text].mult,
                        level = G.GAME.hands[text].level
                    })
                level_up_hand(card, text, nil, card.ability.extra)
                -- update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                --     { mult = 0, chips = 0, handname = '', level = '' })

                return true
            end
        }))
    end,

    end_blind = function(self, card)
        for _, text in ipairs(G.deck.config.cobalt) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                        {
                            handname = localize(text, 'poker_hands'),
                            chips = G.GAME.hands[text].chips,
                            mult = G
                                .GAME.hands[text].mult,
                            level = G.GAME.hands[text].level
                        })
                    level_up_hand(nil, text, nil, -card.ability.extra)
                    update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                        { mult = 0, chips = 0, handname = '', level = '' })
                    return true
                end
            }))
        end
        G.deck.config.cobalt = {}
        return true
    end,
}

SMODS.Consumable { -- Arsenic
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "arsenic",
    -- loc_txt = {
    --     name = 'Arsenic',
    --     text = {
    --         "{C:attention}Swap{} your current",
    --         "hands and discards"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = {},
    cost = 3,
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if G.GAME.current_round.discards_left > 0 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                local temp_hands = G.GAME.current_round.hands_left
                local temp_discards = G.GAME.current_round.discards_left
                local change_discard = temp_hands - temp_discards
                local change_hands = -change_discard
                -- G.GAME.current_round.hands_left = 0
                -- G.GAME.current_round.discards_left = 0
                ease_hands_played(change_hands)
                ease_discard(change_discard)
                return true
            end
        }))
    end,
}

SMODS.Consumable { -- Antimony
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "antimony",
    -- loc_txt = {
    -- name = 'Antimony',
    -- text = {
    --     "Create #1# {C:dark_edition}Negative{} {C:eternal}0-cost{}",
    --     "{C:attention}#2#{} of a random",
    --     "joker for one blind"
    -- }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    -- loc_vars = function(self, info_queue, card)
    --     local ret = alchemical_loc_vars(self, info_queue, center)
    --     local extra = math.ceil(center.ability.extra * alchemical_get_x_mult(center))
    --     info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    --     if not ReduxArcanumMod.config.new_content then
    --         info_queue[#info_queue + 1] = G.P_CENTERS.eternal
    --     end
    --     return { vars = { (extra == 1 and "a") or ret.vars[1], (extra == 1 and "copy") or "copies" }, key = self.key .. (not ReduxArcanumMod.config.new_content and "_classic" or "") }
    -- end,
    unlocked = true,
    discovered = false,
    config = { extra = 1 },
    cost = 3,
    pos = { x = 5, y = 1 },

    use = function(self, card)
        G.jokers.config.antimony = G.jokers.config.antimony or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                if #G.jokers.cards > 0 then
                    local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('invisible'))
                    for _ = 1, card.ability.extra do
                        local card = copy_card(chosen_joker, nil, nil, nil,
                            chosen_joker.edition and chosen_joker.edition.negative)
                        card:set_edition({ negative = true }, true)
                        if ReduxArcanumMod.config.new_content then
                            card.cost = 0
                            card.sell_cost = 0
                        else
                            card:set_eternal(true)
                        end
                        -- if card.ability.invis_rounds then card.ability.invis_rounds = 0 end
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        table.insert(G.jokers.config.antimony, card.unique_val)
                    end
                    return true
                end
            end
        }))
    end,

    end_blind = function(self, card)
        for _, poly_id in ipairs(G.jokers.config.antimony) do
            for k, joker in ipairs(G.jokers.cards) do
                if joker.unique_val == poly_id then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            play_sound('tarot1')
                            joker.T.r = -0.2
                            joker:juice_up(0.3, 0.4)
                            joker.states.drag.is = true
                            joker.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                blockable = false,
                                func = function()
                                    G.jokers:remove_card(joker)
                                    joker:remove()
                                    joker = nil
                                    return true;
                                end
                            }))
                            return true;
                        end
                    }))
                end
            end
        end
        G.jokers.config.antimony = {}
        return true
    end,
}

SMODS.Consumable { -- Soap
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "soap",
    -- loc_txt = {
    --     name = 'Soap',
    --     text = {
    --         "Replace up to {C:attention}#1#{}",
    --         "selected cards with",
    --         "cards from your deck"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 3 },
    cost = 3,
    pos = { x = 0, y = 2 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted <= get_modified_extra_value(card) and #G.hand.highlighted >= 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, card)
        local return_to_deck = function(card)
            if not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and
                G.hand.config.card_limit <= 0 and #G.hand.cards == 0 then
                G.STATE = G.STATES.GAME_OVER; G.STATE_COMPLETE = false
                return true
            end

            delay(0.05)
            draw_card(G.hand, G.deck, 100, 'up', false, card)
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for k, _card in ipairs(G.hand.highlighted) do
                    return_to_deck(_card)
                end
                G.FUNCS.draw_from_deck_to_hand(card.ability.extra)
                return true
            end
        }))
    end,
}

manganese = { -- Manganese
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "manganese",
    -- loc_txt = {
    --     name = 'Manganese',
    --     text = {
    --         "Enhances up to",
    --         "{C:attention}#1#{} selected cards",
    --         "into {C:attention}Steel Cards",
    --         "for one blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 4, select = true },
    cost = 3,
    pos = { x = 1, y = 2 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted <= get_modified_extra_value(card) and #G.hand.highlighted >= 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_manganese = G.deck.config.ra_manganese or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                play_sound('tarot1')
                for k, card in ipairs(G.hand.highlighted) do
                    local prev_enhancement = check_alchemical_prev_enhancement(card)
                    card:set_ability(G.P_CENTERS.m_steel)
                    card:juice_up(1, 0.5)
                    used_card:juice_up(0.3, 0.5)
                    table.insert(G.deck.config.ra_manganese,
                        { card_id = card.unique_val, prev_enhancement = prev_enhancement })
                end
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_manganese then
            for _, manganesed_card in ipairs(G.deck.config.ra_manganese) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == manganesed_card.card_id and card.config.center == G.P_CENTERS.m_steel then
                        card:set_ability(manganesed_card.prev_enhancement)
                    end
                end
            end
            G.deck.config.ra_manganese = {}
        end
        return true
    end,
}
if ReduxArcanumMod.config.new_content then
    manganese.config = { extra = 3 }
end
SMODS.Consumable(manganese)

wax = { -- Wax
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "wax",
    -- loc_txt = {
    --     name = 'Wax',
    --     text = {
    --         "Create {C:attention}#1#{} temporary",
    --         "copies of the selected",
    --         "card for one blind",
    --         "{C:inactive}(Does not trigger jokers){}"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 2, select = true },
    cost = 3,
    pos = { x = 2, y = 2 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted == 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_wax = G.deck.config.ra_wax or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i = 1, used_card.ability.extra do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.hand:emplace(_card)
                    _card:start_materialize(nil, _first_dissolve)
                    table.insert(G.deck.config.ra_wax, { card_id = _card.unique_val })
                end
                playing_card_joker_effects(new_cards)
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_wax then
            local _first_dissolve = false
            for _, waxed_card in ipairs(G.deck.config.ra_wax) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == waxed_card.card_id then
                        card:start_dissolve(nil, _first_dissolve)
                        _first_dissolve = true
                    end
                end
            end
            G.deck.config.ra_wax = {}
        end
        return true
    end,
}
if ReduxArcanumMod.config.new_content then
    wax.config = { extra = 1 }
end
SMODS.Consumable(wax)

borax = { -- Borax
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "borax",
    -- loc_txt = {
    --     name = 'Borax',
    --     text = {
    --         "Converts up to",
    --         "{C:attention}#1#{} selected cards",
    --         "into the most common",
    --         "{C:attention}suit for one blind",
    --         "{C:inactive}Current suit: {V:1}#2#{}"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local top_suit = get_most_common_suit()
        local vars = { get_modified_extra_value(card), localize(top_suit, 'suits_plural'), colours = { G.C.SUITS[top_suit] } }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 4, select = true },
    cost = 3,
    pos = { x = 3, y = 2 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted <= get_modified_extra_value(card) and #G.hand.highlighted >= 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_borax = G.deck.config.ra_borax or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                local top_suit = get_most_common_suit();

                play_sound('tarot1')
                for k, card in ipairs(G.hand.highlighted) do
                    delay(0.05)
                    card:juice_up(1, 0.5)
                    local prev_suit = card.base.suit
                    card:change_suit(top_suit)
                    table.insert(G.deck.config.ra_borax, { card_id = card.unique_val, prev_suit = prev_suit })
                end
                G.hand:parse_highlighted() -- Updates poker hand if turned into a flush
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_borax then
            local _first_dissolve = false
            for _, boraxed_card in ipairs(G.deck.config.ra_borax) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == boraxed_card.card_id then
                        card:change_suit(boraxed_card.prev_suit)
                    end
                end
            end
            G.deck.config.ra_borax = {}
        end
        return true
    end,
}
if ReduxArcanumMod.config.new_content then
    borax.config = { extra = 3 }
end
SMODS.Consumable(borax)

glass = { -- Glass
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "glass",
    -- loc_txt = {
    --     name = 'Glass',
    --     text = {
    --         "Enhances up to",
    --         "{C:attention}#1#{} selected cards",
    --         "into {C:attention}Glass Cards",
    --         "for one blind",
    --         "{C:inactive}Destroyed glass cards",
    --         "{C:inactive}will not return"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 4 },
    cost = 3,
    pos = { x = 4, y = 2 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted <= get_modified_extra_value(card) and #G.hand.highlighted >= 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_glass = G.deck.config.ra_glass or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                play_sound('tarot1')
                for k, card in ipairs(G.hand.highlighted) do
                    local prev_enhancement = check_alchemical_prev_enhancement(card)
                    card:set_ability(G.P_CENTERS.m_glass)
                    card:juice_up(1, 0.5)
                    used_card:juice_up(0.3, 0.5)
                    table.insert(G.deck.config.ra_glass,
                        { card_id = card.unique_val, prev_enhancement = prev_enhancement })
                end
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_glass then
            for _, glassed_card in ipairs(G.deck.config.ra_glass) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == glassed_card.card_id and card.config.center == G.P_CENTERS.m_glass then
                        card:set_ability(glassed_card.prev_enhancement)
                    end
                end
            end
            G.deck.config.ra_glass = {}
        end
        return true
    end,
}
if ReduxArcanumMod.config.new_content then
    glass.config.extra = 2
end
SMODS.Consumable(glass)

SMODS.Consumable { -- Magnet
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "magnet",
    -- loc_txt = {
    --     name = 'Magnet',
    --     text = {
    --         "Draw {C:attention}#1#{} cards",
    --         "of the same rank",
    --         "as the selected card"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 2 },
    cost = 3,
    pos = { x = 5, y = 2 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted == 1 and not SMODS.has_no_rank(G.hand.highlighted[1]) then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                local cur_rank = G.hand.highlighted[1].base.id
                local count = used_card.ability.extra
                for _, v in pairs(G.deck.cards) do
                    if v.base.id == cur_rank and count > 0 then
                        delay(0.05)
                        draw_card(G.deck, G.hand, 100, 'up', true, v)
                        count = count - 1
                    end
                end
                return true
            end
        }))
    end,
}

gold = { -- Gold
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "gold",
    -- loc_txt = {
    --     name = 'Gold',
    --     text = {
    --         "Enhances up to",
    --         "{C:attention}#1#{} selected cards",
    --         "into {C:attention}Gold Cards",
    --         "for one blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        -- ret.key = self.key .. "_classic"
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 4, select = true },
    cost = 3,
    pos = { x = 0, y = 3 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted <= get_modified_extra_value(card) and #G.hand.highlighted >= 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_gold = G.deck.config.ra_gold or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                play_sound('tarot1')
                for k, card in ipairs(G.hand.highlighted) do
                    local prev_enhancement = check_alchemical_prev_enhancement(card)
                    card:set_ability(G.P_CENTERS.m_gold)
                    card:juice_up(1, 0.5)
                    used_card:juice_up(0.3, 0.5)
                    table.insert(G.deck.config.ra_gold,
                        { card_id = card.unique_val, prev_enhancement = prev_enhancement })
                end
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_gold then
            for _, golded_card in ipairs(G.deck.config.ra_gold) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == golded_card.card_id and card.config.center == G.P_CENTERS.m_gold then
                        card:set_ability(golded_card.prev_enhancement)
                    end
                end
            end
            G.deck.config.ra_gold = {}
        end
        return true
    end,
}
if ReduxArcanumMod.config.new_content then
    -- gold.loc_txt.text = {
    --     "{C:attention}#1#{} the value of",
    --     "all {C:attention}gold cards{} currently",
    --     "in hand for one blind"
    -- }
    gold.config = { extra = 2 }
    gold.enhancement_gate = 'm_gold'
    gold.loc_vars = function(self, info_queue, card)
        local extra = get_modified_extra_value(card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return { vars = { (extra == 2 and "Double") or (extra .. "x") } }
    end
    gold.can_use = alchemical_can_use
    gold.use = function(self, used_card)
        G.deck.config.ra_gold = G.deck.config.ra_gold or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                play_sound('tarot1')
                for _, card in ipairs(G.hand.cards) do
                    local card_enhancement = SMODS.get_enhancements(card)
                    if card_enhancement["m_gold"] then
                        card:juice_up(1, 0.5)
                        table.insert(G.deck.config.ra_gold,
                            { card_id = card.unique_val, original_value = card.ability.h_dollars })
                        card.ability.h_dollars = card.ability.h_dollars * used_card.ability.extra
                    end
                end
                return true
            end
        }))
    end
    gold.end_blind = function(self, card)
        if G.deck.config.ra_gold then
            for _, golded_card in ipairs(G.deck.config.ra_gold) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == golded_card.card_id and card.config.center == G.P_CENTERS.m_gold then
                        card.ability.h_dollars = golded_card.original_value
                    end
                end
            end
            G.deck.config.ra_gold = {}
        end
        return true
    end
end
SMODS.Consumable(gold)

silver = { -- Silver
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "silver",
    -- loc_txt = {
    --     name = 'Silver',
    --     text = {
    --         "Enhances up to",
    --         "{C:attention}#1#{} selected cards",
    --         "into {C:attention}Lucky Cards",
    --         "for one blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 4, select = true },
    cost = 3,
    pos = { x = 1, y = 3 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted <= get_modified_extra_value(card) and #G.hand.highlighted >= 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_silver = G.deck.config.ra_silver or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                play_sound('tarot1')
                for k, card in ipairs(G.hand.highlighted) do
                    local prev_enhancement = check_alchemical_prev_enhancement(card)
                    card:set_ability(G.P_CENTERS.m_lucky)
                    card:juice_up(1, 0.5)
                    used_card:juice_up(0.3, 0.5)
                    table.insert(G.deck.config.ra_silver,
                        { card_id = card.unique_val, prev_enhancement = prev_enhancement })
                end
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_silver then
            for _, silvered_card in ipairs(G.deck.config.ra_silver) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == silvered_card.card_id and card.config.center == G.P_CENTERS.m_lucky then
                        card:set_ability(silvered_card.prev_enhancement)
                    end
                end
            end
            G.deck.config.ra_silver = {}
        end
        return true
    end,
}
if ReduxArcanumMod.config.new_content then
    silver.config = { extra = 3 }
end
SMODS.Consumable(silver)

SMODS.Consumable { -- Oil
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "oil",
    -- loc_txt = {
    --     name = 'Oil',
    --     text = {
    --         "Removes {C:attention}debuffs{}",
    --         "from all cards in",
    --         "hand for this blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = {},
    cost = 3,
    pos = { x = 2, y = 3 },

    use = function(self, used_card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for k, v in ipairs(G.hand.cards) do
                    delay(0.05)
                    v:juice_up(1, 0.5)
                    v.ability = v.ability or {}
                    v.ability.debuff_sources = v.ability.debuff_sources or {}
                    table.insert(v.ability.debuff_sources, 'prevent_debuff') -- steammodded thing
                    v.ability.ra_oil = #v.ability.debuff_sources
                    v:set_debuff(false)
                    if v.facing == 'back' then
                        v:flip()
                    end
                end
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        -- sendDebugMessage("Resetting Oil", "ReduxArcanumDebugLogger")
        for k, card in ipairs(G.playing_cards) do
            if card.ability and card.ability.ra_oil then
                card.ability.debuff_sources[card.ability.ra_oil] = false -- steammodded thing
                card.ability.ra_oil = false
            end
        end
        return true
    end,
}

acid = { -- Acid
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "acid",
    -- loc_txt = {
    --     name = 'Acid',
    --     text = {
    --         "{C:attention}Destroy{} all cards of the ",
    --         "same rank as selected",
    --         "card. All cards {C:attention}returned",
    --         "after this blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = {},
    cost = 3,
    pos = { x = 3, y = 3 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted == 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_acid = G.deck.config.ra_acid or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                local selected_rank = G.hand.highlighted[1]:get_id()
                local selected_suit = G.hand.highlighted[1].base.suit
                local acid_aplicable = function(card)
                    return card:get_id() == selected_rank or
                        (card.base.suit == selected_suit and ReduxArcanumMod.config.new_content)
                end
                local bunco_linked_sets_removed = {}

                for k, v in ipairs(G.playing_cards) do
                    if acid_aplicable(v) then
                        table.insert(G.deck.config.ra_acid, v)

                        -- Bunco linked card compat
                        if ReduxArcanumMod.config.bunco_linked_acid and v.ability.group and next(SMODS.find_mod("Bunco")) then
                            -- sendDebugMessage(tprint(bunco_linked_sets_removed), "ReduxArcanumDebugLogger")

                            local group_id = v.ability.group.id

                            for linked_k, linked_v in ipairs(G.playing_cards) do
                                -- Check so cards are not added to table twice
                                if not bunco_linked_sets_removed[group_id] and not acid_aplicable(linked_v) then
                                    -- sendDebugMessage("removinglinks" .. group_id, "ReduxArcanumDebugLogger")
                                    if linked_v.ability.group and linked_v.ability.group.id == group_id then
                                        table.insert(G.deck.config.ra_acid, linked_v)

                                        if linked_v.ability.name == 'Glass Card' then
                                            linked_v:shatter()
                                        else
                                            linked_v:start_dissolve({ HEX("E3FF37") }, nil, 1.6)
                                        end
                                    end
                                end
                            end

                            bunco_linked_sets_removed[group_id] = true
                        end

                        if v.ability.name == 'Glass Card' then
                            v:shatter()
                        else
                            v:start_dissolve({ HEX("E3FF37") }, nil, 1.6)
                        end
                    end
                end
                if not ReduxArcanumMod.config.new_content then
                    for j = 1, #G.jokers.cards do
                        eval_card(G.jokers.cards[j],
                            { cardarea = G.jokers, remove_playing_cards = true, removed = G.deck.config.ra_acid })
                    end
                end
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_acid then
            for _, acided_card in ipairs(G.deck.config.ra_acid) do
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local _card = copy_card(acided_card, nil, nil, G.playing_card)
                G.deck:emplace(_card)
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, _card)
                if not ReduxArcanumMod.config.new_content then
                    playing_card_joker_effects({ true })
                end
            end
            G.deck.config.ra_acid = {}
        end
        return true
    end,
}
-- if ReduxArcanumMod.config.new_content then
--     acid.loc_txt.text = {
--         "{C:attention}Destroy{} all cards of the ",
--         "same rank or suit as selected",
--         "card. All cards {C:attention}returned",
--         "after this blind",
--         "{C:inactive}(Does not trigger jokers){}"
--     }
-- end
SMODS.Consumable(acid)

SMODS.Consumable { -- Brimstone
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "brimstone",
    -- loc_txt = {
    --     name = 'Brimstone',
    --     text = {
    --         "{C:attention}+#1#{} hands, {C:attention}+#1#{} discards",
    --         "Debuff the leftmost",
    --         "non-debuffed joker",
    --         "for one blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        -- info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 2 },
    cost = 3,
    pos = { x = 4, y = 3 },

    use = function(self, used_card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                ease_discard(used_card.ability.extra)
                ease_hands_played(used_card.ability.extra)
                for i = 1, #G.jokers.cards do
                    if not G.jokers.cards[i].debuff then
                        G.jokers.cards[i]:set_debuff(true)
                        G.jokers.cards[i]:juice_up()
                        break
                    end
                end
                return true
            end
        }))
    end,
}

SMODS.Consumable { -- Uranium
    set = "Alchemical",
    atlas = "arcanum_alchemical",
    key = "uranium",
    -- loc_txt = {
    --     name = 'Uranium',
    --     text = {
    --         "Copy the selected card's",
    --         "{C:attention}enhancement{}, {C:attention}seal{}, and {C:attention}edition",
    --         "to {C:attention}#1#{} random unenhanced cards",
    --         "in hand for one blind"
    --     }
    -- },
    loc_vars = function(self, info_queue, card)
        local vars = { get_modified_extra_value(card) }
        return { vars = vars }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = 3 },
    cost = 3,
    pos = { x = 5, y = 3 },

    can_use = function(self, card)
        if alchemical_can_use(self, card) then
            if #G.hand.highlighted == 1 then return true else return false end
        else
            return false
        end
    end,

    use = function(self, used_card)
        G.deck.config.ra_uranium = G.deck.config.ra_uranium or {}
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                for i = 1, used_card.ability.extra do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.5,
                        func = function()
                            local eligible_cards = {}
                            for _, v in ipairs(G.hand.cards) do
                                if v.config.center == G.P_CENTERS.c_base and not (v.edition) and not (v.seal) then
                                    table.insert(eligible_cards, v)
                                end
                            end

                            if #eligible_cards > 0 then
                                local conv_card = pseudorandom_element(eligible_cards, pseudoseed(used_card.ability.name))

                                conv_card:juice_up(1, 0.5)

                                local copied_edition = G.hand.highlighted[1].edition
                                if copied_edition then
                                    if copied_edition.holo then
                                        play_sound('holo1', 1.2 * 1.58, 0.4)
                                    elseif copied_edition.polychrome then
                                        play_sound('polychrome1', 1.2, 0.7)
                                    elseif copied_edition.negative then
                                        play_sound('negative', 1.5, 0.4)
                                    else
                                        play_sound('foil1', 1.2, 0.4)
                                    end
                                else
                                    play_sound('tarot1')
                                end

                                local prev_enhancement = check_alchemical_prev_enhancement(conv_card)
                                local prev_edition = check_alchemical_prev_edition(conv_card)
                                local prev_seal = conv_card:get_seal(true)
                                conv_card:set_ability(G.hand.highlighted[1].config.center)
                                conv_card:set_seal(G.hand.highlighted[1]:get_seal(true), true)
                                conv_card:set_edition(G.hand.highlighted[1].edition, true)

                                table.insert(G.deck.config.ra_uranium,
                                    {
                                        card_id = conv_card.unique_val,
                                        prev_enhancement = prev_enhancement,
                                        prev_edition =
                                            prev_edition,
                                        prev_seal = prev_seal
                                    })
                            end

                            return true
                        end
                    }))
                end
                return true
            end
        }))
    end,

    end_blind = function(self, card)
        if G.deck.config.ra_uranium then
            for _, uranium_card in ipairs(G.deck.config.ra_uranium) do
                for k, card in ipairs(G.playing_cards) do
                    if card.unique_val == uranium_card.card_id then
                        card:set_ability(uranium_card.prev_enhancement, nil, true)
                        card:set_edition(uranium_card.prev_edition, nil, true)
                        card:set_seal(uranium_card.prev_seal, true, nil)
                    end
                end
            end
            G.deck.config.ra_uranium = {}
        end
        return true
    end,
}
