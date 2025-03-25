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
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
	no_pool_flag = 'gfondue_licked',
    config = {
        extra = { gold = 8, gold_loss = 2, },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_gfondue'},
    loc_vars = function(self, info_queue, card)
		return {
			vars = {card.ability.extra.gold, card.ability.extra.gold_loss}
		}
    end,
	
    calculate = function(self, card, context)
		if context.first_hand_drawn then
			local eval = function() return G.GAME.current_round.hands_played == 0 end
			juice_card_until(card, eval, true)
		end
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
					expire_card(card, localize('buf_gfondue_licked'), G.C.FILTER) -- custom function (see Buffoonery.lua)
					G.GAME.pool_flags.gfondue_licked = true
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