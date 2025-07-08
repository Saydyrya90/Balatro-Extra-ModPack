local unstb = SMODS.current_mod
local filesystem = NFS or love.filesystem
local path = unstb.path
local unstb_config = unstb.config

--Global Table
unstb_global = {}
unstb_global.config = unstb.config

-- Debug message
local function print(message)
    sendDebugMessage('[UnStable] - '..(tostring(message) or '???'))
end

print("Starting Unstable")

--Initialize All Colors
G.C.UNSTB_AUX = HEX('00a669')

--Localization Colors
--Properly hook into the function, so it does not error
local ref_loc_colour = loc_colour

function loc_colour(_c, default)
    if not G.ARGS.LOC_COLOURS then
        ref_loc_colour(_c, default)
    elseif not G.ARGS.LOC_COLOURS.unstb_colour then --Init UNSTB's exclusive color
		G.ARGS.LOC_COLOURS.unstb_colour = true
		
        G.ARGS.LOC_COLOURS['auxiliary'] = G.C.UNSTB_AUX 
    end

    return ref_loc_colour(_c, default)
end

--Description page formatting
unstb.description_loc_vars = function()
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end

--Config Stuff

function unstb.save_config(self)
    SMODS.save_mod_config(self)
end

local unstb_config_tab = function()
	return{
		{
		label = localize("unstb_config_header_mech_setting"),
		chosen = true,
		tab_definition_function = function()
		return {
			n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = {
				
					{n=G.UIT.R, config={align = "cm"}, nodes={
						
						{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unstb_config_requires_restart"), colour = G.C.RED, scale = 0.4}}}},
						}},
				
					{n=G.UIT.R, config={align = "cm"}, nodes={ --Base Box containing everything
		
					-- Left Side Column
					{n=G.UIT.C, config={align = "cl", padding = 0.2}, nodes={
						{n=G.UIT.R, config={align = "cl"}, nodes={
						
						{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unstb_config_header_rank"), colour = G.C.ORANGE, scale = 0.5}}}},
						create_toggle({label = localize("unstb_config_rank21"), ref_table = unstb.config.rank, ref_value = 'rank_21', callback = function() unstb:save_config() end}),
						create_toggle({label = localize("unstb_config_rank_bi"), ref_table = unstb.config.rank, ref_value = 'rank_binary', callback = function() unstb:save_config() end}),
						create_toggle({label = localize("unstb_config_rank_decimal"), ref_table = unstb.config.rank, ref_value = 'rank_decimal', callback = function() unstb:save_config() end}),
						
						}},
						
						{n=G.UIT.R, config={align = "cl"}, nodes={
						
						{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unstb_config_header_enh"), colour = G.C.ORANGE, scale = 0.5}}}},
						create_toggle({label = localize("unstb_config_enh_custom"), ref_table = unstb.config.enh, ref_value = 'enh_custom', callback = function() unstb:save_config() end}),
						create_toggle({label = localize("unstb_config_enh_disenh"), ref_table = unstb.config.enh, ref_value = 'enh_disenh', callback = function() unstb:save_config() end}),
						
						}}
					}}, 
					
					-- Right Side Column
					{n=G.UIT.C, config={align = "cl"}, nodes={
					
						{n=G.UIT.R, config={align = "cl"}, nodes={
						
						{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unstb_config_header_mechanics"), colour = G.C.ORANGE, scale = 0.5}}}},
						create_toggle({label = localize("unstb_config_mech_upgrade"), ref_table = unstb.config.gameplay, ref_value = 'edition_upgrade', callback = function() unstb:save_config() end}),
						create_toggle({label = localize("unstb_config_mech_suitseal"), ref_table = unstb.config.gameplay, ref_value = 'seal_suit', callback = function() unstb:save_config() end}),
						create_toggle({label = localize("unstb_config_mech_aux"), ref_table = unstb.config.gameplay, ref_value = 'c_aux', callback = function() unstb:save_config() end}),
						create_toggle({label = localize("unstb_config_mech_music"), ref_table = unstb.config.gameplay, ref_value = 'music', callback = function() unstb:save_config() end}),
						create_toggle({label = localize("unstb_config_mech_fallback"), info = localize("unstb_config_mech_fallback_desc"), ref_table = unstb.config.gameplay, ref_value = 'c_rebundant', callback = function() unstb:save_config() end}),
						create_toggle({label = localize("unstb_config_mech_new_spectral"), ref_table = unstb.config.gameplay, ref_value = 'new_spectrals', callback = function() unstb:save_config() end}),
						
						}},
					}}, 
				
				}}
				},
		}
		end
		},
		
		{ --Reserved Tab, in case the settings are expended in the future
		label = localize("unstb_config_header_joker_settings"),
		tab_definition_function = function()
		return {
			n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = {
				
					{n=G.UIT.R, config={align = "cm"}, nodes={
						
						{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = localize("unstb_config_requires_restart"), colour = G.C.RED, scale = 0.4}}}},
						}},
				
					{n=G.UIT.R, config={align = "cm"}, nodes={ --Base Box containing everything
					
					-- Right Side Column
					{n=G.UIT.C, config={align = "cl"}, nodes={
						
						{n=G.UIT.R, config={align = "cl"}, nodes={
						
						{n=G.UIT.R, config={align = "cm"}, nodes={{n = G.UIT.T, config = {text = "Joker", colour = G.C.ORANGE, scale = 0.5}}}},
						create_toggle({label = 'Vanilla Joker Overrides', info = {'Re-coded Vanilla Jokers to work with new features'}, ref_table = unstb.config.joker, ref_value = 'vanilla', callback = function() unstb:save_config() end}),
						create_toggle({label = 'Shitpost Jokers', ref_table = unstb.config.joker, ref_value = 'shitpost', callback = function() unstb:save_config() end}),
						create_toggle({label = 'Major Gameplay-Altering Jokers', info = {'Jokers that may alters the playstyle drastically'}, ref_table = unstb.config.joker, ref_value = 'alter', callback = function() unstb:save_config() end}),
						create_toggle({label = 'Powerful Jokers', info = {'Jokers that is significantly powerful than base game'}, ref_table = unstb.config.joker, ref_value = 'powerful', callback = function() unstb:save_config() end}),
						}}
					}}, 
				
				}}
				
				},
			
		
		}
		end
		}
	}
end

unstb.extra_tabs = unstb_config_tab

--Just so the gear icon shows up
unstb.config_tab = true

--Map config value with a single string keyword
local config_value = {
    ["rank_21"] = unstb_config.rank.rank_21,
    ["rank_binary"] = unstb_config.rank.rank_binary,
    ["rank_decimal"] = unstb_config.rank.rank_decimal,
    
    ["enh_custom"] = unstb_config.enh.enh_custom,
    ["enh_disenh"] = unstb_config.enh.enh_disenh,
    
    ["edition_upgrade"] = unstb_config.gameplay.edition_upgrade,
    ["seal_suit"] = unstb_config.gameplay.seal_suit,
    ["c_aux"] = unstb_config.gameplay.c_aux,
	["music"] = unstb_config.gameplay.music,
    ["c_rebundant"] = unstb_config.gameplay.c_rebundant,
    ["new_spectrals"] = unstb_config.gameplay.new_spectrals,
    
    ["j_vanilla"] = unstb_config.joker.vanilla,
    ["j_shitpost"] = unstb_config.joker.shitpost,
    ["j_alter"] = unstb_config.joker.alter,
    ["j_powerful"] = unstb_config.joker.powerful,
}

--Inclusion Check by a list of keyword
local function check_enable_taglist(taglist)
    local isAdded = true
    for _, v in ipairs(taglist) do
        isAdded = isAdded and config_value[v]
    end
    return isAdded
end

--Talisman Compatibility
to_big = to_big or function(num)
    return num
end

-- Index-based coordinates generation

local function get_coordinates(position, width)
    if width == nil then width = 10 end -- 10 is default for Jokers
    return {x = (position) % width, y = math.floor((position) / width)}
end

--Mod Icon
SMODS.Atlas {
  -- Key for code to find it with
  key = "modicon",
  -- The name of the file, for the code to pull the atlas from
  path = "modicon.png",
  -- Width of each sprite in 1x size
  px = 32,
  -- Height of each sprite in 1x size
  py = 32
}

--Creates an atlas for Jokers to use
SMODS.Atlas {
  -- Key for code to find it with
  key = "unstb_jokers",
  -- The name of the file, for the code to pull the atlas from
  path = "jokers.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for special Jokers (multi-face, dynamic graphic, etc)
SMODS.Atlas {
  -- Key for code to find it with
  key = "unstb_jokers_ex",
  -- The name of the file, for the code to pull the atlas from
  path = "jokers_ex.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "unstb_jokers_wip",
  -- The name of the file, for the code to pull the atlas from
  path = "jokers_wip.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for new enhancements

SMODS.Atlas {
  -- Key for code to find it with
  key = "unstb_back",
  -- The name of the file, for the code to pull the atlas from
  path = "back.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "enh_slop",
  -- The name of the file, for the code to pull the atlas from
  path = "enh_slop.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "enh_slop_hc",
  -- The name of the file, for the code to pull the atlas from
  path = "enh_slop_hc.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "enh_resource",
  -- The name of the file, for the code to pull the atlas from
  path = "enh_res.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for Suit Seals
SMODS.Atlas {
  -- Key for code to find it with
  key = "suit_seal",
  -- The name of the file, for the code to pull the atlas from
  path = "suit_seal.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for Booster Pack
SMODS.Atlas {
  -- Key for code to find it with
  key = "booster",
  -- The name of the file, for the code to pull the atlas from
  path = "booster.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for Auxiliary Cards

SMODS.Atlas {
  -- Key for code to find it with
  key = "auxiliary_undiscovered",
  -- The name of the file, for the code to pull the atlas from
  path = "auxiliary_undiscovered.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "auxiliary",
  -- The name of the file, for the code to pull the atlas from
  path = "auxiliary.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for Other Consumable Cards

--Tarot
SMODS.Atlas {
  -- Key for code to find it with
  key = "tarot",
  -- The name of the file, for the code to pull the atlas from
  path = "tarot.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}


--Spectral
SMODS.Atlas {
  -- Key for code to find it with
  key = "spectral",
  -- The name of the file, for the code to pull the atlas from
  path = "spectral.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for Vouchers
SMODS.Atlas {
  -- Key for code to find it with
  key = "voucher",
  -- The name of the file, for the code to pull the atlas from
  path = "voucher.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for Decks
SMODS.Atlas {
  -- Key for code to find it with
  key = "deck",
  -- The name of the file, for the code to pull the atlas from
  path = "deck.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

--Atlas for extra ranks
SMODS.Atlas {
  -- Key for code to find it with
  key = "rank_ex",
  -- The name of the file, for the code to pull the atlas from
  path = "rank_ex.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "rank_ex2",
  -- The name of the file, for the code to pull the atlas from
  path = "rank_ex2.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "rank_ex_hc",
  -- The name of the file, for the code to pull the atlas from
  path = "rank_ex_hc.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}

SMODS.Atlas {
  -- Key for code to find it with
  key = "rank_ex2_hc",
  -- The name of the file, for the code to pull the atlas from
  path = "rank_ex2_hc.png",
  -- Width of each sprite in 1x size
  px = 71,
  -- Height of each sprite in 1x size
  py = 95
}


--Music

local aux_music_enable = unstb_config.gameplay.music

SMODS.Sound({
	key = "music_aux",
	path = "music_aux.ogg",
	select_music_track = function()
		return aux_music_enable
			and ( G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Auxiliary")
	end,
})

--SFXs

SMODS.Sound({key = 'heal', path = 'heal.ogg'})
SMODS.Sound({key = 'poison', path = 'poison.ogg'})


--Jokers
--filesystem.load(unstb.path..'joker\\joker.lua')()

--Utility

--Check if table value already exists in the List
local function table_has_value(list, value)
	for i, v in ipairs(list) do
		if v==value then
			return true
		end
	end
	
	return false
end

--Expose this function so I can use this in global scope
unstb_global.table_has_value = table_has_value

--Auto event scheduler, based on Bunco
local function event(config)
    local e = Event(config)
    G.E_MANAGER:add_event(e)
    return e
end

local function big_juice(card)
    card:juice_up(0.7)
end

local function extra_juice(card)
    card:juice_up(0.6, 0.1)
end

local function play_nope_sound()
	--Copied from Wheel of Fortune lol
	event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
           play_sound('tarot2', 0.76, 0.4);return true end})
    play_sound('tarot2', 1, 0.4)
end

local function forced_message(message, card, color, delay, juice)
    if delay == true then
        delay = 0.7 * 1.25
    elseif delay == nil then
        delay = 0
    end

    event({trigger = 'before', delay = delay, func = function()

        if juice then big_juice(juice) end

        card_eval_status_text(
            card,
            'extra',
            nil, nil, nil,
            {message = message, colour = color, instant = true}
        )
        return true
    end})
end

--Joker creation wrapper, based on Bunco
local function create_joker(joker)

	--Check Joker's keyword tag, if the setting is turned off then don't add anything
	local isAdded = true
	if joker.gameplay_tag and type(joker.gameplay_tag) == 'table' then 
		for _, v in ipairs(joker.gameplay_tag) do
			isAdded = check_enable_taglist(joker.gameplay_tag) 
		end
	end
	if not isAdded then return end

    -- Sprite position

    local width = 10 -- Width of the spritesheet (in Jokers)

        -- Soul sprite

        if joker.rarity == 'Legendary' then
            joker.soul = get_coordinates(joker.id) -- Calculates coordinates based on the position variable
        end

    joker.position = get_coordinates(joker.id)

    -- Sprite atlas

    if joker.type == nil then
        joker.atlas = 'unstb_jokers'
    elseif joker.type == 'Banned' then
        joker.atlas = 'unstb_jokers_banned'
    end

    if joker.rarity == 'Legendary' then
        joker.atlas = 'unstb_jokers_legend'
    end
	
	--If the joker has ex property, used extra sheet
	if joker.ex_art then
		joker.atlas = 'unstb_jokers_ex'
	end
	
	--If the joker has no art, fallback to WIP sheet
	if joker.no_art then
		joker.atlas = 'unstb_jokers_wip'
	end

    -- Key generation from name

    local key = string.gsub(string.lower(joker.name), '%s', '_') -- Removes spaces and uppercase letters

    -- Rarity conversion

    if joker.rarity == 'Common' then
        joker.rarity = 1
    elseif joker.rarity == 'Uncommon' then
        joker.rarity = 2
    elseif joker.rarity == 'Rare' then
        joker.rarity = 3
    elseif joker.rarity == 'Legendary' then
        joker.rarity = 4
    end

    -- Config values

    if joker.vars == nil then joker.vars = {} end

    joker.config = {extra = {}}

    for _, kv_pair in ipairs(joker.vars) do
        -- kv_pair is {a = 1}
        local k, v = next(kv_pair)
        joker.config.extra[k] = v
    end

    -- Joker creation
	SMODS.Joker{
        name = joker.name,
        key = key,

        atlas = joker.atlas,
        pos = joker.position,
        soul_pos = joker.soul,
		
		display_size = joker.resize and { w = joker.resize.w, h = joker.resize.h },
		pixel_size = joker.resize and { w = joker.resize.w, h = joker.resize.h },

        rarity = joker.rarity,
        cost = joker.cost,

        unlocked = true,
        --check_for_unlock = joker.check_for_unlock,
        --unlock_condition = joker.unlock_condition,
        --discovered = true, --false,

        blueprint_compat = joker.blueprint or false,
        
		eternal_compat = (joker.eternal == nil) or joker.eternal,
		
		perishable_compat = (joker.perishable == nil) or joker.perishable,
        
        process_loc_text = joker.process_loc_text,

        config = joker.custom_config or joker.config,
        loc_vars = joker.custom_vars or function(self, info_queue, card)

            -- Localization values

            local vars = {}

            for _, kv_pair in ipairs(joker.vars) do
                -- kv_pair is {a = 1}
                local k, v = next(kv_pair)
                -- k is `a`, v is `1`
                table.insert(vars, card.ability.extra[k])
            end

            return {vars = vars}
        end,

        calculate = joker.calculate,
        update = joker.update,
        remove_from_deck = joker.remove_from_deck,
        add_to_deck = joker.add_to_deck,
		
        set_ability = joker.set_ability,
		set_sprites = joker.set_sprites,
		load = joker.load,
		
		calc_dollar_bonus = joker.calc_dollar_bonus,
		
        in_pool = joker.custom_in_pool or pool,

        effect = joker.effect
        }
end

--New global function to get a random eligible suit and rank from the deck without rank-overrides enhancements getting in the way
--Code based on Castle from base game
function get_valid_card_from_deck(seed)
    
	local res_suit = 'Spades'
	local res_rank = '2'
	
    local valid_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not v.config.center.replace_base_card  then --Excludes all cards with replace_base_card enhancements
            valid_cards[#valid_cards+1] = v
        end
    end
    if valid_cards[1] then 
        local target_card = pseudorandom_element(valid_cards, pseudoseed(seed or 'validcard'..G.GAME.round_resets.ante))
		
        res_suit = target_card.base.suit
		res_rank = target_card.base.value
    end
	
	return {suit = res_suit, rank = res_rank}
end

--Black Jack Rank Calculation
local function blackJack_evalrank(hand, bustAmount)
	--Black Jack-style total rank evaluation
	
	bustAmount = bustAmount or 21
	
	local aceCount = 0
	local rank = 0
	
	for i = 1, #hand do
		local currentCard = hand[i]
		if not SMODS.has_no_rank(currentCard) and not currentCard.debuff  then
			
			if currentCard.base.value ~= 'Ace' then
				rank = rank + (SMODS.Ranks[currentCard.base.value].nominal or 0) --Supports modded ranks as well, just in case
			else
				aceCount = aceCount + 1
				
				rank = rank + 11
			end
			
		end
	end
	
	--Handle Ace rank
	while( aceCount > 0 )
	do
	   
		if rank > bustAmount then
			rank = rank - 10
		end
		
		aceCount = aceCount - 1
	end
	
	return rank
	
end

--"Upgrade" function, used on card
local function edition_upgrade(card)
	local edition = (card.edition or {}).key

	if not edition then
		card:set_edition("e_foil", true, false)
	elseif edition=="e_foil" then
		card:set_edition("e_holo", true, false)
	elseif edition=="e_holo" then
		card:set_edition("e_polychrome", true, false)
	end
end

--General Helper function for rank increment / decrement

--Insert "prev" property into SMODS.Ranks
function init_prev_rank_data()
	print("Initialize Remaining Previous Rank Data")
	for _, rank in pairs(SMODS.Ranks) do
		
		--Initialize
		--In case the rank table does not have prev existed
		--Base rank and UNSTB one has them defined manually by default
		if not rank.unstb_prev then
			rank.unstb_prev= {}
		end
		
		next_rank_list = rank.next
		
		for i=1, #next_rank_list do
			local next_rank = SMODS.Ranks[next_rank_list[i]]
			local unstb_prev = next_rank.unstb_prev or {}
			
			if not table_has_value(unstb_prev, rank.key) then
				table.insert(unstb_prev, rank.key)
				next_rank.unstb_prev= unstb_prev
			end
		end
	end
end

--Utility function to get the next rank by specified step, walked using the same algorithm as SMODS Implementation of Strength Tarot
--Negative Step is also ok
function get_next_x_rank(rank, step)
	local currentRank = SMODS.Ranks[rank]
	
	if not currentRank then 
		return 'unstb_???' --Fallback, if the rank is invalid then returning ??? rank card
	end
	
	local behavior
	local new_rank
	
	local mul = (step > 0 and 1) or -1
	
	--Based on SMODS Current implementation of Strength
	for i=mul, step, mul do
	
		if mul > 0 then
			behavior = currentRank.strength_effect or { fixed = 1, ignore = false, random = false }
		else
			behavior = currentRank.decrease_effect or { fixed = 1, ignore = false, random = false }
		end
		
		if behavior.ignore or not next(currentRank.next) then
			return rank
		elseif behavior.random then
			-- TODO doesn't respect in_pool
			if mul>0 then
				new_rank = pseudorandom_element(currentRank.next, pseudoseed('nextrank'))
			else
				new_rank = pseudorandom_element(currentRank.prev, pseudoseed('prevrank'))
			end
			
		else
			if mul>0 then
				local ii = (behavior.fixed and currentRank.next[behavior.fixed]) and behavior.fixed or 1
				new_rank = currentRank.next[ii]
			else
				local ii = (behavior.fixed and currentRank.prev[behavior.fixed]) and behavior.fixed or 1
				new_rank = currentRank.unstb_prev and currentRank.prev[ii] or currentRank.key
			end
			
		end
		
		currentRank = SMODS.Ranks[new_rank]
		--print(SMODS.Ranks[new_rank].key)
	end
	
	return new_rank or rank 

end

--Face Seal

if unstb_config.gameplay.seal_suit then

SMODS.Seal({
	key = "face",
	atlas = "suit_seal",
	
	pos = { x = 4, y = 0 },
	badge_colour = HEX "f59c00",
	shiny = true,
	
	weight = 0,
	config = {extra = {}},
	
	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,
	--[[calculate = function(self, card, context)

	end]]
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
		return false
	end
	})
	
end

--Hook into is_face to account for Face Seal
local card_isfaceref = Card.is_face

function Card:is_face(from_boss)
    if self.debuff and not from_boss then return end
	
	if self.seal == 'unstb_face' then
		return true
	end
	
	return card_isfaceref(self, from_boss)
end

--Suit Seals

--Global table for Suit Seals-related stuff
SuitSeal = {}

SuitSeal.suit_seal_colors = {
	Spades = HEX "603de8",
	Hearts = HEX "e83d61",
	Clubs = HEX "19b8a1",
	Diamonds = HEX "e8793d",
}

--External function to supports register more suits (especially modded) if needed
function SuitSeal.registerSealColor(suit, color)
	SuitSeal.suit_seal_colors[suit] = HEX(color)
end

--Creating an actual SMODS Seal object
function SuitSeal.initSeal(suit, atlas, posX)
	SMODS.Seal({
    key = string.lower(suit),
    atlas = atlas or "suit_seal",
	
	--Extra field for suit seal only, 
	suit_seal = suit,
	
    pos = { x = posX or 0, y = 0 },
    badge_colour = SuitSeal.suit_seal_colors[suit],
    weight = 0,
    config = {extra = {}},
    
    loc_vars = function(self, info_queue, card)
        return {vars = {localize(self.suit_seal, 'suits_plural'), colours = {G.C.SUITS[self.suit_seal]}}}
    end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
	})
end

local suit_seal_list = {"Spades", "Hearts", "Clubs", "Diamonds"}

--Global Suit Seal map from suit
unstb_global.SUIT_SEAL = {}

--TODO: A function wrapper that registers extra suit seal, corresponding auxillary card at the same time
--Might be a part of UnStableEX

if unstb_config.gameplay.seal_suit then

for i = 1, #suit_seal_list do
	SuitSeal.initSeal(suit_seal_list[i], "suit_seal", i-1 )
	
	unstb_global.SUIT_SEAL[suit_seal_list[i]] = {}
	
	unstb_global.SUIT_SEAL[suit_seal_list[i]].seal_key = 'unstb_'..string.lower(suit_seal_list[i])
	unstb_global.SUIT_SEAL[suit_seal_list[i]].aux_key = 'c_unstb_aux_'..string.lower(suit_seal_list[i])
end

end

--Heal Seal

function Card:heal(initial, delay_sprites)
	local prev_center = self.config.prev_center or G.P_CENTERS.c_base
	
	--Nullify hand xmult just in case
	if self.ability.h_x_mult then
		self.ability.h_x_mult = 0
	end
	
	self:set_ability(prev_center, initial, delay_sprites)
end

if unstb_config.enh.enh_disenh then

SMODS.Seal({
    key = "heal",
    atlas = "suit_seal",
	
    pos = { x = 5, y = 0 },
    badge_colour = HEX "7ce83d",
	
    weight = 0,
    config = {extra = {}},
    
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'disenhancement'}
        return {vars = {}}
    end,
    calculate = function(self, card, context)
		if context.cardarea == G.play and context.main_scoring then
		
			local valid_cards = {}
			for i = 1, #G.hand.cards do
				if G.hand.cards[i].config.center.disenhancement and not G.hand.cards[i].healed then
					valid_cards[#valid_cards+1] = G.hand.cards[i]
				end
			end
			
			if valid_cards[1] then 
				local target_card = pseudorandom_element(valid_cards, pseudoseed('heal'..G.GAME.round_resets.ante))
				--Set variable in advance because events are delayed
				target_card.healed = true
				
				--Nullify hand xmult in advance
				if target_card.config.center == G.P_CENTERS.m_unstb_radioactive then
					target_card.ability.h_x_mult = 0
				end
				
				event({func = function()
						target_card:heal()
						play_sound('unstb_heal', 1, 0.3)
						target_card:juice_up()
						target_card.healed = nil
						return true
					end
				})
				
				forced_message("Healed!", target_card, G.C.GREEN, true)	
			end
		end
    end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
	})
	
end


--New Enhancements
 
 function get_valid_card_from_deck(seed)
    
	local res_suit = 'Spades'
	local res_rank = '2'
	
    local valid_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if not v.config.center.replace_base_card  then --Excludes all cards with replace_base_card enhancements
            valid_cards[#valid_cards+1] = v
        end
    end
    if valid_cards[1] then 
        local target_card = pseudorandom_element(valid_cards, pseudoseed(seed or 'validcard'..G.GAME.round_resets.ante))
		
        res_suit = target_card.base.suit
		res_rank = target_card.base.value
    end
	
	return {suit = res_suit, rank = res_rank}
end
 
--Patch get_chip_bonus to allow total chip override
local cardGetChipBonusPointer = Card.get_chip_bonus
 
function Card:get_chip_bonus()
 
	if self.config.center.override_chip then
		return self.config.center.override_chip
	end
	
	return cardGetChipBonusPointer(self)
end

if unstb_config.enh.enh_custom then

--Acorn
SMODS.Enhancement {
	key = "acorn",
	atlas = "unstb_back",
	pos = {x=0, y = 0},
	
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	override_chip = 0,
	
	
	config = {extra = { totalchips = 0, originalchips = 0}},
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = { (card and (card.base.nominal + (card.ability.perma_bonus or 0)) *2) or 0 }
        }
    end,
	
	
	
	--Override genere_ui so it does not display any chips
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
            SMODS.Enhancement.super.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,

	
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
			local rulesJoker = SMODS.find_card('j_unstb_rules_errata')
		
			if next(rulesJoker) then
			
				--Makes the Joker bounce when this card score
				event({trigger = 'after',  func = function()
				big_juice(rulesJoker[1])
				return true end })

				return {
					mult = card.base.nominal * 0.5,
				}
			
			else
				event({trigger = 'after', delay = 0.05,  func = function()
				play_sound('tarot2', 1, 0.4);
				return true end })
			
				forced_message("Not Allowed!", card, G.C.RED, true)		
			end
        end
		
		if context.cardarea == G.hand and context.main_scoring then
			card.ability.extra.totalchips = (card.base.nominal + (card.ability.perma_bonus or 0)) * 2
			
			if not card.debuff then
				--ret.unstb_h_chips = card.ability.extra.totalchips
				return {
					h_chips = card.ability.extra.totalchips
				}
			end
			
		end
    end
 }
 
--Vintage
SMODS.Enhancement {
	key = "vintage",
	atlas = "unstb_back",
	pos = {x=1, y = 0},
	
	
	config = {extra = { bonus_chip = 0, chip_gain_rate = 10, current_odd = 0, odd_destroy = 15, destroy_rate = 1}},
	
	loc_vars = function(self, info_queue, card)
		
		local odds_current = 0
		local destroy_rate = 1
		
		if card then
			odds_current = card.ability.extra.current_odd or 0
			destroy_rate = card.ability.extra.destroy_rate
		end
		
		if G.GAME and G.GAME.probabilities.normal then
			odds_current = odds_current * G.GAME.probabilities.normal
			destroy_rate = destroy_rate * G.GAME.probabilities.normal
		end
	
        return {
            vars = { self.config.extra.chip_gain_rate, odds_current, self.config.extra.odd_destroy, destroy_rate}
        }
    end,
	
	

	
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
			card.ability.perma_bonus = (card.ability.perma_bonus or 0) + card.ability.extra.chip_gain_rate
			card.ability.extra.current_odd = (card.ability.extra.current_odd or 0) + card.ability.extra.destroy_rate
			
			forced_message("Upgrade!", card, G.C.CHIPS, true)
        end
    end,
	
	after_play = function(self, card, context)
		local isDestroy = pseudorandom('vintage'..G.SEED) < card.ability.extra.current_odd * G.GAME.probabilities.normal / card.ability.extra.odd_destroy
		
		if isDestroy then
			event({trigger = 'after', delay = 0.05,  func = function()
				play_sound('tarot2', 1, 0.4);
				return true end })
		
			forced_message("Torn...", card, G.C.BLACK, true)
			return {
				to_destroy = true
			}
		end
	end,
 }
 
 --Promo
SMODS.Enhancement {
	key = "promo",
	atlas = "unstb_back",
	pos = {x=2, y = 0},
	
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = false,
	
	config = {extra = { gold = 0, gold_rate = 1, odds_destroy = 8}},
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = { (card and card.ability and card.ability.extra.gold) or 0, self.config.extra.gold_rate, (G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds_destroy }
        }
    end,
	
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
           card.ability.extra.gold = (card.ability.extra.gold or 0) + card.ability.extra.gold_rate
		   forced_message("Upgrade!", card, G.C.GOLD, true)	 
        end
		
		if context.cardarea == G.hand and context.main_scoring then
			if not card.debuff and card.ability.extra.gold>0 then
				--ret.dollars = card.ability.extra.gold
				return {
					dollars = card.ability.extra.gold
				}
			end
		end
		
    end,
	
	after_play = function(self, card, context) 
		--print("Trigger afterplay")
	
		local isDestroy = pseudorandom('promo'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_destroy
		
		if isDestroy then
			event({trigger = 'after', delay = 0.05,  func = function()
				play_sound('tarot2', 1, 0.4);
				return true end })
		
			forced_message("Sold", card, G.C.ORANGE, true)
			return {
				to_destroy = true
			}
		end
	end,
 }
 
 --Slop
SMODS.Enhancement {
	key = "slop",
	
	lc_atlas = "enh_slop",
	hc_atlas = "enh_slop_hc",
	
	atlas = "enh_slop",
	is_hc = false,
	
	pos = {x=0, y = 0},
	
	replace_base_card = true,
    no_suit = false,
    no_rank = false,
    always_scores = true,
	
	config = {extra = { suit = 'Spades', rank = '2', chips = 0}},
	
	loc_vars = function(self, info_queue, card)
	
		local suit_text = '(Suit)'
		local suit_text_color = G.C.ORANGE
		
		if card and card.ability then
			suit_text = localize(card.ability.extra.suit, 'suits_plural');
			suit_text_color = G.C.SUITS[card.ability.extra.suit]
		end
	
        return {
            vars = { card and card.ability.extra.chips or 2, suit_text, localize(card and card.ability.extra.rank or '2', 'ranks')  ,
			colours = {suit_text_color} }
        }
    end,
	
	
	
	suit_map = {
		Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
	},
	
	set_sprites = function(self, card, front)
		local isCollection = (card.area and card.area.config.collection) or false
		
		if not isCollection and card.ability and card.ability.extra then
			local suit = (card.base and card.base.suit) or 'Spades'
			
			local pos  = get_coordinates( (self.suit_map[suit] or -1) +1 )
				
			card.children.center:set_sprite_pos(pos)
		end
		
    end,
	
	set_ability = function(self, card, initial, delay_sprites)
		if card.base then
			card.ability.extra.suit = card.base.suit or 'Hearts'
			card.ability.extra.rank = card.base.value or '2'
			card.ability.extra.chips = SMODS.Ranks[card.ability.extra.rank].nominal
		end
    end,
	
	update = function(self, card) 
	
		--Jank, supporting for high contrast texture change settings
		if G.SETTINGS.colourblind_option ~= card.atlasmode then
		
			if G.SETTINGS.colourblind_option then
				self.atlas = self.hc_atlas			
			else
				self.atlas = self.lc_atlas
			end
			card.children.center.atlas = G.ASSET_ATLAS[self.atlas]
			card.atlasmode = G.SETTINGS.colourblind_option
			
		end
	
		--Update the value for the 'wise' player who tries to change card value using tarots
		if (card.VT.w <= 0) and card.base.suit and card.base.value then
			local isCollection = (card.area and card.area.config.collection) or false
		
			if not isCollection then
				card.ability.extra.suit = card.base.suit or 'Hearts'
				card.ability.extra.rank = card.base.value or '2'
				card.ability.extra.chips = SMODS.Ranks[card.ability.extra.rank].nominal
				
				local suit = (card.base and card.base.suit) or 'Spades'
				local pos  = get_coordinates( (self.suit_map[suit] or -1) +1 )
				card.children.center:set_sprite_pos(pos)
			end
		end
    end,
	
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
			local scoredAmount = card.ability.extra.chips + card.ability.perma_bonus
			--Store the current scoring hand, for after_play
			--Had to check to not include itself and other Slop Cards so it won't have cyclic references
			if not card.ability.extra.prevhand and context.scoring_hand then
				local hand = {}
				
				for i=1, #context.scoring_hand do
					if context.scoring_hand[i] ~= card and not context.scoring_hand[i].config.center.replace_base_card then
						hand[#hand+1] = {suit = context.scoring_hand[i].base.suit, rank = context.scoring_hand[i].base.value}
					end
				end
				
				card.ability.extra.prevhand = hand
				
				--print(inspectDepth(card.ability.extra.prevhand))
			end
			
			return {
				chips = scoredAmount,
			}
			
        end
    end,
	
	after_play = function(self, card, context) 
		
		forced_message("Randomize!", card, G.C.RED, true)
		
		event({trigger = 'after', delay = 0.05,  func = function()
			card.ability.extra.suit = pseudorandom_element(SMODS.Suits, pseudoseed('slop_card')..G.SEED).key
			card.ability.extra.rank = pseudorandom_element(SMODS.Ranks, pseudoseed('slop_card')..G.SEED).key
			
			local prompt_joker = SMODS.find_card('j_unstb_prompt')
			
			if next(prompt_joker) then
				
				if #card.ability.extra.prevhand>0 then
					card.ability.extra.suit = pseudorandom_element(card.ability.extra.prevhand, pseudoseed('slop_card')..G.SEED).suit
					card.ability.extra.rank = pseudorandom_element(card.ability.extra.prevhand, pseudoseed('slop_card')..G.SEED).rank
					
					--Bounce the Joker a lil bit for the feedback effect
					big_juice(prompt_joker[1])
				end
				
			end
			
			--Clear the variable, unsure why this caused the game to crash when hovering on the deck if left uncleared
			card.ability.extra.prevhand = nil
			
			card.ability.extra.chips = SMODS.Ranks[card.base.value].nominal
			
			local suit_data = SMODS.Suits[card.ability.extra.suit]
			local suit_prefix = suit_data.card_key
			
			local targetCard = suit_prefix .. '_' ..SMODS.Ranks[card.ability.extra.rank].card_key
			
			--print(targetCard)
			
			card:set_base(G.P_CARDS[targetCard])
			
			local suit = (card.base and card.base.suit) or 'Spades'
			local pos  = get_coordinates( (self.suit_map[suit] or -1) +1 )	
			card.children.center:set_sprite_pos(pos)
			
		return true end })
	end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
 --Resource
 SMODS.Enhancement {
	key = "resource",
	atlas = "enh_resource",
	pos = {x=0, y = 0},
	
    replace_base_card = true,
    --no_suit = false,
    no_rank = true,
    always_scores = true,
	
	config = {extra = { xmult = 5, suit = "undefined"} },
	
	loc_vars = function(self, info_queue, card)
	
		local suit_text = 'undefined'
		local suit_text_color = {}
		
		if card.ability then
			suit_text = card.ability.extra.suit;
			
			if suit_text ~= '(Corresponding Suit)' then
				suit_text = localize(card.ability.extra.suit, 'suits_singular');
				suit_text_color = G.C.SUITS[card.ability.extra.suit]
			else
				suit_text_color = G.C.ORANGE
			end
		end
	
        return {
            vars = { (card.ability and card.ability.extra.xmult) or 5, suit_text,
			colours = {suit_text_color} }
        }
    end,
	
	suit_map = {
		Hearts = 0,
        Clubs = 1,
        Diamonds = 2,
        Spades = 3,
	},
	
	
	
	set_sprites = function(self, card, front)
		
		local isCollection = (card.area and card.area.config.collection) or false
		
		if not isCollection and card.ability and card.ability.extra then
			local suit = (card.base and card.base.suit) or 'Spades'
			
			card.ability.extra.suit = suit
				
			local pos  = get_coordinates( (self.suit_map[suit] or -1) +2 )
				
			card.children.center:set_sprite_pos(pos)
		end
		
    end,
	
	update = function(self, card)
		if (card.VT.w <= 0 or card.ability.extra.suit == 'undefined') then
			local isCollection = (card.area and card.area.config.collection) or false
		
			if not isCollection then
				card.ability.extra.suit = card.base.suit
				card.children.center:set_sprite_pos( get_coordinates( (self.suit_map[card.base.suit] or -1) +2 ) )
			else 
				card.ability.extra.suit = "(Corresponding Suit)"
			end
		end
    end,
	
	calculate = function(self, card, context)

        if context.cardarea == G.play and context.main_scoring then
			local has_suit = false
			
			if context.scoring_hand then
				for i = 1, #context.scoring_hand do
					local currentCard = context.scoring_hand[i]
					if currentCard ~= card and currentCard.config.center ~= G.P_CENTERS.m_unstb_resource and currentCard:is_suit(card.ability.extra.suit) then				
						has_suit = true
						break
					end
				end
			end
			
			if has_suit then
				--[[event({trigger = 'after',  func = function()
				play_sound('multhit1')
				return true end })]]
				
				card.ability.extra.to_destroy = true
				
				return {
				xmult = card.ability.extra.xmult,
				}
				
			else
				event({trigger = 'after', delay = 0.05,  func = function()
				play_sound('tarot2', 1, 0.4);
				return true end })

				forced_message("Invalid", card, G.C.ORANGE, true)
			end
			
			return {
			  repetitions = -1,
			  card = context.other_card
			}
        end
    end,
	
	--Injected the trigger using lovely, can be used for any post-play enchantment stuff
	after_play = function(self, card, context) 
		if card.ability.extra.to_destroy then
			forced_message("Redeemed!", card, G.C.RED, true)
				
			return {
				to_destroy = true
			}
		end
	end,
	
	--Can spawn when Catan mode enabled
	in_pool = function(self, args)
        return G.GAME.pool_flags.catan_enabled
    end
 }
 
 end
 
--"Negative" Enhancements

--Global function wrapper to set DisEnhancements
function Card:set_disenhancement(center, initial, delay_sprites)
	
	--If the card has heal seal
	if self.seal and self.seal == 'unstb_heal' then
		
		if self.debuff then
			--If debuff, remove the seal and proceed through the rest of the process
			self.seal = nil
		else
			--If the card is on hand, show resisting animation
			if self.area == G.hand then
				event({func = function() play_sound('unstb_heal', 1, 0.3) return true end})
				forced_message("Resist!", self, G.C.GREEN, true)	
			elseif self.area == G.play then
				--Play healing sound effect if it's in play
				event({func = function() play_sound('unstb_heal', 1, 0.3) return true end})
			end
			
			--Don't turn the card into DisEnhancements
			return
		end
		
	end
	
	--If the card is debuffed, removed the heal seal entirely
	if self.seal and self.seal == 'unstb_heal' and  self.debuff then
		self.seal = nil
	end

	local old_center = self.config.center
	
	--Set the previous enhancement to keep track
	if not old_center.disenhancement then
		self.config.prev_center = old_center
	end

	--Calling appropriate set_ability
	self:set_ability(center, initial, delay_sprites)
end

if unstb_config.enh.enh_disenh then

--Global blacklist for card enhancements that cannot be converted by radioactive card
unstb_global.radioactive_blacklist = {
m_unstb_radioactive = true,
m_unstb_slop = true,
}

--Radioactive
SMODS.Enhancement {
	key = "radioactive",
	atlas = "unstb_back",
	pos = {x=3, y = 0},
	
	
	
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
	
	disenhancement = true, --exclusive property to check if it's disenhancement or not
	
	config = {extra = { chips = 13, odds_conv = 2, odds_mult = 3, mult_good = 1.75, mult_bad = 0.5 }, h_x_mult = 1},
	
	loc_vars = function(self)
        return {
            vars = { self.config.extra.chips, (G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds_conv, self.config.extra.odds_mult, self.config.extra.mult_good, self.config.extra.mult_bad }
        }
    end,
	
	
    
	set_ability = function(self, card, initial, delay_sprites)
		--Set the hand multiplier the first time
		if pseudorandom('radioactive'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_mult then
			card.ability.h_x_mult = card.ability.extra.mult_good
		else
			card.ability.h_x_mult = card.ability.extra.mult_bad
		end
    end,
	
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
			if #context.scoring_hand > 1 then
			
				--polling the eligible hand first
				
				local eligible_hand = {}
				
				for i=1, #context.scoring_hand do
					--Exclude slop card because it interacts horribly with this
					if not unstb_global.radioactive_blacklist[context.scoring_hand[i].config.center.key] and not context.scoring_hand[i].to_convert then
						eligible_hand[#eligible_hand+1] = context.scoring_hand[i]
					end
				end
			
				--Update: no longer show "Safe!" if the entire hand is not convertable
				if #eligible_hand > 0 then
					local target = pseudorandom_element(eligible_hand, pseudoseed('radioactive_conv'..G.SEED))
					if pseudorandom('radioactive'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_conv then
						target.to_convert = true
						--Flipping Animation
						event({trigger = 'after', delay = 0.1, func = function() target:flip(); play_sound('card1', 1); target:juice_up(0.3, 0.3); return true end })
						
						--Changing Card Property
						
						event({trigger = 'after', delay = 0.05,  func = function()
						
							target:set_disenhancement(G.P_CENTERS.m_unstb_radioactive)
							
							return true end })
						
						--Unflipping Animation
						event({trigger = 'after', delay = 0.1, func = function() target:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); target:juice_up(0.3, 0.3); target.to_convert = nil; return true end })

						forced_message("Decayed!", target, G.C.RED, true)
					else
						forced_message("Safe!", card, G.C.GREEN, true)
					end
				end
				
			end
			
			return {
				chips = card.ability.extra.chips
			}
			
			
        end
		
		if context.cardarea == G.hand and not card.healed and context.main_scoring then
			--Xmult handling ability is built-in, so this one just checks for odds and alter it respectively.
			if pseudorandom('radioactive'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_mult then
				card.ability.h_x_mult = card.ability.extra.mult_good
			else
				card.ability.h_x_mult = card.ability.extra.mult_bad
			end
			
		end
    end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
SMODS.Enhancement {
	key = "biohazard",
	atlas = "unstb_back",
	pos = {x=4, y = 0},
	
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
	
	disenhancement = true,
	
	config = {extra = { xmult = 0.9, h_money = 1, odds_conv = 3}},
	
	loc_vars = function(self)
        return {
            vars = { self.config.extra.xmult, self.config.extra.h_money, (G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds_conv }
        }
    end,
	
	calculate = function(self, card, context)

		if context.cardarea == G.play and context.main_scoring then
			return {
				xmult = card.ability.extra.xmult,
			}
		end

		if context.discard and context.other_card == card then
			local is_neutralized = next(SMODS.find_card('j_unstb_vaccination_card'))
		
			--check if it is activated
			if pseudorandom('biohazard'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_conv and not is_neutralized then
			
				--check hand card
				local hand_card = {}
				for i = 1, #G.hand.cards do
					hand_card[G.hand.cards[i]] = true
				end
				
				--populate valid cards
				local valid_cards = {}
				for k, v in ipairs(G.playing_cards) do
					if v.config.center ~= G.P_CENTERS.m_unstb_biohazard and not hand_card[v] then --Exclude biohazard cards
						valid_cards[#valid_cards+1] = v
					end
				end
				
				if valid_cards[1] then 
					local target_card = pseudorandom_element(valid_cards, pseudoseed(seed or 'validcard'..G.GAME.round_resets.ante))
					target_card:set_disenhancement(G.P_CENTERS.m_unstb_biohazard , nil, true)
				end
			
			end
			
		end
		
		if context.cardarea == G.hand and not card.healed and context.main_scoring then
		
			local is_neutralized = next(SMODS.find_card('j_unstb_vaccination_card'))
		
			if not card.debuff and not is_neutralized then
				return {
					dollars = -card.ability.extra.h_money
				}
			end
		end
    end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
SMODS.Enhancement {
	key = "poison",
	atlas = "unstb_back",
	pos = {x=5, y = 0},
	
    replace_base_card = false,
    no_suit = false,
    no_rank = false,
    always_scores = true,
	
	disenhancement = true,
	
	override_chip = 0,
	
	config = {extra = { chip = 0.9, h_money = 1}},
	
	loc_vars = function(self, info_queue, card)
	
		local chip = 0
		if card and card.base then
			chip = card.base.nominal + (card.ability.perma_bonus or 0)
		end
	
        return {
            vars = { chip , self.config.extra.h_money }
        }
    end,
	
	--Override generate_ui so it does not display any chips
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
            SMODS.Enhancement.super.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,

	
	calculate = function(self, card, context)

		if context.cardarea == G.play and context.main_scoring then
			local totalChip = card.base.nominal + (card.ability.perma_bonus or 0) --Counted bonus chips too, go crying
			return {
				chips = -totalChip,
				colour = G.C.RED 
			}
		end
    end,
	
	discard_override = function(self, card, args) --Discard overridden function, injected by Lovely
		card.ability.discarded = nil
		
		draw_card(G.hand, G.deck, args.delay, 'down', false, card)
		
		--Wrap shuffle in the event instead, so it should work now hopefully???
		event({trigger = 'after', func = function()
			G.deck:shuffle('poison'..G.GAME.round_resets.ante)
		return true end})
	end,
	
	--This cannot spawn naturally at all
	in_pool = function(self, args)
        return false
    end
 }
 
end
 
--Add proper tag to stone cards, nothing should change gameplay-wise
SMODS.Enhancement:take_ownership('m_stone', {
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
    }, true)
 
--New Ranks

--Hook for Card:get_id()

local decimal_rank_map = { ['unstb_0.5'] = 'unstb_1', unstb_r2 = '2', unstb_e = '3', unstb_Pi = '4'}

--Expose this part so other mods can register decimal rank used for Engineer
function unstb_global.register_decimal_rank_map(decimal_rank, integer_rank)
	decimal_rank_map[decimal_rank] = integer_rank
end

local ref_getid = Card.get_id
function Card:get_id()

	local engineer_joker = next(SMODS.find_card('j_unstb_engineer'))
	
	--If 'Engineer' Joker exists, returns rounded up rank instead
	if engineer_joker and SMODS.Ranks[self.base.value].is_decimal then
		return SMODS.Ranks[decimal_rank_map[self.base.value]].id
	end

	return ref_getid(self)
end

--Function wrapper to check if a card has decimal rank

local function is_decimal(card)
	return not SMODS.has_no_rank(card) and SMODS.Ranks[card.base.value] and (SMODS.Ranks[card.base.value].is_decimal or SMODS.Ranks[card.base.value].decimal_compat)
end

--Hook for Poker Hand name

local ref_get_poker_hand_info = G.FUNCS.get_poker_hand_info

G.FUNCS.get_poker_hand_info = function(_cards)
    local text, loc_disp_text, poker_hands, scoring_hand, disp_text = ref_get_poker_hand_info(_cards)
    --print(disp_text)
	
    if string.find(disp_text, 'Straight') then
        for i=1, #scoring_hand do
			if is_decimal(scoring_hand[i]) then
				loc_disp_text = string.gsub(loc_disp_text, 'Straight', 'Gay')
				break
			end
		end
    end

    return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end


--Pool flag wrapper function to help assist managing ranks enable / disable
function setPoolRankFlagEnable(rank, isEnable)
	if not G.GAME or G.GAME.pool_flags[rank] == isEnable then return end
	
	G.GAME.pool_flags[rank] = isEnable
end

function getPoolRankFlagEnable(rank)
	return (G.GAME and G.GAME.pool_flags[rank] or false)
end

--Shared pool rank checking function
local function unstb_rankCheck(self, args)
	if args and args.initial_deck then
        return false
    end
	
	return getPoolRankFlagEnable(self.key)
end

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = '0',
    card_key = '0',
    pos = { x = 6 },
    nominal = 0,
	
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = { 'unstb_0.5', 'unstb_1', 'unstb_r2' },
	
    unstb_prev= { 'unstb_???' },
	
    shorthand = '0',
	
	straight_edge = true,
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = '0.5',
    card_key = '0.5',
    pos = { x = 2 },
    nominal = 0.5,
	
    next = {'unstb_1', 'unstb_r2', '2', 'unstb_e' },
	
	unstb_prev= { 'unstb_0' },
	
    shorthand = '0.5',
	
	is_decimal = true,
	rank_act = {'0', '0.5', '1'},
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = '1',
    card_key = '1',
    pos = { x = 5 },
    nominal = 1,
	strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        },
    next = {'unstb_r2', '2', 'unstb_e' },
	
	unstb_prev= { 'unstb_0' },
	
    shorthand = '1',
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'r2',
    card_key = 'R',
    pos = { x = 7 },
    nominal = 1.41,
	
    next = {'2', 'unstb_e', '3', 'unstb_Pi' },
	unstb_prev= { 'unstb_1' },
	
    shorthand = '/2',
	
	is_decimal = true,
	rank_act = {'1', '1.41', '2'},
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'e',
    card_key = 'E',
    pos = { x = 3 },
    nominal = 2.72,
	
    next = { '3', 'unstb_Pi', '4' },
	unstb_prev= { '2' },
	
    shorthand = 'e',
	
	is_decimal = true,
	rank_act = {'2', '2.72', '3'},
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = 'Pi',
    card_key = 'P',
    pos = { x = 4 },
    nominal = 3.14,
	
    next = { '4', '5' },
	unstb_prev= { '3' },
	
    shorthand = 'Pi',
	
	is_decimal = true,
	rank_act = {'3', '3.14', '4'},
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',
	
	
	hidden = true,

    key = '???',
    card_key = '?',
    pos = { x = 1 },
    nominal = 0,
    next = {},
	unstb_prev= {},
    shorthand = '?',
	
	strength_effect = {
            ignore = true
        },
		
	decrease_effect = {
		ignore = true
	},
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

	
	hidden = true,
	
    key = '21', -- the number or name (ex. "Jack") of your rank if it has one
    card_key = '21', -- the short key put after the suit when coding a card object (ex. for the card "H_5" the card_key is 5). this seems to usually match the shorthand
    pos = { x = 0 }, -- x position on the card atlas
    nominal = 21,  -- the number of chips this card scores
    next = { 'unstb_???' }, -- the next rank directly above it, used for Strength Tarot
	unstb_prev= { 'unstb_???' }, -- UNSTB addition: the previous rank directly below it
    shorthand = '21', -- used for deck preview
	
	in_pool = unstb_rankCheck,
}

-- "Premium Pack" Ranks
SMODS.Rank {
	hc_atlas = 'rank_ex2_hc',
    lc_atlas = 'rank_ex2',

	hidden = true,
	
    key = '11',
    card_key = '11',
    pos = { x = 0 },
    nominal = 11,
    next = { 'unstb_12' },
	unstb_prev= {'10'},
    shorthand = '11',
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex2_hc',
    lc_atlas = 'rank_ex2',

	hidden = true,
	
    key = '12',
    card_key = '12',
    pos = { x = 1 },
    nominal = 12,
    next = { 'unstb_13' },
	unstb_prev= {'unstb_11'},
    shorthand = '12',
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex2_hc',
    lc_atlas = 'rank_ex2',

	hidden = true,
	
    key = '13',
    card_key = '13',
    pos = { x = 2 },
    nominal = 13,
    next = { 'Ace' },
	unstb_prev= {'unstb_12'},
    shorthand = '13',
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex2_hc',
    lc_atlas = 'rank_ex2',

	hidden = true,
	
    key = '25',
    card_key = '25',
    pos = { x = 3 },
    nominal = 25,
    next = { 'unstb_???' },
	unstb_prev= { 'unstb_???' },
    shorthand = '25',
	
	in_pool = unstb_rankCheck,
}

SMODS.Rank {
	hc_atlas = 'rank_ex2_hc',
    lc_atlas = 'rank_ex2',

	hidden = true,
	
    key = '161',
    card_key = '161',
    pos = { x = 4 },
    nominal = 161,
    next = { 'unstb_???' },
	unstb_prev= { 'unstb_???' },
    shorthand = '161',
	
	in_pool = unstb_rankCheck,
}
--

SMODS.Ranks['2'].strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        }
SMODS.Ranks['2'].next = {'unstb_e', '3', 'unstb_Pi'}

SMODS.Ranks['3'].strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        }
SMODS.Ranks['3'].next = {'unstb_Pi', '4'}

--Change straight edge off from Ace, so it start to look at rank 0 instead
--SMODS.Ranks['Ace'].straight_edge = false
SMODS.Ranks['Ace'].strength_effect = {
            fixed = 2,
            random = false,
            ignore = false
        }
SMODS.Ranks['Ace'].next = {'unstb_r2', '2', 'unstb_e'}

--Vanilla Rank Alteration for Set 2
SMODS.Ranks['10'].next = {'Jack', 'unstb_11'}

--Add preliminary prev property into vanilla rank list, so the default behavior will always point to this one
local vanilla_rank_list = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}

for i=#vanilla_rank_list, 2, -1 do
	SMODS.Ranks[vanilla_rank_list[i]].unstb_prev= {vanilla_rank_list[i-1]}
end
SMODS.Ranks['2'].unstb_prev= {'Ace'}

--Add a custom in_pool for high vanilla ranks, so they can be hidden from appearing in Lowkey Combo Decks HUD

for i=#vanilla_rank_list, 5, -1 do
	SMODS.Ranks[vanilla_rank_list[i]].in_pool = function()
		return not G.GAME.prevent_high_rank
	end
end

--pseudorandom_element Hook to help filling the specific fallback case

local ref_pseudorandom_element = pseudorandom_element

function pseudorandom_element(_t, seed, args)
	local t, k = ref_pseudorandom_element(_t, seed, args)
	
	--If it return empty because it cannot pick anything, call extra fallback case
	if not k then
		--Not that much of a "safe" check but I fully expect noone to actually
		--random rank and suit object together with everything else
		--If you're doing that I'll cry
		if type(_t[1])=='table' then
			if _t[1].set == 'Rank' then
				return SMODS.Ranks['unstb_???'], 1
			elseif _t[1].set == 'Suit' then
				return SMODS.Suit['Spades'], 1
			end
		end
	end
	
	return t, k
end

--Booster Pack for Premium Card

local premium_booster_rate = {0.75, 0.75, 0.5, 0.1}
local premium_booster_cost = {4, 4, 6, 8}

--Needs all three ranks setting to be on to start appearing
if check_enable_taglist({'rank_binary', 'rank_decimal', 'rank_21'}) then

for i = 1, 4 do
    SMODS.Booster{
        key = 'prem_'..(i <= 2 and i or i == 3 and 'jumbo' or 'mega'), 
		cost = premium_booster_cost[i],

        config = {extra = i <= 2 and 3 or 5, choose =  i <= 3 and 1 or 2},
        draw_hand = false,

        create_card = function(self, card)
            local card = create_card("Base", G.pack_cards, nil, nil, nil, true, nil, 'prem')
			local edition_rate = 3
			local edition = poll_edition('premium_edition'..G.GAME.round_resets.ante, edition_rate, true)
			
			local rank_set = {"unstb_0", "unstb_0.5", "unstb_1", "unstb_r2", "unstb_e", "unstb_Pi", "unstb_11", "unstb_12", "unstb_13", "unstb_21", "unstb_25", "unstb_161"}
			
			--Lowkey Deck / Sleeve combo mode, prevent high rank from being spawned
			if G.GAME.prevent_high_rank then
				rank_set = {"unstb_0", "unstb_0.5", "unstb_1", "unstb_r2", "unstb_e", "unstb_Pi"}
			end
			
			SMODS.change_base(card, nil, pseudorandom_element(rank_set, pseudoseed('premium_rank'..G.GAME.round_resets.ante)))
			
			--Pooling Enhancements
			local cen_pool = {}
			for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
				if not v.replace_base_card and not v.disenhancement then 
					cen_pool[#cen_pool+1] = v
				end
			end
			
			local enh = pseudorandom_element(cen_pool, pseudoseed('premium_enhance'))

			card:set_ability(enh)
			
			card:set_edition(edition)
			card:set_seal(SMODS.poll_seal({mod = 10}))
			
			return card
            -- return {set = 'Polymino', area = G.pack_cards, skip_materialize = nil, soulable = nil, key_append = 'vir'}
        end,

        ease_background_colour = function(self) ease_background_colour{new_colour = HEX('62a1b4'), special_colour = HEX('fce1b6'), contrast = 2} end,
	    particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0,0, {
                timer = 0.015,
                scale = 0.3,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = {G.C.BLACK, G.C.GOLD},
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,

        pos = get_coordinates(i+3),
        atlas = 'booster',
		
		weight = premium_booster_rate[i],
    }
end

end


-- Poker Hand Rewrite to support new ranks probably?
-- Currently unused: Straights use SMODS Implementation perfectly fine

local function get_keys(t)
  local keys={}
  for key,_ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

local isAllowDecimal = true

local decimalHands = {['unstb_0.5'] = {0, 1}, ['unstb_e'] = {2, 3}, ['unstb_Pi'] = {3, 4}}

--Unused, redirect the entire straight calculation to ustb_get_straight instead due to straight_edge shenanigans
function ustb_get_straight_wrapper(hand)

	local ret = {}
	if #hand < (5 - (four_fingers and 1 or 0)) then return ret end
	
	local hasDecimal = false
	for i = 1, #hand do
		if decimalHands[hand[i].base.value] then
			hasDecimal = true
			break
		end
	end
	
	return ustb_straight_calculation(hand) 
	
	--[[if hasDecimal then
		--print('Has decimal')
		return ustb_straight_decimal(hand) 
	else
		--print('do not has decimal')
		return get_straight(hand) 
	end]]
end

function ustb_get_straight(hand) 
	--Basically SMOD's implementation of straight_edge
	--But with a slightly different fix to make extra ranks work

	local ret = {}
	local four_fingers = next(SMODS.find_card('j_four_fingers'))
	local can_skip = next(SMODS.find_card('j_shortcut'))
	
	local can_loop = next(SMODS.find_card('j_unstb_portal'))
	
	if #hand < (5 - (four_fingers and 1 or 0)) then return ret end
	
	local t = {}
	local RANKS = {}
	for i = 1, #hand do
		if hand[i]:get_id() > 0 then
			local rank = hand[i].base.value	
			RANKS[rank] = RANKS[rank] or {}
			RANKS[rank][#RANKS[rank] + 1] = hand[i]
		end
	end
	
	local straight_length = 0
	local straight = false
	local skipped_rank = false
	local vals = {}
	for k, v in pairs(SMODS.Ranks) do
		if v.straight_edge then
			table.insert(vals, k)
		end
	end
	
	local init_vals = {}
	for _, v in ipairs(vals) do
		init_vals[v] = true
	end
	if not next(vals) then table.insert(vals, 'Ace') end
	
	local initial = true
	local br = false
	local end_iter = false
	local i = 0
	
	--print(inspect(vals))
	
	--Manually swapping vals because it would not work properly if it starts at Ace
	--However, Ace has to be kept otherwise it allows the loop back
	
	--TODO: Honestly could figure out the proper logic so it can be converted to lovely patch instead
	
	vals[1] = 'unstb_0'
	--vals[2] = 'Ace'
	
	if not can_loop then
		vals[2] = 'Ace'
	end
	
	--If there is no possible RANKS, breaks the function early
	if not next(RANKS) then return ret end
	
	while 1 do
		end_iter = false
		if straight_length >= (5 - (four_fingers and 1 or 0)) then
			straight = true
		end
		i = i + 1
		if br or (i > #SMODS.Rank.obj_buffer + 1) then break end
		if not next(vals) then break end
		for _, val in ipairs(vals) do
			--print(val)
			--print('===')
			if init_vals[val] and not initial and not can_loop then br = true end
			if RANKS[val] then
				straight_length = straight_length + 1
				skipped_rank = false
				for _, vv in ipairs(RANKS[val]) do
					t[#t + 1] = vv
				end
				
				vals = SMODS.Ranks[val].next
				
				--print(inspect(vals))
				--print('---')
				
				initial = false
				end_iter = true
				break
			end
		end
		if not end_iter then
			local new_vals = {}
			for _, val in ipairs(vals) do
				for _, r in ipairs(SMODS.Ranks[val].next) do
					table.insert(new_vals, r)
				end
			end
			vals = new_vals
			if can_skip and not skipped_rank then
				skipped_rank = true
			else
				straight_length = 0
				skipped_rank = false
				if not straight then t = {} end
				if straight then break end
			end
		end
	end
	if not straight then return ret end
	table.insert(ret, t)
	
	return ret
end

SMODS.PokerHandPart:take_ownership('_straight', {
	func = function(hand) return get_straight(hand, next(SMODS.find_card('j_four_fingers')) and 4 or 5, next(SMODS.find_card('j_shortcut')), next(SMODS.find_card('j_unstb_portal'))) end
})

--Generic consumable selection check utility function
--Written this way for Cryptid compatibility
local function get_consumable_use_hand_count(card, hand)
	local selected_cards = {}
	for i = 1, #hand do
		if hand[i] ~= card then selected_cards[#selected_cards+1] = hand[i] end
	end
	return #selected_cards
end

--Returns selected hands excluding itself (in case of Cryptid merged consumable cards)
local function get_selected_cards(card, hand)
	local selected_cards = {}
	for i = 1, #hand do
		if hand[i] ~= card then selected_cards[#selected_cards+1] = hand[i] end
	end
	return selected_cards
end

--Auxiliary Card

if unstb_config.gameplay.c_aux then

SMODS.ConsumableType{
    key = 'Auxiliary',
    primary_colour = HEX('424e54'),
    secondary_colour = G.C.UNSTB_AUX,
    loc_txt = {},
	default = 'c_unstb_aux_seal_move',
    collection_rows = {5, 5}
}

SMODS.UndiscoveredSprite{
    key = 'Auxiliary',
    atlas = 'auxiliary_undiscovered',
    pos = get_coordinates(0)
}

--Booster Pack for Auxiliary Cards

local aux_booster_rate = {1, 1, 1, 0.25}
local aux_booster_cost = {4, 4, 6, 8}

for i = 1, 4 do
    SMODS.Booster{
        key = 'aux_'..(i <= 2 and i or i == 3 and 'jumbo' or 'mega'),
		cost = aux_booster_cost[i],

        config = {extra = i <= 2 and 3 or 5, choose =  i <= 3 and 1 or 2},
        draw_hand = false,

        create_card = function(self, card)
            local card = create_card('Auxiliary', G.pack_cards, nil, nil, true, true, nil, 'aux')
			local neg_chance = pseudorandom('aux_rng')
			
			if neg_chance < 0.4 and G.GAME.used_vouchers.v_unstb_aux2 and card.config.center.key ~= 'c_unstb_aux_dark_matter' then
				 card:set_edition({negative = true}, true)
			end
			
			return card
        end,

        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.UNSTB_AUX)
            ease_background_colour{new_colour = HEX('477978'), special_colour = HEX('00a669'), contrast = 4}
        end,

        pos = get_coordinates(i-1),
        atlas = 'booster',
		
		weight = aux_booster_rate[i],

        --in_pool = function() return (pseudorandom('aux'..G.SEED) < aux_booster_rate[i]) end
    }
end

--Original Reserve Card Button Code from MoreFluff (which credits to Cryptid and Betmma)
G.FUNCS.can_take_card = function(e)
	local card = e.config.ref_table
	
	--If the edition is negative, adds one more buffer to check if you can take it or not
	local neg_buffer = (card.edition or {}).key == 'e_negative' and 1 or 0
	
	if #G.consumeables.cards < G.consumeables.config.card_limit + neg_buffer then
		  e.config.colour = G.C.GREEN
		  e.config.button = "take_card"
	else
		  e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		  e.config.button = nil
	end
end

G.FUNCS.take_card = function(e)
local c1 = e.config.ref_table
G.E_MANAGER:add_event(Event({
  trigger = "after",
  delay = 0.1,
  func = function()
	c1.area:remove_card(c1)
	c1:add_to_deck()
	if c1.children.price then
	  c1.children.price:remove()
	end
	c1.children.price = nil
	if c1.children.buy_button then
	  c1.children.buy_button:remove()
	end
	c1.children.buy_button = nil
	remove_nils(c1.children)
	
	play_sound('generic1')
	
	G.consumeables:emplace(c1)
	G.GAME.pack_choices = G.GAME.pack_choices - 1
	if G.GAME.pack_choices <= 0 then
	  G.FUNCS.end_consumeable(nil, delay_fac)
	end
	return true
  end,
}))
end

local G_UIDEF_card_focus_ui_ref = G.UIDEF.card_focus_ui

function G.UIDEF.card_focus_ui(card)
	base_background = G_UIDEF_card_focus_ui_ref(card)
	local card_width = card.T.w + (card.ability.consumeable and -0.1 or card.ability.set == 'Voucher' and -0.16 or 0)
	local base_attach = base_background:get_UIE_by_ID('ATTACH_TO_ME')
	
	if ((card.area == G.pack_cards and G.pack_cards)) and card.ability.consumeable and card.ability.set == "Auxiliary" then
    base_attach.children.use = G.UIDEF.card_focus_button{
      card = card, parent = base_attach, type = 'select',
      func = 'can_take_card', button = 'use_card', card_width = card_width
    }
  end

	return base_background
end

local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
	if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a take button for Auxiliary pack
	  if card.ability.set == "Auxiliary" then
		return {
		  n = G.UIT.ROOT,
		  config = { padding = -0.1, colour = G.C.CLEAR },
		  nodes = {
			{
			  n = G.UIT.R,
			  config = {
				ref_table = card,
				r = 0.08,
				padding = 0.1,
				align = "bm",
				minw = 0.5 * card.T.w - 0.15,
				minh = 0.7 * card.T.h,
				maxw = 0.7 * card.T.w - 0.15,
				hover = true,
				shadow = true,
				colour = G.C.UI.BACKGROUND_INACTIVE,
				one_press = true,
				button = "use_card",
				func = "can_take_card",
			  },
			  nodes = {
				{
				  n = G.UIT.T,
				  config = {
					text = 'SELECT',
					colour = G.C.UI.TEXT_LIGHT,
					scale = 0.55,
					shadow = true,
				  },
				},
			  },
			},
		  },
		}
	  end
	end
	return G_UIDEF_use_and_sell_buttons_ref(card)
end

--Auxiliary Cards Code Starts Here--

if unstb_config.gameplay.seal_suit then

--Suit Seals Addition Cards
for i = 1, #suit_seal_list do
	SMODS.Consumable{
		set = 'Auxiliary', atlas = 'auxiliary',
		key = 'aux_'..string.lower(suit_seal_list[i]), 

		config = {extra = {count = 2, seal = 'unstb_'..string.lower(suit_seal_list[i])}},
		--discovered = true,

		loc_vars = function(self, info_queue, card)
			local suit = localize(suit_seal_list[i], 'suits_singular') ..' Seal'
			local suit_color = G.C.SUITS[suit_seal_list[i]]
			
			info_queue[#info_queue+1] = {set = 'Other', key = 'suit_seal'}
			
			return {vars = {card.ability.extra.count, suit, colours = {suit_color}}}
		end,

		can_use = function(self, card)
			if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) >= 1 and get_consumable_use_hand_count(card, G.hand.highlighted) <= card.ability.extra.count) then
				return true
			end
			return false
		end,

		use = function(self, card)
			
			event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
			for i = 1, #G.hand.highlighted do
			event({trigger = 'after', delay = 0.2,
				func = function()
						G.hand.highlighted[i]:set_seal(card.ability.extra.seal, nil, true)
				return true end })
			end
				
			delay(0.5)
			event({trigger = 'after', delay = 0.2,
				func = function()
					G.hand:unhighlight_all();
				return true end })
			
			
		end,

		pos = get_coordinates(i+1),
	}
end

--Face Seal Card
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_face', 

	config = {extra = {count = 2, seal = 'unstb_face'}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'unstb_face_seal'}
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) >= 1 and get_consumable_use_hand_count(card, G.hand.highlighted) <= card.ability.extra.count) then
			return true
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		for i = 1, #G.hand.highlighted do
		event({trigger = 'after', delay = 0.2,
			func = function()
					G.hand.highlighted[i]:set_seal(card.ability.extra.seal, nil, true)
			return true end })
		end
			
		delay(0.5)
		event({trigger = 'after', delay = 0.2,
			func = function()
				G.hand:unhighlight_all();
			return true end })
		
		
	end,

	pos = get_coordinates(6),
}

end

-- +2
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_plus_two', 

	config = {extra = {count = 2}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		local selected_hands = get_selected_cards(card, G.hand.highlighted)
		if G.hand and (#selected_hands == 1) and not selected_hands[1].config.center.no_suit then
			return true
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		local targetCard = G.hand.highlighted[1]
		
		event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
                    local cards = {}
                    for i=1, card.ability.extra.count do
                        local _rank = pseudorandom_element(SMODS.Ranks, pseudoseed('aux_plus_two')) or SMODS.Ranks['2']
                        local _suit = SMODS.Suits[targetCard.base.suit]
						
                        cards[i] = create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = G.P_CENTERS.c_base}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    end
                    playing_card_joker_effects(cards)
                    return true end })
	end,

	pos = get_coordinates(7),
}

-- Wild +4
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_plus_four_wild', 

	config = {extra = {count = 4}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		local selected_hands = get_selected_cards(card, G.hand.highlighted)
		if G.hand and (#selected_hands == 1) and not SMODS.has_no_rank(selected_hands[1]) then
			return true
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		local targetCard = G.hand.highlighted[1]
		
		event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
                    local cards = {}
                    for i=1, card.ability.extra.count do
                        local _rank = SMODS.Ranks[targetCard.base.value]
                        local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('aux_wild_plus_four')) or SMODS.Suits['Spades']
						
                        cards[i] = create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = G.P_CENTERS.c_base}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    end
                    playing_card_joker_effects(cards)
                    return true end })
	end,

	pos = get_coordinates(8),
}

-- In-round Instants
local function get_instant_effect(id, amount)
	if id == 3 then
		ease_hands_played(amount)
	elseif id == 1 then
		ease_discard(amount)
	elseif id == 2 then
		--Base game has this for tags, so I utilize them here
		G.hand:change_size(amount)
		G.FUNCS.draw_from_deck_to_hand(amount)
		
        G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + amount
	else
		forced_message("Nope!", currentCard, G.C.PURPLE, true)
	end
end

local aux_instants = {'aux_inst_disc', 'aux_inst_hsize', 'aux_inst_hand'}

for i = 1, #aux_instants do
	SMODS.Consumable{
		set = 'Auxiliary', atlas = 'auxiliary',
		key = aux_instants[i], 

		config = {extra = {amount = 3}},
		--discovered = true,

		loc_vars = function(self, info_queue, card)
			return {vars = {card.ability.extra.amount}}
		end,

		can_use = function(self, card)
			--Only usable in-round. I can't believe it had to be checked *this much*
			return G.hand and not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack
		end,

		use = function(self, card)
			
			event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
			event({
					trigger = 'after',
					delay = 0.2,
					func = function() 
							play_sound('generic1')
					
							get_instant_effect(i, card.ability.extra.amount)
					return true end })
		end,

		pos = get_coordinates(8+i),
	}
end

--Seal Swap
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_seal_move', 

	config = {extra = {}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,

	can_use = function(self, card)
		if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) == 2) then
			return true
		end
		return false
	end,

	use = function(self, card)
		local card_l_seal = G.hand.highlighted[1].seal
		
		--Animation code mostly ported from basegame tarot
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end })
        end
        delay(0.2)
		
		--Handle the conversion
		event({trigger = 'after',delay = 0.1,func = function()
                    G.hand.highlighted[1]:set_seal(G.hand.highlighted[2].seal, true, true)
					G.hand.highlighted[2]:set_seal(card_l_seal, true, true)
					
					--If a heal seal is on disenhanced card, heal it
					for i=1, #G.hand.highlighted do
						if G.hand.highlighted[i].config.center.disenhancement and G.hand.highlighted[i].seal == 'unstb_heal' then
							G.hand.highlighted[i]:heal()
						end
					end
					
					
                    return true end })
		
		for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end })
        end
        event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end })
        delay(0.5)
	end,

	pos = get_coordinates(12),
}

if unstb_config.rank.rank_binary then

--All for One
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_conv_1', 

	config = {extra = {count = 3}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) >= 1) and (get_consumable_use_hand_count(card, G.hand.highlighted) <= card.ability.extra.count) then
			return true
		end
		return false
	end,

	use = function(self, card)
		--Enable Rank Flag
		setPoolRankFlagEnable('unstb_1', true);
	
		--Animation code mostly ported from basegame tarot
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end })
        end
        delay(0.2)
		
		--Handle the conversion
		for i=1, #G.hand.highlighted do
		event({trigger = 'after',delay = 0.1,func = function()
                    SMODS.change_base(G.hand.highlighted[i], G.hand.highlighted[i].base.suit, 'unstb_1')
                    return true end })
		end
		
		for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end })
        end
        event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end })
        delay(0.5)
	end,

	pos = get_coordinates(13),
}

