SMODS.Joker {
    key = "afan_spc",
    name = "Bitter Ex-Fan",
    atlas = 'buf_special',
    pos = {
        x = 3,
        y = 0,
    },
    rarity = 'buf_spc',
    cost = 0,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {cost = -30, rounds = 5, last = false },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_afan'},
    loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'special_info'}
		end
        return {
            vars = {card.ability.extra.rounds}
        }
    end,
	add_to_deck = function(from_debuff, card)
		card:set_cost()
    end,
	
    calculate = function(self, card, context)
	
		local function to_shuff(card_group, face, unflip)
			for i = 1, #card_group.cards do
				if card_group.cards[i].facing == face then 
					card_group.cards[i]:flip() 
				end
			end
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.3,
				func = function() 
					if face == 'front' then 
						if not unflip then card_group:shuffle() end
					end
					return true
				end
			}))
		end
		
		local function choose_shuff()
			local area = math.random(0, 1) == 1
			if area then
				to_shuff(G.hand, 'back')
				to_shuff(G.jokers, 'front')
				card.ability.extra.should_juice = false
			else
				to_shuff(G.jokers, 'back')
				to_shuff(G.hand, 'front')
				card.ability.extra.should_juice = true
			end
		end
		
		if context.first_hand_drawn and not context.blueprint then
			SMODS.calculate_effect({message = localize('buf_afan_monologue'..math.random(1,3)), colour = G.C.FILTER}, card)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 1,
				func = function()
					choose_shuff()
					return true
				end
			}))
		end
		
		if context.after and #G.hand.cards > 0 and not context.blueprint then
			G.E_MANAGER:add_event(  -- Thanks WilsontheWolf for the help!
				Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						if G.STATE ~= G.STATES.SELECTING_HAND then
							return false
						end
						G.STATE = G.STATES.HAND_PLAYED
						G.STATE_COMPLETE = true
							G.E_MANAGER:add_event(Event({
								func = function() 
									choose_shuff()
									return true
								end}))
						G.STATE = G.STATES.SELECTING_HAND
						if card.ability.extra.should_juice == true then card:juice_up(0.8, 0.5) end
						return true
					end,
				}),
				"other"
			)
		end
		
		if context.end_of_round and not context.blueprint and not context.repetition and not context.other_card then
			card.ability.extra.rounds = card.ability.extra.rounds - 1
			if card.ability.extra.rounds <= 0 then
				SMODS.calculate_effect({message = localize('buf_defeated'), colour = G.C.GREEN}, card)
				card.ability.extra.cost = card.ability.extra.cost * -1
				card:set_cost()
			else
				return {
					message = tostring(card.ability.extra.rounds),
					colour = G.C.FILTER,
				}
			end
		end
		
		if context.selling_self or card.getting_sliced then
			if G.hand then to_shuff(G.hand, 'back', true) end
			if G.jokers then to_shuff(G.jokers, 'back', true) end
		end
    end,
	
	-- HIDE JOKER IN COLLECTION (THANKS, EREMEL) --
	inject = function(self)
		if not Buffoonery.config.show_spc then
			SMODS.Joker.super.inject(self)
			G.P_CENTER_POOLS.Joker[#G.P_CENTER_POOLS.Joker] = nil
		else
			SMODS.Joker.super.inject(self)
		end
	end
}