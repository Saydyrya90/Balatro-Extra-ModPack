local crazy_pack_sparkles = {
    timer = 0.05,
    scale = 0.1,
    lifespan = 2.5,
    speed = 0.7,
    padding = -3,
    colours = {G.C.WHITE, lighten(Reverie.badge_colour, 0.4), lighten(G.C.RED, 0.2)}
}
local film_pack_meteors = {
    timer = 0.035,
    scale = 0.1,
    lifespan = 1.5,
    speed = 4,
    colours = {lighten(Reverie.badge_colour, 0.2), G.C.WHITE}
}

local function create_tag_pack_card(self, card)
    return Reverie.create_tag_as_card(G.pack_cards or G.jokers, true)
end

local function ease_tag_pack_colour(self)
    ease_colour(G.C.DYN_UI.MAIN, mix_colours(G.C.SECONDARY_SET.Tag, G.C.BLACK, 0.9))
    ease_background_colour{new_colour = G.C.SECONDARY_SET.Tag, special_colour = G.C.BLACK, contrast = 2}
end

local function create_crazy_pack_card(self, card)
    return Reverie.create_crazy_random_card(G.pack_cards or G.jokers)
end

local function ease_crazy_pack_colour(self)
    ease_colour(G.C.DYN_UI.MAIN, mix_colours(G.C.SECONDARY_SET.Cine, G.C.BLACK, 0.9))
    ease_background_colour{new_colour = darken(G.C.RED, 0.2), special_colour = darken(G.C.SECONDARY_SET.Cine, 0.4), tertiary_colour = darken(G.C.BLACK, 0.2), contrast = 3}
end

local function create_film_pack_card(self, card)
    return create_card(card.ability.name:find("Mega") and "Cine" or "Cine_Quest", G.pack_cards, nil, nil, true, true, nil, "film")
end

local function ease_film_pack_colour(self)
    ease_colour(G.C.DYN_UI.MAIN, mix_colours(G.C.SECONDARY_SET.Cine, G.C.BLACK, 0.9))
    ease_background_colour{new_colour = G.C.SECONDARY_SET.Cine, special_colour = G.C.BLACK, contrast = 2}
end