end

if unstb_config.rank.rank_21 then

--The Twenty-One
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_21', 

	config = {extra = {count = 5}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		local selected_hands = get_selected_cards(card, G.hand.highlighted)
		if G.hand and (#selected_hands >= 1) and (#selected_hands <= card.ability.extra.count) and blackJack_evalrank(selected_hands, 21)>=21 then
			return true
		end
		return false
	end,

	use = function(self, card)
		--Enable Rank Flag
		setPoolRankFlagEnable('unstb_21', true);
	
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		--Populate removed cards
		local destroyed_cards = {}
		for i = 1, #G.hand.highlighted do destroyed_cards[#destroyed_cards+1] = G.hand.highlighted[i] end
		
		--Destroy Selected Card
		event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    for i=#destroyed_cards, 1, -1 do
                        local c = destroyed_cards[i]
                        if c.ability.name == 'Glass Card' then 
                            c:shatter()
                        else
                            c:start_dissolve(nil, i == #destroyed_cards)
                        end
                    end
                    return true end })
		--Adds Card
		event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
					local _rank = SMODS.Ranks['unstb_21']
					local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('aux_21')) or SMODS.Suits['Spades']
					
					local cards = create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = G.P_CENTERS.c_base}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    playing_card_joker_effects({cards})
                    return true end })
					
		--Call joker calculations for post-destroyed stuff
		delay(0.3)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
        end
	end,

	pos = get_coordinates(14),
}

