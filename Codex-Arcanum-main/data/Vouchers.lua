SMODS.Atlas{
    key = "vouchers",
    path = "vouchers.png",
    px = 71,
    py = 95
}

CodexArcanum.pools.Vouchers = {}

-- kinda default constructor
local function new_voucher(voucher)
    local key = "v_alchemy_" .. voucher.key
    -- create fake
    if not CodexArcanum.config.modules.Vouchers[key] then
        CodexArcanum.pools.Vouchers[#CodexArcanum.pools.Vouchers + 1] = CodexArcanum.FakeCard:extend{ class_prefix = "v" }{
            key = voucher.key or "default",
            loc_set = "Voucher",
            pos = voucher.pos or { x = 0, y = 0 },
            atlas = voucher.atlas or "vouchers",
            loc_vars = function(self, info_queue, center)
                local loc = voucher.loc_vars and voucher.loc_vars(self, info_queue, center) or { vars = {} }
                loc.set = "Voucher"
                return loc
            end,
            config = voucher.config or {}
        }
        return
    end

    -- create voucher
    CodexArcanum.pools.Vouchers[#CodexArcanum.pools.Vouchers + 1] = SMODS.Voucher{
        key = voucher.key,
        pos = voucher.pos or { x = 0, y = 0 },
        atlas = voucher.atlas or "vouchers",
        loc_vars = voucher.loc_vars,
        config = voucher.config or {},
        requires = voucher.requires,
        cost = voucher.cost or 10,
        unlocked = not (voucher.check_for_unlock or voucher.unlock_condition),
        unlock_condition = voucher.unlock_condition,
        check_for_unlock = voucher.check_for_unlock,
        locked_loc_vars = voucher.locked_loc_vars,
        discovered = false,
        redeem = voucher.redeem or function() end
    }
end

new_voucher{
    key = "mortar_and_pestle",
    config = { extra = 1 },
    pos = { x = 0, y = 0 },
    redeem = function(self, center)
        G.E_MANAGER:add_event(Event{
            func = function()
                G.consumeables.config.card_limit = (G.consumeables.config.card_limit or 0) + (center and center.ability.extra or self.config.extra)
                return true
            end
        })
    end
}

new_voucher{
    key = "cauldron",
    config = { extra = 1 },
    pos = { x = 0, y = 1 },
    requires = { "v_alchemy_mortar_and_pestle" }
}

new_voucher{
    key = "alchemical_merchant",
    config = { extra = 4.8 },
    pos = { x = 1, y = 0 },
    redeem = function(self, center)
        G.E_MANAGER:add_event(Event{
            func = function()
                G.GAME.alchemical_rate = center and center.ability.extra or self.config.extra
                return true
            end
        })
    end
}

new_voucher{
    key = "alchemical_tycoon",
    config = { extra = 4.8 * 2 },
    pos = { x = 1, y = 1 },
    requires = { "v_alchemy_alchemical_merchant" },
    redeem = function(self, center)
        G.E_MANAGER:add_event(Event{
            func = function()
                G.GAME.alchemical_rate = center and center.ability.extra or self.config.extra
                return true
            end
        })
    end
}
