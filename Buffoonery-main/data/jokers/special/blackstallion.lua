SMODS.Joker {
    key = "blackstallion",
    name = "Black Stallion",
    atlas = 'buf_special',
    pos = {
        x = 1,
        y = 0,
    },
    rarity = "buf_spc",
    cost = 6,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
	in_pool = false,
    config = {
        extra = { mult = 1, mult_gain = 2 },
		numetal = true
    },
    loc_txt = {set = 'Joker', key = 'j_buf_blackstallion'},
    loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'special_info'}
		end
        return {
            vars = {card.ability.extra.mult, card.ability.extra.mult_gain}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.other_card and G.GAME.blind.boss then
            card.ability.extra.mult = card.ability.extra.mult * card.ability.extra.mult_gain
            return {
                message = localize('buf_doubled'),
                colour = G.C.MULT,
                card = card
            }
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

--DONE