end

if check_enable_taglist({'edition_upgrade', 'enh_disenh'}) then

--Monkey Paw
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_upgrade', 

	config = {extra = {}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = {set = 'Other', key = 'upgrade_edition'}
		info_queue[#info_queue+1] = {set = 'Other', key = 'poison_tooltip'}
	
		return {vars = {}}
	end,

	can_use = function(self, card)
		if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) == 1) then
			return true
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
		local selected_card = G.hand.highlighted[1]
		local selected_index
			
		local poisoned_card = {}
		
		--look for two adjacent cards in hand
		for i=1, #G.hand.cards do
			if G.hand.cards[i] == selected_card then
				selected_index = i
			end
		end
		
		--print(selected_index)
		
		--Cover edge cases
		
		local handCount = #G.hand.cards
		
		if handCount >=3 then --If the hand has 3 cards or more, pick two adjacent cards to poison
			if selected_index>1 then
				poisoned_card[1] = G.hand.cards[selected_index-1]
			else
				poisoned_card[1] = G.hand.cards[handCount]
			end
			
			if selected_index<handCount then
				poisoned_card[2] = G.hand.cards[selected_index+1]
			else
				poisoned_card[2] = G.hand.cards[1]
			end
		elseif #G.hand.cards ==2 then --If the hand has only 2 cards, only one other card can be poisoned
			if selected_index == 1 then
				poisoned_card[1] = G.hand.cards[2]
			else
				poisoned_card[1] = G.hand.cards[1]
			end
		end
		
		for i=1, #poisoned_card do
            local percent = 1.15 - (i-0.999)/(#poisoned_card-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() poisoned_card[i]:flip();play_sound('card1', percent);poisoned_card[i]:juice_up(0.3, 0.3);return true end })
        end
        delay(0.2)
		
		--Handle the conversion
		event({trigger = 'after',delay = 0.1,func = function()
                    edition_upgrade(selected_card)
                    return true end })
		for i=1, #poisoned_card do
		event({trigger = 'after',delay = 0.1,func = function()
                    poisoned_card[i]:set_disenhancement(G.P_CENTERS.m_unstb_poison)
                    return true end })
		end
		
		for i=1, #poisoned_card do
            local percent = 0.85 + (i-0.999)/(#poisoned_card-0.998)*0.3
            event({trigger = 'after',delay = 0.15,func = function() poisoned_card[i]:flip();play_sound('tarot2', percent, 0.6);poisoned_card[i]:juice_up(0.3, 0.3);return true end })
        end
        event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end })
        delay(0.5)
		
		
	end,

	pos = get_coordinates(15),
}

end

if unstb_config.enh.enh_disenh then

--Heal Seal Card
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_heal', 

	config = {extra = {count = 1, seal = 'unstb_heal'}},
	--discovered = true,
	
	weight = 10, --Large chance to appear when it is needed

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'unstb_heal_seal'}
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) == card.ability.extra.count) then
			return true
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		for i = 1, #G.hand.highlighted do
		event({trigger = 'after', delay = 0.2,
			func = function()
					G.hand.highlighted[i]:set_seal(card.ability.extra.seal, nil, true)
					
					--If the selected card has DisEnhancements, heal it
					if G.hand.highlighted[i].config.center.disenhancement then
						G.hand.highlighted[i]:heal()
						play_sound('unstb_heal', 1, 0.3)
						
						forced_message("Healed!", G.hand.highlighted[i], G.C.GREEN, true)	
					end
			return true end })
		end
			
		delay(0.5)
		event({trigger = 'after', delay = 0.2,
			func = function()
				G.hand:unhighlight_all();
			return true end })
		
		
	end,

	pos = get_coordinates(16),
	
	--Can spawn only when more than 10 cards the deck is Disenhanced
	in_pool = function(self, args)
	
		--For some reason, not checking this crash Cryptid on start up
		if not G.playing_cards then return false end
	
		local count = 0
		
		for k, v in ipairs(G.playing_cards) do
			if v.config.center.disenhancement then
				count = count+1
			end
		end
	
        return count > 10
    end,
}

--Heal Hand
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_heal_hand', 

	config = {extra = {}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'disenhancement'}
		
		return {vars = {card.ability.extra.count}}
	end,
	
	weight = 10, --Large chance to appear when it is needed

	can_use = function(self, card)
		--Usable only in-game
		if G.hand and not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack then
			
			--Check if the hand contains at least one DisEnhancements
			for i = 1, #G.hand.cards do
				if G.hand.cards[i].config.center.disenhancement then
					return true
				end
			end
			
			return false
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		--Populate List of cards to heal
		local heal_cards = {}
		for i = 1, #G.hand.cards do
				if G.hand.cards[i].config.center.disenhancement then
					heal_cards[#heal_cards+1] = G.hand.cards[i]
				end
			end
		
		if #heal_cards>0 then
			play_sound('unstb_heal', 1, 0.3)
		end
		
		for i = 1, #heal_cards do
			event({trigger = 'after', delay = 0.1, func = function()
						heal_cards[i]:heal()
						play_sound('tarot2', 1, 0.4)
						heal_cards[i]:juice_up()
						return true
					end
				})
		end
		
	end,

	pos = get_coordinates(17),
	
	--Can spawn only when more than 1/4 of deck is Disenhanced
	in_pool = function(self, args)
	
		--For some reason, not checking this crash Cryptid on start up
		if not G.playing_cards then return false end
	
		local count = 0
		
		for k, v in ipairs(G.playing_cards) do
			if v.config.center.disenhancement then
				count = count+1
			end
		end
	
        return count > #G.playing_cards * 0.25
    end,
}

end

--Lottery
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_lottery', 

	config = {extra = {odds_win = 4, prize = 20}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_win, card.ability.extra.prize }}
	end,

	can_use = function(self, card)
		return true
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
		event({trigger = 'after', func = function()
						if pseudorandom('aux_lottery'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_win then
							ease_dollars(20, true)
						else
							--Port from Wheel of Fortune
							event({trigger = 'after', delay = 0.4, func = function()
								attention_text({
									text = localize('k_nope_ex'),
									scale = 1.3, 
									hold = 1.4,
									major = card,
									backdrop_colour = G.C.UNSTB_AUX,
									align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and 'tm' or 'cm',
									offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0},
									silent = true
									})
									event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
										play_sound('tarot2', 0.76, 0.4);return true end})
									play_sound('tarot2', 1, 0.4)
									card:juice_up(0.3, 0.5)
							return true end })
						end
						return true
					end
				})
	end,

	pos = get_coordinates(18),
}

--Blank
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_blank', 

	config = {extra = {}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,

	can_use = function(self, card)
		return true
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
		event({trigger = 'after', func = function()
						G.GAME.aux_blank_count = (G.GAME.aux_blank_count or 0) + 1
						return true
					end
				})
	end,

	pos = get_coordinates(0),
	
	in_pool = function(self, args)
		if not G.GAME then return false end
		
        return G.booster_pack and (G.GAME.aux_blank_count or 0) < (G.GAME.aux_blank_max_count or 2)
    end,
}

--Dark Matter
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_dark_matter', 

	config = {extra = {slot = 1}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
	
		local key = self.key
		if (card.edition or {}).key == 'e_negative' then
			key = self.key..'_n'
		end
	
		return {key = key, vars = {card.ability.extra.slot}}
	end,

	can_use = function(self, card)
		return G.jokers.config.card_limit > 0
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
		G.GAME.aux_blank_count = 0
		
		--Increase the count for the next Dark Matter
		G.GAME.aux_blank_max_count = (G.GAME.aux_blank_max_count or 2)+1
			
		event({trigger = 'after', func = function()
						if (card.edition or {}).key == 'e_negative' then
							G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.slot
						else
							G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slot
						end
						return true
					end
				})
	end,

	pos = get_coordinates(20),
	
	--Can spawn only when redeemed Blank Auxiliary Card enough time
	in_pool = function(self, args)
		if not G.GAME then return false end
		
        return G.booster_pack and (G.GAME.aux_blank_count or 0) >= (G.GAME.aux_blank_max_count or 2)
    end,
}

--Random
SMODS.Consumable{
	set = 'Auxiliary', atlas = 'auxiliary',
	key = 'aux_random', 

	config = {extra = {count = 2}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		return true
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
		for i = 1, math.min(card.ability.extra.count, G.consumeables.config.card_limit - #G.consumeables.cards) do
            event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    local c = create_card('Auxiliary', G.consumeables, nil, nil, nil, nil, nil, 'aux_random')
                    c:add_to_deck()
                    G.consumeables:emplace(c)
                    card:juice_up(0.3, 0.5)
                end
                return true end })
        end
        delay(0.6)
	end,

	pos = get_coordinates(19),
}

end

--Other Basegame Consumable Supports for new features

--Tarots

--main function for all three tarots
local function conversionTarot(hand, newcenter)
	--Animation ported from basegame Tarot
	
	for i=1, #hand do
		local percent = 1.15 - (i-0.999)/(#hand-0.998)*0.3
		event({trigger = 'after',delay = 0.15,func = function() hand[i]:flip();play_sound('card1', percent);hand[i]:juice_up(0.3, 0.3);return true end })
	end
	delay(0.2)
	
	--Handle the conversion
	for i=1, #hand do
	event({trigger = 'after',delay = 0.1,func = function()
				hand[i]:set_ability(G.P_CENTERS[newcenter])
				return true end })
	end
	
	for i=1, #hand do
		local percent = 0.85 + (i-0.999)/(#hand-0.998)*0.3
		event({trigger = 'after',delay = 0.15,func = function() hand[i]:flip();play_sound('tarot2', percent, 0.6);hand[i]:juice_up(0.3, 0.3);return true end })
	end
	event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end })
	delay(0.5)
end

if unstb_config.enh.enh_custom then

--The Time
SMODS.Consumable{
	set = 'Tarot', atlas = 'tarot',
	key = 'trt_time', 
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize("k_tarot_exclaim"), get_type_colour(self or card.config, card), nil, 1.2)
    end,

	config = {extra = {count = 2}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_vintage']
	
		return {vars = {card and card.ability.extra.count or self.config.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) >= 1) and (get_consumable_use_hand_count(card, G.hand.highlighted) <= card.ability.extra.count) then
			return true
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			
			--Special Interaction: If it is a Vintage Card already, reset the breakdown chance
			if G.hand.highlighted[1].config.center.key == 'm_unstb_vintage' then
				G.hand.highlighted[1].ability.extra.current_odd = 0
			end
			
			conversionTarot(G.hand.highlighted, 'm_unstb_vintage')
	end,

	pos = get_coordinates(0),
}

--The Acorn
SMODS.Consumable{
	set = 'Tarot', atlas = 'tarot',
	key = 'trt_acorn', 
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize("k_tarot_exclaim"), get_type_colour(self or card.config, card), nil, 1.2)
    end,

	config = {extra = {count = 1}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = {set = 'Other', key = 'acorn_tooltip'}
	
		return {vars = {card and card.ability.extra.count or self.config.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) >= 1) and (get_consumable_use_hand_count(card, G.hand.highlighted) <= card.ability.extra.count) then
			return true
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			conversionTarot(G.hand.highlighted, 'm_unstb_acorn')
	end,

	pos = get_coordinates(1),
}

