SMODS.Atlas{
    key = "consumables",
    path = "consumables.png",
    px = 71,
    py = 95
}

CodexArcanum.pools.Consumables = {}

local function new_consumable(consumable)
    local key = "c_alchemy_" .. consumable.key
    -- create fake
    if not CodexArcanum.config.modules.Consumables[key] then
        CodexArcanum.pools.Consumables[#CodexArcanum.pools.Consumables + 1] = CodexArcanum.FakeCard:extend{ class_prefix = "c" }{
            key = consumable.key or "default",
            loc_set = consumable.set,
            atlas = consumable.atlas or "consumables",
            pos = consumable.pos or { x = 0, y = 0 },
            loc_vars = function(self, info_queue, center)
                local loc = consumable.loc_vars and consumable.loc_vars(self, info_queue, center) or { vars = {} }
                loc.set = consumable.set
                return loc
            end,
            config = consumable.config or {},
        }
        return
    end

    CodexArcanum.pools.Consumables[#CodexArcanum.pools.Consumables + 1] = SMODS.Consumable{
        key = consumable.key,
        set = consumable.set,
        pos = consumable.pos or { x = 0, y = 0 },
        atlas =  consumable.atlas or "consumables",
        loc_vars = consumable.loc_vars,
        config = consumable.config or {},
        cost = consumable.cost or 1,
        unlocked = true,
        discovered = false,
        can_use = consumable.can_use or function(card) return true end,
        use = consumable.use
    }
end

new_consumable{
    key = "seeker",
    set = "Tarot",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, center)
        local extra = CodexArcanum.utils.round_to_natural(center.ability.extra.alchemicals)
        return { vars = { extra, CodexArcanum.utils.loc_plural("card", extra) } }
    end,
    config = { extra = { alchemicals = 2 } },
    cost = 3,
    use = function(self, card, area, copier)
        local cards = math.min(CodexArcanum.utils.round_to_natural(card.ability.extra.alchemicals), G.consumeables.config.card_limit - #G.consumeables.cards)
        if cards < 1 then
            return
        end
        local used_tarot = (copier or card)
        for i = 1, cards do
            G.E_MANAGER:add_event(Event{
                trigger = "after",
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound("timpani")
                        local card = create_card("Alchemical", G.consumeables, nil, nil, nil, nil, nil, "see")
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        used_tarot:juice_up(0.3, 0.5)
                    end
                    return true
                end
            })
        end
        delay(0.6)
    end
}

new_consumable{
    key = "philosopher_stone",
    set = "Spectral",
    pos = { x = 0, y = 1 },
    cost = 4,
    can_use = function(card) return not (G.deck and G.deck.config and G.deck.config.philosopher) and G.STATE == G.STATES.SELECTING_HAND end,
    use = function(self, card, area, copier)
        G.deck.config.philosopher = true
    end
}
