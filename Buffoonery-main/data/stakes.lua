SMODS.Stake{ -- Palladium Stake
    key = 'palladium',
    applied_stakes = {'gold'},
    above_stake = 'gold',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
		G.GAME.modifiers.buf_halfstep_bosses = true
    end,

    colour = HEX('b0a190'),
	shader = 'shine',
    pos = {x = 0, y = 0},
    sticker_pos = {x = 0, y = 0},
    atlas = 'buf_stakes',
    sticker_atlas = 'buf_stickers',
	shiny = true
}

SMODS.Stake{ -- Spinel Stake
    key = 'spinel',
    applied_stakes = {'buf_palladium'},
    above_stake = 'buf_palladium',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
		G.GAME.win_ante = G.GAME.win_ante * 1.5
    end,

    colour = HEX('e1345d'),
	shader = 'shine',
    pos = {x = 1, y = 0},
    sticker_pos = {x = 1, y = 0},
    atlas = 'buf_stakes',
    sticker_atlas = 'buf_stickers',
	shiny = true
}