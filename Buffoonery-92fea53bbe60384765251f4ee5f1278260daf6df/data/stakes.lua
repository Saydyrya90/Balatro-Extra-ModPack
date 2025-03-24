SMODS.Stake{ -- Palladium Stake
    key = 'palladium',
    applied_stakes = {'gold'},
    above_stake = 'gold',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
		function buf_get_new_boss()
			G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {
			}
			if G.GAME.perscribed_bosses and G.GAME.perscribed_bosses[G.GAME.round_resets.ante] then 
				local ret_boss = G.GAME.perscribed_bosses[G.GAME.round_resets.ante] 
				G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = nil
				G.GAME.bosses_used[ret_boss] = G.GAME.bosses_used[ret_boss] + 1
				return ret_boss
			end
			if G.FORCE_BOSS then return G.FORCE_BOSS end
			
			local eligible_bosses = {}
			local win_ante = G.GAME.win_ante
			local win_half = math.ceil(win_ante / 2)  -- Step size
			local first_showdown = math.floor(win_ante / 2)  -- First showdown ante in each loop
			local loop_ante = (G.GAME.round_resets.ante - 1) % win_ante + 1  -- Resets every win_ante

			for k, v in pairs(G.P_BLINDS) do
				if not v.boss then
				elseif not v.boss.showdown and (
					v.boss.min <= loop_ante and
					(loop_ante % win_half ~= first_showdown % win_half or loop_ante < 2)
				) then
					eligible_bosses[k] = true
				elseif v.boss.showdown and loop_ante % win_half == first_showdown % win_half and loop_ante >= 2 then
					eligible_bosses[k] = true
				end
			end
			for k, v in pairs(G.GAME.banned_keys) do
				if eligible_bosses[k] then eligible_bosses[k] = nil end
			end

			local min_use = 100
			for k, v in pairs(G.GAME.bosses_used) do
				if eligible_bosses[k] then
					eligible_bosses[k] = v
					if eligible_bosses[k] <= min_use then 
						min_use = eligible_bosses[k]
					end
				end
			end
			for k, v in pairs(eligible_bosses) do
				if eligible_bosses[k] then
					if eligible_bosses[k] > min_use then 
						eligible_bosses[k] = nil
					end
				end
			end
			local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
			G.GAME.bosses_used[boss] = G.GAME.bosses_used[boss] + 1
			
			return boss
		end
		
		get_new_boss = buf_get_new_boss
    end,

    colour = HEX('b0a190'),
	shader = 'shine',
    pos = {x = 0, y = 0},
    sticker_pos = {x = 0, y = 0},
    atlas = 'buf_stakes',
    sticker_atlas = 'buf_stickers',
	shiny = true
}

SMODS.Stake{ -- Spinel Stake
    key = 'spinel',
    applied_stakes = {'buf_palladium'},
    above_stake = 'buf_palladium',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
		G.GAME.win_ante = G.GAME.win_ante * 1.5
    end,

    colour = HEX('e1345d'),
	shader = 'shine',
    pos = {x = 1, y = 0},
    sticker_pos = {x = 1, y = 0},
    atlas = 'buf_stakes',
    sticker_atlas = 'buf_stickers',
	shiny = true
}