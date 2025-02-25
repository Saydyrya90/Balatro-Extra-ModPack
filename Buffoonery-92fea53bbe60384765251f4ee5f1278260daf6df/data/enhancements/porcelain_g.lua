local card_isfaceref = Card.is_face

function Card:is_face(from_boss)
    if self.debuff and not from_boss then return end
	
	if self.config.center == G.P_CENTERS.m_buf_porcelain_g then
		return true
	end
	
	return card_isfaceref(self, from_boss)
end

SMODS.Enhancement {  -- Royal Porcelain Cards
	key = "porcelain_g",
	atlas = "buf_enhancements",
	pos = {x = 1, y = 0},
	
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	in_pool = function(self)
		return false
    end,
	
	config = {extra = {Xchips = 2, limit = 3, played = 0, marked = false}},
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.Xchips, card.ability.extra.limit}
        }
    end,
	
	calculate = function(self, card, context, ret)
		if context.cardarea == G.play and context.main_scoring then
			card.ability.extra.played = #context.full_hand
			if card.ability.extra.played > card.ability.extra.limit then
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
	end,
	
	inject = function(self)
		if not Buffoonery.config.show_spc then
			SMODS.Joker.super.inject(self)
			G.P_CENTER_POOLS.Enhanced[#G.P_CENTER_POOLS.Enhanced] = nil
		else
			SMODS.Enhancement.super.inject(self)
		end
	end
}