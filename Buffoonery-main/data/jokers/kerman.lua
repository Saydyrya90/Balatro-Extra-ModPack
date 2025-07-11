SMODS.Joker {
    key = "kerman",
    name = "Jebediah Kerman",
    atlas = 'kermanatlas',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = {
		    mult = 0, gain = 8, odds = 6,
		    pos_override = { x = 0, y = 0 } -- default like normal pos
		},
    },
	sprite = {
		['Default'] = 0,
		['Mercury'] = 1,
		['Venus'] = 2,
		['Earth'] =3,
		['Mars'] = 4,
		['Jupiter'] = 5,
		['Saturn'] = 6,
		['Uranus'] = 7,
		['Neptune'] = 8,
		['Pluto'] = 9,
		['Planet X'] = 10,
		['Ceres'] = 11,
		['Eris'] = 12,
	},
    loc_txt = {set = 'Joker', key = 'j_buf_kerman'},
    loc_vars = function(card, info_queue, card)
        return {
            vars = {card.ability.extra.mult, card.ability.extra.gain, card.ability.extra.odds, (G.GAME.probabilities.normal or 1)}
        }
    end,
	-------- THANKS, FLOWIRE! --------
	load = function(self, card, card_table, other_card)
		G.E_MANAGER:add_event(Event({
			func = function()
				card.children.center:set_sprite_pos(card.ability.extra.pos_override)
				return true
			end
		}))
	end,
    calculate = function(card, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.using_consumeable and not context.blueprint and (context.consumeable.ability.set == 'Planet' or context.consumeable.ability.name == 'Black Hole') then      
			if pseudorandom("kerman") < G.GAME.probabilities.normal/card.ability.extra.odds or context.consumeable.ability.name == 'Black Hole' then
				local bhole = false
				G.E_MANAGER:add_event(Event({
                    func = function()
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
						if context.consumeable.ability.set == 'Planet' then
							SMODS.calculate_effect({message = localize('buf_blowup'), colour = G.C.FILTER}, card)  -- This card is supposed to EMBODY THE FULL KERBAL EXPERIENCE
							play_sound('buf_explosion')
						else
							SMODS.calculate_effect({message = localize('buf_prism_eor1'), colour = G.C.BUF_SPC}, card)
							bhole = true
						end
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
									if bhole then SMODS.add_card({key = 'j_buf_kerman_spc'}) end
                                    return true; end})) 
                        return true
                    end
                }))
				G.GAME.pool_flags.kermans_mult = card.ability.extra.mult -- This mult is carried over to Jebediah Reborn and reset every run
			else
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
				G.E_MANAGER:add_event(Event({
					func = function()
					G.E_MANAGER:add_event(Event({
						func = function()
						card:juice_up(1, 0.5)
						card.ability.extra.pos_override.x = card.config.center.sprite[context.consumeable.ability.name] or card.config.center.sprite['Default'] -- Keep sprite individual
						card.children.center:set_sprite_pos(card.ability.extra.pos_override) -- Keep sprite individual
					return true end})) 
					SMODS.calculate_effect({message = localize('k_upgrade_ex'), colour = G.C.MULT}, card)
					return true
					end}))
				return
			end
        end
    end
}