--The Greed
SMODS.Consumable{
	set = 'Tarot', atlas = 'tarot',
	key = 'trt_greed', 
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize("k_tarot_exclaim"), get_type_colour(self or card.config, card), nil, 1.2)
    end,

	config = {extra = {count = 2}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_promo']
	
		return {vars = {card and card.ability.extra.count or self.config.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and (get_consumable_use_hand_count(card, G.hand.highlighted) >= 1) and (get_consumable_use_hand_count(card, G.hand.highlighted) <= card.ability.extra.count) then
			return true
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
			conversionTarot(G.hand.highlighted, 'm_unstb_promo')
	end,

	pos = get_coordinates(2),
}

end

--New Rank-based Tarot

local tarot_half_rankList = {['unstb_0'] = 'unstb_0',
							['unstb_1'] = 'unstb_0',
							['2'] = 'unstb_1',
							['3'] = 'unstb_1',
							['4'] = '2',
							['5'] = '2',
							['6'] = '3',
							['7'] = '3',
							['8'] = '4',
							['9'] = '4',
							['10'] = '5',
							['Ace'] = '5',
							['unstb_11'] = '5',
							['unstb_12'] = '6',
							['unstb_13'] = '6',
							['unstb_21'] = '10',
							['unstb_25'] = 'unstb_12',
							['unstb_161'] = 'unstb_???',} --tbh this is Unnecessary cruel but maybe it's for the best
							
if check_enable_taglist({'rank_binary', 'rank_decimal'}) then

SMODS.Consumable{
	set = 'Tarot', atlas = 'tarot',
	key = 'trt_half', 
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize("k_tarot_exclaim"), get_type_colour(self or card.config, card), nil, 1.2)
    end,

	config = {extra = {count = 2}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)

		return {vars = {}}
	end,

	can_use = function(self, card)
		local selected_hands = get_selected_cards(card, G.hand.highlighted)
		if G.hand and (#selected_hands == 1) and not selected_hands[1].config.center.replace_base_card and tarot_half_rankList[selected_hands[1].base.value] then
			return true
		end
		return false
	end,

	use = function(self, card)
			event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				card:juice_up(0.3, 0.5)
            return true end })
			
			local target_card = G.hand.highlighted[1]
			
			--Create two copies of the card, with half rank
			--Create one additional rank 0.5 card if applicable, copy the enhancement only, no other bonus property
			
			local new_rank = tarot_half_rankList[target_card.base.value]
			
			local extra_card = 0
			
			if target_card.base.nominal%2 ==1 then
				extra_card = 1
				
				--Enable Rank Flag
				setPoolRankFlagEnable('unstb_0.5', true);
			end
			
			event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
						local _first_dissolve = nil
						local new_cards = {}
						for i = 1, card.ability.extra.count + extra_card do
							G.playing_card = (G.playing_card and G.playing_card + 1) or 1
							local _card = copy_card(target_card, nil, nil, G.playing_card)
							
							if extra_card>0 and i==card.ability.extra.count + extra_card then
								--Remove special ability
								--_card.set_ability(G.P_CENTERS.c_base)
								_card:set_edition(nil, true, true)
								_card:set_seal(nil, true, true)
								_card.ability.perma_bonus = 0
								
								SMODS.change_base(_card, nil, 'unstb_0.5')
							else
								SMODS.change_base(_card, nil, new_rank)
							end
							
							_card:add_to_deck()
							G.deck.config.card_limit = G.deck.config.card_limit + 1
							table.insert(G.playing_cards, _card)
							G.hand:emplace(_card)
							_card:start_materialize(nil, _first_dissolve)
							_first_dissolve = true
							new_cards[#new_cards+1] = _card
						end
						playing_card_joker_effects(new_cards)
                    return true end })
			
			
			--Destroy the original card
			local destroyed_cards = {target_card}
			event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    for i=#destroyed_cards, 1, -1 do
                        local c = destroyed_cards[i]
                        if c.ability.name == 'Glass Card' then 
                            c:shatter()
                        else
                            c:start_dissolve(nil, i == #destroyed_cards)
                        end
                    end
                    return true end })
					
			--Calling Jokers to process the card destroying
			--Edit: Disable this part for now, technically it should not be counted as destroying card because the new card is considered a split
			
			--[[delay(0.3)
			for i = 1, #G.jokers.cards do
				G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
			end]]
			
	end,

	pos = get_coordinates(3),
}

end

if unstb_config.rank.rank_decimal then

SMODS.Consumable{
	set = 'Tarot', atlas = 'tarot',
	key = 'trt_knowledge', 
	set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize("k_tarot_exclaim"), get_type_colour(self or card.config, card), nil, 1.2)
    end,

	config = {extra = {count = 1}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)

		return {vars = {}}
	end,

	can_use = function(self, card)
		local selected_hands = get_selected_cards(card, G.hand.highlighted)
		if G.hand and (#selected_hands == 1) and not selected_hands[1].config.center.replace_base_card then
			return true
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		local targetCard = G.hand.highlighted[1]
		
		event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
                    local cards = {}
                    for i=1, card.ability.extra.count do
						local created_rank = pseudorandom_element({'unstb_0.5', 'unstb_r2', 'unstb_e', 'unstb_Pi'}, pseudoseed('trt_knowledge'))
						setPoolRankFlagEnable(created_rank, true)
						
                        local _rank = SMODS.Ranks[created_rank]
                        local _suit = SMODS.Suits[targetCard.base.suit]
						
                        cards[i] = create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = G.P_CENTERS.c_base}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    end
                    playing_card_joker_effects(cards)
                    return true end })
		event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end })
			
	end,

	pos = get_coordinates(4),
}
end

--"Rebundant" Spectral (Same ability set as some Auxiliary exclusives, but worse)

if unstb_config.gameplay.c_rebundant then

if unstb_config.enh.enh_disenh then

--Elixir of Life
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_elixir', 

	config = {extra = {}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'disenhancement'}
		
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		--Check the entire deck
		for k, v in ipairs(G.playing_cards) do
			if v.config.center.disenhancement then
				return true
			end
		end
			
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		--Populate List of cards to heal
		local heal_cards = {}
		
		for k, v in ipairs(G.playing_cards) do
			if v.config.center.disenhancement then
				heal_cards[#heal_cards+1] = v
			end
		end
		
		if #heal_cards>0 then
			play_sound('unstb_heal', 1, 0.3)
		end
		
		for i = 1, #heal_cards do
			if heal_cards[i].area == G.hand then --If card is in hand, play animation
				event({trigger = 'after', delay = 0.1, func = function()
						heal_cards[i]:heal()
						play_sound('tarot2', 1, 0.4)
						heal_cards[i]:juice_up()
						return true
					end
				})
			else --Otherwise, just heal
				heal_cards[i]:heal()
			end
			
		end
		
		--Reduce Money if it's greater than 0, otherwise do nothing
		if G.GAME.dollars > 0 then
            ease_dollars(-math.ceil(G.GAME.dollars*0.5), true)
        end
	end,
	
	weight = 10, --Large chance to appear when it is needed

	pos = get_coordinates(0),
	
	--Can spawn only when more than 1/3 of deck is Disenhanced
	in_pool = function(self, args)
	
		--For some reason, not checking this crash Cryptid on start up
		if not G.playing_cards then return false end
	
		local count = 0
		
		for k, v in ipairs(G.playing_cards) do
			if v.config.center.disenhancement then
				count = count+1
			end
		end
	
        return count > #G.playing_cards * 0.3
    end,
}

end

if unstb_config.gameplay.seal_suit then

--Vessel
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_vessel', 

	config = {extra = {count = 4}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'suit_seal'}
		return {vars = {card.ability.extra.count}}
	end,

	can_use = function(self, card)
		local selected_hands = get_selected_cards(card, G.hand.highlighted)
	
		if G.hand and (#selected_hands > 1 and #selected_hands <= card.ability.extra.count) then
		
			local targetCard = selected_hands[1]
			--Sort to get the actual target card
            for i=1, #selected_hands do if selected_hands[i].T.x < targetCard.T.x then targetCard = selected_hands[i] end end
		
			return not targetCard.config.center.no_suit and (unstb_global.SUIT_SEAL[targetCard.base.suit] or {}).seal_key
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		--Figure out what is left card, what is the left card
		local targetCard = G.hand.highlighted[1]
		--Sort to get the actual target card
        for i=1, #G.hand.highlighted do if G.hand.highlighted[i].T.x < targetCard.T.x then targetCard = G.hand.highlighted[i] end end
		
		--Adds Suit Seal to the right card (or none, if there's no matching suit)
		local suit_seal = (unstb_global.SUIT_SEAL[targetCard.base.suit] or {}).seal_key
		
		for i=1, #G.hand.highlighted do
			if G.hand.highlighted[i] ~= targetCard then
				G.hand.highlighted[i]:set_seal(suit_seal, nil, true)
			end
		end		
		
		--Destroy the leftmost card
		local destroyed_cards = {targetCard}
		
		event({
			trigger = 'after',
			delay = 0.1,
			func = function() 
				for i=#destroyed_cards, 1, -1 do
					local c = destroyed_cards[i]
					if c.ability.name == 'Glass Card' then 
						c:shatter()
					else
						c:start_dissolve(nil, i == #destroyed_cards)
					end
				end
				return true end })
		--Calling Jokers to process the card destroying
		delay(0.3)
		for i = 1, #G.jokers.cards do
			G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
		end
	end,

	pos = get_coordinates(1),
}

--Conferment
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_conferment', 

	config = {extra = {count = 4, cost = 8}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'unstb_face_seal'}
		return {vars = {card and card.ability.extra.count or self.config.extra.count, card and card.ability.extra.cost or self.config.extra.cost}}
	end,

	can_use = function(self, card)
		if G.hand and #G.hand.cards > 1 then
		
			--Check if the hand contains at least one non-face card
			for i = 1, #G.hand.cards do
				if not G.hand.cards[i]:is_face() then
					return true
				end
			end
			
			return false
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		

		for i = 1, card.ability.extra.count do
		
			event({
			trigger = 'after',
			delay = 0.2,
			func = function() 
			local hand_card = {}
		
			--Pool All eligible cards in hand, this has to be done each repetition
			--Maybe there could be a prettier way for this?
			for i = 1, #G.hand.cards do
				if not G.hand.cards[i]:is_face() then
					hand_card[#hand_card+1] = G.hand.cards[i]
				end
			end
			
			local target_card = pseudorandom_element(hand_card, pseudoseed('conferment'))
			
			if target_card then
				target_card:set_seal('unstb_face', nil, true)
			end
			return true end
			})
			
		end
		
		--Always decrease regardless of the current money
		ease_dollars(-card.ability.extra.cost, true)
		
	end,

	pos = get_coordinates(2),
}

end

if unstb_config.rank.rank_binary then

--Amnesia
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_amnesia', 

	config = {extra = {count = 3}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)

		return {vars = {card and card.ability.extra.count or self.config.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and #G.hand.cards > 1 then
		
			--Check if the hand contains at least one non-face card
			for i = 1, #G.hand.cards do
				if not G.hand.cards[i]:is_face() then
					return true
				end
			end
			
			return false
		end
		return false
	end,

	use = function(self, card)
		--Enable Rank Flag
		setPoolRankFlagEnable('unstb_0', true);
	
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		--Based on Basegame's Immolate
		local converted_card = {}
		
		local temp_hand = {}
		for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
		table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
		pseudoshuffle(temp_hand, pseudoseed('amnesia'))

		for i = 1, card.ability.extra.count do converted_card[#converted_card+1] = temp_hand[i] end
		
		if #converted_card > 0 then
			--Animation from Basegame Tarot
			for i=1, #converted_card do
				local percent = 1.15 - (i-0.999)/(#converted_card-0.998)*0.3
				event({trigger = 'after',delay = 0.15,func = function() converted_card[i]:flip();play_sound('card1', percent);converted_card[i]:juice_up(0.3, 0.3);return true end })
			end
			delay(0.2)
			
			--Handle the conversion
			for i=1, #converted_card do
			event({trigger = 'after',delay = 0.1,func = function()
						SMODS.change_base(converted_card[i], nil, 'unstb_0')
						return true end })
			end
			
			for i=1, #converted_card do
				local percent = 0.85 + (i-0.999)/(#converted_card-0.998)*0.3
				event({trigger = 'after',delay = 0.15,func = function() converted_card[i]:flip();play_sound('tarot2', percent, 0.6);converted_card[i]:juice_up(0.3, 0.3);return true end })
			end
			delay(0.5)
		end
	end,

	pos = get_coordinates(3),
}

end

if unstb_config.rank.rank_21 then

--Altar
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_altar', 

	config = {extra = {destroy_count = 4, create_count = 3}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)

		return {vars = {card and card.ability.extra.destroy_count or self.config.extra.destroy_count, card and card.ability.extra.create_count or self.config.extra.create_count}}
	end,

	can_use = function(self, card)
		if G.hand and #G.hand.cards > 1 then
			return true
		end
		return false
	end,

	use = function(self, card)
		--Enable Rank Flag
		setPoolRankFlagEnable('unstb_21', true);
	
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		--Based on Basegame's Immolate
		local destroyed_cards = {}
		
		local temp_hand = {}
		for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
		table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
		pseudoshuffle(temp_hand, pseudoseed('altar'))

		for i = 1, card.ability.extra.destroy_count do destroyed_cards[#destroyed_cards+1] = temp_hand[i] end
		
		--Destroy Cards
		event({
			trigger = 'after',
			delay = 0.1,
			func = function() 
				for i=#destroyed_cards, 1, -1 do
					local c = destroyed_cards[i]
					--print(c)
					
					if c.ability.name == 'Glass Card' then 
						c:shatter()
					else
						c:start_dissolve(nil, i == #destroyed_cards)
					end
				end
				return true end })
		--Calling Jokers to process the card destroying
		delay(0.3)
		--print('joker')
		for i = 1, #G.jokers.cards do
			G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
		end
		
		--Adding New Cards
		event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
                    local cards = {}
                    for i=1, card.ability.extra.create_count do
                        local _rank = SMODS.Ranks['unstb_21']
                        local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('altar')) or SMODS.Suits['Spades']
						
						--Pooling Enhancements
						local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if not v.replace_base_card and not v.disenhancement then 
                                cen_pool[#cen_pool+1] = v
                            end
                        end
						
                        cards[i] = create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = pseudorandom_element(cen_pool, pseudoseed('altar'))}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    end
                    playing_card_joker_effects(cards)
                    return true end })
		
	end,

	pos = get_coordinates(4),
}

end

if check_enable_taglist({'edition_upgrade', 'enh_disenh'}) then

--Devil's Contract
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_contract', 

	config = {extra = {upgrade_count = 2, disenc_count = 2}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)

		info_queue[#info_queue+1] = {set = 'Other', key = 'upgrade_edition'}
		info_queue[#info_queue+1] = {set = 'Other', key = 'disenhancement'}

		return {vars = {card and card.ability.extra.upgrade_count or self.config.extra.upgrade_count, card and card.ability.extra.disenc_count or self.config.extra.disenc_count}}
	end,

	can_use = function(self, card)
		if G.hand and #G.hand.cards > 1 then
			return true
		end
		return false
	end,

	use = function(self, card)
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		--Based on Basegame's Immolate
		local upgrade_card = {}
		local disenc_card = {}
		
		local temp_hand = {}
		for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
		table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
		pseudoshuffle(temp_hand, pseudoseed('dvcontract'))

		for i = 1, card.ability.extra.upgrade_count do upgrade_card[#upgrade_card+1] = temp_hand[i] end
		for i = card.ability.extra.upgrade_count+1, card.ability.extra.upgrade_count+card.ability.extra.disenc_count  do disenc_card[#disenc_card+1] = temp_hand[i] end
		
		--Upgrade the card
		for i=1, #upgrade_card do
		event({trigger = 'after',delay = 0.1,func = function()
                    edition_upgrade(upgrade_card[i])
                    return true end })
		end
		
		--Disenhanced the Remaining Cards
		if #disenc_card > 0 then
			--Animation from Basegame Tarot
			for i=1, #disenc_card do
				local percent = 1.15 - (i-0.999)/(#disenc_card-0.998)*0.3
				event({trigger = 'after',delay = 0.15,func = function() disenc_card[i]:flip();play_sound('card1', percent);disenc_card[i]:juice_up(0.3, 0.3);return true end })
			end
			delay(0.2)
			
			--Handle the conversion
			for i=1, #disenc_card do
			event({trigger = 'after',delay = 0.1,func = function()		
						disenc_card[i]:set_ability(G.P_CENTERS[pseudorandom_element({'m_unstb_radioactive', 'm_unstb_biohazard', 'm_unstb_poison'}, pseudoseed('dvcontract'))])
						return true end })
			end
			
			for i=1, #disenc_card do
				local percent = 0.85 + (i-0.999)/(#disenc_card-0.998)*0.3
				event({trigger = 'after',delay = 0.15,func = function() disenc_card[i]:flip();play_sound('tarot2', percent, 0.6);disenc_card[i]:juice_up(0.3, 0.3);return true end })
			end
			delay(0.5)
		end
	end,

	pos = get_coordinates(5),
}

end

end

--Other Spectrals

if unstb_config.gameplay.new_spectrals then

--Poltergeist
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_poltergeist', 

	config = {extra = {}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)

		return {vars = {}}
	end,

	can_use = function(self, card)
		if G.hand and #G.jokers.cards > 1 then
		
			--Check if there is at least one joker with edition
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
					return true
				end
			end
			
			return false
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		local joker_list = G.jokers.cards
		
		local temp_edition = {}
		for k, v in ipairs(joker_list) do temp_edition[#temp_edition+1] = v.edition or 'none' end
		pseudoshuffle(temp_edition, pseudoseed('poltergeist'))

		--Give all joker new editions
		--Animation from Basegame Tarot
		for i=1, #joker_list do
			local percent = 1.15 - (i-0.999)/(#joker_list-0.998)*0.3
			event({trigger = 'after',delay = 0.15,func = function() joker_list[i]:flip();play_sound('card1', percent);joker_list[i]:juice_up(0.3, 0.3);return true end })
		end
		delay(0.2)
		
		--Set the new edition
		for i=1, #joker_list do
		event({trigger = 'after',delay = 0.1,func = function()	

					local edition = temp_edition[i]
					
					if edition == 'none' then
						edition =  nil
					end
		
					joker_list[i]:set_edition(edition, true, true)
					return true end })
		end
		
		for i=1, #joker_list do
			local percent = 0.85 + (i-0.999)/(#joker_list-0.998)*0.3
			event({trigger = 'after',delay = 0.15,func = function() joker_list[i]:flip();play_sound('tarot2', percent, 0.6);joker_list[i]:juice_up(0.3, 0.3);return true end })
		end
		delay(0.5)
	end,

	pos = get_coordinates(6),
	
	--Can spawn only if there is more than one joker, and at least one with edition
	in_pool = function(self, args)
	
		--For some reason, not checking this crash Cryptid on start up
		if not G.jokers then return false end
	
		if #G.jokers.cards > 1 then
			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
					return true
				end
			end
		end
	
        return false
    end,
}

--Projection
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_projection', 

	config = {extra = {odds_break = 4}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)

		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card and card.ability.extra.odds_break or self.config.extra.odds_break}}
	end,

	can_use = function(self, card)
		if G.hand and #G.jokers.cards > 1 and #G.jokers.highlighted ==1 and G.jokers.highlighted[1] then
		
			--Check if there is at least one of the selected jokers have edition and is not the same
			local joker = G.jokers.highlighted[1]
			local position = nil
			
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == joker then position = i; break end
            end
			
			--Selected Joker is at the rightmost
			if position==#G.jokers.cards then
				return false
			end
			
			local nextjoker = G.jokers.cards[position+1]
			
			--If both has edition, see if it's the same
			if joker.edition and nextjoker.edition then
				return joker.edition.key ~= nextjoker.edition.key
			end
			
			--Return true if at least one of them has edition
			return joker.edition or nextjoker.edition 
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		local joker = G.jokers.highlighted[1]
		local position = nil
			
		for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == joker then position = i; break end
        end
		
		local nextjoker = G.jokers.cards[position+1]
		
		local firstEdition = joker.edition
		local nextEdition = nextjoker.edition
		
		local joker_list = {joker, nextjoker}
		
		--Animation from Basegame Tarot
		for i=1, #joker_list do
			local percent = 1.15 - (i-0.999)/(#joker_list-0.998)*0.3
			event({trigger = 'after',delay = 0.15,func = function() joker_list[i]:flip();play_sound('card1', percent);joker_list[i]:juice_up(0.3, 0.3);return true end })
		end
		delay(0.2)
		
		--Set the new edition
		for i=1, #joker_list do
		event({trigger = 'after',delay = 0.1,func = function()	
					joker:set_edition(nextEdition, true, true)
					nextjoker:set_edition(firstEdition, true, true)
					return true end })
		end
		
		for i=1, #joker_list do
			local percent = 0.85 + (i-0.999)/(#joker_list-0.998)*0.3
			event({trigger = 'after',delay = 0.15,func = function() joker_list[i]:flip();play_sound('tarot2', percent, 0.6);joker_list[i]:juice_up(0.3, 0.3);return true end })
		end
		delay(0.5)
		
		--Destroy one of the joker
		if pseudorandom('projection'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_break then
			local target = pseudorandom_element(joker_list, pseudoseed('projection'))
			event({func = function()
                        target:start_dissolve({HEX("57ecab")}, nil, 1.6)
                    return true end })
			forced_message("Failed...", target, G.C.BLACK, true)
		end
		
		
	end,

	pos = get_coordinates(7),
	
	--Can spawn only if there is at least more than 1 Joker with distinct edition
	in_pool = function(self, args)
	
		--For some reason, not checking this crash Cryptid on start up
		if not G.jokers then return false end
	
		local prev_edition = nil
	
		if #G.jokers.cards > 1 then
			--Set the first one as a pivot check
			prev_edition = G.jokers.cards[1].edition
			
			--Iterate through the rest
			for i=2, #G.jokers.cards do
				--If there is one Joker with different edition, breaks and return true
				if prev_edition ~= G.jokers.cards[i].edition then
					return true
				end
			end
		end
	
        return false
    end,
}

unstb_global.siphon_blacklist = {}
unstb_global.siphon_blacklist['e_negative'] = true

--Global register function, just in case more modded edition can blackList them
function unstb_global.register_siphon_blacklist(edition_list)
	for i=1, #edition_list do
		unstb_global.siphon_blacklist[edition_list[i]] = true
	end
end

--Siphon
SMODS.Consumable{
	set = 'Spectral', atlas = 'spectral',
	key = 'spc_siphon', 

	config = {extra = {count = 4}},
	--discovered = true,

	loc_vars = function(self, info_queue, card)

		return {vars = {card and card.ability.extra.count or self.config.extra.count}}
	end,

	can_use = function(self, card)
		if G.hand and #G.jokers.cards >= 1 and #G.jokers.highlighted ==1 and G.jokers.highlighted[1] then
			return G.jokers.highlighted[1].edition and not unstb_global.siphon_blacklist[G.jokers.highlighted[1].edition.key]
		end
		return false
	end,

	use = function(self, card)
		
		event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end })
		
		local edition_card = {}
		local temp_hand = {}
		
		for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
		table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
		pseudoshuffle(temp_hand, pseudoseed('siphon'))

		for i = 1, card.ability.extra.count do edition_card[#edition_card+1] = temp_hand[i] end
		
		local joker = G.jokers.highlighted[1]
		local edition = joker.edition
		
		--Destroy the joker
		
		event({func = function()
					joker:start_dissolve({HEX("57ecab")}, nil, 1.6)
				return true end })
		delay(0.5)
		
		--Upgrade the card
		
		event({trigger = 'after',delay = 0.1,func = function()
					for i=1, #edition_card do
						edition_card[i]:set_edition(edition, true, i==1)
					end
                    return true end })
		
		
	end,

	pos = get_coordinates(8),
	
	--Can spawn only if there is one joker or more with edition
	in_pool = function(self, args)
	
		--For some reason, not checking this crash Cryptid on start up
		if not G.jokers then return false end
	
		if #G.jokers.cards >= 1 then
			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].edition and not unstb_global.siphon_blacklist[G.jokers.cards[i].edition.key] then
					return true
				end
			end
		end
	
        return false
    end,
}

end

--Vouchers

if unstb_config.gameplay.c_aux then

SMODS.Voucher({
	object_type = "Voucher",
	key = "aux1",
	
	atlas = "voucher",
	pos = { x = 0, y = 0 },
	unlocked = true,
	--discovered = true,
	redeem = function(self)
		event({
			func = function()
				G.GAME.auxiliary_rate = (G.GAME.auxiliary_rate or 0) + 2
				return true
			end,
		})
	end,
	unredeem = function(self)
	event({
		func = function()
			G.GAME.auxiliary_rate = (G.GAME.auxiliary_rate or 2) - 2
			return true
		end,
	})
	end
})
  
SMODS.Voucher({
	object_type = "Voucher",
	key = "aux2",
	
	atlas = "voucher",
	pos = { x = 1, y = 0 },
	unlocked = true,
	--discovered = true,
	requires = { "v_unstb_aux1" },
})

end

-------- Joker Code Starts Here ------

--Basic Jokers

--Lunar Calendar
create_joker({
    name = 'Lunar Calendar', id = 40,
    rarity = 'Common', cost = 5,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {odds_spawn = 4} },
	
	custom_vars = function(self, info_queue, card)
		local suit  = card and card.ability.extra and card.ability.extra.suit or 'Spades'
	
		local suit_name = localize(suit, 'suits_singular')
		local suit_color = G.C.SUITS[suit]
	
        return {vars = {suit_name, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_spawn, colours = {suit_color}}}
    end,
	
	set_ability = function(self, card, initial, delay_sprites)
		--Initialize variables
		card.ability.extra.suit = pseudorandom_element(SMODS.Suits, pseudoseed('lunarcalendar')).key --All suits, not just strictly in the deck
    end,
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			--Main Context
			if context.other_card:is_suit(card.ability.extra.suit) then
				local isActivated = pseudorandom('lunarcalendar'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_spawn
				
				if isActivated then
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
						
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						event({func = function()
							local created_card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, nil)
							created_card:add_to_deck()
							G.consumeables:emplace(created_card)
							G.GAME.consumeable_buffer = 0
							return true end
						})
						
						forced_message("Planet", context.blueprint_card or card, G.C.SECONDARY_SET.Planet, true)
						
						return nil, true
					end
				end
				
			end
		end
		
		--End-of-round Randomize
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.suit = pseudorandom_element(SMODS.Suits, pseudoseed('lunarcalendar')).key
			return{
				message = localize(card.ability.extra.suit, 'suits_singular'),
			}
		end
	end,
})

--Dragon Hoard
create_joker({
    name = 'Dragon Hoard', id = 42,
    rarity = 'Common', cost = 4,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{mult_rate = 15}, {held_amount = 2}, {mult_current = 0}},
	
	custom_vars = function(self, info_queue, card)
        
		local held_amount = G.consumeables and #G.consumeables.cards or 0
		
		local mult_current = card.ability.extra.mult_rate * math.floor(held_amount/card.ability.extra.held_amount)
		
		return { vars = {card.ability.extra.mult_rate, card.ability.extra.held_amount, mult_current}}
    end,
	
	
    calculate = function(self, card, context)
		--Main context
		if context.joker_main then
			
			card.ability.extra.mult_current = card.ability.extra.mult_rate * math.floor(#G.consumeables.cards/card.ability.extra.held_amount)
		
			if card.ability.extra.mult_current > 0 then
				return {
					mult_mod = card.ability.extra.mult_current,
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_current } }
				}
			end
		end
		
    end,
})

--Card Dealer
create_joker({
    name = 'Card Dealer', id = 41,
    rarity = 'Common', cost = 5,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {chip_rate = 15}, {chips = 0} },
	
	custom_vars = function(self, info_queue, card)
        
		return { vars = {card.ability.extra.chip_rate, card.ability.extra.chips}}
    end,
	
    calculate = function(self, card, context)
	
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
	
		if context.before and context.full_hand and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips + #context.full_hand * card.ability.extra.chip_rate
			
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				card = card
			 }
		end
		
		--End-of-round Resets
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint and not context.retrigger_joker then
			if card.ability.extra.chips > 0 then
				card.ability.extra.chips = 0
				return{
					message = localize('k_reset'),
					colour = G.C.RED
				}
			end
		end
		
	end,
})

--Match Three
create_joker({
    name = 'Match Three', id = 67,
    rarity = 'Common', cost = 6,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {mult = 15}, {count = 3} },
	
	custom_vars = function(self, info_queue, card)
        
		return { vars = {card.ability.extra.mult, card.ability.extra.count}}
    end,
	
    calculate = function(self, card, context)
	
		if context.joker_main then
		
			--Not enough card
			if #context.scoring_hand < card.ability.extra.count then
				return
			end
			
			local card_count = 1
			local max_card_count = 0
			local current_suit = context.scoring_hand[1].base.suit
			
			for i=2, #context.scoring_hand do
				if context.scoring_hand[i]:is_suit(current_suit) then
					card_count = card_count + 1
				else
					--reset count
					
					if card_count > max_card_count then
						max_card_count = card_count
					end
					
					card_count = 1
					current_suit = context.scoring_hand[i].base.suit
				end
			end
			
			if card_count > max_card_count then
				max_card_count = card_count
			end
			
			--print(max_card_count)
			--print(card.ability.extra.count)
			
			if max_card_count >= card.ability.extra.count then
				return {
					mult_mod = card.ability.extra.mult,
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
				}
			end
		end
		
	end,
})

create_joker({
    name = 'Furry Joker', id = 44,
    rarity = 'Uncommon', cost = 7,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {odds_poly = 8} },
	
	custom_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS['m_wild']
		info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome']
		
		return { vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_poly}}
    end,
	
    calculate = function(self, card, context)	
		if context.after and context.scoring_hand then
			local polyAmount = 0
			for i=1, #context.scoring_hand do
				local current_card = context.scoring_hand[i]
				if current_card.config.center == G.P_CENTERS.m_wild and (current_card.edition or {}).key ~= 'e_polychrome' and not current_card.becoming_poly then
					local isActivated = pseudorandom('furry'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_poly
					if isActivated then
						current_card.becoming_poly = true
						event({trigger = 'after', delay = 0.4, func = function()
									big_juice(context.blueprint_card or card)
									current_card:set_edition("e_polychrome", true, false)
									current_card.becoming_poly = nil
							return true end
						})
						polyAmount = polyAmount+1
					end
				end
			end
			if polyAmount>0 then
				delay(2.5)
			end
			return nil, true
		end
	end,
  
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one wild card in the deck
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_wild then return true end
		end
		return false
		
    end
})

--Hook set_cost to allow messing with prices
local ref_set_cost = Card.set_cost
function Card.set_cost(self)
	ref_set_cost(self)
	for k,v in ipairs(SMODS.find_card("j_unstb_luxurious_handbag")) do
		self.cost = self.cost + v.ability.extra.inflation
	end
	
end

create_joker({
    name = 'Luxurious Handbag', id = 43,
    rarity = 'Uncommon', cost = 6,
	
    blueprint = false, eternal = true, perishable = true,
	
	vars = { {add_slot = 4}, {inflation = 2} },
	
	custom_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.add_slot, card.ability.extra.inflation}}
    end,
	
	add_to_deck = function(self, card, from_debuff)
	
		G.consumeables:change_size(card.ability.extra.add_slot)
	
		--Recalculate all prices in the shop
		event({func = function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end 
		})
		
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.consumeables:change_size(-card.ability.extra.add_slot)
		
		--Recalculate all prices in the shop
		event({func = function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end 
		})
	end,
	
	--Actual functionality is in  Card.set_cost hook mostly
	--[[
    calculate = function(self, card, context)	
		
	end,]]
})

