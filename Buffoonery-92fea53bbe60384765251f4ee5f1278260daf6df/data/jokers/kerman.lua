SMODS.Joker {
    key = "kerman",
    name = "Jebediah Kerman",
    atlas = 'buf_jokers',
    pos = {
        x = 3,
        y = 1,
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
	no_pool_flag = 'kerman_went_boom',
    config = {
        extra = { mult = 0, gain = 8, odds = 6 },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_kerman'},
    loc_vars = function(card, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.gain, card.ability.extra.odds, (G.GAME.probabilities.normal or 1)}
        }
    end,
    calculate = function(card, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then      
			if pseudorandom("kerman") < G.GAME.probabilities.normal/card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
                    func = function()
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
						SMODS.calculate_effect({message = localize('buf_blowup'), colour = G.C.FILTER}, card)  -- This card is supposed to EMBODY THE FULL KERBAL EXPERIENCE
                        play_sound('buf_explosion')
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                    return true; end})) 
                        return true
                    end
                }))
				G.GAME.pool_flags.kerman_went_boom = true
			else
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
				G.E_MANAGER:add_event(Event({
					func = function() SMODS.calculate_effect({message = localize('k_upgrade_ex'), colour = G.C.MULT}, card); return true
					end}))
				return
			end
        end
    end
}

--DONE