SMODS.Joker {
    key = "camarosa",
    name = "Camarosa",
    atlas = 'buf_jokers',
    pos = {
        x = 5,
        y = 2,
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
	yes_pool_flag = 'gfondue_licked',
    config = {
        extra = { emult = 1.25, odds = 1000},
    },
    loc_txt = {set = 'Joker', key = 'j_buf_camarosa'},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.emult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds}
        }
    end,
	
    calculate = function(self, card, context)
        if context.joker_main then
            return {
				emult = card.ability.extra.emult
			}
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.other_card then
            if pseudorandom('camarosa') < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
							func = function()
									G.jokers:remove_card(card)
									card:remove()
									card = nil
								return true; end})) 
						return true
					end
				})) 
				return {
					message = localize('k_eaten_ex'),
					colour = G.C.FILTER
				}
			else
				return {
					message = localize('k_safe_ex'),
					colour = G.C.GREEN
				}
			end
        end
    end
}