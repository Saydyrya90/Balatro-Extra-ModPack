-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--      ALCHEMICAL BOOSTER
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

function add_booster(booster)
    SMODS.Booster {
        key = booster.key,
        -- loc_txt = {
        --     group_name = 'Alchemy Pack',
        --     name = booster.name,
        --     text = {
        --         'Choose {C:attention}#1#{} of up to',
        --         "{C:attention}#2#{C:alchemical} Alchemical{} cards to",
        --         "add to your consumeables"
        --     }
        -- },

        group_key = "k_ReduxArcanum_alchemy_pack",
        kind = "Alchemical",

        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.choose, card.ability.extra }, key = booster.loc_key }
        end,
        config = { extra = booster.extra, choose = booster.choose, name = localize("k_ReduxArcanum_alchemical") },

        create_card = function(self, card)
            local card = create_alchemical(G.pack_cards, nil, nil, true, true, nil, 'alc')
            return card
        end,

        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX('4d7796'))
            ease_background_colour { new_colour = darken(G.C.BLACK, 0.2), special_colour = darken(G.C.ORANGE, 0.2), contrast = 3 }
        end,

        pos = booster.pos,
        atlas = 'ca_booster_atlas',

        weight = booster.weight or 1,

        cost = booster.cost or 4,

        in_pool = function() return true end
    }
end

for i = 1, 7 do
    local loc_key
    local extra
    local choose
    local name
    local pos
    local cost
    local weight = 1
    if i < 5 then
        loc_key = "p_ReduxArcanum_alchemy_normal"
        name = "Alchemy Pack"
        choose = 1
        extra = 2
        cost = 4
    elseif i < 7 then
        loc_key = "p_ReduxArcanum_alchemy_jumbo"
        name = "Jumbo Alchemy Pack"
        choose = 1
        extra = 4
        cost = 6
    else
        loc_key = "p_ReduxArcanum_alchemy_mega"
        name = "Mega Alchemy Pack"
        choose = 2
        extra = 4
        cost = 8
        weight = 0.25
    end

    pos = { x = (i - 1) % 4, y = math.floor((i - 1) / 4) }

    add_booster({
        key = "alchemy_" .. i,
        loc_key = loc_key,
        name = name,
        extra = extra,
        choose = choose,
        pos = pos,
        weight = weight,
        cost = cost
    })
end