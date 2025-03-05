-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--           VOUCHERS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.Voucher {
    key = 'mortar_and_pestle',
    -- loc_txt = {
    --     name = "Mortar and Pestle",
    --     text = {
    --         "{C:attention}+1{} consumable slot",
    --     }
    -- },

    unlocked = true,

    redeem = function(self)
        -- Copied from Cystal Ball
        G.E_MANAGER:add_event(Event({
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                return true
            end
        }))
    end,

    pos = { x = 0, y = 2 },
    atlas = 'arcanum_others'
}

cauldron = {
    key = 'cauldron',
    -- loc_txt = {
    --     name = "Cauldron",
    --     text = {
    --         "{C:alchemical}Alchemical{} cards may come with",
    --         "the {C:dark_edition}Negative{} Edition"
    --     },
    --     unlock = {
    --         "Use a total of {C:attention}25",
    --         "{C:alchemical}Alchemical{} cards from any",
    --         "{C:alchemical}Alchemy Pack",
    --         "{C:inactive}(#1#)",
    --     }
    -- },

    loc_vars = function(self, info_queue)
        if not ReduxArcanumMod.config.new_content then
            return { key = self.key .. "_classic"}
        end
    end,
    locked_loc_vars = function(self, info_queue)
        return { vars = { self.unlock_condition.extra, G.PROFILES[G.SETTINGS.profile].career_stats.c_ReduxArcanum_alchemy_pack_used or 0 } }
    end,

    requires = { 'v_ReduxArcanum_mortar_and_pestle' },

    unlocked = false,
    unlock_condition = {
        type = "c_ReduxArcanum_alchemy_pack_used",
        extra = 25
    },

    pos = { x = 0, y = 3 },
    atlas = 'arcanum_others'
}
SMODS.Voucher(cauldron)

SMODS.Voucher {
    key = 'alchemical_merchant',
    -- loc_txt = {
    --     name = "Alchemical Merchant",
    --     text = {
    --         "{C:alchemical}Alchemical{} cards can",
    --         "appear in the {C:attention}shop",
    --     },
    -- },

    unlocked = true,

    config = { extra = 4 },

    redeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.alchemical_rate = self.config.extra
                return true
            end
        }))
    end,

    pos = { x = 1, y = 2 },
    atlas = 'arcanum_others'
}

SMODS.Voucher {
    key = 'alchemical_tycoon',
    -- loc_txt = {
    --     name = "Alchemical Tycoon",
    --     text = {
    --         "{C:alchemical}Alchemical{} cards appear",
    --         "{C:attention}2X{} more frequently",
    --         "in the shop"
    --     },
    --     unlock = {
    --         "Buy a total of",
    --         "{C:attention}25{C:alchemical} Alchemical{} cards",
    --         "from the shop",
    --         "{C:inactive}(#1#)",
    --     }
    -- },

    locked_loc_vars = function(self, info_queue)
        return { vars = { self.unlock_condition.extra, G.PROFILES[G.SETTINGS.profile].career_stats.c_ReduxArcanum_alchemicals_bought or 0 } }
    end,

    requires = { 'v_ReduxArcanum_alchemical_merchant' },

    unlocked = false,
    unlock_condition = {
        type = "c_ReduxArcanum_alchemicals_bought",
        extra = 25
    },

    config = { extra = 9.6 },

    redeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.alchemical_rate = self.config.extra
                return true
            end
        }))
    end,

    pos = { x = 1, y = 3 },
    atlas = 'arcanum_others'
}

SMODS.Voucher:take_ownership('observatory', {
    calculate = function(self, card, context)
        if 
            context.other_consumeable and
            not context.other_consumeable.debuff and
            context.other_consumeable.ability.set == 'Planet' and
            context.other_consumeable.ability.consumeable.hand_type == context.scoring_name
        then
            return {
                x_mult = card.ability.extra
            }
        end
    end,
}, false)