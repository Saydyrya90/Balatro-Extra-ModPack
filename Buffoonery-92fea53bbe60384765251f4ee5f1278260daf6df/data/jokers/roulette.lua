SMODS.Joker {
    key = "roulette",
    name = "Russian Roulette",
    atlas = 'rouletteatlas',
    pos = {
        x = 0,
        y = 0,
    },
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    config = {
        extra = {money = 30, odds = 6} 
    },
    loc_txt = {set = 'Joker', key = 'j_buf_roulette'},
	loc_vars = function(self, info_queue, card)
		return { 
			vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds}
		}
	end,

    calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			should_jiggle = false
			if pseudorandom('roulette') < G.GAME.probabilities.normal / card.ability.extra.odds then
				card:juice_up(0.8, 0.5)
				SMODS.calculate_effect({message = localize('buf_ydead'), colour = G.C.RED}, card)
				play_sound('buf_roul2', 0.96+math.random()*0.08, 0.7)
				card.config.center.pos.x = 1
				card.ability.extra.odds = math.max(card.ability.extra.odds - 1, 1)
				G.E_MANAGER:add_event(  -- Thanks WilsontheWolf for the help! (and code!)
					Event({
						trigger = "after",
						delay = 0.2,
						func = function()
							card.config.center.pos.x = 0
							if G.STATE ~= G.STATES.SELECTING_HAND then
								return false
							end
							G.STATE = G.STATES.HAND_PLAYED
							G.STATE_COMPLETE = true
							end_round()
							return true
						end,
					}),
					"other"
				)
			else
				if card.ability.extra.odds == 2 then -- when chance is 1/2, create a Legendary Joker
					card.ability.extra.odds = math.max(card.ability.extra.odds - 1, 1)
					play_sound('buf_roul1', 0.96+math.random()*0.08)
					local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
					G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
					G.E_MANAGER:add_event(Event({
						func = function() 
							for i = 1, jokers_to_create do
								local card = create_card('Joker', G.jokers, true, nil, nil, nil, nil, 'rou') -- the 'true' here refers to the 'legendary' boolean of the create_card() function
								card:add_to_deck()
								G.jokers:emplace(card)
								card:start_materialize()
								G.GAME.joker_buffer = 0
							end
							return true
						end}))   
					SMODS.calculate_effect({message = localize('k_plus_joker'), colour = G.C.BLUE}, card)
				else
					card:juice_up(0.8, 0.5)
					SMODS.calculate_effect({message = localize('buf_dry'), colour = G.C.GREEN}, card)
					play_sound('buf_roul1', 0.96+math.random()*0.08)
					delay(0.8)
					ease_dollars(30)
					card.ability.extra.odds = math.max(card.ability.extra.odds - 1, 1)
				end
			end
		end
	end
}