SMODS.Atlas {
    key = "balatro_hearts_1",
    path = "balatro_hearts_1.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}
SMODS.Atlas {
    key = "balatro_hearts_2",
    path = "balatro_hearts_2.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}

SMODS.Atlas {
    key = "balatro_spades_1",
    path = "balatro_spades_1.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}

SMODS.Atlas {
    key = "balatro_spades_2",
    path = "balatro_spades_2.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}

SMODS.Atlas {
    key = "balatro_diamonds_1",
    path = "balatro_diamonds_1.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}

SMODS.Atlas {
    key = "balatro_diamonds_2",
    path = "balatro_diamonds_2.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}

SMODS.Atlas {
    key = "balatro_clubs_1",
    path = "balatro_clubs_1.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}

SMODS.Atlas {
    key = "balatro_clubs_2",
    path = "balatro_clubs_2.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}


SMODS.DeckSkin {
    key = "balatro_hearts",
    suit = "Hearts",
    palettes = {
        {
            key = 'lc',
            ranks = { "Jack", "Queen", "King" },
            display_ranks = { "Jack", "Queen", "King" },
            atlas = "balx_balatro_hearts_1",
            pos_style = "collab"
        },
        {
            key = 'hc',
            ranks = { "Jack", "Queen", "King" },
            display_ranks = { "Jack", "Queen", "King" },
            atlas = "balx_balatro_hearts_2",
            pos_style = "collab"
        }
    },
    atlas= "DeckSkin",
    loc_txt = {
        ["en-us"] = "Balatro"
    },
}

SMODS.DeckSkin {
    key = "balatro_spades",
    suit = "Spades",
    palettes = {
        {
            key = 'lc',
            ranks = { "Jack", "Queen", "King" },
            display_ranks = { "Jack", "Queen", "King" },
            atlas = "balx_balatro_spades_1",
            pos_style = "collab"
        },
        {
            key = 'hc',
            ranks = { "Jack", "Queen", "King" },
            display_ranks = { "Jack", "Queen", "King" },
            atlas = "balx_balatro_spades_2",
            pos_style = "collab"
        }
    },
    atlas= "DeckSkin",
    loc_txt = {
        ["en-us"] = "Balatro"
    },
}

SMODS.DeckSkin {
    key = "balatro_diamonds",
    suit = "Diamonds",
    palettes = {
        {
            key = 'lc',
            ranks = { "Jack", "Queen", "King" },
            display_ranks = { "Jack", "Queen", "King" },
            atlas = "balx_balatro_diamonds_1",
            pos_style = "collab"
        },
        {
            key = 'hc',
            ranks = { "Jack", "Queen", "King" },
            display_ranks = { "Jack", "Queen", "King" },
            atlas = "balx_balatro_diamonds_2",
            pos_style = "collab"
        }
    },
    atlas= "DeckSkin",
    loc_txt = {
        ["en-us"] = "Balatro"
    },
}

SMODS.DeckSkin {
    key = "balatro_clubs",
    suit = "Clubs",
    palettes = {
        {
            key = 'lc',
            ranks = { "Jack", "Queen", "King" },
            display_ranks = { "Jack", "Queen", "King" },
            atlas = "balx_balatro_clubs_1",
            pos_style = "collab"
        },
        {
            key = 'hc',
            ranks = { "Jack", "Queen", "King" },
            display_ranks = { "Jack", "Queen", "King" },
            atlas = "balx_balatro_clubs_2",
            pos_style = "collab",
            hc_default = true,
        }
    },
    atlas= "DeckSkin",
    loc_txt = {
        ["en-us"] = "Balatro"
    },
}
