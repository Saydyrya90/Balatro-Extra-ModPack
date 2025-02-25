SMODS.Atlas{
    key = "boosters",
    path = "boosters.png",
    px = "71",
    py = "95"
}

CodexArcanum.pools.BoosterPacks = CodexArcanum.pools.BoosterPacks or {}

-- kinda default constructor
local function new_booster(booster)
    local key = "p_" .. booster.type .. "_" .. tostring(booster.index)
    -- create fake
    if not CodexArcanum.config.modules.BoosterPacks[key] then
        CodexArcanum.pools.BoosterPacks[#CodexArcanum.pools.BoosterPacks + 1] = CodexArcanum.FakeBooster{
            key = booster.type .. "_" .. tostring(booster.index),
            kind = "Alchemical",
            group_key = "k_alchemy_pack",
            atlas = booster.atlas or "boosters",
            pos = booster.pos or { x = 4, y = 4 },
            config = { extra = booster.extra, choose = booster.choose, name = "Alchemical" },
            loc_vars = function(self, info_queue, card)
                return { vars = { card.ability.choose, card.ability.extra }, key = "p_" .. booster.type, set = "Booster" }
            end
        }
        return
    end
    -- create booster pack
    CodexArcanum.pools.BoosterPacks[#CodexArcanum.pools.BoosterPacks + 1] = SMODS.Booster{
        key = booster.type .. "_" .. tostring(booster.index),
        kind = "Alchemical",
        group_key = "k_alchemy_pack",
        pos = booster.pos,
        atlas = booster.atlas or "boosters",
        config = { extra = booster.extra, choose = booster.choose, name = "Alchemical" },
        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.choose, card.ability.extra }, key = "p_" .. booster.type }
        end,
        weight = booster.weight or 1,
        cost = booster.cost or 4,
        in_pool = function()
            return true
        end,
        create_card = function(self, card)
            return CodexArcanum.utils.create_alchemical()
        end
    }
end

for i = 1, 4 do
    new_booster{
        type = "alchemy_normal",
        index = i,
        pos = { x = i - 1, y = 0 },
        choose = 1,
        extra = 2,
        cost = 4
    }
end
for i = 1, 2 do
    new_booster{
        type = "alchemy_jumbo",
        index = i,
        pos = { x = i - 1, y = 1 },
        choose = 1,
        extra = 4,
        cost = 6
    }
end
new_booster{
    type = "alchemy_mega",
    index = 1,
    pos = { x = 2, y = 1 },
    choose = 2,
    extra = 4,
    cost = 8,
    weight = 0.25
}
