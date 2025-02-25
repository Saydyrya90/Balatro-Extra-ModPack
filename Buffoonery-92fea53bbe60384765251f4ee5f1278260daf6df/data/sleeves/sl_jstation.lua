CardSleeves.Sleeve {
    key = 'jstation',
    unlocked = true,
    discovered = true,
    atlas = 'buf_sleeves',
    pos = {
        x = 0,
        y = 0,
    },
    config = {},
	loc_vars = function(self)
        if self.get_current_deck_key() == "b_buf_jstation" then
            return {key = self.key .. '_alt', vars = {}}
        end
    end,
    apply = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
			G.hand:change_size(1)
            play_sound('timpani')
			local card = nil
			if self.get_current_deck_key() == "b_buf_jstation" then
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_dxmemcard', 'jst')
			else
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_memcard', 'jst')
			end
            card:add_to_deck()
            G.jokers:emplace(card)
			card:start_materialize()
			card:set_edition()
            G.GAME.joker_buffer = 0
        return true end }))
    end,
}

-- sleeve_buf_jstation