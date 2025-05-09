SMODS.Achievement {
    key = "alchemy_completionist",
    hidden_name = false,
    unlock_condition = function (self, args)
        if args.type == "discover_amount" then
            local earned = true
            for k, v in pairs(G.P_CENTERS or {}) do
                if v.mod and v.mod.id == "ReduxArcanum" then
                    earned = earned and v.discovered
                end
            end
            return earned
        end
    end
}

-- SMODS.Achievement {
--     key = "alchemy_gold_stake",
--     hidden_name = false,
--     unlock_condition = function (self, args)
--         if args.type == "win" then
--             if G.GAME.stake >= G.P_STAKES["stake_gold"].order then
--                 return true
--             end
--         end
--     end,
--     bypass_all_unlocked = true
-- }

SMODS.Achievement {
    key = "mutated_joker_max",
    hidden_name = false,
    unlock_condition = function (self, args)
        if args.type == "ReduxArcanum_mutated_joker_max" then
            return true
        end
    end,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    key = "salt_booster_tag",
    hidden_name = true,
    hidden_text = true,
    unlock_condition = function (self, args)
        if args.type == "ReduxArcanum_midblind_pack" then
            return true
        end
    end,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    key = "all_alchemicals",
    hidden_name = true,
    hidden_text = true,
    unlock_condition = function (self, args)
        if args.type == "used_alchemical" and #G.deck.config.played_alchemicals >= 24 then
            local count = 0
            for i, key in ipairs(G.deck.config.played_alchemicals) do
                if key ~= "ReduxArcanum_philosopher_stone" then
                    count = count + 1
                end
            end
            return count >= 24
        end
    end,
    bypass_all_unlocked = true
}