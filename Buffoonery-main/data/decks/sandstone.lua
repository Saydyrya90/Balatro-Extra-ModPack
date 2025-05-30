SMODS.Back{
    key = 'sandstone',
    unlocked = false,
	unlock_condition = {type = 'win_stake', stake = buf.compat.bunco and 13 or 10},
    atlas = 'buf_decks',
    pos = {
        x = 3,
        y = 0,
    },
    config = {},

    apply = function(self)
		local ante = G.GAME.win_ante * 0.75 
		local int_part, frac_part = math.modf(ante)               -- this is here to be more compatible with other modifiers to
		local rounded = int_part + (frac_part >= 0.5 and 1 or 0)  -- G.GAME.win_ante that might come before this deck
        G.GAME.win_ante = rounded
		if not buf.compat.sleeves or G.GAME.selected_sleeve ~= 'sleeve_buf_sandstone' then
			G.GAME.starting_params.ante_scaling = 2
		end
    end,
}