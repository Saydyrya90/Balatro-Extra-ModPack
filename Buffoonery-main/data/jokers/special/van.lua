SMODS.Joker {
    key = "van",
    name = "Van",
    atlas = 'buf_special',
    pos = {
        x = 6,
        y = 0,
    },
    rarity = 'buf_spc',
    cost = 6,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = { chip_mod = 30, jokers = 0, chips = 15, check = false, init = 0 },
		numetal = true
    },
    loc_txt = {set = 'Joker', key = 'j_buf_clown'},
    loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'special_info'}
		end
		if card.area == G.jokers then
            return {
				key = self.key .. '_alt', 
				vars = { card.ability.extra.chip_mod, card.ability.extra.chips }
			}
		else
			return {
				vars = {}
			}
		end
    end,
	add_to_deck = function(self, card, context)
		SMODS.calculate_effect({message = localize('buf_hopin'), colour = G.C.BUF_SPC}, card)
	end,
    calculate = function(self, card, context)
	
		if context.cardarea == G.jokers then
			card.ability.extra.check = true
		else
			card.ability.extra.check = false
		end
		
		if context.selling_self or card.getting_sliced then
			van_count = 0
		end
		
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
		
	end,
	
	update = function(self, card, dt)
		if card.ability.extra.jokers < van_count and card.ability.extra.check then
			SMODS.calculate_effect({message = localize('k_upgrade_ex'), colour = G.C.BLUE}, card)
			card.ability.extra.jokers = van_count -- check continue run error txt
			card.ability.extra.chips = card.ability.extra.init + (card.ability.extra.chip_mod * card.ability.extra.jokers)
		elseif card.ability.extra.jokers == van_count and van_count == 0 and card.ability.extra.check then
			card.ability.extra.chips = card.ability.extra.init 
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