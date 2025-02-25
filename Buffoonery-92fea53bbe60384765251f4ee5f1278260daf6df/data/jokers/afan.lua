SMODS.Joker {
    key = "afan",
    name = "Adoring Fan",
    atlas = 'buf_jokers',
    pos = {
        x = 3,
        y = 0,
    },
    rarity = 1,
    cost = 0,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = { mult = 15, odds = 2, cost = -6 },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_afan'},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult, G.GAME.probabilities.normal or 1, card.ability.extra.odds}
        }
    end,
	add_to_deck = function(from_debuff, card)
		card:set_cost()
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.selling_self and pseudorandom('adoring'..G.GAME.round_resets.ante) < G.GAME.probabilities.normal / card.ability.extra.odds then
			card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('buf_afan_annoy'..math.random(1,4)), colour = G.C.RED})
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 1,
				func = function() 
					local chosen_joker = nil
					for i = 1, #G.jokers.cards do
						if G.jokers.cards[i] == card then chosen_joker = G.jokers.cards[i] end
					end
					local _card = copy_card(chosen_joker, nil, nil, nil, false)
					_card:add_to_deck()
					G.jokers:emplace(_card)
					_card:start_materialize()
					G.GAME.joker_buffer = 0
					return true
				end
			}))
		end
    end
}