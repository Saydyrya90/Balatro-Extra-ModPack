SMODS.Joker {
    key = "dorkshire_g",
    name = "Dorkshire Gold",
    atlas = 'buf_special',
    pos = {
        x = 2,
        y = 0,
    },
    rarity = 'buf_spc',
    cost = 7,
    unlocked = false,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    loc_txt = {set = 'Joker', key = 'j_buf_dorkshire_g'},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'porcg_info'}
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'special_info'}
		end
		if buf.compat.unstable then
            return {
				key = self.key .. '_alt', 
			}
		end 
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_name == "Three of a Kind" and not context.blueprint then
			local tcards = {}
			local check = false
			for k, v in ipairs(context.scoring_hand) do
				if v:get_id() == 2 or v:get_id() == 3 or v:get_id() == 10 or 
				SMODS.Ranks[v.base.value].key == 'unstb_12' or SMODS.Ranks[v.base.value].key == 'unstb_13' or
				SMODS.Ranks[v.base.value].key == 'unstb_21' or SMODS.Ranks[v.base.value].key == 'unstb_25' then 
					check = true
					tcards[#tcards+1] = v
					v:set_ability(G.P_CENTERS.m_buf_porcelain_g, nil, true)
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end
					})) 
				end
			end
			if check then SMODS.calculate_effect({message = localize('buf_tea'), colour = G.C.GREEN}, card) end
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
