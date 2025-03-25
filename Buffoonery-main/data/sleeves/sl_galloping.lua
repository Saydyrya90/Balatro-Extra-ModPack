CardSleeves.Sleeve {
    key = 'galloping',
    unlocked = false,
    unlock_condition = { deck = "b_buf_galloping", stake = "stake_green" },
    atlas = 'buf_sleeves',
    pos = {
        x = 1,
        y = 0,
    },
    config = {},
	loc_vars = function(self)
		local key
		local vars = {}
        if self.get_current_deck_key() == "b_buf_galloping" then
            key = self.key .. '_alt'
        else
			key = self.key
		end
		return {key = key, vars = vars}
    end,
    apply = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
            play_sound('timpani')
			local card = nil
			if self.get_current_deck_key() == "b_buf_galloping" then
				G.GAME.starting_params.hands = G.GAME.starting_params.hands - 2
				G.GAME.round_resets.hands = G.GAME.round_resets.hands - 2
				 G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - 2
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_whitepony', 'jst')
			else
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_blackstallion', 'jst')
			end
            card:add_to_deck()
            G.jokers:emplace(card)
			card:start_materialize()
			card:set_edition()
            G.GAME.joker_buffer = 0
        return true end }))
    end,
}