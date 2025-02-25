SMODS.Joker {
    key = "gfondue",
    name = "Gold Fondue",
    atlas = 'buf_jokers',
    pos = {
        x = 4,
        y = 2,
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
	no_pool_flag = 'gfondue_licked',
    config = {
        extra = { gold = 9, gold_loss = 3, },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_whitepony'},
    loc_vars = function(self, info_queue, card)
		return {
			vars = {card.ability.extra.gold, card.ability.extra.gold_loss}
		}
    end,
	
    calculate = function(self, card, context)
		if G.GAME.current_round.hands_played == 0 then
			if context.before then
				return {
					dollars = card.ability.extra.gold,
					card = card
				}
			end
			if context.after and not context.blueprint then
				card.ability.extra.gold = card.ability.extra.gold - card.ability.extra.gold_loss
				if card.ability.extra.gold <= 0 then
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
						G.GAME.pool_flags.gfondue_licked = true
						return {
							message = localize('buf_gfondue_licked'),
							colour = G.C.FILTER
						}
				else
					return {
						message = "-"..localize('$')..card.ability.extra.gold_loss,
						colour = G.C.MONEY
					}
				end
			end
		end
    end,
}