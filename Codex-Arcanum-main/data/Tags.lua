SMODS.Atlas{
    key = "tags",
    path = "tags.png",
    px = 34,
    py = 34
}

CodexArcanum.pools.Tags = CodexArcanum.pools.Tags or {}

-- kinda default constructor
local function new_tag(tag)
    tag.config = tag.config or {}
    tag.config.type = tag.type
    local key = "tag_alchemy_" .. tag.key
    -- create fake
    if not CodexArcanum.config.modules.Tags[key] then
        CodexArcanum.pools.Tags[#CodexArcanum.pools.Tags + 1] = CodexArcanum.FakeTag{
            key = tag.key or "default",
            atlas = tag.atlas or "tags",
            pos = tag.pos or { x = 0, y = 0 },
            loc_vars = tag.loc_vars,
            config = tag.config,
            rarity = tag.rarity or 1
        }
        return
    end

    CodexArcanum.pools.Tags[#CodexArcanum.pools.Tags + 1] = SMODS.Tag{
        key = tag.key,
        pos = tag.pos or { x = 0, y = 0 },
        atlas = tag.atlas or "tags",
        config = tag.config,
        loc_vars = tag.loc_vars,
        apply = function(self, _tag, context)
            if context.type ~= self.config.type then
                return
            end
            local lock = _tag.ID
            G.CONTROLLER.locks[lock] = true
            _tag:yep("+", tag.apply_color, function()
                tag.apply()
                G.CONTROLLER.locks[lock] = nil
                return true
            end
            )
            _tag.triggered = true
            return true
        end
    }
end

-- Elemental Tag
new_tag{
    key = "elemental",
    pos = { x = 0, y = 0 },
    type = "new_blind_choice",
    apply_color = G.C.PURPLE,
    apply = function()
        local key = CodexArcanum.config.modules.BoosterPacks["p_alchemy_mega_1"] and "p_alchemy_mega_1" or "p_arcana_mega_1"
        local card = Card(G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2, G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2, G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty, G.P_CENTERS[key], { bypass_discovery_center = true, bypass_discovery_ui = true })
        card.cost = 0
        card.from_tag = true
        G.FUNCS.use_card{ config = { ref_table = card } }
        card:start_materialize()
    end
}
