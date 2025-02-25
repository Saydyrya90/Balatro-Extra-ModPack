CardSleeves.Sleeve {
    key = 'porcelain',
    unlocked = true,
    discovered = true,
    atlas = 'buf_sleeves',
    pos = {
        x = 2,
        y = 0,
    },
    config = {},
	loc_vars = function(self)
        if self.get_current_deck_key() == "b_buf_porcelain" then
            return {key = self.key .. '_alt', vars = {}}
        end
    end,
    apply = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
            play_sound('timpani')
			local card = nil
			if self.get_current_deck_key() == "b_buf_porcelain" then
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_dorkshire_g', 'por')
			else
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_dorkshire', 'por')
				local rmvd_suit = {'Spades', 'Hearts', 'Clubs', 'Diamonds'}
				local random = rmvd_suit[math.random(1, 4)]
				local target_suit = random
				local keys_to_remove = {}
				for k, v in pairs(G.playing_cards) do
					if v.base.suit == target_suit then
						table.insert(keys_to_remove, v)
					end
				end
				for i = 1, #keys_to_remove do
					keys_to_remove[i]:remove()
				end
			end
            card:add_to_deck()
            G.jokers:emplace(card)
			card:start_materialize()
			card:set_edition()
            G.GAME.joker_buffer = 0
			
        return true end }))
    end,
}