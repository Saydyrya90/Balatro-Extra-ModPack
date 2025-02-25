SMODS.Joker {
    key = "clown",
    name = "Clown",
    atlas = 'buf_jokers',
    pos = {
        x = 2,
        y = 2,
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = { chip_mod = 15, jokers = 0, chips = 15, check = false },
		numetal = true
    },
    loc_txt = {set = 'Joker', key = 'j_buf_clown'},
    loc_vars = function(self, info_queue, center)
        return {
            vars = { center.ability.extra.chip_mod, center.ability.extra.chips }
        }
    end,
    calculate = function(self, card, context)
	
		if context.cardarea == G.jokers then
			card.ability.extra.check = true
		else
			card.ability.extra.check = false
		end
		
		if context.selling_self or card.getting_sliced then
			clown_count = -1
		end
		
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
		
	end,
	
	update = function(self, card, dt)
		if card.ability.extra.jokers < clown_count and card.ability.extra.check then
			SMODS.calculate_effect({message = localize('k_upgrade_ex'), colour = G.C.BLUE}, card)
			card.ability.extra.jokers = clown_count
			card.ability.extra.chips = 20 + (card.ability.extra.chip_mod * card.ability.extra.jokers)
		end
    end,
}