-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--      ALCHEMICAL CLASSES
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.ConsumableType {
    key = 'Alchemical',
    primary_colour = HEX('FFFFFF'),
    secondary_colour = HEX('C09D75'),
    -- loc_txt = {
    --     name = 'Alchemical',
    --     collection = 'Alchemical Cards',
    --     text = {
    --         "Can only be used",
    --         "during a {C:attention}blind{}"
    --     },
    --     undiscovered = {
    --         name = 'Not Discovered',
    --         text = {
    --             [1] = 'Purchase or use',
    --             [2] = 'this card in an',
    --             [3] = 'unseeded run to',
    --             [4] = 'learn what it does'
    --         }
    --     }
    -- },
    inject_card = function (self, center)
        -- Default can_use (alchemicals may define their own)
        if not center.can_use then
            center.can_use = alchemical_can_use
        end

        -- Add wrapper function to use to apply polychrome, check for unlocks, and set up end-of-round cleanup
        center.use = alchemical_use(center.use)
        center.loc_vars = alchemical_loc_vars(center.loc_vars)

        SMODS.ConsumableType.inject_card(self, center)
    end,
    default = "c_ReduxArcanum_ignis",
    collection_rows = { 4, 4 },
    shop_rate = 0
}

SMODS.UndiscoveredSprite {
    key = 'Alchemical',
    atlas = 'arcanum_alchemical_undiscovered',
    pos = { x = 0, y = 0 }
}

-- Standard function used to define when an alchemy card can be used
-- (Typically, during a blind or in a booster pack)
function alchemical_can_use(self, card)
    
    -- Few different use cases here:
    -- 1) If the alchemy card is owned by the player, it should only be useable during a blind.
    -- 2) If the alchemy card is part of a booster pack, it should be useable if there is an empty consumable slot.
    -- 3) If the alchemy card is purchaseable in the shop, it should be buy only (no buy & use)
    -- Secnarioes 2 and 3 have been ported over to overriden functions in overrides.lua

    -- Secret fourth scenario: debuffed alchemical cards (via new boss blind) should not be useable either
    -- Sorted in lovely.toml

    if G.STATE == G.STATES.SELECTING_HAND and not card.debuff then
        return true
    else
        return false
    end
end

function alchemical_use(func)
    return function(self, card)
        -- Setup end-of-round cleanup for temp effects
        G.deck.config.played_alchemicals = G.deck.config.played_alchemicals or {}
        table.insert(G.deck.config.played_alchemicals, self.key)

        -- For Breaking Bozo unlock
        check_for_unlock({ type = 'used_alchemical' })

        -- Apply actual polychrome effect only on use (to avoid double multiplication)
        if card.edition and card.edition.polychrome and card.ability.extra then
            card.ability.extra = math.ceil(card.ability.extra * card.edition.x_mult)
        end

        -- Execute alchemical effect
        if type(func) == "function" then
            func(self, card)
        end
    end
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

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--     HANDLING POLYCHROME
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
-- This is all set up a bit weirdly
-- In order to avoid the extra value being multiplied multiple times, I've set it up to only multiply at the last possible moment
-- This means that it needs to be handled separately for tooltips (via loc_vars), which is done by calculating the new value but not applying it
-- This all also means that if you want an alchemical card's effect to be polychromable, use card.config.extra, otherwise don't

-- At end of round (same time Idol, Ancient Joker, etc. reset), cleanup all temporary alchemical effects
-- Usually for cards that affect cards in deck, like Acid or Bismuth
function ra_reset_played_alchemicals()
    if G.deck.config.played_alchemicals then
        for _, key in ipairs(G.deck.config.played_alchemicals) do
            local card = G.P_CENTERS[key]
            if card.end_blind then
                card.end_blind()
            end
        end
        G.deck.config.played_alchemicals = {}
    end
end

function alchemical_get_x_mult(card)
    if card.edition and card.edition.polychrome and card.ability.extra then
        return card.edition.x_mult
    else
        return 1
    end
end

-- Returns extra value considering polychrome
-- Used in loc_vars
function get_modified_extra_value(card)
    local extra

    if card.edition and card.edition.polychrome and card.ability.extra then
        extra = math.ceil(card.ability.extra * card.edition.x_mult)
    else
        extra = card.ability.extra
    end

    return extra
end

-- Handle alt localizations for polychrome and classic cards here
function alchemical_loc_vars(func)
    return function(self, info_queue, card)
        local key = card.config.center.key

        if G.localization.descriptions["Alchemical"][key .. "_plural"] and get_modified_extra_value(card) ~= 1 then
            key = key .. "_plural"
        elseif not ReduxArcanumMod.config.new_content and G.localization.descriptions["Alchemical"][key .. "_classic"] then
            key = key .. "_classic"
        end

        local ret = func(self, info_queue, card)
        ret.key = key
        return ret
    end
end