Reverie.boosters = {
    {
        key = "crazy_lucky_1",
        group_key = "k_dvrprv_crazy_pack",
        loc_key = "p_dvrprv_crazy_lucky",
        order = 6,
        name = "Pack",
        config = {
            extra = 4,
            choose = 1,
            weights = {
                ["Joker"] = 1,
                ["Consumeables"] = 0.75,
                ["Playing"] = 1,
                ["Tag"] = 0.15,
                ["Voucher"] = 0.05,
                ["Cine"] = 0.01
            }
        },
        weight = 1,
        kind = "Crazy",
        cost = 6,
        yes_pool_flag = "Crazy Lucky",
        pos = {
            x = 4,
            y = 0
        },
        create_card = create_crazy_pack_card,
        ease_background_colour = ease_crazy_pack_colour,
        sparkles = crazy_pack_sparkles
    },
    {
        key = "tag_normal_1",
        group_key = "k_dvrprv_tag_pack",
        loc_key = "p_dvrprv_tag_normal",
        order = 1,
        name = "Tag Pack",
        config = {
            extra = 2,
            choose = 1
        },
        weight = 1,
        kind = "Tag",
        cost = 4,
        yes_pool_flag = "Tag or Die",
        pos = {
            x = 0,
            y = 0
        },
        create_card = create_tag_pack_card,
        ease_background_colour = ease_tag_pack_colour
    },
    {
        key = "tag_normal_2",
        group_key = "k_dvrprv_tag_pack",
        loc_key = "p_dvrprv_tag_normal",
        order = 2,
        name = "Tag Pack",
        config = {
            extra = 2,
            choose = 1
        },
        weight = 1,
        kind = "Tag",
        cost = 4,
        yes_pool_flag = "Tag or Die",
        pos = {
            x = 1,
            y = 0
        },
        create_card = create_tag_pack_card,
        ease_background_colour = ease_tag_pack_colour
    },
    {
        key = "tag_jumbo_1",
        group_key = "k_dvrprv_tag_pack",
        loc_key = "p_dvrprv_tag_jumbo",
        order = 3,
        name = "Jumbo Tag Pack",
        config = {
            extra = 4,
            choose = 1
        },
        weight = 1,
        kind = "Tag",
        cost = 6,
        yes_pool_flag = "Tag or Die",
        pos = {
            x = 2,
            y = 0
        },
        create_card = create_tag_pack_card,
        ease_background_colour = ease_tag_pack_colour
    },
    {
        key = "tag_mega_1",
        group_key = "k_dvrprv_tag_pack",
        loc_key = "p_dvrprv_tag_mega",
        order = 4,
        name = "Mega Tag Pack",
        config = {
            extra = 4,
            choose = 2
        },
        weight = 0.25,
        kind = "Tag",
        cost = 8,
        yes_pool_flag = "Tag or Die",
        pos = {
            x = 3,
            y = 0
        },
        create_card = create_tag_pack_card,
        ease_background_colour = ease_tag_pack_colour
    },
    {
        key = "film_normal_1",
        group_key = "k_dvrprv_film_pack",
        loc_key = "p_dvrprv_film_normal",
        order = 7,
        name = "Film Pack",
        config = {
            extra = 2,
            choose = 1
        },
        weight = 1,
        kind = "Cine",
        cost = 4,
        pos = {
            x = 1,
            y = 1
        },
        create_card = create_film_pack_card,
        ease_background_colour = ease_film_pack_colour,
        meteors = film_pack_meteors
    },
    {
        key = "film_normal_2",
        group_key = "k_dvrprv_film_pack",
        loc_key = "p_dvrprv_film_normal",
        order = 8,
        name = "Film Pack",
        config = {
            extra = 2,
            choose = 1
        },
        weight = 1,
        kind = "Cine",
        cost = 4,
        pos = {
            x = 2,
            y = 1
        },
        create_card = create_film_pack_card,
        ease_background_colour = ease_film_pack_colour,
        meteors = film_pack_meteors
    },
    {
        key = "film_jumbo_1",
        group_key = "k_dvrprv_film_pack",
        loc_key = "p_dvrprv_film_jumbo",
        order = 9,
        name = "Jumbo Film Pack",
        config = {
            extra = 4,
            choose = 1
        },
        weight = 0.6,
        kind = "Cine",
        cost = 6,
        pos = {
            x = 3,
            y = 1
        },
        create_card = create_film_pack_card,
        ease_background_colour = ease_film_pack_colour,
        meteors = film_pack_meteors
    },
    {
        key = "film_mega_1",
        group_key = "k_dvrprv_film_pack",
        loc_key = "p_dvrprv_film_mega",
        order = 10,
        name = "Mega Film Pack",
        config = {
            extra = 2,
            choose = 1
        },
        weight = 0.07,
        kind = "Cine",
        cost = 8,
        pos = {
            x = 4,
            y = 1
        },
        create_card = create_film_pack_card,
        ease_background_colour = ease_film_pack_colour,
        meteors = film_pack_meteors
    }
}

for _, v in pairs(Reverie.boosters) do
    v.atlas = "cine_boosters"
    v.loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra }, key = v.loc_key }
    end

    SMODS.Booster(v)
end

SMODS.Booster:take_ownership_by_kind('Standard', {
    create_card = function(self, card, i)
        if Reverie.find_used_cine("Poker Face") then
            card = Reverie.create_poker_face_card(G.pack_cards)
            return card
        else
            local _edition = poll_edition('standard_edition'..G.GAME.round_resets.ante, 2, true)
            local _seal = SMODS.poll_seal({mod = 10})
            return {set = (pseudorandom(pseudoseed('stdset'..G.GAME.round_resets.ante)) > 0.6) and "Enhanced" or "Base", edition = _edition, seal = _seal, area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "sta"}
        end
    end,
}, true)

SMODS.Booster:take_ownership_by_kind('Buffoon', {
    create_card = function(self, card)
        special_reverie_joker = Reverie.create_special_joker(G.pack_cards)
        if special_reverie_joker then
            return special_reverie_joker
        end
        return {set = "Joker", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "buf"}
    end,
}, true)