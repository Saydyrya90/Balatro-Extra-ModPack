SMODS.Atlas({
    key = 'arcanum_blinds',
    path = 'ra_blind_atlas.png',
    px = 34,
    py = 34,
    frames = 21,
    atlas_table =
    'ANIMATION_ATLAS'
})

if ReduxArcanumMod.config.new_content then
    SMODS.Blind { -- The Bane
        key = 'bane',
        -- loc_txt = {
        --     name = 'The Bane',
        --     text = { 'All Consumables', 'are debuffed' },
        -- },
        boss = { min = 2 },

        recalc_debuff = function(self, card, from_blind)
            for i = 1, #G.consumeables.cards do
                G.consumeables.cards[i]:set_debuff(true)
                if G.consumeables.cards[i].debuff then G.consumeables.cards[i].debuffed_by_blind = true end
            end
        end,

        disable = function()
            for i = 1, #G.consumeables.cards do
                G.consumeables.cards[i]:set_debuff(false)
            end
        end,
        defeat = function()
            for i = 1, #G.consumeables.cards do
                G.consumeables.cards[i]:set_debuff(false)
            end
        end,

        boss_colour = HEX('5D757A'),

        pos = { y = 0 },
        atlas = 'arcanum_blinds'
    }
end
