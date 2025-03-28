SMODS.Joker {
    key = "jokergebra",
    name = "JokerGebra",
    atlas = 'buf_jokers',
    pos = {
        x = 5,
        y = 0,
    },
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    config = {
        extra = { check = true, mult_amount = 0, mult_joker = nil, spc_count = 0, spc_check = true },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_interpreter'},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {( 5 - card.ability.extra.spc_count )}
		}
    end,
	
    calculate = function(self, card, context)  -- BEWARE: JANKY ASS CODE BELOW
		local function moddedCalcIndiv(effect, scored_card, key, amount, from_edition)  -- Hooked this func to get the amount of mult provided by the scoring joker
			origCalcIndiv(effect, scored_card, key, amount, from_edition)
			if scored_card == card.ability.extra.mult_joker then  -- prevents playing cards from interfering, eg. Mult cards
				if (key == 'mult' or key == 'h_mult' or key == 'mult_mod') and amount then
					if from_edition then  -- if the scored joker has an edition that adds mult, add the amount to calculation
						card.ability.extra.mult_amount = amount * 5
					elseif card.ability.extra.check and card.ability.extra.mult_amount ~= nil then
						card.ability.extra.mult_amount = (card.ability.extra.mult_amount) + amount * 5
						card.ability.extra.spc_count = 0
						card.ability.extra.check = false
					end
				elseif (key == 'x_mult' or key == 'xmult' or key == 'Xmult' or key == 'x_mult_mod' or key == 'Xmult_mod') and amount ~= 1 then
					if card.ability.extra.spc_check then 
						card.ability.extra.spc_count = card.ability.extra.spc_count + 1 
						card.ability.extra.spc_check = false
					end
				end
			end
		end
	
        if context.before and not card.getting_sliced then  -- switch to modified scoring func before scoring
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then card.ability.extra.mult_joker = G.jokers.cards[i-1] end
			end
			if not context.blueprint then
				SMODS.calculate_individual_effect = moddedCalcIndiv
			end
		end
		
		if context.setting_blind then
			card.ability.extra.spc_check = true
		end
		
		if context.joker_main and not card.getting_sliced then
			if buf.compat.talisman then
				card.ability.extra.mult_amount = to_number(card.ability.extra.mult_amount)
			end
			return {
				chips = card.ability.extra.mult_amount
			}
        end
		
		if context.after and not context.blueprint then  -- go back to original func at EoR
			SMODS.calculate_individual_effect = origCalcIndiv
			card.ability.extra.check = true
			card.ability.extra.mult_amount = 0
			card.ability.extra.mult_joker = nil
			if card.ability.extra.spc_count >= 5 then
				G.E_MANAGER:add_event(
				Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						SMODS.calculate_effect({message = localize('k_upgrade_ex'), colour = G.C.BUF_SPC}, card)
						G.E_MANAGER:add_event(
							Event({
								trigger = "after",
								delay = 0.2,
								func = function()
									SMODS.add_card({key = 'j_buf_integral'})
									card:start_dissolve()
									return true
								end}))
						return true
					end }))	
			end
		end
    end,
	remove_from_deck = function(self,card,context)
		SMODS.calculate_individual_effect = origCalcIndiv -- Revert to original behavior if the card is removed
	end
}