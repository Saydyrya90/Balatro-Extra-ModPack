SMODS.Back{
    key = 'porcelain',
    unlocked = true,
    discovered = true,
    atlas = 'buf_decks',
    pos = {
        x = 2,
        y = 0,
    },
    config = {},

    apply = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
            local card = nil
			if not buf.compat.sleeves or G.GAME.selected_sleeve ~= 'sleeve_buf_porcelain' then
				play_sound('timpani')
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_dorkshire', 'por')
				card:add_to_deck()
				G.jokers:emplace(card)
				card:start_materialize()
				card:set_edition()
				G.GAME.joker_buffer = 0
			end
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
        return true end }))
    end,
}