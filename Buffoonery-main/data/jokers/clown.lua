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
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = { chip_mod = 15, jokers = 0, chips = 15, check = false, init = 15, otherc = false },
		numetal = true
    },
    loc_txt = {set = 'Joker', key = 'j_buf_clown'},
    loc_vars = function(self, info_queue, center)
        return {
            vars = { center.ability.extra.chip_mod, center.ability.extra.chips }
        }
    end,
	add_to_deck = function(self, card, context)
		local van = nil
		for i = 1, #G.jokers.cards do
			local _card = G.jokers.cards[i]
			if _card.config.center.key == 'j_buf_clown' then
				local init = _card.ability.extra.chips + 15
				_card.ability.extra.otherc = true
				card.ability.extra.otherc = true
				van = SMODS.add_card({key = 'j_buf_van'})
				van.ability.extra.init = init
				expire_card(_card)
				expire_card(card)-- custom function (see Buffoonery.lua)
				clown_count = -1 -- global variable difined in joker.toml (lovely patch)
				break
			elseif _card.config.center.key == 'j_buf_van' then
				_card.ability.extra.chip_mod = _card.ability.extra.chip_mod + 15
				expire_card(card)
				SMODS.calculate_effect({message = localize('buf_hopin'), colour = G.C.BUF_SPC}, card)
			end
		end
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
	
	update = function(self, card)
		if card.ability.extra.jokers < clown_count and card.ability.extra.check and not card.ability.extra.otherc then
			SMODS.calculate_effect({message = localize('k_upgrade_ex'), colour = G.C.BLUE}, card)
			card.ability.extra.jokers = clown_count -- check continue run error txt
			card.ability.extra.chips = card.ability.extra.init + (card.ability.extra.chip_mod * card.ability.extra.jokers)
		end
    end,
}