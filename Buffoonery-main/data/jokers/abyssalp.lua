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
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
		extra = { jokies = {}, abils = {}, edits = {}, count = 0, neg = 0, echo = nil, echo_slot = 0}
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
			card.ability.extra.jokies[i] = _card.config.center.key
			card.ability.extra.abils[i] = _card.ability
			if _card.edition then
				if _card.edition.negative then card.ability.extra.neg = card.ability.extra.neg + 1 end
				card.ability.extra.edits[i] = _card.edition
			else
				card.ability.extra.edits[i] = 'nope'
			end
		end
		for i = 1, #card.ability.extra.jokies do
			if G.jokers.cards[i] ~= card then 
				local sliced_card = G.jokers.cards[i]
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1
				G.E_MANAGER:add_event(Event({func = function()
					G.GAME.joker_buffer = 0
					card:juice_up(0.8, 0.8)
					sliced_card:start_dissolve({HEX("9a45f5")}, nil, 1.6)
				return true end }))
			end
		end
		play_sound('buf_phase', 0.96+math.random()*0.08)
		SMODS.calculate_effect({message = localize("buf_prism_sck"), colour = G.C.DARK_EDITION}, card)
		card.ability.extra.echo = SMODS.add_card({key = 'j_buf_abyssalecho'}) -- store the echo inside the ability table for easy reference
		card.ability.extra.echo.ability.extra.mult = card.ability.extra.echo.ability.extra.mult + (card.ability.extra.echo.ability.extra.mult_gain * #card.ability.extra.jokies)
		card.ability.extra.echo_slot = 1 -- This is a temporary joker slot used to counteract the Echo's presence
		for i = 1, #card.ability.extra.edits do
			if card.ability.extra.edits[i].negative then
				local tempedit = card.ability.extra.edits[i]
				local tempjokie = card.ability.extra.jokies[i]
				local tempabil = card.ability.extra.abils[i]
				table.remove(card.ability.extra.edits, i)
				table.remove(card.ability.extra.jokies, i)
				table.remove(card.ability.extra.abils, i)
				table.insert(card.ability.extra.edits, 1, tempedit)
				table.insert(card.ability.extra.jokies, 1, tempjokie)
				table.insert(card.ability.extra.abils, 1, tempabil)
			end
		end
	end,
	
	remove_from_deck = function(self, card, context) -- Destroy the Echo when removed
		for i = 1, #G.jokers.cards do
			local _card = G.jokers.cards[i]
			if _card.config.center.key == 'j_buf_abyssalecho' then
				_card:start_dissolve()
			end
		end
	end,
	
    calculate = function(self, card, context)
		-- Update values at EoR
		if context.end_of_round and not context.blueprint and not context.repetition and not context.other_card and card.ability.extra.neg < #card.ability.extra.jokies then
			card.ability.extra.count = card.ability.extra.count + 1
			card.ability.extra.neg = card.ability.extra.neg + math.floor(card.ability.extra.count / 3)
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
			local limit = (G.jokers.config.card_limit + 1 + neg + card.ability.extra.echo_slot)-- limit is temporarily raised to fit this joker, the Echo, and all the (to be) negative jokers 
			play_sound('buf_phase', 0.96+math.random()*0.08)
			G.E_MANAGER:add_event(Event({
                    func = function() 
                        for i = 1, #card.ability.extra.jokies do
							if jcards + buffer < limit then
								local _card = create_card('Joker', G.jokers, nil, nil, nil, nil, card.ability.extra.jokies[i])
								_card.ability = card.ability.extra.abils[i]
								_card:set_edition((card.ability.extra.edits[i]~='nope' and card.ability.extra.edits[i]) or {}, nil, true)
								if neg > 0 then
									_card:set_edition({negative = true})
									neg = neg - 1
								end
								_card:add_to_deck()
								G.jokers:emplace(_card)
								_card:start_materialize({HEX("9a45f5")}, nil, 1.6)
								G.GAME.joker_buffer = 0
								jcards = jcards + 1
							end
                        end
                        return true
                    end}))
		end
    end
	
}

--TODO: negative jokers bug fix