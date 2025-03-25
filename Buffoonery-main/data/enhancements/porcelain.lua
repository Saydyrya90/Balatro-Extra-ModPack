SMODS.Enhancement {  -- Porcelain Cards
	key = "porcelain",
	atlas = "buf_enhancements",
	pos = {x=0, y = 0},
	
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	
	config = {extra = {Xchips = 1.75, limit = 3, played = 0, marked = false}},
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.Xchips, card.ability.extra.limit}
        }
    end,
	
	calculate = function(self, card, context, ret)
		if context.before and card.area == G.hand then  -- This code block makes sure the card is not marked while in hand,
			card.ability.extra.marked = false			-- useful for when the card is detroyed and copied with Extra Credit's
		end												-- Ship of Theseus, for example.
		
		if context.cardarea == G.play and context.main_scoring then
			card.ability.extra.played = #context.full_hand
			if card.ability.extra.played > card.ability.extra.limit and card.area == G.play then -- the 'card.area' part makes sure the card is only marked if it's in the scoring cards area
				card.ability.extra.marked = true
			end
			return {
				xchips = card.ability.extra.Xchips
			}
		end
		
		if context.final_scoring_step and card.ability.extra.marked then
			G.E_MANAGER:add_event(Event({
				trigger = 'immediate',
				func = function()
					card:shatter()
					return true 
				end 
			}))
		end
		
		if context.destroying_card and card.ability.extra.marked then
			return {
				remove = true
			}
		end
	end
}