--Portal
create_joker({
    name = 'Portal', id = 39,
    rarity = 'Uncommon', cost = 7,
	
    blueprint = true, eternal = true, perishable = true,
	
	--vars = { {times = 1}},
	
	--Actual ability is in ustb_get_straight
    --[[calculate = function(self, card, context)
		
	end,]]
})

--Suit Seal Support Jokers

--Vainglorious Joker
create_joker({
    name = 'Vainglorious Joker', id = 32,
    rarity = 'Common', cost = 5,
	
	gameplay_tag = {'seal_suit'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {mult = 5} },
	
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'suit_seal'}
        return {vars = {card.ability.extra.mult}}
    end,
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.seal and SMODS.Seals[context.other_card.seal] and SMODS.Seals[context.other_card.seal].suit_seal then
				--big_juice(context.blueprint_card or card)
				return {
				  mult = card.ability.extra.mult,
				  card = card
				}
			end
		end
	end,
  
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one card with suit seal
		for _, v in pairs(G.playing_cards) do
			if v.seal and SMODS.Seals[v.seal] and SMODS.Seals[v.seal].suit_seal then return true end
		end
		return false
		
    end
})

--Acedia Joker
create_joker({
    name = 'Acedia Joker', id = 31,
    rarity = 'Common', cost = 5,
	
	gameplay_tag = {'seal_suit'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {mult = 10} },
	
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'suit_seal'}
        return {vars = {card.ability.extra.mult}}
    end,
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.seal and SMODS.Seals[context.other_card.seal] and SMODS.Seals[context.other_card.seal].suit_seal then
				local is_activate = false
				
				--If same suit, returns true immediately. This should also handle Wild Card cases and other Joker-related calculation probably?
				--I hope so, if there's a case that slips by I'll be crying
				if context.other_card:is_suit(SMODS.Seals[context.other_card.seal].suit_seal, nil, nil, true) then
					is_activate = true
					
				--Otherwise, checks suit group
				elseif get_suit_group(context.other_card.base.suit) == get_suit_group(SMODS.Seals[context.other_card.seal].suit_seal) then
					is_activate = true
				end
				
				if is_activate then
					return {
					  mult = card.ability.extra.mult,
					  card = card
					}
				end
			end
		end
	end,
  
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one card with suit seal
		for _, v in pairs(G.playing_cards) do
			if v.seal and SMODS.Seals[v.seal] and SMODS.Seals[v.seal].suit_seal then return true end
		end
		return false
		
    end
})

--Cinnabar
create_joker({
    name = 'Cinnabar', id = 33,
    rarity = 'Uncommon', cost = 7,
	
	gameplay_tag = {'seal_suit', 'c_aux'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {odds = 6} },
	
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'suit_seal'}
        return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.seal and SMODS.Seals[context.other_card.seal] and SMODS.Seals[context.other_card.seal].suit_seal then
				local isActivated = pseudorandom('cinnabar'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds
				
				if isActivated then
					local created_card = unstb_global.SUIT_SEAL[SMODS.Seals[context.other_card.seal].suit_seal].aux_key
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
						
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						event({func = function()
							local created_card = create_card('Auxiliary', G.consumeables, nil, nil, nil, nil, created_card, nil)
							created_card:add_to_deck()
							G.consumeables:emplace(created_card)
							G.GAME.consumeable_buffer = 0
							return true end
						})
						
						forced_message("Auxiliary", context.blueprint_card or card, G.C.UNSTB_AUX, true)
					end
				end
				
				return nil, true
			end
		end
	end,
  
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one card with suit seal
		for _, v in pairs(G.playing_cards) do
			if v.seal and SMODS.Seals[v.seal] and SMODS.Seals[v.seal].suit_seal then return true end
		end
		return false
		
    end
})

--Auxiliary Support

--Free Trial
create_joker({
    name = 'Free Trial', id = 54,
    rarity = 'Uncommon', cost = 4,
	
	gameplay_tag = {'c_aux'},
	
	vars = {{odds = 4},  {count = 0}},
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
		
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		
		if context.using_consumeable then
			if context.consumeable.ability.set == "Auxiliary" then
				if pseudorandom('freetrial'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds and card.ability.extra.count < 6 then
					--Hidden variable just so that you can't keep loop creating auxiliary cards forever
					--Will not be visible on the card description by choice
					card.ability.extra.count = card.ability.extra.count+1
					
					event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit >= #G.consumeables.cards then
						play_sound('timpani')
						local c = create_card('Auxiliary', G.consumeables, nil, nil, nil, nil, nil, 'freetrial')
						c:set_edition({negative = true}, true)
						c:add_to_deck()
						G.consumeables:emplace(c)
						
						big_juice(context.blueprint_card or card)
						card_eval_status_text(context.blueprint_card or card,'extra',nil, nil, nil,{message = "Free Trial", colour = G.C.UNSTB_AUX, instant = true})
						
						--forced_message("Free Trial!", context.blueprint_card or card, G.C.UNSTB_AUX, )
					end
					return true end })
				end
				
				return nil, true
			end
		end
		
		--Reset the hidden variable at the end of the round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if card.ability.extra.count > 0 then
				card.ability.extra.count = 0
			end
		end
    end
})

--Extended Warranty
create_joker({
    name = 'Extended Warranty', id = 55,
    rarity = 'Rare', cost = 8,
	
	gameplay_tag = {'c_aux'},
	
	vars = {{xmult = 1.5}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.xmult}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		
		if context.joker_main then
			for i=1, #G.consumeables.cards do
				if G.consumeables.cards[i].ability.set == "Auxiliary" then
				
					event({trigger = 'after', func = function()
						(context.blueprint_card or card):juice_up(0.5, 0.5)
					return true end
					})
					
					SMODS.calculate_effect({xmult = card.ability.extra.xmult}, G.consumeables.cards[i])
				end
			end
			
			return nil, true
		end
		
    end
})

--Technician
create_joker({
    name = 'Technician', id = 56,
    rarity = 'Common', cost = 6,
	
	gameplay_tag = {'c_aux'},
	
	vars = {{chip_rate = 15}, {chips = 0}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chip_rate, card.ability.extra.chips}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	set_ability = function(self, card, initial, delay_sprites)
		if G.GAME and G.GAME.consumeable_usage_total then
			card.ability.extra.chips = (G.GAME.consumeable_usage_total.auxiliary or 0) * card.ability.extra.chip_rate
		else
			card.ability.extra.chips = 0
		end
    end,
	
    calculate = function(self, card, context)
		
		--Upgrades
		if context.using_consumeable and not context.blueprint then
                if context.consumeable.ability.set == "Auxiliary" then
				   card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_rate
				   event({
					func = function()
							big_juice(card)
							forced_message("Upgraded!", card, G.C.CHIPS, true)
							--card_eval_status_text(card,'extra',nil, nil, nil,{message = "Upgraded", colour = G.C.MULT, instant = true})
							return true end})
				end
		end
		
		--Main context
		if context.joker_main then
			if card.ability.extra.chips > 0 then
				return {
					chip_mod = card.ability.extra.chips,
					message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
				}
			end
		end
		
    end
})

--Season Pass
create_joker({
    name = 'Season Pass', id = 57,
    rarity = 'Uncommon', cost = 5,
	
	gameplay_tag = {'c_aux'},
	
	vars = {{odds = 4}, {count = 0}},
	
    custom_vars = function(self, info_queue, card)
	
        return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    blueprint = true, eternal = true,
	
    calculate = function(self, card, context)
		if context.discard then
			if not context.other_card.debuff and context.other_card:is_face() and card.ability.extra.count < 6 and pseudorandom('season_pass'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
				--Create consumable
				if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
						--Hidden variable just so that you can't keep loop creating auxiliary cards forever
						--Will not be visible on the card description by choice
						card.ability.extra.count = card.ability.extra.count+1
						
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						event({func = function()
							local created_card = create_card('Auxiliary', G.consumeables, nil, nil, nil, nil, nil, 'season_pass')
							created_card:add_to_deck()
							G.consumeables:emplace(created_card)
							G.GAME.consumeable_buffer = 0
							return true end
						})
						
						forced_message("Auxiliary", context.blueprint_card or card, G.C.UNSTB_AUX, 0.5)
					end
					
				return nil, true
			end
		end
		
		--Reset the hidden variable at the end of the round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if card.ability.extra.count > 0 then
				card.ability.extra.count = 0
			end
		end
    end
})

--BlackJack + Question Mark Line Jokers

--Black Jack
create_joker({
    name = 'Black Jack', id = 15,
    rarity = 'Uncommon', cost = 5,
	
	gameplay_tag = {'rank_21', 'j_alter'},
	
    blueprint = true, eternal = true, perishable = false,
	
	vars = {{maxRank = 21}, {chips = 0}},
	
    calculate = function(self, card, context)
		--This part handles the chip reward
		if context.joker_main and card.ability.extra.chips>0 then
		  return {
			chip_mod = card.ability.extra.chips,
			message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
		  }
		end
	
		--This part handles the scaling
		if context.before and context.scoring_hand and not context.blueprint then
		
			local totalRank = blackJack_evalrank(context.scoring_hand, card.ability.extra.maxRank)
		
			if totalRank < card.ability.extra.maxRank then
				if totalRank > 0 then
					card.ability.extra.chips = card.ability.extra.chips + totalRank
					return {
						message = 'Upgraded!',
						colour = G.C.CHIPS,
						card = card
					}
				end
			elseif totalRank == card.ability.extra.maxRank then
				card.ability.extra.chips = (card.ability.extra.chips + totalRank) * 2
				
				local popup_msg = 'Black Jack!'
				if card.ability.extra.maxRank ~= 21 then
					popup_msg = 'Black Jack...?'
				else
				
				end
				
				return {
					message = popup_msg,
					colour = G.C.RED,
					card = card,
					sound = 'multhit1'
				}
			else
				if card.ability.extra.chips > 0 then
					card.ability.extra.chips = 0
					
					event({ trigger = 'after', delay = 0.2, func = function()
					play_sound('tarot1')
					return true end })
					
					return {
						message = 'Busted...',
						colour = G.C.BLACK,
						card = card
					}
				end
			end
			
			
		end
		
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and G.GAME.blind.boss and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if card.ability.extra.chips > 0 then
				card.ability.extra.chips = 0
				return {
					  message = 'Reset!'
				}
			end
		end
  end
})

--What
create_joker({
    name = 'What', id = 14,
    rarity = 'Rare', cost = 6,
	
	gameplay_tag = {'rank_21'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {chips = 420}, {mult = 69} },
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.base.value == 'unstb_???' then
				return {
				  chips = card.ability.extra.chips,
				  mult = card.ability.extra.mult,
				  card = card
				}
			end
		end
	end,
  
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one rank ??? card
		for _, v in pairs(G.playing_cards) do
			if v.base.value == 'unstb_???' then return true end
		end
		return false
		
    end
})

--Decimal-line Jokers

create_joker({
    name = 'Floating Point Error', id = 34,
    rarity = 'Uncommon', cost = 4,
	
	gameplay_tag = {'rank_decimal'},
	
    blueprint = true, eternal = true, perishable = true,
	
	--vars = { {bonus = 10}},
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card
			if is_decimal(currentCard) then
				--big_juice(card)
			
				currentCard.ability.perma_bonus = (currentCard.ability.perma_bonus or 0) + SMODS.Ranks[currentCard.base.value].nominal
				
				event({ trigger = 'after', func = function()
				big_juice(card)
				return true end })
				
				return {
                    extra = {message = "Upgrade!", colour = G.C.CHIPS},
                    colour = G.C.CHIPS,
                    card = currentCard
                }
			end
		end
	end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one decimal card
		for _, v in pairs(G.playing_cards) do
			if is_decimal(v) then return true end
		end
		return false
		
    end
})

--Academic Journal
create_joker({
    name = 'Academic Journal', id = 35,
    rarity = 'Uncommon', cost = 6,
	
	gameplay_tag = {'rank_decimal'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {times_max = 5}},
	
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.times_max, card.ability.extra.times_max - card.ability.extra.times_current}}
    end,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable all decimal ranks card in pools
		if not from_debuff then
			setPoolRankFlagEnable('unstb_0.5', true);
			setPoolRankFlagEnable('unstb_r2', true);
			setPoolRankFlagEnable('unstb_e', true);
			setPoolRankFlagEnable('unstb_Pi', true);
		end
    end,
	
	set_ability = function(self, card, initial, delay_sprites)
		--Initialize variables
		card.ability.extra.times_current = 0
    end,
	
    calculate = function(self, card, context)	
		if context.before and not context.blueprint then
			local is_active = true
			
			if card.ability.extra.times_current < card.ability.extra.times_max then
				for i=1, #context.scoring_hand do
					if context.scoring_hand[i]:is_face() then
						is_active = false
						break
					end
				end
				
				if is_active then
					card.ability.extra.times_current = (card.ability.extra.times_current or 0) + 1
				end
			else
				is_active = false
			end
			
			card.ability.extra.is_active = is_active
		end
		
		if context.after then
			--Create Card if it activates
			if card.ability.extra.is_active then
				--Adds a card
				event({trigger = 'after', func = function()
							local rank = SMODS.Ranks[pseudorandom_element({'unstb_0.5', 'unstb_r2', 'unstb_e', 'unstb_Pi'}, pseudoseed('researchpaper')..G.SEED)].card_key
							local suit = pseudorandom_element(SMODS.Suits, pseudoseed('researchpaper')..G.SEED).card_key
							
							--Pooling Enhancements
							local cen_pool = {}
							for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
								if not v.replace_base_card and not v.disenhancement then 
									cen_pool[#cen_pool+1] = v
								end
							end
							
							local _card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[suit..'_'..rank], pseudorandom_element(cen_pool, pseudoseed('researchpaper')..G.SEED), {playing_card = G.playing_card})
							
							_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
							G.play:emplace(_card)
							table.insert(G.playing_cards, _card)
							
							big_juice(context.blueprint_card or card)
							
							event({func = function()
									playing_card_joker_effects({_card})
							return true end })
							
							return true end
						})
				delay(1.5)

				event({trigger = 'after', func = function()
					G.deck.config.card_limit = G.deck.config.card_limit + 1
					draw_card(G.play,G.deck, 90,'up', nil)  
					return true end
					})
					
				return nil, true
					
				
			end
		end
		
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint and not context.retrigger_joker then
			if card.ability.extra.times_current > 0 then
				card.ability.extra.times_current = 0
				return {
					  message = 'Reset!'
				}
			end
		end
	end,
})

--Engineer
create_joker({
    name = 'Engineer', id = 37,
    rarity = 'Common', cost = 5,
	
	gameplay_tag = {'rank_decimal'},
	
    blueprint = false, eternal = true, perishable = true,
	
	--vars = { {times = 1}},
	
	--Engineer's actual ability is in Card:get_id hook above
    --[[calculate = function(self, card, context)
		
	end,]]
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one decimal card
		for _, v in pairs(G.playing_cards) do
			if is_decimal(v) then return true end
		end
		return false
		
    end
})

--Thesis Proposal
create_joker({
    name = 'Thesis Proposal', id = 36,
    rarity = 'Common', cost = 6,
	
	gameplay_tag = {'rank_decimal'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{ repetitions = 2 }},
	
    calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
		  if is_decimal(context.other_card) then
				return {
				  message = 'Again!',
				  repetitions = card.ability.extra.repetitions,
				  card = context.blueprint_card or card
				}
		  end
		end
	end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one decimal card
		for _, v in pairs(G.playing_cards) do
			if is_decimal(v) then return true end
		end
		return false
		
    end
})

--Rainbow Flag
create_joker({
    name = 'Rainbow Flag', id = 38,
    rarity = 'Uncommon', cost = 5,
	
	gameplay_tag = {'rank_decimal'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {odds_poly = 6} },
	
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome']
		
		return { vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_poly}}
    end,
	
    calculate = function(self, card, context)	
		if context.after and next(context.poker_hands['Straight']) and context.scoring_hand then
			
			--Check if the Joker should be activated or not
			local is_activate = false
			for i=1, #context.scoring_hand do
				if is_decimal(context.scoring_hand[i]) then
					is_activate = true
					break
				end
			end
			
			if is_activate then
				local eligible_card = {}
				
				--Populate the list of eligible card
				for i=1, #context.scoring_hand do
					if (context.scoring_hand[i].edition or {}).key ~= 'e_polychrome' and not context.scoring_hand[i].becoming_poly then
						eligible_card[#eligible_card+1] = context.scoring_hand[i]
					end
				end
				
				--If there is eligible card, and the random chance hits
				if #eligible_card > 0 and pseudorandom('rainbowflag'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_poly then
					local targetCard = pseudorandom_element(eligible_card, pseudoseed('rainbowflag')..G.SEED)
					
					targetCard.becoming_poly = true
					event({trigger = 'after', delay = 0.4, func = function()
								big_juice(context.blueprint_card or card)
								targetCard:set_edition("e_polychrome", true, false)
								targetCard.becoming_poly = nil
						return true end
					})
					delay(2.5)
				end
				
				return nil, true
			end
		end
	end,
  
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one decimal card
		for _, v in pairs(G.playing_cards) do
			if is_decimal(v) then return true end
		end
		return false
		
    end
})

--Binary-line Jokers

local chipsAbilityMatch = {
	m_stone = 50,
	m_unstb_resource = 0,
	m_unstb_radioactive = 13,
	m_unstb_biohazard = 0
}

create_joker({
    name = 'Dummy Data', id = 6,
    rarity = 'Uncommon', cost = 6,
	
	gameplay_tag = {'rank_binary'},
	
	vars = {{odds = 2}, {unscored_card = {}}},
	
    custom_vars = function(self, info_queue, card)
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 0 card in pools
		if not from_debuff then
			setPoolRankFlagEnable('unstb_0', true);
			setPoolRankFlagEnable('unstb_1', true);
		end
    end,
	
    calculate = function(self, card, context)
		if context.before and context.scoring_hand and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.unscored_card = {}
			for k, v in pairs(context.full_hand) do
				local unscoring = true
				for _k,_v in pairs(context.scoring_hand) do
					if v == _v then
						unscoring = false
						break
					end
				end
				
				if unscoring and not v.debuff then
					card.ability.extra.unscored_card[#card.ability.extra.unscored_card+1] = v
				end
			end
		end
		
		if context.after and not context.blueprint and not context.retrigger_joker then
			for i = 1, #card.ability.extra.unscored_card do
			
				local isTurning = pseudorandom('dummy'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds
				if isTurning then
					local currentCard = card.ability.extra.unscored_card[i]
					
					currentCard.ability.perma_bonus = (currentCard.ability.perma_bonus or 0) + SMODS.Ranks[currentCard.base.value].nominal
					
					--Flipping Animation
					event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('card1', 1); currentCard:juice_up(0.3, 0.3); return true end })
					
					--Changing Card Property
					
					event({trigger = 'after', delay = 0.05,  func = function()
					
						local suit_data = SMODS.Suits[currentCard.base.suit]
						local suit_prefix = suit_data.card_key
						
						currentCard:set_base(G.P_CARDS[suit_prefix .. '_unstb_0' ])
						
						--Un-stoned the stone card
						if currentCard.config.center.key == 'm_unstb_slop' or chipsAbilityMatch[currentCard.config.center.key] then
							currentCard:set_ability(G.P_CENTERS.c_base)
						end
						
						return true end })
					
					--Unflipping Animation
					event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); currentCard:juice_up(0.3, 0.3); return true end })
					forced_message("Zero!", currentCard, G.C.GREY, true)
				end
			end
		end
	end
})

create_joker({
    name = 'Micro SD Card', id = 4,
    rarity = 'Uncommon', cost = 7,
	
	gameplay_tag = {'rank_binary', 'j_alter', 'j_powerful'},
	
	vars = {{odds_current = 0}, {odds_destroy = 512}, {stored_chips = 0}},
	
    custom_vars = function(self, info_queue, card)
	
		local activate_text = 'Inactive'
		local activate_color = G.C.RED
		if G.jokers and G.jokers.cards[1] == card then
			activate_text = 'Active'
			activate_color = G.C.GREEN
		end
	
		return {vars = {G.GAME and G.GAME.probabilities.normal * card.ability.extra.odds_current or 0, card.ability.extra.odds_destroy, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.stored_chips, activate_text,
				colours = {activate_color} }}
    end,
	
    blueprint = true, eternal = false, perishable = false,
	
	--Set sprites and hitbox
	resize = { w = 41, h = 59 },
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 0 card in pools
		setPoolRankFlagEnable('unstb_0', true);
		setPoolRankFlagEnable('unstb_1', true);
	end,
	
    calculate = function(self, card, context)
		--This part handles the chip reward
		if context.joker_main then
		  return {
			chip_mod = card.ability.extra.stored_chips,
			message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.stored_chips } }
		  }
		end
	
		--The scaling part is not copyable by Blueprint
		if context.discard and not context.blueprint then
			
			--Check if the joker is on the leftmost slot
			if G.jokers.cards[1] == card then
				local currentCard = context.other_card
				
				--Not debuffed, and isn't face card, and is base card
				if not currentCard:is_face() and not currentCard.debuff and currentCard.config.center == G.P_CENTERS.c_base then
					
					local bonusChip = currentCard.ability.perma_bonus or 0
					local baseChip = SMODS.Ranks[currentCard.base.value].nominal
					
					local totalChip = baseChip + bonusChip
					
					if totalChip>0 then
						card.ability.extra.stored_chips = (card.ability.extra.stored_chips or 0) + totalChip
						
						card.ability.extra.odds_current = (card.ability.extra.odds_current or 0) + totalChip
						
						--Change card
						event({trigger = 'after', delay = 0.02,  func = function()
								
							local suit_data = SMODS.Suits[currentCard.base.suit]
							local suit_prefix = suit_data.card_key
							
							currentCard:juice_up(0.3, 0.3);
							currentCard:set_base(G.P_CARDS[suit_prefix .. '_unstb_0' ])
							
							return true end })
						
						return {
							message = localize { type = 'variable', key = 'a_chips', vars = { totalChip } },
							colour = G.C.CHIPS,
							card = card
						}
					end
				end
			end
			
		end
		
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if pseudorandom('sdcard'..G.SEED) < G.GAME.probabilities.normal * card.ability.extra.odds_current / card.ability.extra.odds_destroy then
				event({func = function()
							
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						
						--Destroy Card
						event({trigger = 'after', delay = 0.3,  func = function()
							
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true end })
						
						return true end })
				return {
				  message = 'Corrupted...',
				  colour = G.C.BLACK
				}
			else
				return {
				  message = 'Safe!'
				}
			end
		end
	end
})

create_joker({
    name = 'Social Experiment', id = 65,
    rarity = 'Rare', cost = 9,
	
	gameplay_tag = {'rank_binary', 'j_powerful'},
	
    blueprint = false, eternal = true, perishable = true,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 0 card in pools
		setPoolRankFlagEnable('unstb_0', true);
		setPoolRankFlagEnable('unstb_1', true);
    end,
	
    calculate = function(self, card, context)
		
		if context.after and context.scoring_hand and #context.scoring_hand > 1 and not context.blueprint and not context.retrigger_joker then
			local totalChipCount = 0
		
			for i = 1, #context.scoring_hand do
				if i<#context.scoring_hand and not (context.scoring_hand[i]:is_face() and not (context.scoring_hand[i].config.center.key == 'm_unstb_slop' or SMODS.has_no_rank(context.scoring_hand[i]))) and (context.scoring_hand[i].ability.perma_bonus or 0)<128 then --context.scoring_hand[i].config.center ~= G.P_CENTERS.m_stone then --Check if it is not a Stone card	
					local currentCard = context.scoring_hand[i]
					
					local bonusChip = currentCard.ability.perma_bonus or 0
					
					
					local baseChip = SMODS.Ranks[currentCard.base.value].nominal
					
					if currentCard.config.center.key == 'm_unstb_slop' then
						baseChip = 0
						bonusChip = bonusChip + currentCard.ability.extra.chips				
					elseif chipsAbilityMatch[currentCard.config.center.key] then
						baseChip = 0
						bonusChip = bonusChip + chipsAbilityMatch[currentCard.config.center.key]
					end
					
					if bonusChip + baseChip > 0 then
					
						context.scoring_hand[i+1].ability.perma_bonus = (context.scoring_hand[i+1].ability.perma_bonus or 0) + (bonusChip + baseChip)*2
						
						totalChipCount = totalChipCount + bonusChip + baseChip
						
						currentCard.ability.perma_bonus = 0
						
						--Flipping Animation
						event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('card1', 1); currentCard:juice_up(0.3, 0.3); return true end })
						
						--Changing Card Property
						
						event({trigger = 'after', delay = 0.05,  func = function()
						
							local suit_data = SMODS.Suits[currentCard.base.suit]
							local suit_prefix = suit_data.card_key
							
							currentCard:set_base(G.P_CARDS[suit_prefix .. '_unstb_0' ])
							
							--Un-stoned the stone card
							--print(currentCard.config.center.key)
							--print(chipsAbilityMatch[currentCard.config.center.key])
							if currentCard.config.center.key == 'm_unstb_slop' or chipsAbilityMatch[currentCard.config.center.key] then
								currentCard:set_ability(G.P_CENTERS.c_base)
							end
							
							return true end })
						
						--Unflipping Animation
						event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); currentCard:juice_up(0.3, 0.3); return true end })
						forced_message("Double It!", currentCard, G.C.CHIPS, true)
					end
					
				else
					if totalChipCount > 0 then
						local currentCard = context.scoring_hand[i]
						
						event({ trigger = 'after', delay = 0.2, func = function()
						big_juice(currentCard)
						play_sound('multhit1')
						return true end })
						
						forced_message("Take!", currentCard, G.C.CHIPS, true)
						
						totalChipCount = 0
					end
				end
			end
		
		end
		
    end
})

create_joker({
    name = 'Power of One', id = 13,
    rarity = 'Uncommon', cost = 7,
	
	gameplay_tag = {'rank_binary'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{mult_rate = '4'}, {mult = '0'}},
	
	custom_vars = function(self, info_queue, card)
        
		--Check the number of 1 in the deck
		local one_count=0
		if (G.playing_cards) then
			for _, v in pairs(G.playing_cards) do
				if v.base.value == 'unstb_1' then one_count = one_count + 1 end
			end
			return { vars = {card.ability.extra.mult_rate, one_count*card.ability.extra.mult_rate}}
		else
			return { vars = {card.ability.extra.mult_rate, 0}}
		end 
    end,
	
	
    calculate = function(self, card, context)
		--Main context
		if context.joker_main then
			local one_count=0
			for _, v in pairs(G.playing_cards) do
				if v.base.value == 'unstb_1' then one_count = one_count + 1 end
			end
			
			card.ability.extra.mult = one_count*card.ability.extra.mult_rate
		
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
		
    end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one rank 1 card
		for _, v in pairs(G.playing_cards) do
			if v.base.value == 'unstb_1' then return true end
		end
		return false
		
    end
})

local binary_rank = {'unstb_0', 'unstb_1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace', 'unstb_???'}

