SMODS.Atlas{
    key = "decks",
    path = "decks.png",
    px = 71,
    py = 95
}

CodexArcanum.pools.Decks = {}

-- kinda default constructor
local function new_deck(deck)
    local key = "b_alchemy_" .. deck.key
    -- create fake
    if not CodexArcanum.config.modules.Decks[key] then
        CodexArcanum.pools.Decks[#CodexArcanum.pools.Decks + 1] = CodexArcanum.FakeCard:extend{ class_prefix = "b" }{
            key = deck.key or "default",
            loc_set = "Back",
            atlas = deck.atlas or "decks",
            pos = deck.pos or { x = 0, y = 0 },
            loc_vars = function(self, info_queue, center)
                local loc = deck.loc_vars and deck.loc_vars(self, info_queue, center) or { vars = {} }
                loc.set = "Back"
                return loc
            end,
            config = deck.config or {},
            rarity = deck.rarity or 1
        }
        return
    end

    -- create deck
    CodexArcanum.pools.Decks[#CodexArcanum.pools.Decks + 1] = SMODS.Back{
        key = deck.key,
        config = deck.config or {},
        unlocked = true,
        apply = function(self) end,
        pos = deck.pos or { x = 0, y = 0 },
        atlas = deck.atlas or "decks",
        trigger_effect = deck.trigger_effect
    }
end

local philosopher_consumables = CodexArcanum.config.modules.Consumables["c_alchemy_seeker"] and { "c_alchemy_seeker" } or nil

new_deck{
    key = "philosopher",
    config = { vouchers = { "v_alchemy_alchemical_merchant" }, consumables = philosopher_consumables },
    pos = { x = 0, y = 0 }
}

new_deck{
    key = "herbalist",
    config = { vouchers = { "v_alchemy_mortar_and_pestle" } },
    pos = { x = 1, y = 0 },
    trigger_effect = function(self, context)
        if context.setting_blind and G.GAME.blind:get_type() == "Boss" then
            delay(0.2)
            G.E_MANAGER:add_event(Event{
                trigger = "immediate",
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards or G.GAME.used_vouchers.v_alchemy_cauldron then
                        play_sound("timpani")
                        local card = create_card("Alchemical", G.consumeables, nil, nil, nil, nil, nil, "see")
                        if G.consumeables.config.card_limit <= #G.consumeables.cards and G.GAME.used_vouchers.v_alchemy_cauldron then
                            card:set_edition({ negative = true }, true) -- well...
                        end
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                    return true
                end
            })
        end
    end
}
