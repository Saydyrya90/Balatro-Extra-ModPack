SMODS.Joker {
    key = "abyssalp",
    name = "Abyssal Prism",
    atlas = 'buf_jokers',
    pos = {
        x = 2,
        y = 3,
    },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
		extra = { jokies = {}, done = false, count = 0, neg = 0}
    },
    loc_txt = {set = 'Joker', key = 'j_buf_abyssalp'},
	loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'banish_info'}
		end
        return {
            vars = { card.ability.extra.neg, card.ability.extra.count % 3
			}
        }
    end,
	
	-- Eat them Jokers when acquired
	add_to_deck = function(self, card, context)
		local _card = nil
		for i = 1, #G.jokers.cards do
			_card = G.jokers.cards[i]
			card.ability.extra.jokies[i] = _card
		end
		for i = 1, #card.ability.extra.jokies do
			if not card.ability.extra.jokies[i].ability.eternal and not card.ability.extra.jokies[i].getting_sliced then 
				local sliced_card = card.ability.extra.jokies[i]
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1
				G.E_MANAGER:add_event(Event({func = function()
					G.GAME.joker_buffer = 0
					card:juice_up(0.8, 0.8)
					sliced_card:start_dissolve({HEX("9a45f5")}, nil, 1.6)
				return true end }))
			end
		end
		card.ability.extra.done = true
		play_sound('buf_phase', 0.96+math.random()*0.08)
		SMODS.calculate_effect({message = localize("buf_prism_sck"), colour = G.C.DARK_EDITION}, card)
	end,
	
    calculate = function(self, card, context)
		-- Update values at EoR
		if context.end_of_round and not context.blueprint and not context.repetition and not context.other_card then
			card.ability.extra.count = card.ability.extra.count + 1
			card.ability.extra.neg = math.floor(card.ability.extra.count / 3)
			if card.ability.extra.count % 3 == 0 then
				return {
					message = localize("buf_prism_eor2"),
					colour = G.C.DARK_EDITION,
					card = card
				}
			else
				return {
					message = localize("buf_prism_eor1"),
					colour = G.C.DARK_EDITION,
					card = card
				}
			end
		end
		
		-- Spit out them jokers when sold
		if context.selling_self then
			local jcards, buffer, neg = #G.jokers.cards, G.GAME.joker_buffer,  card.ability.extra.neg
			local limit = (G.jokers.config.card_limit + 1 + neg) -- limit is temporarily raised to fit this joker and all the (to be) negative jokers 
			play_sound('buf_phase', 0.96+math.random()*0.08)
			G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i = 1, #card.ability.extra.jokies do
							if jcards + buffer < limit then
								local card = create_card('Joker', G.jokers, nil, nil, nil, nil, card.ability.extra.jokies[i].config.center.key, 'mag')
								if neg > 0 then
									card:set_edition({negative = true})
									neg = neg - 1
								else
									card:set_edition()
								end
								card:add_to_deck()
								G.jokers:emplace(card)
								card:start_materialize({HEX("9a45f5")}, nil, 1.6)
								G.GAME.joker_buffer = 0
								jcards = jcards + 1
							end
                        end
                        return true
                    end}))
		end
    end
}