create_joker({
    name = 'Binary Number', id = 5,
    rarity = 'Uncommon', cost = 7,
	
	gameplay_tag = {'rank_binary'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {},
	
	
    calculate = function(self, card, context)
		--Main context
		if context.after then
			local hand = context.full_hand
			
			--Parse the hand and check if it's eligible in one go
			
			--Ineligible hand
			if #hand > 4 then return end
			
			local is_binary = true
			local final_rank = 0
			local suit_list = {}
			
			for i=1, #hand do
				local rank = hand[i].base.value
				
				if rank == 'unstb_1' then
					final_rank = final_rank + 2 ^ (#hand-i)
					suit_list[#suit_list+1] = hand[1].base.suit
				elseif rank == 'unstb_0' then
					--Do nothing, really
					suit_list[#suit_list+1] = hand[1].base.suit
				else
					is_binary = false
					break
				end
			end
			
			--If the hand is binary number, create card accordingly
			if is_binary then
				
				local target_rank = binary_rank[final_rank+1] or 'unstb_???'
				
				--print(final_rank)
				--print(target_rank)
				
				--Create Card
				event({func = function()
								local rank = SMODS.Ranks[target_rank].card_key
								local suit = SMODS.Suits[pseudorandom_element(suit_list, pseudoseed('binary')..G.SEED)].card_key
								
								local _card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[suit..'_'..rank], G.P_CENTERS.c_base, {playing_card = G.playing_card})
								
								
								--Juice up the Joker
								card:juice_up(0.3, 0.3)
								
								_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
								G.play:emplace(_card)
								table.insert(G.playing_cards, _card)
								
								event({func = function()
									playing_card_joker_effects({_card})
								return true end })
								
								return true end
						})
				
				event({func = function()
					G.deck.config.card_limit = G.deck.config.card_limit + 1
					return true end
					})
				
				delay(1)

				event({func = function()
					draw_card(G.play,G.deck, 90,'up', nil)  
					return true end
					})
					
				
			end
			
			return nil, true
		end
		
    end,
	
	custom_in_pool = function(self, args)
		--If rank 0 and 1 is unlocked this run
		return getPoolRankFlagEnable('unstb_0') and getPoolRankFlagEnable('unstb_1')
		
    end
})

--Enhancement-line Jokers

--Quintuplets
create_joker({
    name = 'Quintuplets', id = 2,
    rarity = 'Uncommon', cost = 6,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{scoring_name = ''}, {scoring_hand = {}}},
	
	custom_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_TAGS.tag_negative
    end,
	
    calculate = function(self, card, context)
		--Keep track of scoring hand
		--[[if context.after and context.scoring_name ~= nil and context.scoring_hand and not context.blueprint then
			card.ability.extra.scoring_name = context.scoring_name
			card.ability.extra.scoring_hand = context.scoring_hand
		end
		
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and card.ability.extra.scoring_name == 'Flush Five' then
		
			local isActivated = true
			
			for i = 1, #card.ability.extra.scoring_hand do
                if card.ability.extra.scoring_hand[i].config.center == G.P_CENTERS.c_base then
					isActivated = false
					break
				end
            end
			
			if isActivated then
				if not context.blueprint then
					card.ability.extra.scoring_name = ''
				end
				
				event({	 trigger = 'after', delay = 0.5, func = function()
								card:juice_up(0.3, 0.3)
				
								add_tag(Tag('tag_negative'))
								play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
								play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
								
								return true end
						}
					)
			end
		end]]
		
		if context.after and next(context.poker_hands['Five of a Kind']) then
			event({	 trigger = 'after', delay = 0.5, func = function()
								(context.blueprint_card or card):juice_up(0.3, 0.3)
				
								add_tag(Tag('tag_negative'))
								play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
								play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
								
								return true end
						}
					)
			return nil, true
		end
	end
})

--Edition-line Jokers

--Graphic Card
create_joker({
    name = 'Graphic Card', id = 69,
    rarity = 'Rare', cost = 8,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{ count = 5 }, {current_count = 0}, {tag_count = 0}},
	
	custom_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_TAGS.tag_double
		return {vars = {card.ability.extra.count, card.ability.extra.current_count}}
    end,
	
	--Set sprites and hitbox
	resize = { w = 48, h = 95 },
	
    calculate = function(self, card, context)
	
		if context.individual and context.cardarea == G.play and not context.repetition and not context.blueprint then
			if context.other_card.edition  then
				card.ability.extra.current_count = card.ability.extra.current_count + 1
			end
		end
		
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over then
		
			if card.ability.extra.current_count > 0 then
				if card.ability.extra.current_count >= card.ability.extra.count then
					card.ability.extra.tag_count = card.ability.extra.tag_count + 1
				
					event({	 trigger = 'after', delay = 0.5, func = function()
						
										add_tag(Tag('tag_double'))
										play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
										play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
										
										return true end
								}
							)
					forced_message("Tag!", card, G.C.SECONDARY_SET.Enhanced, true, false)
				end
			
			end
			
			--This doesn't really work, context.retrigger_joker called after the normal one so it ended up resetting first anyways ;w;
			--This will remain broken until I figured out something, sry
			if not context.blueprint and not context.retrigger_joker then
				if card.ability.extra.tag_count == 0 then
					forced_message("Reset", card, G.C.SECONDARY_SET.Enhanced, true, false)
				end
				
				card.ability.extra.tag_count = 0
				card.ability.extra.current_count = 0
			end
			
			return nil, true
		end
	end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one card with edition
		for _, v in pairs(G.playing_cards) do
			if v.edition then return true end
		end
		return false
		
    end
})

--Connoiseur
create_joker({
    name = 'Connoiseur', id = 45,
    rarity = 'Rare', cost = 8,
	
	gameplay_tag = {'j_powerful'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{ repetitions = 1 }},
	
    calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
		  if context.other_card.edition  then
			return {
			  message = 'Again!',
			  repetitions = card.ability.extra.repetitions,
			  card =  context.blueprint_card or card
			}
		  end
		end
	end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one card with edition
		for _, v in pairs(G.playing_cards) do
			if v.edition then return true end
		end
		return false
		
    end
})

--Jeweler
create_joker({
    name = 'Jeweler', id = 0,
    rarity = 'Uncommon', cost = 8,
	
	gameplay_tag = {'edition_upgrade'},
	
	vars = {{odds = 4}},
	
    custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'upgrade_edition'}
	
        local vars
        if G.GAME and G.GAME.probabilities.normal then
            vars = {G.GAME.probabilities.normal, card.ability.extra.odds}
        else
            vars = {1, card.ability.extra.odds}
        end
        return {vars = vars}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		
		if context.before and not context.blueprint then
		
			if pseudorandom('jeweler'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
			
				forced_message("Upgrade!", card, G.C.PURPLE, true, false)
				
				local hand_name = context.scoring_name
				
				if to_big(G.GAME.hands[hand_name].level) > to_big(0) then
					level_up_hand(card, hand_name, false, -1)
				end
			
				
				
				for i = 1, #context.scoring_hand do
					local current_card = context.scoring_hand[i]
					edition_upgrade(context.scoring_hand[i])
					
					--[[event({delay = 0, trigger = 'before',
						func = function()
							edition_upgrade(current_card)
							
						return true end}
					)]]
				end
			end
		
			return nil, true
		end
		
    end
})

--New Enhancements Support Stuff

--Slop Card Lines

--Joker Diffusion
create_joker({
    name = 'Joker Diffusion', id = 26,
    rarity = 'Uncommon', cost = 6,
	
	gameplay_tag = {'enh_custom'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{count = '3'}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_slop']
		
		return { vars = {card.ability.extra.count}}
    end,
	
	
    calculate = function(self, card, context)
		if context.after then
			local is_activate = #context.scoring_hand ~= #context.full_hand
			
			--Terminate if the condition does not met
			if not is_activate then return end
			
			--Populate Candidate Card
			local eligible_card = {}
			local converted_card = {}
			
			for i=1, #G.hand.cards do
				if G.hand.cards[i].config.center == G.P_CENTERS.c_base and not G.hand.cards[i].to_convert then eligible_card[#eligible_card+1] = G.hand.cards[i] end
			end
			
			table.sort(eligible_card, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
			pseudoshuffle(eligible_card, pseudoseed('jokerdiffusion'..G.SEED))

			
			for i = 1, card.ability.extra.count do converted_card[#converted_card+1] = eligible_card[i] end
			
			if #converted_card > 0 then
				--Animation from Basegame Tarot
				for i=1, #converted_card do
					converted_card[i].to_convert = true
				
					local percent = 1.15 - (i-0.999)/(#converted_card-0.998)*0.3
					event({trigger = 'after',delay = 0.15,func = function() big_juice(context.blueprint_card or card); converted_card[i]:flip();play_sound('card1', percent);converted_card[i]:juice_up(0.3, 0.3);return true end })
				end
				delay(0.2)
				
				--Handle the conversion
				for i=1, #converted_card do
				event({trigger = 'after',delay = 0.1,func = function()
							converted_card[i]:set_ability(G.P_CENTERS.m_unstb_slop)
							return true end })
				end
				
				for i=1, #converted_card do
					local percent = 0.85 + (i-0.999)/(#converted_card-0.998)*0.3
					event({trigger = 'after',delay = 0.15,func = function() converted_card[i]:flip();play_sound('tarot2', percent, 0.6);converted_card[i]:juice_up(0.3, 0.3); converted_card[i].to_convert = nil; return true end })
				end
				delay(0.5)
			end
			
			return nil, true
		end
		
    end,
})

--Non-Fungible Joker
create_joker({
    name = 'NonFungible Joker', id = 27,
    rarity = 'Uncommon', cost = 6,
	
	gameplay_tag = {'enh_custom'},
	
    blueprint = false, eternal = false, perishable = true,
	
	vars = {{count = '1'}, {max_payout = 10}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_slop']
		
		return { vars = {card.ability.extra.count, card.ability.extra.max_payout}}
    end,
	
	
    calculate = function(self, card, context)
		if context.pre_discard and not context.blueprint and not context.retrigger_joker then
			local slop_count = 0
			for i=1, #context.full_hand do
				if context.full_hand[i].config.center == G.P_CENTERS.m_unstb_slop then slop_count = slop_count + 1 end
			end
			
			card.ability.extra.is_activate = slop_count==1
		end
	
		if context.discard and not context.other_card.debuff and not context.blueprint then
			if card.ability.extra.is_activate and context.other_card.config.center == G.P_CENTERS.m_unstb_slop then
				ease_dollars(pseudorandom('nfj'..G.SEED, 0, card.ability.extra.max_payout), true)
				
				return {
					--play_sound('whoosh1', math.random()*0.1 + 0.6,0.3),
					message = 'Sold!',
					colour = G.C.GOLD,
					remove = true,
					card = card
				}
			end
		end
		
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if card.ability.extra.max_payout > 0 or card.sell_cost > 0 then
				if card.ability.extra.max_payout>0 then
					card.ability.extra.max_payout = card.ability.extra.max_payout - 1
				end
				
				--Reduce its own selling price too, for the funny
				
				if card.sell_cost > 0 then
					card.ability.extra_value = (card.ability.extra_value or 0) - 1
					card:set_cost()
				end
				
				return{
					message = "Price Dropped",
					colour = G.C.RED,
				}
			end
		end
		
    end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one slop card
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_slop then return true end
		end
		return false
		
    end
})

--Prompt
create_joker({
    name = 'Prompt', id = 28,
    rarity = 'Common', cost = 7,
	
	gameplay_tag = {'enh_custom'},
	
    blueprint = true, eternal = true, perishable = true,
	
	--vars = { {times = 1}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_slop']
		
		return { vars = {}}
    end,
	
	--Prompt's actual ability is in Slop Card's after_play function
    --[[calculate = function(self, card, context)
		
	end,]]
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one slop card
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_slop then return true end
		end
		return false
		
    end
})

--Uninterested Primate
create_joker({
    name = 'Uninterested Primate', id = 29,
    rarity = 'Common', cost = 5,
	
	gameplay_tag = {'enh_custom'},
	
    blueprint = true, eternal = false, perishable = false,
	
	vars = { {chips = 50}, {chips_rate = 10}, {slop_scored = 0}, {slop_cycle = 3}, {chance_destroy = 8}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_slop']
		
		return { vars = {card.ability.extra.chips_rate, card.ability.extra.slop_cycle, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.chance_destroy, card.ability.extra.chips, card.ability.extra.slop_cycle - card.ability.extra.slop_scored}}
    end,
	
	calculate = function(self, card, context)
		--Main Context
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
		
		--Scaling, cannot copy via blueprint
		if context.individual and context.cardarea == G.play and not context.blueprint then
			if context.other_card.config.center == G.P_CENTERS.m_unstb_slop then
				card.ability.extra.slop_scored = card.ability.extra.slop_scored + 1
				
				if card.ability.extra.slop_scored >= card.ability.extra.slop_cycle then
					card.ability.extra.slop_scored = 0
					
					card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_rate
					
					forced_message("+"..card.ability.extra.chips_rate, card, G.C.CHIPS, true)
				end
				
			end
		end
	
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
		
			--Reduce its own selling price, for the funny
				
			if card.sell_cost > 0 then
				card.ability.extra_value = (card.ability.extra_value or 0) - 1
				card:set_cost()
			end
		
			if pseudorandom('primate'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.chance_destroy then
				event({func = function()
							
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						
						--Destroy Card
						event({trigger = 'after', delay = 0.3,  func = function()
							
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true end })
						
						return true end })
						
				G.GAME.pool_flags.primate_gone = true
				return {
				  message = 'My Primates Gone'
				}
			else
				return {
				  message = 'Safe!'
				}
			end
		end
	end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one slop card + primate is not gone yet
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_slop then return not G.GAME.pool_flags.primate_gone end
		end
		return false
		
    end
})

--Lethargic Lion
create_joker({
    name = 'Lethargic Lion', id = 30,
    rarity = 'Common', cost = 5,
	
	gameplay_tag = {'enh_custom'},
	
    blueprint = true, eternal = false, perishable = false,
	
	vars = { {xmult = 2}, {xmult_rate = 0.02}, {slop_scored = 0}, {slop_cycle = 3}, {chance_destroy = 8}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_slop']
		
		return { vars = {card.ability.extra.xmult_rate, card.ability.extra.slop_cycle, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.chance_destroy, card.ability.extra.xmult, card.ability.extra.slop_cycle - card.ability.extra.slop_scored}}
    end,
	
	calculate = function(self, card, context)
		--Main Context
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end
		
		--Scaling, cannot copy via blueprint
		if context.individual and context.cardarea == G.play and not context.blueprint then
			if context.other_card.config.center == G.P_CENTERS.m_unstb_slop then
				card.ability.extra.slop_scored = card.ability.extra.slop_scored + 1
				
				if card.ability.extra.slop_scored >= card.ability.extra.slop_cycle then
					card.ability.extra.slop_scored = 0
					
					card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_rate
					
					forced_message("+"..card.ability.extra.xmult_rate, card, G.C.MULT, true)
				end
				
			end
		end
	
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
		
			--Reduce its own selling price, for the funny
				
			if card.sell_cost > 0 then
				card.ability.extra_value = (card.ability.extra_value or 0) - 1
				card:set_cost()
			end
		
			if pseudorandom('primate'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.chance_destroy then
				event({func = function()
							
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						
						--Destroy Card
						event({trigger = 'after', delay = 0.3,  func = function()
							
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true end })
						
						return true end })
				return {
				  message = 'My Lions Gone'
				}
			else
				return {
				  message = 'Safe!'
				}
			end
		end
	end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one slop card + primate is gone
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_slop then return G.GAME.pool_flags.primate_gone end
		end
		return false
		
    end
})


--Vintage Joker
create_joker({
    name = 'Vintage Joker', id = 23,
    rarity = 'Uncommon', cost = 6,
	
	gameplay_tag = {'enh_custom'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{chance_fix = '4'}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_vintage']
		
		return { vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.chance_fix}}
    end,
	
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.config.center == G.P_CENTERS.m_unstb_vintage then
				if pseudorandom('vintagejoker'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.chance_fix then
					context.other_card.ability.extra.current_odd = 0 --math.ceil(context.other_card.ability.extra.current_odd * 0.5)
					
					event({trigger = 'after',  func = function()
								play_sound('tarot2', 1, 0.6);
								big_juice(context.blueprint_card or card)
								return true end })
					forced_message("Restored!", context.other_card, G.C.GREEN, true)
				end
			end
		end
		
    end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one vintage card
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_vintage then return true end
		end
		return false
		
    end
})

--Rules Errata
create_joker({
    name = 'Rules Errata', id = 24,
    rarity = 'Uncommon', cost = 5,
	
	gameplay_tag = {'enh_custom'},
	
    blueprint = false, eternal = true, perishable = true,
	
	--vars = {{}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = {set = 'Other', key = 'acorn_tooltip'}
		
		return { vars = {}}
    end,
	
	--This Joker's effect is in Acorn Mark Card's code itself
    --[[calculate = function(self, card, context)
	
		if context.individual and context.cardarea == G.play then
			
		end
		
    end,]]
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one acorn card
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_acorn then return true end
		end
		return false
		
    end
})

--Auction Winner
create_joker({
    name = 'Auction Winner', id = 25,
    rarity = 'Common', cost = 6,
	
	gameplay_tag = {'enh_custom'},
	
    blueprint = true, eternal = true, perishable = true,
	
	--vars = {{}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_promo']
		
		return { vars = {}}
    end,
	
    calculate = function(self, card, context)
	
		if context.remove_playing_cards then
		
			local money = 0
		
			for _, v in pairs(context.removed) do
				if v.config.center == G.P_CENTERS.m_unstb_promo then
					money = money + v.ability.extra.gold
				end
			end
			
			if money>0 then
				event({trigger = 'after',  func = function()
								ease_dollars(money, true)
								big_juice(context.blueprint_card or card)
								return true end })
				forced_message('$'..money, context.blueprint_card or card, G.C.GOLD, true)
			end
			 
		end
		
    end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one promo card
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_promo then return true end
		end
		return false
		
    end
})

create_joker({
    name = 'Joker Island', id = 7,
    rarity = 'Uncommon', cost = 6,
	
	gameplay_tag = {'enh_custom'},
	
	vars = {{target_rank = 2}, {odds_ticket = 6}},
	
    custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'resource_tooltip'}
        return {vars = {localize(card.ability.extra.target_rank, 'ranks'), G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_ticket}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	set_ability = function(self, card, initial, delay_sprites)
		--Random possible rank
		local rank = '2'
		if G.playing_cards then
			rank = get_valid_card_from_deck('jokerisland'..G.SEED).rank --pseudorandom_element(G.playing_cards, pseudoseed('jokerisland')..G.SEED).base.value
		end
		
		card.ability.extra.target_rank = rank
    end,
	
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.pool_flags.catan_enabled then
			G.GAME.pool_flags.catan_enabled = true
		end
	end,
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card
			if currentCard.base.value == card.ability.extra.target_rank and not SMODS.has_no_rank(currentCard) then
				
				local isActivated = pseudorandom('jokerisland'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_ticket
				
				if isActivated then
					event({func = function()
									local rank = pseudorandom_element(SMODS.Ranks, pseudoseed('jokerisland')..G.SEED).card_key
									local suit = SMODS.Suits[currentCard.base.suit].card_key
									
									local _card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[suit..'_'..rank], G.P_CENTERS.m_unstb_resource, {playing_card = G.playing_card})
									
									_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
									G.play:emplace(_card)
									table.insert(G.playing_cards, _card)
									
									event({func = function()
										playing_card_joker_effects({_card})
									return true end })
									
									return true end
							})

					event({func = function()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						draw_card(G.play,G.deck, 90,'up', nil)  
						return true end
						})
				end
				return nil, true
			end
		end
		
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			card.ability.extra.target_rank = get_valid_card_from_deck('jokerisland'..G.SEED).rank --pseudorandom_element(G.playing_cards, pseudoseed('jokerisland')..G.SEED).base.value --pseudorandom_element(SMODS.Ranks, pseudoseed('jokerisland')..G.SEED).key
			return{
				message = "Randomize"
			}
		end
    end
})

--New Anti-Enhancement Stuff

create_joker({
    name = 'Kaiju', id = 17,
    rarity = 'Uncommon', cost = 8,
	
	gameplay_tag = {'enh_disenh'},
	
	vars = {{add_slot = 4}},
	
    custom_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_radioactive']
	
        return {vars = {card.ability.extra.add_slot}}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.pool_flags.radioactive_enabled then
			G.GAME.pool_flags.radioactive_enabled = true
		end
		
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.add_slot
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.add_slot
	end,
	
    calculate = function(self, card, context)
		if context.first_hand_drawn and not context.retrigger_joker then
			event({delay = 0.4, trigger = 'after',
						func = function()
							local eligible_list={}
							for i=1, #G.hand.cards do
								if G.hand.cards[i].config.center ~= G.P_CENTERS.m_unstb_radioactive then table.insert(eligible_list,G.hand.cards[i]) end
							end
							if #eligible_list>0 then
								local enhanced_card = pseudorandom_element(eligible_list, pseudoseed('kaiju'..G.SEED))
								enhanced_card:set_disenhancement(G.P_CENTERS.m_unstb_radioactive , nil, true)
								play_sound('tarot1')
								enhanced_card:juice_up()
							end
							
						return true end}
					)
		end
    end
})

create_joker({
    name = 'Poison the Well', id = 18,
    rarity = 'Uncommon', cost = 8,
	
	gameplay_tag = {'enh_disenh'},
	
	vars = {{discard_size = 4}},
	
    custom_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = {set = 'Other', key = 'poison_tooltip'}
	
        return {vars = {card.ability.extra.discard_size}}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.pool_flags.poison_enabled then
			G.GAME.pool_flags.poison_enabled = true
		end
		
		 G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_size
		 ease_discard(3)
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_size
		ease_discard(-3)
	end,
	
    calculate = function(self, card, context)
		if context.pre_discard and not context.blueprint and not context.retrigger_joker then
			local target_card = pseudorandom_element(G.hand.highlighted, pseudoseed(seed or 'poisonwell'..G.GAME.round_resets.ante))
			
			event({trigger = 'after',  func = function()
							play_sound('generic1')
							target_card:juice_up(0.3, 0.3);
							target_card:set_disenhancement(G.P_CENTERS.m_unstb_poison , nil, true)
							
							return true end })
		end
    end
})

create_joker({
    name = 'Petri Dish', id = 19,
    rarity = 'Uncommon', cost = 8,
	
	gameplay_tag = {'enh_disenh'},
	
	vars = {{adds_hand = 4}, {odds = 4}},
	
    custom_vars = function(self, info_queue, card)
	
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_biohazard']
	
        return {vars = {card.ability.extra.adds_hand, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
	add_to_deck = function(self, card, from_debuff)
		if not G.GAME.pool_flags.biohazard_enabled then
			G.GAME.pool_flags.biohazard_enabled = true
		end
		
		 G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.adds_hand
		 ease_hands_played(3)
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.adds_hand
		ease_hands_played(-3)
	end,
	
    calculate = function(self, card, context)
		if context.after and not context.blueprint and not context.retrigger_joker then
			if pseudorandom('petridish'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
				local target_card = pseudorandom_element(context.full_hand, pseudoseed(seed or 'petridishtarget'..G.SEED))
			
				event({trigger = 'after',  func = function()
								play_sound('generic1')
								target_card:juice_up(0.3, 0.3);
								target_card:set_disenhancement(G.P_CENTERS.m_unstb_biohazard)
								
								return true end })

				forced_message("Infected", target_card, G.C.RED, true)
			end
		end
    end
})

--Anti-Enhancement Supports
create_joker({
    name = 'Geiger Counter', id = 20,
    rarity = 'Uncommon', cost = 6,
	
	gameplay_tag = {'enh_disenh'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{mult_rate = '6'}, {mult = '0'}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_radioactive']
		
		--Check the number of radioactive card in the deck
		local count =0
		if (G.playing_cards) then
			for _, v in pairs(G.playing_cards) do
				if v.config.center == G.P_CENTERS.m_unstb_radioactive then count = count + 1 end
			end
			return { vars = {card.ability.extra.mult_rate, count*card.ability.extra.mult_rate}}
		else
			return { vars = {card.ability.extra.mult_rate, 0}}
		end 
    end,
	
	--Set sprites and hitbox
	resize = { w = 53, h = 95 },
	
    calculate = function(self, card, context)
		--Main context
		if context.joker_main then
			local count=0
			for _, v in pairs(G.playing_cards) do
				if v.config.center == G.P_CENTERS.m_unstb_radioactive then count = count + 1 end
			end
			
			card.ability.extra.mult = count*card.ability.extra.mult_rate
		
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
		
    end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one radioactive card
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_radioactive then return true end
		end
		return false
		
    end
})

create_joker({
    name = 'Strych Nine', id = 21,
    rarity = 'Uncommon', cost = 5,
	
	gameplay_tag = {'enh_disenh'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{chip_rate = '9'}, {chip = '0'}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = {set = 'Other', key = 'poison_tooltip'}
		
		--Check the number of poison card in the deck
		local count =0
		if (G.playing_cards) then
			for _, v in pairs(G.playing_cards) do
				if v.config.center == G.P_CENTERS.m_unstb_poison then count = count + 1 end
			end
			return { vars = {card.ability.extra.chip_rate, count*card.ability.extra.chip_rate}}
		else
			return { vars = {card.ability.extra.chip_rate, 0}}
		end 
    end,
	
	
    calculate = function(self, card, context)
		--Main context
		if context.joker_main then
			local count=0
			for _, v in pairs(G.playing_cards) do
				if v.config.center == G.P_CENTERS.m_unstb_poison then count = count + 1 end
			end
			
			card.ability.extra.chip = count*card.ability.extra.chip_rate
		
			return {
				chip_mod = card.ability.extra.chip,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip } }
			}
		end
		
    end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one poison card
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_poison then return true end
		end
		return false
		
    end
})

create_joker({
    name = 'Vaccination Card', id = 22,
    rarity = 'Uncommon', cost = 7,
	
	gameplay_tag = {'enh_disenh'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{xmult_rate = '0.5'}, {xmult = '1'}},
	
	custom_vars = function(self, info_queue, card)
        
		info_queue[#info_queue+1] = G.P_CENTERS['m_unstb_biohazard']
		
		--Check the number of biohazard card on hand
		local count = 0
		if (G.hand) then
			for i = 1, #G.hand.cards do
				if G.hand.cards[i].config.center == G.P_CENTERS.m_unstb_biohazard and not G.hand.cards[i].healed then
					count = count+1
				end
			end
			return { vars = {card.ability.extra.xmult_rate, 1+count*card.ability.extra.xmult_rate}}
		else
			return { vars = {card.ability.extra.xmult_rate, 1}}
		end 
    end,
	
	
    calculate = function(self, card, context)
		--Main context
		if context.joker_main then
			local count=0
			
			for i = 1, #G.hand.cards do
				if G.hand.cards[i].config.center == G.P_CENTERS.m_unstb_biohazard and not G.hand.cards[i].healed then
					count = count+1
				end
			end
			
			card.ability.extra.xmult = 1+count*card.ability.extra.xmult_rate
		
			return {
				Xmult_mod = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end
		
    end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if there is at least one biohazard card
		for _, v in pairs(G.playing_cards) do
			if v.config.center == G.P_CENTERS.m_unstb_biohazard then return true end
		end
		return false
		
    end
})

--Miscellaneous

-- Joker 2

create_joker({
    name = 'Joker2', id = 11,
    rarity = 'Common', cost = 4,
	
	gameplay_tag = {'j_shitpost'},
	
	vars = {{mult = 4}, {xmult = 2}, {odds_destroy = 4}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult, card.ability.extra.xmult, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_destroy}}
    end,
	
    blueprint = true, eternal = false, perishable = true,
	
    calculate = function(self, card, context)
		
		--Main context
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				xmult = card.ability.extra.xmult,
				--message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end
		
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if pseudorandom('joker2'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_destroy then
				event({func = function()
							
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						
						--Destroy Card
						event({trigger = 'after', delay = 0.3,  func = function()
							
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true end })
						
						return true end })
				return {
				  message = 'Flopped',
				  colour = G.C.ORANGE
				}
			else
				return {
				  message = 'Safe!',
				  colour = G.C.GREEN
				}
			end
		end
    end
})

-- Joker Stairs
create_joker({
    name = 'Joker Stairs', id = 12,
    rarity = 'Uncommon', cost = 8,
	
	gameplay_tag = {'j_shitpost'},
	
	vars = {{mult_rate = 4}, {mult = 0}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult_rate, card.ability.extra.mult}}
    end,
	
    blueprint = true, eternal = true, perishable = false,
	
    calculate = function(self, card, context)
		--Shop
		if context.buying_card and context.card ~= card then	
			if unstb_global.name_joker[context.card.config.center.key] then
				--print("Joker Stair Triggered!")
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_rate
				   event({
					func = function()
							big_juice(card)
							forced_message("Upgraded!", card, G.C.MULT, true)
							--card_eval_status_text(card,'extra',nil, nil, nil,{message = "Upgraded", colour = G.C.MULT, instant = true})
							return true end})
			end
		end
		
		--Main context
		if context.joker_main then
			if card.ability.extra.mult > 0 then
				return {
					mult_mod = card.ability.extra.mult,
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
				}
			end
		end
		
    end
})

--A special function to check for blueprint compat for both sides
G.FUNCS.blueprint_compat_dside_l = function(e)
  if e.config.ref_table.ability.blueprint_compat_l ~= e.config.ref_table.ability.blueprint_compat_check_l then 
    if e.config.ref_table.ability.blueprint_compat_l == 'compatible' then 
        e.config.colour = mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
    elseif e.config.ref_table.ability.blueprint_compat_l == 'incompatible' then
        e.config.colour = mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8)
    end
    e.config.ref_table.ability.blueprint_compat_ui_l = ' '..localize('k_blueprint_l_'..e.config.ref_table.ability.blueprint_compat_l)..' '
    e.config.ref_table.ability.blueprint_compat_check_l = e.config.ref_table.ability.blueprint_compat_l
  end
end

G.FUNCS.blueprint_compat_dside_r = function(e)
  if e.config.ref_table.ability.blueprint_compat_r ~= e.config.ref_table.ability.blueprint_compat_check_r then 
    if e.config.ref_table.ability.blueprint_compat_r == 'compatible' then 
        e.config.colour = mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
    elseif e.config.ref_table.ability.blueprint_compat_r == 'incompatible' then
        e.config.colour = mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8)
    end
    e.config.ref_table.ability.blueprint_compat_ui_r = ' '..localize('k_blueprint_r_'..e.config.ref_table.ability.blueprint_compat_r)..' '
    e.config.ref_table.ability.blueprint_compat_check_r = e.config.ref_table.ability.blueprint_compat_r
  end
end

--Plagiarism
create_joker({
    name = 'Plagiarism', id = 46,
    rarity = 'Uncommon', cost = 10,
	
	gameplay_tag = {'j_shitpost'},
	
	vars = {{dir = 0}},
	
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.dir==0 and 'Left' or 'Right'}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	set_ability = function(self, card, initial, delay_sprites)
		--Random direction
		card.ability.extra.dir = 0
		if pseudorandom('plagiarism'..G.SEED) > 0.5 then
			card.ability.extra.dir = 1
		end
    end,
	
    calculate = function(self, card, context)
		--Code based on Familiar's Crimsonotype
		
		--This bit of code runs before hand played, cannot copyable by other blueprint
		if context.before and not context.blueprint and not context.repetition and not context.repetition_only and not context.retrigger_joker  then
			card.ability.extra.dir = 0
			
			if pseudorandom('plagiarism'..G.SEED) > 0.5 then
				card.ability.extra.dir = 1
			end
			
			forced_message(card.ability.extra.dir==0 and 'Left' or 'Right', card, G.C.ORANGE, true)
		end
		
		local other_joker = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				if card.ability.extra.dir==0 then
					other_joker = G.jokers.cards[i - 1]
				else
					other_joker = G.jokers.cards[i + 1]
				end
			end
		end
		if other_joker and other_joker ~= self then
		
			--local newcontext = context
			context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
			context.blueprint_card = context.blueprint_card or card

			if context.blueprint > #G.jokers.cards + 1 then
				return
			end

			local other_joker_ret, trig = other_joker:calculate_joker(context)
			
			--Context needs resetting afterwards, otherwise this value keeps persisting
			context.blueprint = nil
			
			local eff_card = context.blueprint_card or card
			context.blueprint_card = nil
			
			if other_joker_ret or trig then
				if not other_joker_ret then
					other_joker_ret = {}
				end
				
				other_joker_ret.card = eff_card
				other_joker_ret.colour = G.C.GREEN
				other_joker_ret.no_callback = true
				
				--IDK why these are not applied to the return value, it even worked fine when I commented return line out when it shouldn't
				
				return other_joker_ret
			end
		end
    end
})

--Joker Throwing Card
create_joker({
    name = 'Joker Throwing Card', id = 47,
    rarity = 'Rare', cost = 8,
	
	vars = {{rate = 2}, {reduce = 10}, {odds_destroy = 4}},
	
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.reduce, G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_destroy, card.ability.extra.rate}}
    end,
	
    blueprint = false, eternal = true, perishable = false,
	
    calculate = function(self, card, context)
		--Reduce Blind Size
		if context.setting_blind and not context.blueprint then
            local decrease = math.min(card.ability.extra.reduce, 70) --Failsafe, just in case other value-altering joker did the funnies
			
            G.GAME.blind.chips = G.GAME.blind.chips * (1 - decrease * 0.01)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
		
		--Check before hand is played
		if context.before and context.scoring_hand and not context.blueprint and not context.retrigger_joker then
		
			local isActivated = pseudorandom('throwingcard'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_destroy
			
			if isActivated and card.ability.extra.reduce < 70 then --Won't activate if the reduction reach the hardcoded limit (to prevent other value-altering joker)
				local target_card = pseudorandom_element(context.scoring_hand, pseudoseed('throwingcard'..G.SEED))
				target_card.is_destroying = true
			end
		end
		
		--Handle Card Destroy
		if context.destroying_card and not context.blueprint then
				if context.destroying_card.is_destroying then
					if card.ability.extra.reduce < 70 then
						card.ability.extra.reduce = card.ability.extra.reduce + card.ability.extra.rate
						card.ability.extra.reduce = math.min(card.ability.extra.reduce, 70)
						
						forced_message("Upgraded!", card, G.C.PURPLE, true)
					end
					
					return { remove = true } --Destroy the card
				end
		end
    end
})

--Jackhammer
create_joker({
    name = 'Jackhammer', id = 16,
    rarity = 'Uncommon', cost = 7,
	
	gameplay_tag = {'j_powerful'},
	
	vars = {{retrigger_times = 5}, {is_activate = false}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.retrigger_times}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		
		--Pre-hand check
		if context.before and not context.blueprint then
			card.ability.extra.is_activate = false
		
			local jack_count = 0
			for i=1, #context.scoring_hand do
				if context.scoring_hand[i].base.value == 'Jack' then
					jack_count = jack_count + 1
				end
			end
			
			if jack_count==1 then
				card.ability.extra.is_activate = true
			end
			
		end
		
		--Main context
		if context.cardarea == G.play and context.repetition and not context.repetition_only and card.ability.extra.is_activate then
		  if context.other_card.base.value == 'Jack' then
			card.ability.extra.target_jack = context.other_card

			return {
			  message = 'Again!',
			  repetitions = card.ability.extra.retrigger_times,
			  card = context.blueprint_card or card
			}
		  end
		end
		
		if context.destroying_card and not context.blueprint then
				--This context is called on every single card in the scoring hand
				--Check if the card called is the same as target card
				if context.destroying_card == card.ability.extra.target_jack then
					card.ability.extra.target_jack = nil
					return { remove = true } --Destroy the card
				end
		end
		
    end
})

--Jack of All Trades
create_joker({
    name = 'Jack of All Trades', id = 60,
    rarity = 'Uncommon', cost = 6,
	
	vars = {{chips = 20}, {mult = 3}, {xmult = 1.25}, {money = 1}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.money}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.base.value == 'Jack' then
				ease_dollars(card.ability.extra.money)
				return {
				  chips = card.ability.extra.chips,
				  mult = card.ability.extra.mult,
				  x_mult = card.ability.extra.xmult,
				  card = card
				}
			end
		end
    end
})

--Magic Trick Card
create_joker({
    name = 'Magic Trick Card', id = 0, ex_art = true,
    rarity = 'Uncommon', cost = 4,
	
	vars = {{side = 0}},
	custom_vars = function(self, info_queue, card)
	
		local rank1 = localize(card.ability.extra.source_rank, 'ranks')
		local suit1 = localize(card.ability.extra.source_suit, 'suits_plural')
		
		local rank2 = localize(card.ability.extra.target_rank, 'ranks')
		local suit2 = localize(card.ability.extra.target_suit, 'suits_plural')
	
		local colour1 = G.C.SUITS[card.ability.extra.source_suit]
		local colour2 = G.C.SUITS[card.ability.extra.target_suit]
	
		return {vars = {rank1..' of '..suit1, rank2..' of '..suit2, colours = {colour1, colour2}}}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
	set_ability = function(self, card, initial, delay_sprites)
		if card.ability.extra.side == 0 then
			card.ability.extra.source_suit = 'Hearts'
			card.ability.extra.source_rank = 'Queen'
			
			card.ability.extra.target_suit = 'Clubs'
			card.ability.extra.target_rank = '7'
		else
			card.ability.extra.source_suit = 'Clubs'
			card.ability.extra.source_rank = '7'
			
			card.ability.extra.target_suit = 'Hearts'
			card.ability.extra.target_rank = 'Queen'
		end
		card.children.center:set_sprite_pos({x = card.ability.extra.side, y = 0})
    end,
	
    calculate = function(self, card, context)
	
		if context.pre_discard and not context.blueprint and not context.retrigger_joker then
            event({trigger = 'after', delay = 0.3, blockable = false,
				func = function()
				
					card:juice_up(1, 1)
					
					if card.ability.extra.side == 0 then
						card.ability.extra.side = 1
						
						card.ability.extra.source_suit = 'Clubs'
						card.ability.extra.source_rank = '7'
						
						card.ability.extra.target_suit = 'Hearts'
						card.ability.extra.target_rank = 'Queen'
					else
						card.ability.extra.side = 0
						
						card.ability.extra.source_suit = 'Hearts'
						card.ability.extra.source_rank = 'Queen'
						
						card.ability.extra.target_suit = 'Clubs'
						card.ability.extra.target_rank = '7'
					end
					card.children.center:set_sprite_pos({x = card.ability.extra.side, y = 0})
	
				return true end})
				
				card_eval_status_text(
            card,
            'extra',
            nil, nil, nil,
            {message = 'Flipped!', colour = G.C.ORANGE, instant = true}
        )
		end
		
		if context.after and not context.blueprint and not context.retrigger_joker then
			for i = 1, #context.scoring_hand do
				local currentCard = context.scoring_hand[i]
				
				local is_activate = currentCard:is_suit(card.ability.extra.source_suit) and currentCard.base.value == card.ability.extra.source_rank
				
				if is_activate then
					--Flipping Animation
					event({trigger = 'after', delay = 0.1, func = function() big_juice(card); currentCard:flip(); play_sound('card1', 1); currentCard:juice_up(0.3, 0.3); return true end })
					
					--Changing Card Property
					
					event({trigger = 'after', delay = 0.05,  func = function()
						 SMODS.change_base(currentCard, card.ability.extra.target_suit, card.ability.extra.target_rank)
						return true end })
					
					--Unflipping Animation
					event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); currentCard:juice_up(0.3, 0.3); return true end })
					forced_message("Changed!", currentCard, G.C.ORANGE, true)
				end
			end
		end
		
    end
})

--Queensland
create_joker({
    name = 'Queensland', id = 61,
    rarity = 'Rare', cost = 7,
	
	gameplay_tag = {'enh_custom'},
	
	vars = {{count_max = 5}, {count = 0}},
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'resource_tooltip'}
		return {vars = {card.ability.extra.count_max, card.ability.extra.count_max - card.ability.extra.count}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.base.value == 'Queen' then
				if card.ability.extra.count < card.ability.extra.count_max then
					if not context.blueprint then
						card.ability.extra.count = card.ability.extra.count + 1
					end
					
					local other_card = context.other_card
					
					event({func = function()
									local rank = pseudorandom_element(SMODS.Ranks, pseudoseed('queensland')..G.SEED).card_key
									local suit = SMODS.Suits[other_card.base.suit].card_key
									
									local _card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[suit..'_'..rank], G.P_CENTERS.m_unstb_resource, {playing_card = G.playing_card})
									
									big_juice(context.blueprint_card or card)
									
									_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
									G.play:emplace(_card)
									table.insert(G.playing_cards, _card)
									
									event({func = function()
										playing_card_joker_effects({_card})
									return true end })
									
									return true end
							})

					event({func = function()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						draw_card(G.play,G.deck, 90,'up', nil)  
						return true end
						})
					
				end
				
				return nil, true
			end
		end
		
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if card.ability.extra.count > 0 then
				card.ability.extra.count = 0
				return {
					  message = 'Reset!'
				}
			end
		end
    end
})

--King of Pop
create_joker({
    name = 'King of Pop', id = 62,
    rarity = 'Rare', cost = 8,
	
	gameplay_tag = {'j_powerful'},
	
	vars = {{odds_destroy = 4}},
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_TAGS.tag_double
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_destroy}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		--Pre-hand check
		if context.before and not context.blueprint then
			for i=1, #context.scoring_hand do
				if not SMODS.has_no_rank(context.scoring_hand[i]) and context.scoring_hand[i].base.value == 'King' and context.scoring_hand[i].config.center ~= G.P_CENTERS.c_base and not context.scoring_hand[i].config.center.disenhancement then
					if pseudorandom('kingofpop'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_destroy then
						context.scoring_hand[i].to_destroy = true
					end
				end
			end
		end
		
		if context.destroying_card then
			if context.destroying_card.to_destroy then
				print(inspect(context))
			
				event({	 trigger = 'after', delay = 0.5, func = function()
						
										add_tag(Tag('tag_double'))
										play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
										play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
										
										return true end
								}
							)
				forced_message("Tag!", card, G.C.SECONDARY_SET.Enhanced)
			
				if not context.blueprint then
					return { remove = true } --Destroy the card
				end
			end
		end
    end
})

--Polychrome Red Seal Steel Joker
create_joker({
    name = 'prssj', id = 63,
    rarity = 'Rare', cost = 10,
	
	gameplay_tag = {'j_shitpost', 'j_powerful', 'edition_upgrade'},
	
	vars = {{odds_upgrade = 8}, {odds_retrigger = 4}, {odds_hand = 2}, {hand_xmult = 2}},
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'upgrade_edition'}
	
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds_upgrade, card.ability.extra.odds_retrigger, card.ability.extra.odds_hand,  card.ability.extra.hand_xmult}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
	
		--Upgrade Part
		if context.before then
		
			local upgrade_count = 0
			for i = 1, #context.scoring_hand do
				local current_card = context.scoring_hand[i]
				
				if not current_card.debuff and current_card.base.value == 'King' and pseudorandom('prssj1'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_upgrade then
					upgrade_count = upgrade_count+1
					edition_upgrade(current_card)
				end
			end
			
			if upgrade_count > 0 then
				--forced_message("Upgrade!", context.blueprint_card or card, G.C.SECONDARY_SET.Enhanced, true)
				return {
					message = 'Upgrade!',
					colour = G.C.SECONDARY_SET.Enhanced,
					card = context.blueprint_card or card,
				}
			end
		
		end
		
		if context.cardarea == G.play and context.repetition and not context.repetition_only and not context.other_card.debuff and context.other_card.base.value == 'King' then
			if pseudorandom('prssj2'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_retrigger then
				return {
				  message = 'Again!',
				  repetitions = 1,
				  card =  context.blueprint_card or card
				}
			end
		end
		
		if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card.base.value == 'King' then
			if pseudorandom('prssj3'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_hand then
				if context.other_card.debuff then
					return {
						message = localize('k_debuffed'),
						colour = G.C.RED,
						card = context.blueprint_card or card,
					}
				else
					return {
						x_mult = card.ability.extra.hand_xmult,
						card = context.blueprint_card or card
					}
				end
			end
		end
    end
})

--Master of One
create_joker({
    name = 'Master of One', id = 64,
    rarity = 'Uncommon', cost = 7,
	
	gameplay_tag = {'rank_binary', 'j_alter'},
	
	--vars = {},
	custom_vars = function(self, info_queue, card)
		return {vars = {}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	add_to_deck = function(self, card, from_debuff)
		--Enable rank 1 card in pools
		if not from_debuff then
			setPoolRankFlagEnable('unstb_1', true);
		end
    end,
	
    calculate = function(self, card, context)
	
		if context.setting_blind then
			--Adds a card
			event({trigger = 'after', func = function()
						local rank = 'unstb_1'
						local suit = pseudorandom_element(SMODS.Suits, pseudoseed('masterofone')..G.SEED).card_key
						
						--Pooling Enhancements
						local cen_pool = {}
						for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
							if not v.replace_base_card and not v.disenhancement then 
								cen_pool[#cen_pool+1] = v
							end
						end
						
						local _card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS[suit..'_'..rank], pseudorandom_element(cen_pool, pseudoseed('masterofone')..G.SEED), {playing_card = G.playing_card})
						
						_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
						G.play:emplace(_card)
						table.insert(G.playing_cards, _card)
						
						big_juice(context.blueprint_card or card)
						card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = 'One!', colour = G.C.SECONDARY_SET.Enhanced})
						
						event({func = function()
							playing_card_joker_effects({_card})
						return true end })
						
						return true end
					})

			event({trigger = 'after', func = function()
				G.deck.config.card_limit = G.deck.config.card_limit + 1
				draw_card(G.play,G.deck, 90,'up', nil)  
				return true end
				})
				
			return nil, true
		end
		
    end
})

--Spectre
create_joker({
    name = 'Spectre', id = 9,
    rarity = 'Uncommon', cost = 7,
	
	vars = {{xmult_rate = 0.25}, {xmult = 1}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.xmult_rate, card.ability.extra.xmult}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	set_ability = function(self, card, initial, delay_sprites)
		if G.GAME and G.GAME.consumeable_usage_total then
			card.ability.extra.xmult = 1 + G.GAME.consumeable_usage_total.spectral * card.ability.extra.xmult_rate
		else
			card.ability.extra.xmult = 1
		end
    end,
	
    calculate = function(self, card, context)
		
		--Upgrades
		if context.using_consumeable and not context.blueprint and not context.retrigger_joker then
                if context.consumeable.ability.set == "Spectral" then
				   card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_rate
				   event({
					func = function()
							big_juice(card)
							forced_message("Upgraded!", card, G.C.MULT, true)
							--card_eval_status_text(card,'extra',nil, nil, nil,{message = "Upgraded", colour = G.C.MULT, instant = true})
							return true end})
				end
		end
		
		--Main context
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end
		
    end
})

--Library Card
create_joker({
    name = 'Library Card', id = 52,
    rarity = 'Uncommon', cost = 8,
	
	vars = {{chips_rate = 5}, {mult_rate = 2}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips_rate, card.ability.extra.mult_rate}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if not context.other_card.config.center.no_suit and unstb_global.name_suit[context.other_card.base.suit] then
				local suit_info = unstb_global.name_suit[context.other_card.base.suit]
				
				local totalChips = card.ability.extra.chips_rate * suit_info.count_consonant
				local totalMult = card.ability.extra.mult_rate * suit_info.count_vowel
				
				return {
				  chips = totalChips,
				  mult = totalMult,
				  card = card
				}
			end
		end
    end
})

--Collector's Album
create_joker({
    name = 'Collector Album', id = 53,
    rarity = 'Uncommon', cost = 8,
	
	vars = {{chips_rate = 120}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips_rate, card.ability.extra.mult_rate}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
	
    calculate = function(self, card, context)
	
		if context.other_joker then
			--trigger on only joker with "Card" in the name
			if unstb_global.name_card[context.other_joker.config.center.key] then
				event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })
                return {
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips_rate}},
                    chip_mod = card.ability.extra.chips_rate
                }
			end
		end
    end
})

local function get_random_hand(current_hand, seed)
	local _poker_hands = {}
	
	--Populate list
    for k, v in pairs(G.GAME.hands) do
        if v.visible then _poker_hands[#_poker_hands+1] = k end
    end
       
	local new_hand = nil
    while not new_hand do
        new_hand = pseudorandom_element(_poker_hands, pseudoseed(seed or 'rand_hand'))
        if new_hand == current_hand then new_hand = nil end
    end
	
	return new_hand
end

--Throwing Hands
create_joker({
    name = 'Throwing Hands', id = 8,
    rarity = 'Common', cost = 5,
	
	vars = {{target_hand = 'High Card'}, {odds_base = 2}, {odds_destroy = 3}, {xmult = 4}, {is_destroyed = false}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.xmult, card.ability.extra.odds_base * (G.GAME and G.GAME.probabilities.normal  or 1), card.ability.extra.odds_destroy, localize(card.ability.extra.target_hand, 'poker_hands')}}
    end,
	
    blueprint = true, eternal = false, perishable = true,
	
	set_ability = function(self,card, initial, delay_sprites)
	
		--Random Poker Hand
        card.ability.extra.target_hand = get_random_hand(card.ability.extra.target_hand, 'throwinghands'..G.SEED)
    end,
	
    calculate = function(self, card, context)
		
		if context.joker_main and context.scoring_name ~= nil and context.scoring_hand then
		
			if context.scoring_name ~= card.ability.extra.target_hand then
				if pseudorandom('throwinghands'..G.SEED) < G.GAME.probabilities.normal * card.ability.extra.odds_base / card.ability.extra.odds_destroy then
					card.ability.extra.is_destroyed = true
				end
			end
			
			if not card.ability.extra.is_destroyed then
				return {
					xmult = card.ability.extra.xmult,
				}
			else
				if not context.blueprint and not context.retrigger_joker then
					event({func = function()
							
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						
						--Destroy Card
						event({trigger = 'after', delay = 0.3,  func = function()
							
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true end })
						
						return true end })
					return {
					  message = 'Bye',
					}
				end
			end
		
			
		end
		
		if context.end_of_round and not (context.individual or context.repetition or context.blueprint) then
            card.ability.extra.target_hand = get_random_hand(card.ability.extra.target_hand, 'throwinghands'..G.SEED)
			
            return {
                message = card.ability.extra.target_hand
            }
        end
    end
})

--Imperial Bower
create_joker({
    name = 'Imperial Bower', id = 58,
    rarity = 'Common', cost = 7,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = { {xmult = 3}},
	
	custom_vars = function(self, info_queue, card)
        
		return { vars = {card.ability.extra.xmult}}
    end,
	
    calculate = function(self, card, context)
	
		if context.joker_main and next(context.poker_hands['Straight']) then
			
			local face_count = 0
			
			for i=1, #context.scoring_hand do
				if context.scoring_hand[i]:is_face() then
					face_count = face_count+1
				end
			end
			
			if face_count > 0 then
				return {
					Xmult_mod = card.ability.extra.xmult,
					message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
				}
			end
			
		end
		
	end,
})

--The Jolly Joker
create_joker({
    name = 'The Jolly Joker', id = 59,
    rarity = 'Uncommon', cost = 6,
	
	gameplay_tag = {'j_powerful'},
	
    blueprint = true, eternal = true, perishable = false,
	
	vars = { {mult_rate = 8}, {mult = 0}},
	
	custom_vars = function(self, info_queue, card)
        
		return { vars = {card.ability.extra.mult_rate, card.ability.extra.mult}}
    end,
	
    calculate = function(self, card, context)
	
		if context.before and context.scoring_hand and not context.blueprint then
			if next(context.poker_hands['Pair']) then
			
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_rate
				
				return {
					message = 'Upgraded!',
					colour = G.C.MULT,
					card = card
				}
				
			elseif card.ability.extra.mult > 0 then
				card.ability.extra.mult = 0
				
				event({ trigger = 'after', delay = 0.2, func = function()
                play_sound('tarot1')
				return true end })
				
				return {
					message = 'Reset',
					card = card
				}
			end
		end
	
		if context.joker_main then
			if card.ability.extra.mult > 0 then
				return {
					mult_mod = card.ability.extra.mult,
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
				}
			end
			
		end
		
	end,
})

--Get Out of Jail Free Card
create_joker({
    name = 'Get Out of Jail Free Card', id = 48,
    rarity = 'Rare', cost = 10,
	
    blueprint = false, eternal = false, perishable = true,
	
	--vars = { {times = 1}},
	
	custom_vars = function(self, info_queue, card)
	
		local activate_text = 'Inactive'
		local activate_color = G.C.RED
		if G.STATE == G.STATES.SELECTING_HAND then
			activate_text = 'Active'
			activate_color = G.C.GREEN
		end
	
		return {vars = {activate_text,
				colours = {activate_color} }}
    end,
	
	--Set sprites and hitbox
	resize = { w = 64, h = 93 },
	
	add_to_deck = function(self, card, from_debuff)
		--Set the flag to true immediately once this joker has been picked up, it can't spawn again for the rest of the session
		G.GAME.pool_flags.jailfree_get = true
	end,
	
    calculate = function(self, card, context)
		--Referenced from DebugPlus's "Win Blind" function
		if context.selling_self and not context.blueprint then
			if G.STATE ~= G.STATES.SELECTING_HAND then
				return
			end
			G.GAME.chips = G.GAME.blind.chips
			G.STATE = G.STATES.HAND_PLAYED
			G.STATE_COMPLETE = true
			end_round()
		end
	end,
	
	custom_in_pool = function(self, args)
	
		--Spawns if this card has not been picked before
		return not G.GAME.pool_flags.jailfree_get
		
    end
	
})

--Tanzaku
create_joker({
    name = 'Tanzaku', id = 70,
    rarity = 'Rare', cost = 8,
	
	gameplay_tag = {'j_powerful'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{ repetitions = 0 }, { repetition_rate = 1 }, {seal_count_current = 0}, {seal_count_trigger = 2} },
	
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.repetitions, card.ability.extra.repetition_rate,  card.ability.extra.seal_count_trigger, card.ability.extra.seal_count_trigger-card.ability.extra.seal_count_current}}
    end,
	
	--Set sprites and hitbox
	resize = { w = 50, h = 80 },
	
    calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
		  if context.other_card.seal  then
			return {
			  message = 'Again!',
			  repetitions = card.ability.extra.repetitions,
			  card =  context.blueprint_card or card
			}
		  end
		end
		
		--The scaling part is not copyable by Blueprint
		if context.discard and not context.blueprint then
			
			local currentCard = context.other_card
			
			--Not debuffed, and has seal
			if not currentCard.debuff and currentCard.seal then
			
				if card.ability.extra.seal_count_current < 8 then
					card.ability.extra.seal_count_current = card.ability.extra.seal_count_current + 1
					
					if card.ability.extra.seal_count_current>=card.ability.extra.seal_count_trigger then
						card.ability.extra.seal_count_current = 0
						
						card.ability.extra.repetitions = card.ability.extra.repetitions + card.ability.extra.repetition_rate
						
						--forced_message('+'..card.ability.extra.repetition_rate, card, G.C.ORANGE, true)
						return {
							message = '+'..card.ability.extra.repetition_rate,
							card = card
						}
					end
				end
			end
			
		end
		
		--End of round check, make sure it's checked absolutely once per round
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint then
			if card.ability.extra.repetitions > 0 then
				card.ability.extra.repetitions = 0
				return {
					  message = 'Reset!'
				}
			end
		end
	end
})

--Glass Cannon
create_joker({
    name = 'Glass Cannon', id = 68,
    rarity = 'Rare', cost = 8,
	
	gameplay_tag = {'j_powerful'},
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{ repetitions = 1 }},
	
	custom_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_glass
		return {vars = {card.ability.extra.repetitions}}
    end,
	
    calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
		  if context.other_card.config.center == G.P_CENTERS.m_glass  then
			return {
			  message = 'Again!',
			  repetitions = card.ability.extra.repetitions,
			  card =  context.blueprint_card or card
			}
		  end
		end
		
		if context.destroying_card and not context.blueprint then
				if context.destroying_card.config.center == G.P_CENTERS.m_glass then
					return { remove = true } --Destroy the card
				end
		end
	end
})

--Pity Rate Drop
create_joker({
    name = 'Pity Rate Drop', id = 71,
    rarity = 'Rare', cost = 8,
	
    blueprint = true, eternal = true, perishable = true,
	
	vars = {{ odds = 8 }, {odds_rate = 1}, {odds_current = 1}},
	
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.odds_current * (G.GAME and G.GAME.probabilities.normal  or 1), card.ability.extra.odds, card.ability.extra.odds_rate * (G.GAME and G.GAME.probabilities.normal or 1), G.GAME and G.GAME.probabilities.normal  or 1}}
    end,
	
    calculate = function(self, card, context)
	
		if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
			if pseudorandom('pity_rate_drop'..G.SEED) < G.GAME.probabilities.normal * card.ability.extra.odds_current / card.ability.extra.odds then
			
				if context.blueprint then
					card.ability.extra.blueprint_created = true
				end
				card.ability.extra.odds_current = 1
				
				local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
				G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
				event({
					func = function() 
						for i = 1, jokers_to_create do
							local card = create_card('Joker', G.jokers, nil, 1, nil, nil, nil, 'pity_rate_drop')
							card:add_to_deck()
							G.jokers:emplace(card)
							card:start_materialize()
						end
						G.GAME.joker_buffer = 0
						return true
					end})   
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = 'Create!', colour = G.C.RED})
			else
				--Odds increments part are not copyable by Blueprint
				if not context.blueprint and not context.retrigger_joker then
					--Increase odds, only if a card has not been created by blueprint prior
					
					if not card.ability.extra.blueprint_created then
						card.ability.extra.odds_current = card.ability.extra.odds_current + card.ability.extra.odds_rate
					else
						card.ability.extra.blueprint_created = nil
					end
					
					play_nope_sound()
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = 'Nope', colour = G.C.RED})
				end
			end
			return nil, true
		end
	end
})

