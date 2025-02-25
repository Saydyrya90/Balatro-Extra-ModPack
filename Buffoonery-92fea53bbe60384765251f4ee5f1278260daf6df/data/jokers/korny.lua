SMODS.Joker {
    key = "korny",
    name = "Korny Joker",
    atlas = 'buf_jokers',
    pos = {
        x = 1,
        y = 0,
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
	no_pool_flag = 'korny_dead',
    config = {
        extra = { 
		chips = 60,
		bgchips = 100, 
		bschips = 180,
		odds = 8 
		},
		numetal = true
    },
    loc_txt = {set = 'Joker', key = 'j_buf_korny'},
    loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'korny_info'}   --Credit original artwork author [Snakey] (adapted by me for balatro)
		end
        return {
            vars = {card.ability.extra.chips, 
					card.ability.extra.bgchips,
					card.ability.extra.bschips,
					G.GAME.probabilities.normal,
					card.ability.extra.odds
					}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
			if G.GAME.blind:get_type() == 'Small' then
				return {
					chips = card.ability.extra.chips
				}
			end
			if G.GAME.blind:get_type() == 'Big' then
				return {
					chips = card.ability.extra.bgchips
				}
			end
			if G.GAME.blind:get_type() == 'Boss' then
				return {
					chips = card.ability.extra.bschips
				}
			end
		end
		if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
			local rand_min = 2
            if pseudorandom("korny") < G.GAME.probabilities.normal/math.random(rand_min, card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3,0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                                    func = function()
                                                        G.jokers:remove_card(card)
                                                        card:remove()
                                                        card = nil
                                                        return true; end }))
                        return true
                    end
                }))
				G.GAME.pool_flags.korny_dead = true
                return {
                    message = localize("buf_korny_dd"),
                    colour = G.C.RED,
                    card = card
                }
            else
                return {
                    message = localize("buf_korny_ok"),
                    colour = G.C.GREEN,
                    card = card
                }
            end
        end
    end
}