local jd = JokerDisplay.Definitions

--UnStable's Joker

--[[jd["j_unstb_lunar_calendar"] = {
	text = {
		{ text = "+" },
		{ ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
	},
	text_config = { colour = G.C.SECONDARY_SET.Planet },
	reminder_text = {
		{ text = "(" },
		{ ref_table = "card.joker_display_values", ref_value = "lunar_suit"},
		{ text = ")" }
	},
	extra = {
		{
			{ text = "(" },
			{ ref_table = "card.joker_display_values", ref_value = "odds" },
			{ text = ")" },
		}
	},
	extra_config = { colour = G.C.GREEN, scale = 0.3 },
	calc_function = function(card)
		local count = 0
		local text, _, scoring_hand = JokerDisplay.evaluate_hand()
		if text ~= 'Unknown' then
			for _, scoring_card in pairs(scoring_hand) do
				if scoring_card:get_id() and scoring_card:is_suit(card.ability.extra.suit) then
					count = count +
						JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
				end
			end
		end
		card.joker_display_values.count = count
		card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds_spawn } }
		card.joker_display_values.lunar_suit = localize(card.ability.extra.suit, 'suits_plural')
	end,
	style_function = function(card, text, reminder_text, extra)
		if reminder_text and reminder_text.children[2] then
			reminder_text.children[2].config.colour = lighten(G.C.SUITS[card.ability.extra.suit], 0.35)
		end
		return false
	end
}

jd["j_unstb_dragon_hoard"] = {
	text = {
		{ text = "+" },
		{ ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
	},
	text_config = { colour = G.C.MULT },
	calc_function = function(card)
		card.joker_display_values.mult = (G.consumeables and card.ability.extra.mult_rate * math.floor(#G.consumeables.cards/card.ability.extra.held_amount))or 0
	end
}

jd["j_unstb_card_dealer"] = {
	text = {
		{ text = "+" },
		{ ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
	},
	text_config = { colour = G.C.CHIPS },
}

jd["j_unstb_match_three"] = {
	text = {
		{ text = "+" },
		{ ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
	},
	text_config = { colour = G.C.MULT },
	calc_function = function(card)
		local count = 0
		local text, _, scoring_hand = JokerDisplay.evaluate_hand()
		if text ~= 'Unknown' then
			--TODO: Check for suits in the adjacent card
			for _, scoring_card in pairs(scoring_hand) do
				if scoring_card:get_id() and scoring_card:is_suit(card.ability.extra.suit) then
					count = count +
						JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
				end
			end
		end
	
		card.joker_display_values.mult = count
	end
}]]


--Vanilla Override Jokers
if unstb_global.config.joker.vanilla then

jd["j_fibonacci"].calc_function = function(card)
		local mult = 0
		local text, _, scoring_hand = JokerDisplay.evaluate_hand()
		if text ~= 'Unknown' then
			for _, scoring_card in pairs(scoring_hand) do
				if not scoring_card.config.center.no_rank and (unstb_global.fibo[scoring_card.base.nominal] or scoring_card.base.value == 'Ace') then
					mult = mult +
						card.ability.extra.mult *
						JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
				end
			end
		end
		card.joker_display_values.mult = mult
		
		if getPoolRankFlagEnable('unstb_0') or getPoolRankFlagEnable('unstb_1') or getPoolRankFlagEnable('unstb_13') or getPoolRankFlagEnable('unstb_21') then
			card.joker_display_values.localized_text = "(0,1," .. localize("Ace", "ranks") .. ",2,3,5,8,13,21)"
		else
			card.joker_display_values.localized_text = "(" .. localize("Ace", "ranks") .. ",2,3,5,8)"
		end
		
		
	end
	
jd["j_even_steven"].reminder_text = {
		{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
}
jd["j_even_steven"].calc_function = function(card)
		local mult = 0
		local text, _, scoring_hand = JokerDisplay.evaluate_hand()
		if text ~= 'Unknown' then
			for _, scoring_card in pairs(scoring_hand) do
				if unstb_global.modulo_check(scoring_card, 2, 0) then
					mult = mult +
						card.ability.extra.mult *
						JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
				end
			end
		end
		card.joker_display_values.mult = mult
		
		if getPoolRankFlagEnable('unstb_0') or getPoolRankFlagEnable('unstb_12') then
			card.joker_display_values.localized_text = "(12,10,8,6,4,2,0)"
		else
			card.joker_display_values.localized_text = "(10,8,6,4,2)"
		end
end	

jd["j_odd_todd"].reminder_text = {
		{ ref_table = "card.joker_display_values", ref_value = "localized_text" },
}
jd["j_odd_todd"].calc_function = function(card)
		local chips = 0
		local text, _, scoring_hand = JokerDisplay.evaluate_hand()
		if text ~= 'Unknown' then
			for _, scoring_card in pairs(scoring_hand) do
				if unstb_global.modulo_check(scoring_card, 2, 1) then
					chips = chips +
						card.ability.extra.chips *
						JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
				end
			end
		end
		card.joker_display_values.chips = chips
		
		if getPoolRankFlagEnable('unstb_1') or getPoolRankFlagEnable('unstb_11') or getPoolRankFlagEnable('unstb_13') or getPoolRankFlagEnable('unstb_21') or getPoolRankFlagEnable('unstb_25') or getPoolRankFlagEnable('unstb_161')then
			card.joker_display_values.localized_text = "(161,25,21,13,11," .. localize("Ace", "ranks") .. ",9,7,5,3,1)"
		else
			card.joker_display_values.localized_text = "(" .. localize("Ace", "ranks") .. ",9,7,5,3)"
		end
end	

--Completely redefine Hack
jd["j_hack"] = {
	reminder_text = {
		{ ref_table = "card.joker_display_values", ref_value = "eligible_ranks" },
	},
	calc_function = function(card)
		if getPoolRankFlagEnable('unstb_0') or getPoolRankFlagEnable('unstb_1') then
			card.joker_display_values.eligible_ranks = "(0,1,2,3,4,5)"
		else
			card.joker_display_values.eligible_ranks = "(2,3,4,5)"
		end
	end,
	retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
		if held_in_hand then return 0 end
		return (not playing_card.config.center.no_rank and unstb_global.hack[playing_card.base.value]) and
			joker_card.ability.extra * JokerDisplay.calculate_joker_triggers(joker_card) or 0
	end
}


jd["j_raised_fist"].calc_function = function(card)
            local temp_Mult, temp_Value = 999999, 999999
            local temp_card = nil
            local retriggers = 1
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].highlighted and not SMODS.has_no_rank(G.hand.cards[i]) and 
                    temp_Value >= SMODS.Ranks[G.hand.cards[i].base.value].sort_nominal then
                    retriggers = JokerDisplay.calculate_card_triggers(G.hand.cards[i], nil, true)
                    temp_Mult = G.hand.cards[i].base.nominal
                    temp_Value = SMODS.Ranks[G.hand.cards[i].base.value].sort_nominal
                    temp_card = G.hand.cards[i]
                end
            end
            if not temp_card or temp_card.debuff or temp_card.facing == 'back' then
                temp_Mult = 0
            end
            card.joker_display_values.mult = (temp_Mult < 999999 and temp_Mult * 2 * retriggers or 0)
        end

end