--Salmon Run
create_joker({
    name = 'Salmon Run', id = 10,
    rarity = 'Uncommon', cost = 7,
	
	vars = {{odds = 7}},
	custom_vars = function(self, info_queue, card)
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			local currentCard = context.other_card
			
			if not SMODS.has_no_rank(currentCard) and currentCard.base.value == '7' then
				local isActivated = pseudorandom('salmonrun'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds
				
				if isActivated then
					event({func = function()
									--Copy Card
									local _card = copy_card(currentCard, nil, nil, G.playing_card)
									_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
									G.play:emplace(_card)
									table.insert(G.playing_cards, _card)
									
									event({func = function()
										playing_card_joker_effects({_card})
									return true end })
									
									return true end
							})

					event({func = function()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						draw_card(G.play,G.deck, 90,'up', nil)  
						return true end
						})
				end
				
				return nil, true
			end
		end
    end
})

--Cool S
create_joker({
    name = 'Cool S', id = 66,
    rarity = 'Common', cost = 8,
	
	vars = {},
	custom_vars = function(self, info_queue, card)
		return {vars = {}}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		if context.after and not context.blueprint and not context.retrigger_joker then
			for i = 1, #context.scoring_hand do
				local currentCard = context.scoring_hand[i]
				
				if currentCard.base.value == '8' then
					--Pooling Enhancements
					local cen_pool = {}
					for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
						if not v.replace_base_card and not v.disenhancement then 
							cen_pool[#cen_pool+1] = v
						end
					end
					
					--Flipping Animation
					event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('card1', 1); currentCard:juice_up(0.3, 0.3); return true end })
					
					--Changing Card Property
					
					event({trigger = 'after', delay = 0.05,  func = function()
					
						currentCard:set_ability(pseudorandom_element(cen_pool, pseudoseed('cool_s'..G.SEED)))
					
						return true end })
					
					--Unflipping Animation
					event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); currentCard:juice_up(0.3, 0.3); return true end })
					
					delay(0.1)
				end
			end
		end
    end
})

