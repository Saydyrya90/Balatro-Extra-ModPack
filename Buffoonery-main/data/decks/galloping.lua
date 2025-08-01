SMODS.Back{
    key = 'galloping',
    unlocked = false,
    discovered = true,
	unlock_condition = {type = 'ante_up', ante = 10},
    atlas = 'buf_decks',
    pos = {
        x = 1,
        y = 0,
    },
    config = {
		jokers = {j_buf_blackstallion}
	},
	loc_vars = function(self, info_queue, card)
		return {vars = {localize{type = 'name_text', key = 'j_buf_blackstallion', set = 'Joker'}}}
	end,
	
    apply = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8, func = function()
            local card = nil
			if not buf.compat.sleeves or G.GAME.selected_sleeve ~= 'sleeve_buf_galloping' then
				play_sound('timpani')
				card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_buf_blackstallion', 'jst')
				card:add_to_deck()
				G.jokers:emplace(card)
				card:start_materialize()
				card:set_edition()
				G.GAME.joker_buffer = 0
			end
        return true end }))
    end,
}