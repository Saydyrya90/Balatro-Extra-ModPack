SMODS.Joker {
    key = "dxmemcard",
    name = "Deluxe Memory Card",
    atlas = 'buf_special',
    pos = {
        x = 0,
        y = 0,
    },
    rarity = 'buf_spc',
    cost = 8,
    unlocked = false,
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = false,
	in_pool = false,
    config = {
		mcount = 0,
		tsuit = "-",
		trank = "-",
		extra = { bases = {}, abils = {}, edits = {}, seals = {}, params = {} }
    },
    loc_txt = {set = 'Joker', key = 'j_buf_memcard'},
	loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'special_info'}
		end
        return {
            vars = {
					card.ability.mcount,
					card.ability.tsuit, 
					card.ability.trank
			}
        }
    end,
	set_ability = function(self, card, initial, delay_sprites)
            local W = card.T.w
			local H = card.T.h
            local scale = 1
            card.children.center.scale.y = 1.174*card.children.center.scale.x
            card.T.h = H*scale/1.174*scale
            card.T.w = W*scale
    end,
    calculate = function(self, card, context)
		-- MEMORIZE FIRST SCORING CARD EACH HAND
		if context.before and not context.blueprint then
			if card.ability.mcount < 16 then  --limits to 16 cards memorized
				card.ability.mcount = card.ability.mcount + 1 
				card.ability.extra.bases[card.ability.mcount] = context.scoring_hand[1].config.card  -- [UPDATE]:changed from local variable to table value, in order to store card edition and/or enhancement.
				card.ability.extra.abils[card.ability.mcount] = context.scoring_hand[1].config.center
				card.ability.extra.edits[card.ability.mcount] = context.scoring_hand[1].edition
				card.ability.extra.seals[card.ability.mcount] = context.scoring_hand[1].seal
				if context.scoring_hand[1].params then
					card.ability.extra.params[card.ability.mcount] = context.scoring_hand[1].params
				end
				local _card = context.scoring_hand[1]
				local underscore_pos = string.find(SMODS.Suits[_card.base.suit].key, "_")  -- Checks for mod prefixes in suit keys and removes them from printed string
				if underscore_pos then
					card.ability.tsuit = localize('buf_'..string.sub(SMODS.Suits[_card.base.suit].key, underscore_pos + 1))
				else
					card.ability.tsuit =  localize('buf_'..SMODS.Suits[_card.base.suit].key)  -- [UPDATE] Now uses SMODS functionality to improve mod compatibility
				end
				local key = SMODS.Ranks[_card.base.value].key
				local tkey = localize('buf_'..key)
				card.ability.trank =  ((tkey ~= 'ERROR' and tkey) or key) .. localize('buf_of')
				local underscore_pos2 = string.find(card.ability.trank, "_")
				if underscore_pos2 then
					local langkey = 'buf_'..string.sub(((tkey ~= 'ERROR' and tkey) or key), underscore_pos2 + 1)
					if langkey == 'buf_0.5' then langkey = 'buf_half' end
					card.ability.trank = localize(langkey) .. localize('buf_of')
				end
				return {
					message = localize('buf_memory'),
					colour = G.C.GREEN 
				}
			elseif card.ability.mcount >= 8 then
				return {
					message = localize('buf_memfull'),
					colour = G.C.RED
				}
			end
		end
		
		-- CONVERT INTO MEMORIZED CARDS WHEN SELLING
		if context.selling_self and #G.hand.cards ~= 0 and not context.blueprint then
			local j = math.min((card.ability.mcount), #G.hand.cards) -- prevents getting a nil value for suit[i] and rank[i]
			if j > 0 then
				for i = 1, j do
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
						local hcard = G.hand.cards[i]
						hcard:set_base(card.ability.extra.bases[i]) -- copy_card wasn't working
						hcard:set_ability(card.ability.extra.abils[i])
						-- for k, v in pairs(card.ability.extra.abils[i]) do  -- I can't remember why tf I made this part, but this was crashing the game with modded enchancements
							-- if type(v) == 'table' then 
								-- hcard.ability[k] = copy_table(v)
							-- else
								-- hcard.ability[k] = v
							-- end
						-- end
						hcard:set_edition(card.ability.extra.edits[i] or {}, nil, true)
						hcard:set_seal(card.ability.extra.seals[i], true)
						hcard.params = card.ability.extra.params[i]
						hcard.params.playing_card = playing_card
						-- local mcard = card.ability.extra.cards[i]
						-- copy_card(mcard, hcard)
						G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);G.hand.cards[i]:flip(); -- Animation stuff
						return true 
					end }))
				end
			else
				return true
			end
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