--Memoriam Photo
create_joker({
    name = 'Memoriam Photo', id = 72,
    rarity = 'Uncommon', cost = 6,
	
	vars = {{chips = 0}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips}}
    end,
	
    blueprint = true, eternal = true, perishable = false,
	
    calculate = function(self, card, context)
		--Upgrades
		if context.remove_playing_cards and not context.blueprint and not context.retrigger_joker then
			local added_total = 0
			for i=1, #context.removed do
				if not SMODS.has_no_rank(context.removed[i]) then
					added_total = added_total + context.removed[i].base.nominal
				end
			end
			
			if added_total>0 then
				card.ability.extra.chips = card.ability.extra.chips + (2 * added_total)
				event({
					func = function()
						big_juice(card)
						forced_message("Upgraded!", card, G.C.CHIPS, true)
						--card_eval_status_text(card,'extra',nil, nil, nil,{message = "Upgraded", colour = G.C.MULT, instant = true})
						return true end
					})
			end
		end
		
		--Main context
		if context.joker_main then
			if card.ability.extra.chips > 0 then
				return {
					chip_mod = card.ability.extra.chips,
					message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
				}
			end
		end
    end,
})

--Schrodinger Cat
create_joker({
    name = 'Schrodinger Cat', id = 73,
    rarity = 'Uncommon', cost = 8,
	
	vars = {{odds = 3}},
	custom_vars = function(self, info_queue, card)
		return {vars = {G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds}}
    end,
	
    blueprint = true, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		--Upgrades
		if context.remove_playing_cards then
			for i=1, #context.removed do
				local isActivated = pseudorandom('schrodingercat'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds
				
				if isActivated then
					event({func = function()
									--Copy Card
									G.playing_card = (G.playing_card and G.playing_card + 1) or 1
									local _card = copy_card(context.removed[i], nil, nil, G.playing_card)
									
									--Special interaction: if it is a vintage card, resets the odds
									if _card.config.center.key == 'm_unstb_vintage' then
										_card.ability.extra.current_odd = 0
									end
									
									_card:start_materialize({G.C.SECONDARY_SET.Enhanced})
									_card:add_to_deck()
									G.deck:emplace(_card)
									table.insert(G.playing_cards, _card)
									
									event({func = function()
										playing_card_joker_effects({_card})
									return true end })
									return true end
							})
							
					event({func = function()
									G.deck.config.card_limit = G.deck.config.card_limit + 1
									return true end
							})
					
					forced_message(localize('k_copied_ex'), context.blueprint_card or card, G.C.ORANGE, 0.25)
				end
			end
			return nil, true
		end
    end,
})

--Cashback Card
create_joker({
    name = 'Cashback Card', id = 51,
    rarity = 'Rare', cost = 9,
	
	vars = {{payout = 0}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.payout}}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		if context.using_consumeable and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.payout = card.ability.extra.payout + 1
			event({
			func = function()
					big_juice(card)
					forced_message("Upgrade!", card, G.C.GOLD, true)
					--card_eval_status_text(card,'extra',nil, nil, nil,{message = "Upgraded", colour = G.C.MULT, instant = true})
					return true end})
		end
    end,
	calc_dollar_bonus = function(self, card)
		if G.GAME.blind.boss then
			local bonus = card.ability.extra.payout
			
			card.ability.extra.payout = 0
			
			if bonus > 0 then return bonus end
		end
	end
})

--Raffle
create_joker({
    name = 'Raffle', id = 50,
    rarity = 'Common', cost = 8,
	
	vars = {{odds = 20}, {prize = 20}, {current_odds = 0}},
	custom_vars = function(self, info_queue, card)
		return {vars = {(G.GAME and G.GAME.probabilities.normal or 1)*card.ability.extra.current_odds, card.ability.extra.odds, card.ability.extra.prize, G.GAME and G.GAME.probabilities.normal or 1, }}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		--All upgraded part
		if context.buying_card and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.current_odds = card.ability.extra.current_odds + 1
			forced_message('Upgrade!', card, G.C.ORANGE, true)
		end
		
		if context.reroll_shop and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.current_odds = card.ability.extra.current_odds + 1
			forced_message('Upgrade!', card, G.C.ORANGE, true)
		end
		
		if context.open_booster and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.current_odds = card.ability.extra.current_odds + 1
			forced_message('Upgrade!', card, G.C.ORANGE, true)
		end
		
		--Payout
		if context.ending_shop and not context.blueprint and not context.retrigger_joker then
			if pseudorandom('raffle'..G.SEED) < G.GAME.probabilities.normal * card.ability.extra.current_odds / card.ability.extra.odds then
				event({trigger = 'after',  func = function()
									ease_dollars(card.ability.extra.prize, true)
									big_juice(context.blueprint_card or card)
									return true end })
				forced_message('$'..card.ability.extra.prize, card, G.C.GOLD, true)
			else
				play_nope_sound()
				forced_message('Nope', card, G.C.RED, true)
			end
			
			card.ability.extra.current_odds = 0
		end
		
		--Make sure the chance resets again when round ends, cause booster opening from tags currently still trigger it and idk how to prevent that
		if context.end_of_round and not context.other_card and not context.repetition and not context.game_over and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.current_odds = 0
		end
    end
})

--ease_dollars hook, for IC Card
local ref_ease_dollars = ease_dollars
function ease_dollars(mod, instant)

	if to_big(mod) < to_big(0) then
	
		local iccard_list = SMODS.find_card('j_unstb_ic_card')
	
		if next(iccard_list) then
			for i=1, #iccard_list do
				 if iccard_list[i].ability.extra.balance > 0 then 
				 
					--Note: Spend amount is negative
					local spendamount = math.max(mod, -iccard_list[i].ability.extra.balance)
					
					mod = mod - spendamount
					iccard_list[i].ability.extra.balance = iccard_list[i].ability.extra.balance + spendamount
					G.GAME.virtual_dollars = G.GAME.virtual_dollars + spendamount
					
					if not instant then
						forced_message("-$"..math.abs(spendamount), iccard_list[i], G.C.red, 0.5)
					end
					
					if mod >= 0 then
						return
					end
				 end
			end
		end
	end
	
	ref_ease_dollars(mod, instant)
end

--IC Card
create_joker({
    name = 'IC Card', id = 49,
    rarity = 'Uncommon', cost = 6,
	
	vars = {{money_rate = 3},{balance = 0}, {round_max = 9}},
	custom_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.money_rate, card.ability.extra.round_max, card.ability.extra.balance, card.ability.extra.round_left}}
    end,
	
    blueprint = false, eternal = false, perishable = false,
	
	set_ability = function(self, card, initial, delay_sprites)
		card.ability.extra.round_left = card.ability.extra.round_max
		
		if G.STATE ~= G.STATES.SHOP then --Joker obtained not during the shop
			card.ability.extra.start_counting = true
		end
    end,
	
	add_to_deck = function(self, card, from_debuff)
		G.GAME.virtual_dollars = (G.GAME.virtual_dollars or 0) + card.ability.extra.balance
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.virtual_dollars = (G.GAME.virtual_dollars or 0) - card.ability.extra.balance
	end,
	
    calculate = function(self, card, context)
		
		--When entering the round, start counting the round remaining
		--(If the Joker is bought in the shop, the first shop leave will not be counted down)
		if context.first_hand_drawn then
			card.ability.extra.start_counting = true
		end
		
		if context.before and context.scoring_hand and not context.blueprint and not context.retrigger_joker then
			card.ability.extra.balance = card.ability.extra.balance + card.ability.extra.money_rate
			
			--Update the game's global virtual money at the same time
			G.GAME.virtual_dollars = (G.GAME.virtual_dollars or 0) + card.ability.extra.money_rate
			
			forced_message("$"..card.ability.extra.money_rate, card, G.C.GOLD, true)
		end
		
		if context.ending_shop and not context.blueprint and not context.retrigger_joker then
		
			if card.ability.extra.start_counting then
				card.ability.extra.round_left = card.ability.extra.round_left - 1
				
				if card.ability.extra.round_left <= 0 then
					event({func = function()
							
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						
						--Destroy Card
						event({trigger = 'after', delay = 0.3,  func = function()
							
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							return true end })
						
						return true end })
					card_eval_status_text(card,'extra',nil, nil, nil,{message = 'Expired', colour = G.C.ORANGE, instant = true})
				else
					forced_message(card.ability.extra.round_left..' Round', card, G.C.ORANGE, true)
				end
				
			end
		
			card.ability.extra.start_counting = false
		end
    end
})



--local rank_2048 = { unstb_0 = true, unstb_1 = true, ['2'] = true, ['4'] = true, ['8'] = true}

--2048
create_joker({
    name = 'j2048', id = 3,
    rarity = 'Uncommon', cost = 7,
	
	gameplay_tag = {'j_alter'},
	
	vars = {{card_to_destroy = {}}},
	
	custom_vars = function(self, info_queue, card)
		
		--[[local key = self.key
		if getPoolRankFlagEnable('unstb_0') or getPoolRankFlagEnable('unstb_1') then
			key = self.key..'_ex'
		end]]
	
		return { vars = {} }
	end,
	
    blueprint = false, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		if context.before and context.scoring_hand and not context.blueprint and not context.retrigger_joker then
			local card_list = {}
			local card_to_destroy = {}
			
			for i = 1, #context.scoring_hand do
				local c = context.scoring_hand[i]
				local key = c.base.value
				
				--print(rank_2048[c.base.value])
				
				
				if card_list[key] then
					--print('found the card list: '..c.base.value)
				
					local prev_card = card_list[key]
					card_to_destroy[#card_to_destroy+1] = prev_card
					
					--Transfer chips
					local bonusChip = prev_card.ability.perma_bonus or 0
					local baseChip = SMODS.Ranks[prev_card.base.value].nominal
					
					--Delay the chip adding, so it does not get evaluated
					event({delay = 0.1, func = function()
					c.ability.perma_bonus = (c.ability.perma_bonus or 0) + baseChip + bonusChip
					return true end
					})
					
					--Erase the slot, if there's the next one then it counts as a new pair
					card_list[key] = nil
				else
					--print('adding to card list: '..c.base.value)
					card_list[key] = c
				end
				
			end
			
			--print('done')
			--print(inspectDepth(card_to_destroy, nil, 1))
			
			card.ability.extra.card_to_destroy = card_to_destroy
		end
		
		if context.destroying_card and not context.blueprint then
			--print('check card to destroy main')
			for i = 1, #card.ability.extra.card_to_destroy do
				--print('check card to destroy')
				--print(context.destroying_card == card.ability.extra.card_to_destroy[i])
				if context.destroying_card == card.ability.extra.card_to_destroy[i] then
					return { remove = true }
				end
			end
		end
    end
})

--Inductor
create_joker({
    name = 'Inductor', id = 1,
    rarity = 'Rare', cost = 8,
	
	gameplay_tag = {'j_powerful'},
	
	vars = {{odds_en = 2}, {odds_ed = 4}, {odds_s = 8}},
	
    custom_vars = function(self, info_queue, card)
        local vars
        if G.GAME and G.GAME.probabilities.normal then
            vars = {G.GAME.probabilities.normal, card.ability.extra.odds_en, card.ability.extra.odds_ed, card.ability.extra.odds_s}
        else
            vars = {1, card.ability.extra.odds_en, card.ability.extra.odds_ed, card.ability.extra.odds_s}
        end
        return {vars = vars}
    end,
	
    blueprint = false, eternal = true, perishable = true,
	
    calculate = function(self, card, context)
		
		if context.after and context.scoring_hand and #context.scoring_hand > 1 and not context.blueprint and not context.retrigger_joker then
			local sourceCard = {}
		
			for i = 1, #context.scoring_hand do
				if not (context.scoring_hand[i].config.center == G.P_CENTERS.m_stone or context.scoring_hand[i].config.center.replace_base_card) then --Check if it is not a Stone card or have any weird enhancement
					if sourceCard[context.scoring_hand[i].base.value..context.scoring_hand[i].base.suit] then --targetCard exists
						
						local currentCard = context.scoring_hand[i]
						local targetCard = sourceCard[context.scoring_hand[i].base.value..context.scoring_hand[i].base.suit]
						
						
						local isCopyEnhancement = pseudorandom('prop_enh'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_en
						local isCopyEdition = pseudorandom('prop_ed'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_ed
						local isCopySeal = pseudorandom('prop_s'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds_s
						
						--Extra check, if the current card and target card have the same status, don't play animation
						
						if currentCard.config.center == targetCard.config.center then
							isCopyEnhancement = false
							
						end
						if (currentCard.edition or {}).key == (targetCard.edition or {}).key then
							isCopyEdition = false
							
						end
						if currentCard.seal == targetCard.seal then
							isCopySeal = false
						end
						
						local isPlayingAnimation = isCopyEnhancement or isCopyEdition or isCopySeal
						
						if isPlayingAnimation then
							--Flipping Animation
							event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('card1', 1); currentCard:juice_up(0.3, 0.3); return true end })
							
							--Changing Card Property
							event({trigger = 'after', delay = 0.05,  func = function()
							
							--Copy enhancement
							if isCopyEnhancement then
								currentCard:set_ability(targetCard.config.center)
							end
							
							--Copy edition
							if isCopyEdition then
								currentCard:set_edition(targetCard.edition, true, true)
							end
							
							--Copy seal
							if isCopySeal then
								currentCard:set_seal(targetCard.seal, true, true)
							end
							
							return true end })
							
							--Unflipping Animation
							event({trigger = 'after', delay = 0.1, func = function() currentCard:flip(); play_sound('tarot2', 1, 0.6); big_juice(card); currentCard:juice_up(0.3, 0.3); return true end })
							forced_message("Copied!", currentCard, G.C.RED, true)
						end
					else --set the target card to the following
						sourceCard[context.scoring_hand[i].base.value..context.scoring_hand[i].base.suit] = context.scoring_hand[i]
					end	
				end
			end
		
		end
		
    end
})

--Decks

if unstb_config.gameplay.c_aux then

SMODS.Back{ -- Utility Deck
	key = "utility", 
	pos = {x = 0, y = 0},
	
	unlocked = true,

    config = {vouchers = {'v_unstb_aux1'}, aux_amount = 1, aux_chance = 2},
    loc_vars = function(self)
        return {vars = {}}
    end,

    apply = function(self)
		G.GAME.auxiliary_rate = (G.GAME.auxiliary_rate or 0) + self.config.aux_chance
         event({
				func = function()
					for i = 1, self.config.aux_amount do
						local card = create_card('Auxiliary', G.consumeables, nil, nil, nil, nil, 'c_unstb_aux_random', 'utildeck')
						card:add_to_deck()
						G.consumeables:emplace(card)
					end
					return true
				end
                })
    end,

    atlas = 'unstb_deck'
}

end

if check_enable_taglist({'rank_binary', 'rank_decimal'}) then

unstb.lowkey_rankList = {'2', '3', '4', '5', 'unstb_0', 'unstb_0.5', 'unstb_1', 'unstb_r2', 'unstb_e', 'unstb_Pi'}
		
unstb.lowkey_blacklisted = {}
unstb.lowkey_ranklist = {}

--Populate the Lowkey Deck rank blacklist, called at the Splash Screen to support modded ranks as well
function init_lowkey_blacklist()
	for k, v in pairs(SMODS.Ranks) do
		if not table_has_value(unstb.lowkey_rankList, k) then
			unstb.lowkey_blacklisted[k] = true
		end
	end
end

SMODS.Back{ -- Lowkey Deck
	key = "lowkey", 
	pos = {x = 1, y = 0},
	
	unlocked = true,

    config = {},
    loc_vars = function(self)
        return {vars = {}}
    end,

    apply = function(self)
		
		--Enable all the pool flags
		setPoolRankFlagEnable('unstb_0', true);
		setPoolRankFlagEnable('unstb_0.5', true);
		setPoolRankFlagEnable('unstb_1', true);
		setPoolRankFlagEnable('unstb_r2', true);
		setPoolRankFlagEnable('unstb_e', true);
		setPoolRankFlagEnable('unstb_Pi', true);
	
		--Notice: used card_key version and not standard key
		local added_rank = {'unstb_0', 'unstb_0.5', 'unstb_1', 'unstb_R', 'unstb_E', 'unstb_P'}
				
		local all_suit = {}
		
		for k, v in pairs(SMODS.Suits) do
			--If has in_pool, check in_pool
			if type(v) == 'table' and type(v.in_pool) == 'function' and v.in_pool then
				if v:in_pool({initial_deck = true}) then
					all_suit[#all_suit+1] = v.card_key
				end
			else --Otherwise, added by default
				all_suit[#all_suit+1] = v.card_key
			end
			
		end
		
		--print(inspect(all_suit))
		
		local extra_cards = {}
		
		for i=1, #all_suit do
			for j=1, #added_rank do
				extra_cards[#extra_cards+1] = {s = all_suit[i], r = added_rank[j]}
			end
		end
		
		G.GAME.starting_params.extra_cards = extra_cards
		
		G.GAME.starting_params.blacklisted_ranks = unstb.lowkey_blacklisted
		
    end,

    atlas = 'unstb_deck'
}
end


--Compatibility / Tweaks / Rework Stuff

--CardSleeves Support
if CardSleeves then

--Sleeves
SMODS.Atlas {
  -- Key for code to find it with
  key = "sleeve",
  path = "sleeve.png",
  px = 73,
  py = 95
}

if unstb_config.gameplay.c_aux then

--Utility Sleeve
CardSleeves.Sleeve({
	name = "Utility Sleeve",
	key="utility",
	atlas="sleeve",
	pos = { x = 0, y = 0 },
	unlocked = true,
	loc_vars = function(self)
		local key
		
		if self.get_current_deck_key() ~= "b_unstb_utility" then
			key = self.key
			self.config = { voucher = 'v_unstb_aux1', aux_chance = 1}
		else
			key = self.key .. "_alt"
			self.config = { voucher = 'v_unstb_aux2', aux_chance = 1}
		end
		return { key = key }
	end,
	apply = function(self)
		--Call main apply function from CardSleeve first to apply vouchers
		CardSleeves.Sleeve.apply(self)
		
		G.GAME.auxiliary_rate = (G.GAME.auxiliary_rate or 0) + self.config.aux_chance
		
		event({
			func = function()
			
				if self.get_current_deck_key() ~= "b_unstb_utility" then
					local card = create_card('Auxiliary', G.consumeables, nil, nil, nil, nil, 'c_unstb_aux_random', 'utildeck')
					card:add_to_deck()
					G.consumeables:emplace(card)
				else
					local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_unstb_free_trial', nil)
					card:set_edition({negative = true}, true)
					card:add_to_deck()
					G.jokers:emplace(card)
				end
				
				return true
			end
			})
	end
})

end

if check_enable_taglist({'rank_binary', 'rank_decimal'}) then

--Lowkey Sleeve
CardSleeves.Sleeve({
	name = "Lowkey Sleeve",
	key="lowkey",
	atlas="sleeve",
	pos = { x = 1, y = 0 },
	unlocked = true,
	loc_vars = function(self)
		local key
		
		if self.get_current_deck_key() ~= "b_unstb_lowkey" then
			key = self.key
			self.config = { remove_ranks = true }
		else
			key = self.key .. "_alt"
			self.config = { prevent_ranks = true }
		end
		return { key = key }
	end,
	apply = function(self)
		--Call main apply function from CardSleeve first to apply vouchers
		CardSleeves.Sleeve.apply(self)
			
		--Regular sleeve effects
		
		if self.config.remove_ranks then
			--Enable all the pool flags
			setPoolRankFlagEnable('unstb_0', true);
			setPoolRankFlagEnable('unstb_0.5', true);
			setPoolRankFlagEnable('unstb_1', true);
			setPoolRankFlagEnable('unstb_r2', true);
			setPoolRankFlagEnable('unstb_e', true);
			setPoolRankFlagEnable('unstb_Pi', true);
		
			--Notice: used card_key version and not standard key
			local added_rank = {'unstb_0', 'unstb_0.5', 'unstb_1', 'unstb_R', 'unstb_E', 'unstb_P'}
					
			local all_suit = {}
			
			for k, v in pairs(SMODS.Suits) do
				--If has in_pool, check in_pool
				if type(v) == 'table' and type(v.in_pool) == 'function' and v.in_pool then
					if v:in_pool({initial_deck = true}) then
						all_suit[#all_suit+1] = v.card_key
					end
				else --Otherwise, added by default
					all_suit[#all_suit+1] = v.card_key
				end
				
			end
			
			--print(inspect(all_suit))
			
			local extra_cards = {}
			
			for i=1, #all_suit do
				for j=1, #added_rank do
					extra_cards[#extra_cards+1] = {s = all_suit[i], r = added_rank[j]}
				end
			end
			
			G.GAME.starting_params.extra_cards = extra_cards
			
			G.GAME.starting_params.blacklisted_ranks = unstb.lowkey_blacklisted
		end
		
		--Set the game flags to prevent high rank, this affact premium booster
		if self.config.prevent_ranks then
			G.GAME.prevent_high_rank = true
		end
		
		--Code based on Abandoned Sleeve from CardSleeve itself, for special effect
		if self.config.prevent_ranks and self.allowed_card_centers == nil then
            self.allowed_card_centers = {}
            self.skip_trigger_effect = true
			
            for _, card_center in pairs(G.P_CARDS) do
                local card_instance = Card(0, 0, 0, 0, card_center, G.P_CENTERS.c_base)

                if not unstb.lowkey_blacklisted[card_instance.base.value] then
                    self.allowed_card_centers[#self.allowed_card_centers+1] = card_center
                end
                card_instance:remove()
            end
			
            -- Make it loops around to 0 immediately after using strength on 5
            self.get_rank_after_5 = function() return "unstb_0" end
            self.skip_trigger_effect = false
        end
	end,
	calculate = function(self, sleeve, context)
	
		--Code based on Abandoned Sleeve from CardSleeve itself
        if not sleeve.config.prevent_ranks then
            return
        end
        if sleeve.skip_trigger_effect then
            return
        end
        if sleeve.allowed_card_centers == nil then
            sleeve:apply()
        end

        -- handle Strength, Ouija, Grim, Familiar
        local card = context.card
        local is_playing_card = card and (card.ability.set == "Default" or card.ability.set == "Enhanced") and card.config.card_key
        if context.before_use_consumable and card then
            if card.ability.name == 'Strength' then
                sleeve.in_strength = true
            elseif card.ability.name == "Ouija" then
                sleeve.in_ouija = true
			elseif card.ability.name == "Grim" then
                sleeve.in_grim = true
			elseif card.ability.name == "Familiar" then
                sleeve.in_familiar = true
            end
			
        elseif context.after_use_consumable then
            sleeve.in_strength = nil
            sleeve.in_ouija = nil
			sleeve.ouija_rank = nil
			
			sleeve.in_grim = nil
			sleeve.in_familiar = nil
        elseif G.GAME and G.GAME.blind and (context.create_card or context.modify_playing_card) and card and is_playing_card then
            if unstb.lowkey_blacklisted[card.base.value] then
                local initial = G.GAME.blind == nil or context.create_card
				
                if sleeve.in_strength then
                    local base_key = SMODS.Suits[card.base.suit].card_key .. "_" .. sleeve.get_rank_after_5()
                    card:set_base(G.P_CARDS[base_key], initial)
				elseif sleeve.in_grim then --Grim will always create 1 (because Ace)
                    local base_key = SMODS.Suits[card.base.suit].card_key .. "_unstb_1"
                    card:set_base(G.P_CARDS[base_key], initial)
                elseif sleeve.in_ouija then
                    if sleeve.ouija_rank == nil then
                        local random_base = pseudorandom_element(sleeve.allowed_card_centers, pseudoseed("slv"))
                        local card_instance = Card(0, 0, 0, 0, random_base, G.P_CENTERS.c_base)
                        sleeve.ouija_rank = SMODS.Ranks[card_instance.base.value]
                        card_instance:remove()
                    end
                    local base_key = SMODS.Suits[card.base.suit].card_key .. "_" .. sleeve.ouija_rank.card_key
                    card:set_base(G.P_CARDS[base_key], initial)
                else
                    local new_rank = pseudorandom_element(unstb.lowkey_rankList, pseudoseed("slv"))
					--Use smods change_base so we can still keep the suit
					SMODS.change_base(card, nil, new_rank)
					
					if sleeve.in_familiar and unstb_config.gameplay.seal_suit then --For Familiar, adds face seal to the created card (if the mechanic is enabled)
						card:set_seal('unstb_face', true, true)
					end
                end
            end
        end
    end,
})

end

end

--Reworked Vanilla Joker to support new features
if unstb_config.joker.vanilla then

filesystem.load(unstb.path..'/override/vanilla_joker.lua')()

end

--Suits, supports for Suit Seals, a lot of suit-based Joker, and modded suits support for Smeared
filesystem.load(unstb.path..'/override/suits.lua')()

--JokerDisplay (Partial) Support
if JokerDisplay then
	SMODS.load_file("/override/jokerdisplay.lua")()
end

--Manually load localizations and populate necessary info needed for the mod

--Global table entry to handle trigger for name-related stuff
unstb_global.name_joker = {}
unstb_global.name_card = {}
unstb_global.name_suit = {}

function unstb_process_english_loc()
	local function populateList(temp_loc)
		if not temp_loc or not temp_loc.descriptions then return end
	
		local jokers = temp_loc.descriptions.Joker or {}
		for k,v in pairs(jokers) do
			if not unstb_global.name_joker[k] and not unstb_global.name_card[k] then
				if v.name and type(v.name) == 'string' and string.match(string.lower(v.name), "joker") then
					unstb_global.name_joker[k] = v.name
				end
				
				if v.name and type(v.name) == 'string' and string.match(string.lower(v.name), "card") then
					unstb_global.name_card[k] = v.name
				end
			end
		end
		
		--Process suit loc if exists
		local suit = (temp_loc.misc and temp_loc.misc.suits_singular) or {}
		
		for k,v in pairs(suit) do
			if not unstb_global.name_suit[k] and v and type(v) == 'string' then
				local suit_name = string.lower(v)
				
				local vowel = suit_name:gsub("[^aeiou]","")
				local consonant = suit_name:gsub("[^bcdfghjklmnpqrstvwxyz]","") --To be safe, list alphabet only, no symbol, space, or numbers
				
				unstb_global.name_suit[k] = {
					name = v,
					count_vowel = string.len(vowel),
					count_consonant = string.len(consonant)
				}
			end
		end
		
	end
	
	local function loc_fallback()
		--print("Called loc fallback")
		return {}
	end

	print("Start initializing localization-independent info")
	--Basegame Jokers
	local temp_loc = assert(loadstring(love.filesystem.read('localization/en-us.lua')))()
	populateList(temp_loc)
	
	--Modded Jokers
	for k, _ in pairs(SMODS.Mods) do
		if SMODS.Mods[k].can_load and SMODS.Mods[k].path then
			temp_loc = (SMODS.load_file('/localization/en-us.lua', k) or loc_fallback)()
			if temp_loc then
				populateList(temp_loc)
			end
		end
	end
	
	--Fallback, handle the rest of the mod without proper localization (eg. uses loc_txt)
	--these mods tend to not have proper localization so it should be fine to look at the game's raw table
	populateList(G.localization)
	
	print("Finished initializing localization-independent info")
	
end

--Hook for the game's splash screen, to initialize any data that is sensitive to the mod's order (mainly rank stuff)

local ref_gamesplashscreen = Game.splash_screen

function Game:splash_screen()
 	ref_gamesplashscreen(self)
	
	--set_consumeable_usage hook to keep track of UnStable's own consumable count
	--Certain mod like Aurinko made this hook doesn't work fsr
	local set_consumeable_usage_ref = set_consumeable_usage

	function set_consumeable_usage(card) 
		if card.config.center_key and card.ability.consumeable then
			if card.config.center.set == 'Auxiliary' then
				--Initialize it if not, basically what basegame does but have to put here bc it runs before basegame's
				G.GAME.consumeable_usage_total = G.GAME.consumeable_usage_total or {tarot = 0, planet = 0, spectral = 0, tarot_planet = 0, all = 0}
				
				G.GAME.consumeable_usage_total.auxiliary = (G.GAME.consumeable_usage_total.auxiliary or 0) + 1  
			end
		end

		return set_consumeable_usage_ref(card)
	end
	
	init_prev_rank_data()
	
	if init_lowkey_blacklist then
		init_lowkey_blacklist()
	end
	
	unstb_process_english_loc()
end