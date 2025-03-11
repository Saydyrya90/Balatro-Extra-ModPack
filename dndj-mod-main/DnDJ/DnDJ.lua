--- STEAMODDED HEADER
--- MOD_NAME: DNDJ
--- MOD_ID: dndj
--- MOD_AUTHOR: [Auraa_]
--- MOD_DESCRIPTION: This mod aims to re-imagine cards from Dungeons & Degenerate Gamblers as jokers. 
--- DEPENDENCIES: [Talisman]
--- PREFIX: dndj
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 0.3.4a
--- BADGE_COLOR: 32751a

local dndj_mod = SMODS.current_mod
dndj_global = {}

-- C O L O R S --
loc_colour('eir')
G.ARGS.LOC_COLOURS.eir = HEX'faaaab'

loc_colour('explosive')
G.ARGS.LOC_COLOURS.explosive = HEX'e07c2f'

dndj_mod.description_loc_vars = function()
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1 }
end

-- A T L A S E S --
dndj = {}
SMODS.Atlas {
    key = 'jokers_atlas',
    path = "Jokers.png",
    px = 71,
    py = 95
}
-- Special atlas for Killer Queen joker --
SMODS.Atlas {
    key = 'jojokers_atlas',
    path = 'JoJokers.png',
    px = 71,
    py = 98
}
SMODS.Atlas {
    key = 'rank_ex',
    path = 'rank_ex.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'rank_ex_hc',
    path = 'rank_ex_hc.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'booster', 
    path = 'Boosters.png', 
    px = 71, 
    py = 95
}
SMODS.Atlas {
    key = 'spectral', 
    path = 'Spectrals.png', 
    px = 71, 
    py = 95
}
SMODS.Atlas {
    key = 'planet',
    path = 'Planets.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'decks',
    path = 'Backs.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'stickers',
    path = 'Stickers.png',
    px = 71,
    py = 95
}

-- S O U N D S --

SMODS.Sound({key = 'badexplosion', path = 'snd_badexplosion.wav'})


-- C O M P A T I B I L I T Y --

-- Talisman --
to_big = to_big or function(num)
    return num
end

to_number = to_number or function(num)
    return num
end

-- Hit --
local hit = next(SMODS.find_mod('Hit'))

-- UnStable --
local unstable = next(SMODS.find_mod('UnStable'))

-- Ortalab --
local ortalab = next(SMODS.find_mod('Ortalab'))

-- R A N K S --

-- Function to check if rank is decimal, taken from UnStable --
local function is_decimal(card)
	return SMODS.Ranks[card.base.value].is_decimal and not card.config.center.no_rank
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

-- Function to add rounding because lua doesnt fucking have it for some reason!!!
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
  end

-- "Prev" property, taken from UnStable --
function init_prev_rank_data()
	print("Initialize Remaining Previous Rank Data")
	for _, rank in pairs(SMODS.Ranks) do
		
		--Initialize
		--In case the rank table does not have prev existed
		--Base rank and UNSTB one has them defined manually by default
		if not rank.prev then
			rank.prev = {}
		end
		
		next_rank_list = rank.next
		
		for i=1, #next_rank_list do
			local next_rank = SMODS.Ranks[next_rank_list[i]]
			local prev = next_rank.prev or {}
			
			if not table_has_value(prev, rank.key) then
				table.insert(prev, rank.key)
				next_rank.prev = prev
			end
		end
	end
end

--taken from unstable again lol
function setPoolRankFlagEnable(rank, isEnable)
	if not G.GAME or G.GAME.pool_flags[rank] == isEnable then return end
	
	G.GAME.pool_flags[rank] = isEnable
end

function getPoolRankFlagEnable(rank)
	return (G.GAME and G.GAME.pool_flags[rank] or false)
end

--Shared pool rank checking function
local function _rankCheck(self, args)
	if args and args.initial_deck then
        return false
    end
	
	return getPoolRankFlagEnable(self.key)
end



-- Check if UnStable exists, if it does, do not generate these cards (OBSOLETE)--
--if not unstable then
-- Rank Implementation --
SMODS.Rank {
    hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

    hidden = true,

    key = '11',
    card_key = '11',
    pos = {x = 13},
    nominal = 11,
    next = { 'dndj_12' },
    prev = {'10'},
    shorthand = '11',
    loc_txt = { name = "11"},
    in_pool = _rankCheck,
}

SMODS.Rank {
    hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

    hidden = true,

    key = '12',
    card_key = '12',
    pos = {x = 14},
    nominal = 12,
    next = { 'dndj_13' },
    prev = {'dndj_11'},
    shorthand = '12',
    loc_txt = { name = "12"},
    in_pool = _rankCheck,
}

SMODS.Rank {
    hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

    hidden = true,

    key = '13',
    card_key = '13',
    pos = {x = 15},
    nominal = 13,
    next = { 'Ace' },
    prev = {'dndj_12'},
    shorthand = '13',
    loc_txt = { name = "13"},
    in_pool = _rankCheck,
}

SMODS.Rank {
    hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

    hidden = true,

    key = '21',
    card_key = '21',
    pos = {x = 16},
    nominal = 21,
    --next = { 'dndj_13' },
    --prev = {'dndj_11'},
    shorthand = '21',
    loc_txt = { name = "21"},
    in_pool = _rankCheck,
}

SMODS.Rank {
    hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

    hidden = true,

    key = '1',
    card_key = '1',
    pos = {x = 17},
    nominal = 1,
    strength_effect = {
        fixed = 2,
        random = false,
        ignore = false
    },
    next = { '2' },
    prev = {'dndj_0'},
    shorthand = '1',
    loc_txt = { name = "1"},
    in_pool = _rankCheck,
}

SMODS.Rank {
    hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

    hidden = true,

    key = '0.5',
    card_key = '0.5',
    pos = {x = 18},
    nominal = 0.5,

    is_decimal = true,
    rank_act = {'0', '0.5', '1'},
    next = { 'dndj_1', '2' },
    prev = {'dndj_0'},
    shorthand = '0.5',
    loc_txt = { name = "Half"},
    in_pool = _rankCheck,
}

SMODS.Rank {
    hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

    hidden = true,

    key = 'Pi',
    card_key = 'Pi',
    pos = {x = 19},
    nominal = 3.141592653,
    next = { '4', '5' },
    prev = {'3'},
    shorthand = 'Pi',
    is_decimal = true,
    rank_act = {'3', '3.14', '4'},
    loc_txt = { name = "Pi"},
    in_pool = _rankCheck,
}

SMODS.Rank {
    hc_atlas = 'rank_ex_hc',
    lc_atlas = 'rank_ex',

    hidden = true,

    key = '0',
    card_key = '0',
    pos = {x = 20},
    nominal = 0,
    strength_effect = {
        fixed = 2,
        random = false,
        ignore = false
    },
    straight_edge = true,


    next = { 'dndj_0.5', 'dndj_1' },
    shorthand = '0',
    loc_txt = { name = "0"},
    in_pool = _rankCheck,
}

-- Vanilla Rank Changes --
-- Code taken from UnStable --
--SMODS.Ranks['2'].strength_effect = {
    --fixed = 2,
    --random = false,
    --ignore = false
--}
SMODS.Ranks['2'].next = {'3', 'dndj_Pi'}

--SMODS.Ranks['3'].strength_effect = {
  -- fixed = 2,
   --random = false,
   --ignore = false
--}
SMODS.Ranks['3'].next = {'dndj_Pi', '4'}

--Change straight edge off from Ace, so it start to look at rank 0 instead
SMODS.Ranks['Ace'].straight_edge = false
SMODS.Ranks['Ace'].strength_effect = {
   fixed = 2,
   random = false,
   ignore = false
}
SMODS.Ranks['Ace'].next = {'2'}

--Vanilla Rank Alteration for Set 2
SMODS.Ranks['10'].next = {'Jack', 'dndj_11'}

--Add preliminary prev property into vanilla rank list, so the default behavior will always point to this one
local vanilla_rank_list = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'}

for i=#vanilla_rank_list, 2, -1 do
SMODS.Ranks[vanilla_rank_list[i]].prev = {vanilla_rank_list[i-1]}
end
SMODS.Ranks['2'].prev = {'dndj_1','Ace'}

--end

--Taken from "Blackjack Hands" by Mathguy--
function add_bj_count()
    local total = 0
    if (G.jokers ~= nil) and (G.jokers.cards ~= nil) and (G.jokers.cards[1] ~= nil) then
        for i = 1, #G.jokers.cards do
            if (G.jokers.cards[i].ability.name == "Ace up my Sleeve") and not G.jokers.cards[i].debuff then
                total = total + 1
            end
        end
    end
    return total
end
local get_blackjack = function(hand)
     if (#hand < 1) then
        return {}
    end
    local ret = {}
    local t = {}
    local total = 0
    local aces = 0
    local tolerance = add_bj_count()
    for i=1, #hand do
        if (hand[i].base.nominal > 0) and (hand[i].ability.effect ~= 'Stone Card') then
            total = total + hand[i].base.nominal
            t[#t+1] = hand[i]
            if hand[i].base.value == 'Ace' then
                aces = aces + 1
            end
        end
    end
    if (total > (21 + tolerance)) then
        while ((total > (21 + tolerance)) and (aces > 0)) do 
            total = total - 10
            aces = aces - 1
        end
    end
    if (total >= (21 - tolerance)) and (total <= (21 + tolerance)) then
        table.insert(ret, t)
        return ret
    end
    return {}
end

-- H A N D S --
--Check if "Hit" mod exists
if not hit then
    SMODS.PokerHand {
        key = 'blackjack',
        chips = 21,
        l_chips = 21,
        mult = 2,
        l_mult = 2,
        example = {
            { 'S_A', true },
            { 'D_K', true },
        },
        above_hand = "Two Pair",
        --visible = false,
        loc_txt = {
            name = "Blackjack",
            description = { 
            "Any combination of cards whose", 
            "ranks sum to 21"
        },
        },
        evaluate = function(parts, hand)
            local bj = get_blackjack(hand)
            if next(bj) then
                return bj
            else
                return {}
            end
        end,
    }
    SMODS.PokerHand {
        key = 'flushjack',
        chips = 77,
        l_chips = 33,
        mult = 7,
        l_mult = 3,
        example = {
            {'H_5', true},
            {'H_4', true},
            {'H_7', true},
            {'H_2', true},
            {'H_3', true},
        },
        above_hand = "Four of a Kind",
        visible = false,
        loc_txt = {
            name = "Blackjack Flush",
            description = {
                "Any combination of 5 cards that share",
                "the same suit whose ranks add to 21"
              },
        },
        evaluate = function(parts, hand)
            local bj = get_blackjack(hand)
            if next(bj) and next(parts._flush) then
                return bj
            else
                return {}
            end
        end,
    }
end

-- R A R I T I E S --

-- Special (from Buffoonery so that it doesn't look weird when paired with that mod)
SMODS.Rarity{
	key = "special",
	loc_txt = {
		name = "Special"
	},
	badge_colour = HEX('ee8f8d'),
	pools = {["Joker"] = false},
	get_weight = function(self, weight, object_type)
		return weight
	end,
}


-- B O O S T E R S --


-- Taken from BUNCO and UNSTABLE

-- If Unstable is detected then do not generate these booster packs (OBSOLETE)
--if not unstable then

local contraband_booster_rate = {.5, .5, .25, .1}
local contraband_booster_cost = {4, 4, 6, 8}
local contraband_booster_name = {"Contraband Pack", "Contraband Pack", "Jumbo Contraband Pack", "Mega Contraband Pack"}
local contraband_booster_key = {"contraband_1", "contraband_2", "contraband_3", "contraband_4"}

for i = 1, 4 do
    SMODS.Booster{
        key = contraband_booster_key[i],
        loc_txt = {
            group_name = "Contraband Pack",
            name = contraband_booster_name[i],
            text = {
              "Choose {C:attention}#1#{} of up to",
                "{C:attention}#2#{C:attention} Playing{} cards with",
                "{C:attention}an illegal rank{} to add to your deck"
            },
          },
		--no_pool_flag = 'full_deck_exception',
        cost = contraband_booster_cost[i],
        atlas = 'booster', pos = { x = i-1, y = 0 },
        config = {extra = i <= 2 and 3 or 5, choose =  i <= 3 and 1 or 2},
        draw_hand = false,

      
        create_card = function(self, card)
            local card = create_card("Base", G.pack_cards, nil, nil, nil, true, nil, 'contraband')
			--local edition_rate = 3
			local edition = poll_edition("randomseed", nil, true, false)
            local enhancement = G.P_CENTERS[SMODS.poll_enhancement({guaranteed = false, mod = 0.25})]
			
			local rank_set = {"dndj_0","dndj_0.5","dndj_1","dndj_Pi","dndj_11","dndj_12","dndj_13","dndj_21"}
			
			--Lowkey Deck / Sleeve combo mode, prevent high rank from being spawned
			--if G.GAME.prevent_high_rank then
			--	rank_set = {"unstb_0", "unstb_0.5", "unstb_1", "unstb_r2", "unstb_e", "unstb_Pi"}
			---end
			
			SMODS.change_base(card, nil, pseudorandom_element(rank_set, pseudoseed('contraband'..G.GAME.round_resets.ante)))
			
			--Pooling Enhancements
			--local cen_pool = {}
			--for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
			--	if not v.replace_base_card and not v.disenhancement then 
			--		cen_pool[#cen_pool+1] = v
			--	end
			--end
			
			--local enh = pseudorandom_element(cen_pool, pseudoseed('contraband_enhance'))
            
            if enhancement then
			card:set_ability(enhancement)
            end
			
			card:set_edition(edition)
			card:set_seal(SMODS.poll_seal({mod = 10}))
			
			return card
            -- return {set = 'Polymino', area = G.pack_cards, skip_materialize = nil, soulable = nil, key_append = 'vir'}
        end,

        ease_background_colour = function(self) ease_background_colour{new_colour = HEX('3d3f40'), special_colour = HEX('2e3a4a'), contrast = 2} end,
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

        --pos = get_coordinates(i+3),
        --atlas = 'booster',
		
		weight = contraband_booster_rate[i],
    }
end
--end

-- P L A N E T S --
if not hit then
SMODS.Consumable{
    set = 'Planet', atlas = 'planet',
    pos = {x = 0, y = 0},
    key = 'europa',
    name = "Europa",
    loc_txt = {
        name = "Europa",
        text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips"
        }
    },
    config = {hand_type = 'dndj_blackjack'},
    loc_vars = function(self, info_queue, card)
        local hand = self.config.hand_type
        return { vars = {G.GAME.hands[hand].level,localize(hand, 'poker_hands'), G.GAME.hands[hand].l_mult, G.GAME.hands[hand].l_chips, colours = {(G.GAME.hands[hand].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[hand].level)])}} }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge('Moon', get_type_colour(self or card.config, card), nil, 1.2)
    end
    --in_pool = function(self)
    --    if G.GAME.hands["dndj_blackjack"].played > 0 then
    --        return true
    --    end
    --    return false
    --end
}
SMODS.Consumable{
    set = 'Planet', atlas = 'planet',
    pos = {x = 1, y = 0},
    key = 'io',
    name = "Io",
    loc_txt = {
        name = "Io",
        text = {
            "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
            "{C:attention}#2#",
            "{C:mult}+#3#{} Mult and",
            "{C:chips}+#4#{} chips"
        }
    },
    config = {hand_type = 'dndj_flushjack'},
    loc_vars = function(self, info_queue, card)
        local hand = self.config.hand_type
        return { vars = {G.GAME.hands[hand].level,localize(hand, 'poker_hands'), G.GAME.hands[hand].l_mult, G.GAME.hands[hand].l_chips, colours = {(G.GAME.hands[hand].level==1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[hand].level)])}} }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge('Moon', get_type_colour(self or card.config, card), nil, 1.2)
    end,
    in_pool = function(self)
        if G.GAME.hands["dndj_flushjack"].played > 0 then
            return true
        end
        return false
    end
}
end



-- S P E C T R A L --

SMODS.Consumable{
    set = 'Spectral', atlas = 'spectral',
    pos = {x = 0, y = 0},
    key = 'spc_inversion',

    config = {extra = {}},
    loc_txt = {
        name = "Inversion",
        text = {
          "Adds {C:dark_edition}Negative{} to",
            "{C:attention}1{} selected card in hand",
        },
      },
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    
    can_use = function(self, card)
        if G.hand and (#G.hand.highlighted == 1) and G.hand.highlighted[1] and (not G.hand.highlighted[1].edition) then 
            return true
        end
        
        return false
    end,

    use = function(self,card)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            local over = false
            local edition = poll_edition("randomseed", nil, false, true, {"e_negative"})
            local aura_card = G.hand.highlighted[1]
            aura_card:set_edition(edition, true)
            card:juice_up(0.3, 0.5)
        return true end }))
    end
}

--If Unstable detected do not generate this spectral (OBSOLETE)
--if not unstable then
SMODS.Consumable {
    set = 'Spectral', atlas = 'spectral',
    pos = {x = 1, y = 0},
    key = 'spc_blackmagic',
    config = {extra = {create_count = 3}},
    loc_txt = {
        name="Black Magic",
                text={
                    "Destroy {C:attention}1{} random",
                    "card in your hand, add",
                    "{C:attention}#1#{} random {C:attention}Enhanced",
                    "{C:attention}Playing cards{} with an",
                    "{C:attention}illegal rank{} to your hand",
                },
            },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card and card.ability.extra.create_count or self.config.extra.create_count}
        }
    end,

    can_use = function(self, card)
		if G.hand then
			return true
		end
		return false
	end,
    use = function(self, card)
		--Enable Rank Flag
		--setPoolRankFlagEnable('unstb_21', true);
	
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
			card:juice_up(0.3, 0.5)
            return true end }))
		
		--Based on Basegame's Immolate
		local destroyed_cards = {}
		
		local temp_hand = {}
		for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
		table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
		pseudoshuffle(temp_hand, pseudoseed('blackmagic'))

		for i = 1, 1 do destroyed_cards[1] = temp_hand[i] end
		
		--Destroy Cards
		G.E_MANAGER:add_event(Event({
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
				return true end }))
		--Calling Jokers to process the card destroying
		delay(0.3)
		--print('joker')
		for i = 1, #G.jokers.cards do
			G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
		end
		
		--Adding New Cards
		G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function() 
                    local cards = {}
                    for i=1, card.ability.extra.create_count do
                        cards[i] = true
                        local rank_set = pseudorandom_element({"dndj_0","dndj_0.5","dndj_1","dndj_Pi","dndj_11","dndj_12","dndj_13","dndj_21"}, pseudoseed('blackmagic'))
                        local _rank = SMODS.Ranks[rank_set]
                        local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('blackmagic')) or SMODS.Suits['Spades']
						
						--Pooling Enhancements
						local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if not v.replace_base_card and not v.disenhancement then 
                                cen_pool[#cen_pool+1] = v
                            end
                        end
						
                        create_playing_card({front = G.P_CARDS[(_suit.card_key)..'_'..(_rank.card_key)], center = pseudorandom_element(cen_pool, pseudoseed('altar'))}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})
                    end
                    playing_card_joker_effects(cards)
                    return true end }))
		
	end,

	--pos = get_coordinates(4),
}
--end

-- S T I C K E R S --

SMODS.Sticker{
    key = 'explosive',
    atlas = 'stickers',
    pos = {x = 0, y = 0},
    loc_txt = {
        name="Explosive",
        label = 'Explosive',
                text={
                    "This Joker will destroy itself",
                    "at the end of the round"
                },
            },
    badge_colour = HEX('e07c2f'),
    hide_badge = false,
    default_compat = true,
    needs_enable_flag = false,
    sets = {Joker = true},
    rate = 0,
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
            card.sell_cost = -1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('dndj_badexplosion', 1, 0.4)
                    card.T.r = -0.2
                    card:juice_up(0.3,0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                                func = function()
                                                    G.jokers:remove_card(card)
                                                    card:remove()
                                                    card = nil
                                                    return true; end }))
                    return true
                end
            }))
            return {
                message = "B O O M !",
                colour = G.C.RED,
                card = card
            }
        end
    end,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
}

-- O V E R R I D E S (Mostly taken from UnStable) --
if not unstable then
    dndj_global.fib = {}
    function dndj_global.register_fibonacci(rank_list)
        for i = 1, #rank_list do
          dndj_global.fib[rank_list[i]] = true
        end
    end
    dndj_global.odd = {}
    function dndj_global.register_odd(rank_list)
        for i = 1, #rank_list do
          dndj_global.odd[rank_list[i]] = true
        end
    end
    dndj_global.even = {}
    function dndj_global.register_even(rank_list)
        for i = 1, #rank_list do
          dndj_global.even[rank_list[i]] = true
        end
    end
    dndj_global.hack = {}
    function dndj_global.register_hack(rank_list)
	    for i = 1, #rank_list do
		 dndj_global.hack[rank_list[i]] = true
	    end
    end

    dndj_global.register_hack({'dndj_0', 'dndj_1', '2', '3', '4', '5'})
    dndj_global.register_fibonacci({'dndj_0', 'dndj_1', '2', '3', '5', '8', 'dndj_13', 'dndj_21','Ace'})
    dndj_global.register_odd({'dndj_1', '3', '5', '7', '9', 'dndj_11', 'dndj_13', 'dndj_21', 'Ace'})
    dndj_global.register_even({'dndj_0', '2', '4', '6', '8', '10', 'dndj_12'})
    
    --dndj_global.face = {Jack = true, Queen = true, King = true}

    SMODS.Joker:take_ownership('fibonacci', {
        config = {extra = {mult = 8}},
        loc_txt = {
            name = "Fibonacci",
            text = {
              "Each played {C:attention}0{}, {C:attention}1{}, {C:attention}2{}, {C:attention}3{},",
                "{C:attention}5{}, {C:attention}8{}, {C:attention}13{}, {C:attention}21{} or {C:attention}Ace{} gives",
                "{C:mult}+#1#{} Mult when scored",
            },
          },
        loc_vars = function(self, info_queue, card)
            local key = self.key
            return { key = key, vars = {card and card.ability.extra.mult or self.config.extra.mult} }
        end,
        calculate = function(self, card, context)
		
            if context.individual and context.cardarea == G.play then
                
                if not context.other_card.config.center.no_rank and dndj_global.fib[context.other_card.base.value] then
                    return {
                      mult = card.ability.extra.mult,
                      card = card
                    }
                end
            end
            
        end
    }, true)

    SMODS.Joker:take_ownership('odd_todd', {
        config = {extra = {chips = 31}},
        loc_txt = {
            name = "Odd Todd",
            text = {
              "Played cards with",
                    "{C:attention}odd{} rank give",
                    "{C:chips}+#1#{} Chips when scored",
                    "{C:inactive}(A, 21, 13, 11, 9, 7, 5, 3, 1)",
            },
          },
        loc_vars = function(self, info_queue, card)
            local key = self.key
            return { key = key, vars = {card and card.ability.extra.chips or self.config.extra.chips} }
        end,
        calculate = function(self, card, context)
		
            if context.individual and context.cardarea == G.play then
                
                if not context.other_card.config.center.no_rank and dndj_global.odd[context.other_card.base.value] then
                    return {
                      chips = card.ability.extra.chips,
                      card = card
                    }
                end
            end
            
        end
    }, true)

    SMODS.Joker:take_ownership('even_steven', {
        config = {extra = {mult = 4}},
        loc_txt = {
            name = "Even Steven",
            text = {
              "Played cards with",
                    "{C:attention}even{} rank give",
                    "{C:mult}+#1#{} Mult when scored",
                    "{C:inactive}(12, 10, 8, 6, 4, 2, 0)",
            },
          },
        loc_vars = function(self, info_queue, card)
            local key = self.key
            return { key = key, vars = {card and card.ability.extra.mult or self.config.extra.mult} }
        end,
        calculate = function(self, card, context)
		
            if context.individual and context.cardarea == G.play then
                
                if not context.other_card.config.center.no_rank and dndj_global.even[context.other_card.base.value] then
                    return {
                      mult = card.ability.extra.mult,
                      card = card
                    }
                end
            end
            
        end
    }, true)
end

SMODS.Joker:take_ownership('hack', {

	config = { extra = 1 },
    loc_txt = {
        name = "Hack",
        text = {
          "Retrigger",
          "each played",
          "{C:attention}0{}, {C:attention}1{}, {C:attention}2{}, {C:attention}3{}, {C:attention}4{}, or {C:attention}5{}",
        },
      },
	loc_vars = function(self, info_queue, card)
		
		local key = self.key
		--if getPoolRankFlagEnable('unstb_0') or getPoolRankFlagEnable('unstb_1') then
		--	key = self.key..'_ex'
		--end
	
		return { key = key, vars = {card and card.ability.extra or self.config.extra} }
	end,
	
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
		  if not context.other_card.config.center.no_rank and dndj_global.hack[context.other_card.base.value] then
				return {
				  message = 'Again!',
				  repetitions = card.ability.extra,
				  card = context.blueprint_card or card
				}
		  end
		end
	end,
	
}, true)


-- J O K E R S --

-- Birthday Card --
SMODS.Joker {
    key = "birthdaycard",
    name = "Birthday Card",
    atlas = 'jokers_atlas',
    pos = {
        x = 0,
        y = 0,
    },
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    eternal_compat = false,
    perishable_compat = false,
    blueprint_compat = false,
    config = {
        extra = {
            cards_scored = 0,
            cards_required = 21
        }
    },
    loc_txt = {
        name = "Birthday Card",
        text = {
          "After {C:attention}#2#{} cards score,",
          "destroy this Joker and",
          "earn {C:attention}5 Standard Tags",
          "{C:inactive}(Currently {C:attention}#1#{C:inactive}/#2#)"
        },
      },
      loc_vars = function(self, info_queue, center)
        return {vars = { center.ability.extra.cards_scored, center.ability.extra.cards_required } }
      end,
      calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and not context.other_card.debuff then
            card.ability.extra.cards_scored = card.ability.extra.cards_scored + 1
        end
        if context.after then
            if card.ability.extra.cards_scored >= card.ability.extra.cards_required then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        add_tag(Tag('tag_standard'))
                        add_tag(Tag('tag_standard'))
                        add_tag(Tag('tag_standard'))
                        add_tag(Tag('tag_standard'))
                        add_tag(Tag('tag_standard'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        G.jokers:remove_card(self)
                        card:remove()
                        card = nil
                        return true
                    end
                })) 
                return {
                    message = "Happy birthday!",
                    colour = G.C.RED
                }
            end
        end
    end         
}

-- Jack of All Trades --
SMODS.Joker{
    key = 'jackoff_lmao',
    rarity = 3,
    cost = 9,
    atlas = 'jokers_atlas',
    blueprint_compat = true,
    pos = { x = 1, y = 0 },
    config = {extra = {chips = 50, mult = 7, x_mult = 1.25, dollars = 1} },
    loc_txt = {
        name = "Jack of all Trades",
        text = {
            "Played {C:attention}Jacks{} give {C:chips}+#1#{} Chips,",
            "{C:mult}+#2#{} Mult, {X:mult,C:white}X#3#{} Mult, and {C:money}$#4#{}",
            "when scored"
        },
      },
    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.chips, center.ability.extra.mult, center.ability.extra.x_mult, center.ability.extra.dollars} }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 11 then
                return {
                  chips = card.ability.extra.chips,
                  mult = card.ability.extra.mult,
                  x_mult = card.ability.extra.x_mult,
                  dollars = card.ability.extra.dollars,
                  card = card
              }
          end
      end
    end
}

-- Jack in a Box --
SMODS.Joker{
    key = 'jack_in_a_box',
    rarity = 1,
    atlas = 'jokers_atlas',
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    pos = { x = 2, y = 0 },
    config = { extra = {mult = 0, mult_mod = 3} },
    loc_txt = {
        name = "Jack in a Box",
        text = {
            "This Joker gains {C:mult}+#2#{} Mult at the ",
            "start of each round, but has a {C:green}1 in 10{} chance ",
            "to destroy itself at the end of the round",
            "{C:inactive}(Currently {}{C:mult}+#1#{}{C:inactive} Mult){}"
        },
      },
    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.mult, center.ability.extra.mult_mod} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                mult_mod = card.ability.extra.mult
            }
        end
    if context.first_hand_drawn and not context.blueprint then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
        }
    end
    if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
        if pseudorandom("jack_in_a_box") < G.GAME.probabilities.normal/10 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3,0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                                func = function()
                                                    G.jokers:remove_card(card)
                                                    card:remove()
                                                    card = nil
                                                    return true; end }))
                    return true
                end
            }))
            return {
                message = "Pop goes the weasel!",
                colour = G.C.RED,
                card = card
            }
        else
            return {
                message = localize("k_safe_ex"),
                colour = G.C.GREEN,
                card = card
            }
        end
    end
end
}

-- Jackhammer --

SMODS.Joker{
    key = 'jackhammer',
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 5,
    blueprint_compat = true,
    eternal_compat = false,
    pos = { x = 3, y = 0 },

    config = { extra = {mult = 50} },
    loc_txt = {
        name = "Jackhammer",
        text = {
            "{C:mult}+50{} Mult",
            "Destroys itself at end of round",
        },
      },

    loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.mult} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                mult_mod = card.ability.extra.mult
            }
        end
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3,0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                                func = function()
                                                    G.jokers:remove_card(card)
                                                    card:remove()
                                                    card = nil
                                                    return true; end }))
                    return true
                end
            }))
            return {
                message = "Overheated!",
                colour = G.C.RED,
                card = card
            }
        end
    end
}

-- Jumping Jacks --

SMODS.Joker{
    key = 'jumpnjacks',
    rarity = 1,
    atlas = 'jokers_atlas',
    cost = 5,
    blueprint_compat = true,
    pos = { x = 4, y = 0 },
    config = { extra = {mult = 10} },
    loc_txt = {
        name = "Jumping Jacks",
        text = {
            "This Joker alternates between giving ",
            "{C:mult}+0{} and {C:mult}+10{} Mult for each",
            "scored {C:attention}Jack{} after every hand.",
            "{C:inactive}(Currently{}{C:mult} +#1#{}{C:inactive} Mult){}"
        },
      },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 11 then
                return {
                  mult = card.ability.extra.mult,
                  card = card
              }
            end
        end
        if context.after then
            if card.ability.extra.mult == 10 then
                card.ability.extra.mult = 0
                return {
                    message = "+0 Mult",
                    colour = G.C.RED,
                    card = card
                }
            end
            if card.ability.extra.mult == 0 then
                card.ability.extra.mult = 10
                return {
                    message = "+10 Mult",
                    colour = G.C.GREEN,
                    card = card
                }
            end
        end
    end
}

-- Jack and the Beanstalk --
SMODS.Joker{
    key = 'beanstalk',
    rarity = 3,
    atlas = 'jokers_atlas',
    cost = 10,
    blueprint_compat = true,
    pos = { x = 5, y = 0 },
    config = { extra = {repetitions = 2} },
    loc_txt = {
        name = "Jack and the Beanstalk",
        text = {"Retrigger each",
         "played {C:attention}Jack{} twice"},
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.repetitions} }
    end,
    calculate = function(self, card, context)
    if context.repetition
	and context.other_card:get_id() == 11
	and context.cardarea == G.play then
		return {
			message = localize('k_again_ex'),
			repetitions = card.ability.extra.repetitions,
			card = card
			}
		end
    end
}

-- Monterey Jack --
SMODS.Joker{
    key = 'throw_the_cheese',
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 6,
    eternal_compat = false,
    pos = { x = 6, y = 0 },
    config = { extra = {hands = 3, hands_mod = 1} },
    loc_txt = {
        name = "Monterey Jack",
        text = {
            "{C:blue}+#1#{} Hands every round,",
            "Reduces by {C:red}#2#{} each round"
        },
      },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.hands, card.ability.extra.hands_mod} }
    end,
    calculate = function(self, card, context)
    if context.setting_blind and context.blind == G.GAME.round_resets.blind then
        G.E_MANAGER:add_event(Event({func = function()
            ease_hands_played(card.ability.extra.hands)
            --card_eval_status_text(context.blueprint_card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {card.ability.extra.hands}}})--
        return true end }))
    end
    if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
        if card.ability.extra.hands - card.ability.extra.hands_mod <= 0 then 
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                            return true; end})) 
                    return true
                end
            })) 
            return {
                message = localize('k_eaten_ex'),
                colour = G.C.FILTER
            }
        else
            card.ability.extra.hands = card.ability.extra.hands - card.ability.extra.hands_mod
            ease_hands_played(-1)
            return {
                message = "-1 Hand",
                colour = G.C.FILTER
            }
        end
    end
end
}

-- Jackpot --
SMODS.Joker{
    key = 'jackpot',
    rarity = 3,
    atlas = 'jokers_atlas',
    cost = 7,
    blueprint_compat = true,
    eternal_compat = false,
    pos = { x = 8, y = 0 },
    --config = { extra = {} },
    loc_txt = {
        name = "Jackpot",
        text = {
            "At the beginning of the round, this Joker",
            "adds {C:attention}3 Jacks{} with a random seal,",
            "enhancement, and edition to your hand,",
            "then becomes a Pot"
        },
      },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_dndj_pot_like_weed_get_it_hah_ha
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            for i = 0, 2, 1 do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local eligible_suits = {}
                    for _,k in ipairs(SMODS.Suit.obj_buffer) do
                    if not SMODS.Suits[k].in_pool or SMODS.Suits[k]:in_pool({ rank = 'Jack' }) then eligible_suits[#eligible_suits+1] = SMODS.Suits[k].card_key end
                    end
                    local _suit = pseudorandom_element(eligible_suits, pseudoseed('jacks'))
                    local _card = create_playing_card({
                        front = G.P_CARDS[_suit..'_J'], 
                        center = G.P_CENTERS.c_base}, G.hand, nil, nil, nil)
                    _card:set_ability(G.P_CENTERS[SMODS.poll_enhancement({guaranteed = true, options = {"m_bonus", "m_mult", "m_gold", "m_steel", "m_lucky"}, type_key = 'randomseed'})], true, false)
                    _card:set_seal(SMODS.poll_seal({guaranteed = true, type_key = 'randomseed'}), true, false)
                    _card:set_edition(poll_edition("randomseed", nil, false, true, {"e_foil", "e_holo","e_polychrome"}))
                    G.GAME.blind:debuff_card(_card)
                    G.hand:sort()
                    if context.blueprint_card then context.blueprint_card:juice_up() else card:juice_up() end
                    return true
                end}))
            end
            playing_card_joker_effects({true})
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
 
                            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                local jokers_to_create = math.min(1,
                                    G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                                
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        --local card = create_card('Joker', G.jokers, nil, 0, nil, nil, 'j_pot_like_weed_get_it_hah_ha', 'random')--
                                        local _card = SMODS.create_card({
                                            set = 'Joker',
                                            area = G.jokers,
                                            key = 'j_dndj_pot_like_weed_get_it_hah_ha',
                                        })
                                        _card:add_to_deck()
                                        G.jokers:emplace(_card)
                                        _card:start_materialize()
                                        G.GAME.joker_buffer = 0
                                        return true
                                    end
                                }))
                            end
                            return true;
                        end
                    }))
                    return true
                end
            }))

            return {
                message = "A WINNER IS YOU",
                colour = G.C.MULT,
                card = card
            }
        end
        
    end
}

-- Pot --

SMODS.Joker{
    key = 'pot_like_weed_get_it_hah_ha',
    rarity = 1,
    atlas = 'jokers_atlas',
    cost = 3,
    blueprint_compat = true,
    pos = { x = 9, y = 0 },
    config = { extra = {chips = 50} },
    in_pool = function(self)
        return false
    end,
    loc_txt = {
        name = "Pot",
        text = {
            "{C:chips}+#1#{} Chips"
        },
      },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips} }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                chip_mod = card.ability.extra.chips
            }
        end
    end
}

-- Magic Trick --
SMODS.Joker{
    key = 'holy_shit_magic_trick_2',
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 7,
    blueprint_compat = true,
    pos = { x = 7, y = 0 },
    config = { extra = {chips = 0, chip_mod = 10} },
    loc_txt = {
        name = "Magic Trick",
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "for every {C:attention}Queen of Diamonds{} or",
            "{C:attention}7 of Spades{} scored",
            "{C:inactive}(Currently {}{C:chips}+#1#{}{C:inactive} Chips)"
        },
      },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.chip_mod} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if (context.other_card:get_id() == 7 and context.other_card:is_suit("Spades") or (context.other_card:get_id() == 12 and context.other_card:is_suit("Diamonds"))) then
                --card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                --chips = card.ability.extra.chips,
                --mult = card.ability.extra.mult,
                extra = {focus = card, message = localize('k_upgrade_ex')},
                colour = G.C.MULT,
                card = card
                }
            end
        end
        if context.joker_main then
            return {
            message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
            chip_mod = card.ability.extra.chips
            --message = localize('k_upgrade_ex')
            }
        end
    end

}

-- Musician --
SMODS.Joker{
    key = 'musician',
    rarity = 3,
    atlas = 'jokers_atlas',
    cost = 10,
    blueprint_compat = true,
    pos = { x = 0, y = 1 },
    config = { extra = {x_mult = 1, x_mult_mod = 0.2} },
    loc_txt = {
        name = "Musician",
        text = {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "for every {C:attention}21{} scored",
            "{C:inactive}(Currently {}{X:mult,C:white}X#1#{}{C:inactive} Mult){}"
        },
      },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.x_mult, card.ability.extra.x_mult_mod} }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card.base.value == "dndj_21" or context.other_card.base.value == "unstb_21" then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
                return {
                    --chips = card.ability.extra.chips,
                    --mult = card.ability.extra.mult,
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    colour = G.C.MULT,
                    card = card
                    }

            end
        end
        if context.joker_main then
            return {
            x_mult_mod = card.ability.extra.x_mult,
            --message = localize('k_upgrade_ex')
            }
        end
    end

}

-- Checkmate --
SMODS.Joker{
    key = 'checkmate',
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 7,
    blueprint_compat = true,
    pos = { x = 1, y = 1 },
    config = { extra = {} },
    loc_txt = {
        name = "Checkmate",
        text = {
            "Reduces {C:attention}Boss Blinds{} by {C:attention}25%{}"
        },
      },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.blind.boss then
            G.GAME.blind.chips = G.GAME.blind.chips * 0.75
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end

}

-- Guillotine --

SMODS.Joker{
    key = 'guillotine',
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 5,
    blueprint_compat = true,
    pos = { x = 2, y = 1 },
    config = { h_size = 0, x_chips = 0.5,  extra = { Xhandsize = 1.5} },
    loc_txt = {
        name = "Guillotine",
        text = {
             "{C:white,X:chips}X#2#{} Chips, {C:white,X:attention}X#3#{} hand size"
        },
      },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.h_size, card.ability.x_chips, card.ability.extra.Xhandsize} }
    end,

    calculate = function(self, card, context)
            --local originalhand = G.hand.config.card_limit
            if context.first_hand_drawn and not context.blueprint then
                card.ability.h_size = round((G.hand.config.card_limit * card.ability.extra.Xhandsize)-G.hand.config.card_limit)
                G.hand:change_size(card.ability.h_size) 
            end
            if context.joker_main then
                return {
                    x_chips = card.ability.x_chips,
                    --message = localize{ type = "variable", key = "a_xchips", vars = { card.ability.x_chips } }, colour = G.C.CHIPS, sound = "talisman_xchip"
                }
            end
            if context.end_of_round and not context.repetition and not context.individual then
                G.hand:change_size(-card.ability.h_size)
                card.ability.h_size = 0
            end
        --end
    end

}

-- Killer Queen --
SMODS.Joker{

    key = 'jojo_reference',
    rarity = 2,
    atlas = 'jojokers_atlas',
    cost = 6,
    blueprint_compat = true,
    pos = { x = 0, y = 0 },
    config = { extra = {mult = 0, mult_mod = 5} },
    loc_txt = {
        name = "Killer Queen",
        text = {
            "When round begins, this Joker destroys",
            "{C:attention}1{} random card in your hand and gains {C:mult}+#2#{} Mult",
            "{C:inactive}(Currently {}{C:mult}+#1#{}{C:inactive} Mult)"
        },
      },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.mult_mod} }
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            --local rndcard = pseudorandom_element(G.hand.cards, pseudoseed('killerqueenhastouchedthecard'))
            --rndcard:start_dissolve()
            G.E_MANAGER:add_event(Event({
                func = function()
                    local rndcard = pseudorandom_element(G.hand.cards, pseudoseed('killerqueenhastouchedthecard'))
                    rndcard:start_dissolve()
                    G.hand:sort()
                    if context.blueprint_card then context.blueprint_card:juice_up() else card:juice_up() end 
                    return true
                end}))
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                card = card
            }
        end
        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end
    end,
}

-- Stone Age Joker --
SMODS.Joker{

    key = 'flintstones',
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 7,
    blueprint_compat = true,
    pos = { x = 3, y = 1 },
    config = { extra = {x_mult = 3, stones = 0} },
    loc_txt = {
        name = "Stone Age Joker",
        text = {
            "{X:mult,C:white}X#1#{} Mult if played hand",
            "contains a {C:attention}Stone Card{}"
        },
      },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.x_mult, card.ability.extra.stones} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.ability.name == 'Stone Card' and not context.blueprint then
            card.ability.extra.stones = card.ability.extra.stones + 1
        end
        if context.joker_main and card.ability.extra.stones > 0 then
            return {
                x_mult_mod = card.ability.extra.x_mult,
                card = card
            }
            end
        if context.after then
            card.ability.extra.stones = 0
        end
     end
}

SMODS.Joker{
    key = 'glitched_joker',
    rarity = 3,
    atlas = 'jokers_atlas',
    cost = 8,
    pos = { x = 4, y = 1 },
    config = { extra = {generated_cards = 2} },
    loc_txt = {
        name = "Glitched Joker",
        text = {
            "Creates {C:attention}#1#{} random {C:explosive}Explosive{} {C:dark_edition}Negative{}",
            "Jokers? at the end of the round",
            "{C:inactive}Has an unmodifiable {C:green}1 in 20{}",
            "{C:inactive}chance to generate a non-Joker{}",
            "{C:inactive}Boosters and Vouchers generated this way{}",
            "{C:inactive}add{}{C:attention} +1 permanent Joker slot{}{C:inactive} when destroyed{}"
        },
      },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.generated_cards} }
    end,

    calculate = function(self, card, context)
        --if context.ending_shop then
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
        --if context.first_hand_drawn then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    --card.T.r = -0.2
                    --card:juice_up(0.3, 0.4)
                    --card.states.drag.is = true
                    --card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            --G.jokers:remove_card(card)
                            --card:remove()
 
                            if #G.jokers.cards + G.GAME.joker_buffer <= 9999 then
                                local jokers_to_create = math.min(1,
                                    G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                                
                                for i = 1, card.ability.extra.generated_cards, 1 do
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local random = math.random()
                                        local theFunny = 'Joker'
                                        local k = nil
                                        if random < 0.95 then
                                            theFunny = 'Joker'
                                            k = G.P_CENTER_POOLS.Joker[math.random(#G.P_CENTER_POOLS.Joker)].key
                                        elseif random < 0.965 then
                                            theFunny = 'Tarot'
                                        elseif random < 0.98 then
                                            theFunny = 'Planet'
                                        elseif random < 0.995 then
                                            theFunny = 'Spectral'
                                        elseif random < 0.998 then
                                            theFunny = 'Base'
                                        elseif random < 0.999 then
                                            theFunny = 'Voucher'
                                        elseif random < 1 then
                                            theFunny = 'Booster'
                                        end
                                        --local random = math.random()
                                        --if random < 0.9 then
                                        --    k = G.P_CENTER_POOLS.Joker[math.random(#G.P_CENTER_POOLS.Joker)].key
                                       -- end
                                        --local randomJoker = math.random() * #G.P_CENTER_POOLS.Joker
                                        --for i = 1, randomJoker do
                                          -- local k = G.P_CENTER_POOLS.Joker[i].key
                                        --end
                                        --local card = create_card('Joker', G.jokers, nil, 0, nil, nil, 'j_pot_like_weed_get_it_hah_ha', 'random')--
                                        local _card = SMODS.create_card({
                                            set = theFunny,
                                            area = G.jokers,
                                            edition = 'e_negative',
                                            --rarity = 5,
                                            --legendary = true,
                                            soulable = true,
                                            --stickers = {'dndj_explosive'}
                                            --key = G.P_CENTER_POOLS.Joker[math.random(#G.P_CENTER_POOLS.Joker)].key
                                            key = k
                                        })
                                        _card.sell_cost = -1
                                        _card:set_eternal(_eternal)
                                        _card:add_to_deck()
                                        SMODS.Stickers['dndj_explosive']:apply(_card, true)
                                        G.jokers:emplace(_card)
                                        _card:start_materialize()
                                        G.GAME.joker_buffer = 0
                                        return {
                                            message = "TEST",
                                            colour = G.C.MULT,
                                            card = card
                                        }
                                    end
                                }))
                            end
                            end
                            return true;
                        end
                    }))
                    return true
                end
            }))

            return {
                --message = "TEST",
                --colour = G.C.MULT,
                card = card
            }
        end
    end

}

SMODS.Joker{
    key = 'koi_no_disco_queen',
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 6,
    blueprint_compat = true,
    pos = { x = 5, y = 1 },
    config = { extra = {} },
    loc_txt = {
        name = "Disco Queen",
        text = {
            "Each played {C:attention}9{},{C:attention} 10{}, or {C:attention}11{}",
            "gives that card's ",
            "{C:chips}chip value{} as {C:mult}Mult{}"
        },
      },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.value == '9' or context.other_card.base.value == '10' or context.other_card.base.value == 'dndj_11' or context.other_card.base.value == 'unstb_11' then
                return {
                    mult = context.other_card.base.nominal + context.other_card.ability.perma_bonus,
                    card = card
                }
            end
        end
    end

}

SMODS.Joker{
    key = 'jimbo',
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 4,
    blueprint_compat = true,
    pos = { x = 6, y = 1 },
    config = { extra = {chips = 40} },
    pixel_size = {w = 58, h = 89},
    loc_txt = {
        name = "Jimbo",
        text = {
            "Played cards give",
            "{C:chips}+#1#{} Chips when scored"
        },
      },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            return {
                chips = card.ability.extra.chips,
                card = card
            }
        end
    end

}

if not hit then
SMODS.Joker{
    key = 'batty_joker',
    loc_txt = {
        name = "Batty Joker",
        text = {
            "{C:mult}+#1#{} Mult if played hand",
            "contains a {C:attention}Blackjack{}"
        },
    },
    rarity = 1,
    atlas = 'jokers_atlas',
    cost = 4,
    blueprint_compat = true,
    pos = { x = 7, y = 1 },
    config = {extra = {mult = 10}},

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult} }
    end,

    calculate = function(self, card, context)
        --Code from Blackjack Hands by Mathguy
        if context.joker_main then
            local get_blackjack = function(hand)
                if (#hand < 1) then
                    return {}
                end
                local ret = {}
                local t = {}
                local total = 0
                local aces = 0
                local tolerance = add_bj_count()
                for i=1, #hand do
                    if (hand[i].base.nominal > 0) and (hand[i].ability.effect ~= 'Stone Card') then
                        total = total + hand[i].base.nominal
                        t[#t+1] = hand[i]
                        if hand[i].base.value == 'Ace' then
                            aces = aces + 1
                        end
                    end
                end
                if (total > (21 + tolerance)) then
                    while ((total > (21 + tolerance)) and (aces > 0)) do 
                        total = total - 10
                        aces = aces - 1
                    end
                end
                if (total >= (21 - tolerance)) and (total <= (21 + tolerance)) then
                    table.insert(ret, t)
                    return ret
                end
                return {}
            end

            local hand = context.full_hand
            local valid = false
            local extent = function(table)
                return (#table ~= 0)
            end
            if (#hand >= 1) then
                if extent(get_blackjack(hand)) then
                    valid = true
                end
            elseif (#hand == 4) then
                if (extent(get_blackjack(hand)) or extent(get_blackjack({hand[1], hand[2], hand[3]})) or extent(get_blackjack({hand[4], hand[2], hand[3]})) or extent(get_blackjack({hand[1], hand[4], hand[3]})) or extent(get_blackjack({hand[1], hand[2], hand[4]}))) then
                    valid = true
                end
            elseif (#hand == 5) then
                if (extent(get_blackjack(hand)) or
                extent(get_blackjack({hand[3], hand[4], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[4], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[3], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[4], hand[5]})) or
                extent(get_blackjack({hand[1], hand[3], hand[5]})) or
                extent(get_blackjack({hand[1], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[5]})) or
                extent(get_blackjack({hand[1], hand[2], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3], hand[5]})) or
                extent(get_blackjack({hand[1], hand[2], hand[5], hand[4]})) or
                extent(get_blackjack({hand[1], hand[5], hand[3], hand[4]})) or
                extent(get_blackjack({hand[5], hand[2], hand[3], hand[4]}))) then
                    valid = true
                end
            end

            if valid then
                return {
                    message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                    mult_mod = card.ability.extra.mult,
                    card = card
                }
            else 
                return
            end
        end
    end

}

SMODS.Joker{
    key = 'underhanded_joker',
    loc_txt = {
        name = "Underhanded Joker",
        text = {
            "{C:chips}+#1#{} Chips if played hand",
            "contains a {C:attention}Blackjack{}"
        },
    },
    rarity = 1,
    atlas = 'jokers_atlas',
    cost = 4,
    blueprint_compat = true,
    pos = {x = 8, y = 1},
    config = {extra = {chips = 100}},

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips} }
    end,

    calculate = function(self, card, context)
        --Code from Blackjack Hands by Mathguy
        if context.joker_main then
            local get_blackjack = function(hand)
                if (#hand < 1) then
                    return {}
                end
                local ret = {}
                local t = {}
                local total = 0
                local aces = 0
                local tolerance = add_bj_count()
                for i=1, #hand do
                    if (hand[i].base.nominal > 0) and (hand[i].ability.effect ~= 'Stone Card') then
                        total = total + hand[i].base.nominal
                        t[#t+1] = hand[i]
                        if hand[i].base.value == 'Ace' then
                            aces = aces + 1
                        end
                    end
                end
                if (total > (21 + tolerance)) then
                    while ((total > (21 + tolerance)) and (aces > 0)) do 
                        total = total - 10
                        aces = aces - 1
                    end
                end
                if (total >= (21 - tolerance)) and (total <= (21 + tolerance)) then
                    table.insert(ret, t)
                    return ret
                end
                return {}
            end

            local hand = context.full_hand
            local valid = false
            local extent = function(table)
                return (#table ~= 0)
            end
            if (#hand >= 1) then
                if extent(get_blackjack(hand)) then
                    valid = true
                end
            elseif (#hand == 4) then
                if (extent(get_blackjack(hand)) or extent(get_blackjack({hand[1], hand[2], hand[3]})) or extent(get_blackjack({hand[4], hand[2], hand[3]})) or extent(get_blackjack({hand[1], hand[4], hand[3]})) or extent(get_blackjack({hand[1], hand[2], hand[4]}))) then
                    valid = true
                end
            elseif (#hand == 5) then
                if (extent(get_blackjack(hand)) or
                extent(get_blackjack({hand[3], hand[4], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[4], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[3], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[4], hand[5]})) or
                extent(get_blackjack({hand[1], hand[3], hand[5]})) or
                extent(get_blackjack({hand[1], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[5]})) or
                extent(get_blackjack({hand[1], hand[2], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3], hand[5]})) or
                extent(get_blackjack({hand[1], hand[2], hand[5], hand[4]})) or
                extent(get_blackjack({hand[1], hand[5], hand[3], hand[4]})) or
                extent(get_blackjack({hand[5], hand[2], hand[3], hand[4]}))) then
                    valid = true
                end
            end

            if valid then
                return {
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                    chip_mod = card.ability.extra.chips,
                    card = card
                }
            else 
                return
            end
        end
    end

}

SMODS.Joker{
    key = 'the_party',
    loc_txt = {
        name = "The Party",
        text = {
            "{X:mult,C:white}X#1#{} Mult if played hand",
            "contains a {C:attention}Blackjack{}"
        },
        unlock = {
            "Win a run",
            "without playing",
            "a {C:attention}Blackjack{}."
        },
    },
    rarity = 3,
    atlas = 'jokers_atlas',
    cost = 8,
    blueprint_compat = true,
    pos = {x = 9, y = 1},
    config = {extra = {xmult = 2}},
    unlock_condition = {type = 'win_no_hand', extra = 'dndj_blackjack'},
    unlocked = false,

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmult} }
    end,

    calculate = function(self, card, context)
        --Code from Blackjack Hands by Mathguy
        if context.joker_main then
            local get_blackjack = function(hand)
                if (#hand < 1) then
                    return {}
                end
                local ret = {}
                local t = {}
                local total = 0
                local aces = 0
                local tolerance = add_bj_count()
                for i=1, #hand do
                    if (hand[i].base.nominal > 0) and (hand[i].ability.effect ~= 'Stone Card') then
                        total = total + hand[i].base.nominal
                        t[#t+1] = hand[i]
                        if hand[i].base.value == 'Ace' then
                            aces = aces + 1
                        end
                    end
                end
                if (total > (21 + tolerance)) then
                    while ((total > (21 + tolerance)) and (aces > 0)) do 
                        total = total - 10
                        aces = aces - 1
                    end
                end
                if (total >= (21 - tolerance)) and (total <= (21 + tolerance)) then
                    table.insert(ret, t)
                    return ret
                end
                return {}
            end

            local hand = context.full_hand
            local valid = false
            local extent = function(table)
                return (#table ~= 0)
            end
            if (#hand >= 1) then
                if extent(get_blackjack(hand)) then
                    valid = true
                end
            elseif (#hand == 4) then
                if (extent(get_blackjack(hand)) or extent(get_blackjack({hand[1], hand[2], hand[3]})) or extent(get_blackjack({hand[4], hand[2], hand[3]})) or extent(get_blackjack({hand[1], hand[4], hand[3]})) or extent(get_blackjack({hand[1], hand[2], hand[4]}))) then
                    valid = true
                end
            elseif (#hand == 5) then
                if (extent(get_blackjack(hand)) or
                extent(get_blackjack({hand[3], hand[4], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[4], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[3], hand[5]})) or 
                extent(get_blackjack({hand[2], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[4], hand[5]})) or
                extent(get_blackjack({hand[1], hand[3], hand[5]})) or
                extent(get_blackjack({hand[1], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[5]})) or
                extent(get_blackjack({hand[1], hand[2], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3], hand[4]})) or
                extent(get_blackjack({hand[1], hand[2], hand[3], hand[5]})) or
                extent(get_blackjack({hand[1], hand[2], hand[5], hand[4]})) or
                extent(get_blackjack({hand[1], hand[5], hand[3], hand[4]})) or
                extent(get_blackjack({hand[5], hand[2], hand[3], hand[4]}))) then
                    valid = true
                end
            end

            if valid then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
                    Xmult_mod = card.ability.extra.xmult,
                    card = card
                }
            else 
                return
            end
        end
    end

}
end

SMODS.Joker{
    key = 'scrooge_mcjoker',
    loc_txt = {
        name = "Scrooge McJoker",
        text = {
            "{X:money,C:white}$X#1#{} if played hand",
            "is a {C:attention}Blackjack Flush{}"
        },
    },
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 8,
    blueprint_compat = true,
    pos = { x = 0, y = 2 },
    config = { extra = {xmoney = 1.25, dollars = 0} },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmoney} }
    end,

    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['dndj_flushjack']) then
            card.ability.extra.dollars = round(to_number((G.GAME.dollars*(card.ability.extra.xmoney-1))))
        end
        if context.joker_main and card.ability.extra.dollars > 0 then
            return {
                dollars = card.ability.extra.dollars
            }
        end
        if context.after then
            card.ability.extra.dollars = 0
        end
    end

}

SMODS.Joker{
    key = 'king_of_the_hill',
    loc_txt = {
        name = "King of the Hill",
        text = {
            "{X:mult,C:white}X#2#{} Mult if there is only",
            "1 {C:attention}face{} card in your full deck",
            "{C:inactive}(Currently {}{C:attention}#1#{}{C:inactive})"
        },
    },
    rarity = 3,
    atlas = 'jokers_atlas',
    cost = 10,
    blueprint_compat = true,

    pos = { x = 1, y = 2 },

    config = { extra = {face_tally = 0, xmult = 5} },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.face_tally, card.ability.extra.xmult} }
    end,

    calculate = function(self, card, context)
        card.ability.extra.face_tally = 0
        for k, v in ipairs(G.playing_cards) do
            if v:is_face() then card.ability.extra.face_tally = card.ability.extra.face_tally + 1 end end
        if context.joker_main and card.ability.extra.face_tally == 1 then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
                Xmult_mod = card.ability.extra.xmult
            }
        end
    end

}


SMODS.Joker{
    key = 'king_of_kings',
    loc_txt = {
        name = "King of Kings",
        text = {
            "For each played {C:attention}King{}, destroy it",
            "and gain {C:chips}+#3#{} Chips and {X:mult,C:white}X#4#{} Mult",
            "{C:inactive}(Currently {}{C:chips}+#1#{}{C:inactive} Chips and {X:mult,C:white}X#2#{}{C:inactive} Mult){}"
        },
    },
    rarity = 2,
    atlas = 'jokers_atlas',
    cost = 7,
    blueprint_compat = true,
    pos = { x = 2, y = 2 },
    config = { extra = {chips = 0, x_mult = 1, chip_mod = 10, x_mult_mod = 0.3} },

    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.chips, card.ability.extra.x_mult, card.ability.extra.chip_mod, card.ability.extra.x_mult_mod} }
    end,

    calculate = function(self, card, context)
        if context.destroying_card and context.cardarea == G.play and not context.blueprint then
            if context.destroying_card:get_id() == 13 then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_mod
                return {
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    colour = G.C.MULT,
                    delay = 0.45,
                    remove = true,
                    card = card
                }
            end
        end
        if context.joker_main then
            return {
                chip_mod = card.ability.extra.chips,
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                delay = 1,
                x_mult_mod = card.ability.extra.x_mult
            }
        end
    end

}

SMODS.Joker{
    key = 'king_cobra',
    loc_txt = {
        name = "King Cobra",
        text = {
            "This Joker gains {X:mult,C:white}X#3#{} Mult",
            "for every {C:attention}King{} in your full deck",
            "{C:inactive}(Currently {}{X:mult,C:white}X#2#{}{C:inactive} Mult){}",
            "{C:blue}#1#{} hand per round"
        },
    },
    rarity = 3,
    atlas = 'jokers_atlas',
    cost = 9,
    blueprint_compat = true,
    pos = { x = 3, y = 2 },
    config = { extra = {hands = -1, x_mult = 1, x_mult_mod = 0.5, king_tally = 0} },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.hands, card.ability.extra.x_mult, card.ability.extra.x_mult_mod, card.ability.extra.king_tally} }
    end,
    calculate = function(self, card, context)
        card.ability.extra.king_tally = 0
        for k, v in ipairs(G.playing_cards) do
            if v:get_id() == 13 then 
                card.ability.extra.king_tally = card.ability.extra.king_tally + 1
                card.ability.extra.x_mult = card.ability.extra.king_tally*(card.ability.extra.x_mult_mod)+1
            end 
        end
        if context.setting_blind and context.blind == G.GAME.round_resets.blind then
            G.E_MANAGER:add_event(Event({func = function()
                ease_hands_played(card.ability.extra.hands)
                --card_eval_status_text(context.blueprint_card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {card.ability.extra.hands}}})--
            return true end }))
        end
        if context.joker_main then
            return {
                --message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                x_mult_mod = card.ability.extra.x_mult
            }
        end
    end

}















-- D E C K S --
-- [TO BE COMPLETED] --
SMODS.Back{
    key = 'nothings_deck',
    atlas = 'decks',
    discovered = true,
    pos = {x = 0, y = 0},
    config = {ante_scaling = 1, joker_slot = 0},
    --config = { extra = {min_ante = 3} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.ante_scaling, self.config.joker_slot} }
    end,
    loc_txt = {
        name = "Nihilist Deck",
        text = {
            "Start with {C:attention}1{} card",
            --"{C:mult}0.5X{} base Blind size",
            "Starts at {C:attention}Ante 0{}",
            "{C:attention}The Pillar{} cannot appear"
        },
      },
    apply = function(self)
        --G.GAME.HUD:recalculate()
        G.GAME.round_resets.ante = 0
        G.GAME.round_resets.blind_ante = 0
        G.GAME.banned_keys['bl_pillar'] = true
        ease_ante(0)
        --SMODS.Blind:take_ownership('bl_pillar', {boss = {min = 9e999, max = 9e999}})
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    v.to_remove = true
                end
            --end
            local i = 1
            while i <= #G.playing_cards do
                if G.playing_cards[i].to_remove then
                    G.playing_cards[i]:remove()
                else
                    i = i + 1
                end
            end
            --local eligible_suits = {}
            --for _,k in ipairs(SMODS.Suit.obj_buffer) do
               -- if not SMODS.Suits[k].in_pool or SMODS.Suits[k]:in_pool({ rank = 'dndj_0' }) then eligible_suits[#eligible_suits+1] = SMODS.Suits[k].card_key end
               -- end
            --local _suit = pseudorandom_element(eligible_suits, pseudoseed('zero'))
            local _card = create_playing_card({
                front = G.P_CARDS.H_dndj_0, 
                center = G.P_CENTERS.c_base}, G.deck, nil, nil, nil)
            _card:set_ability(G.P_CENTERS.m_stone, nil, true)
            _card:set_edition('e_holo', true)
            --SMODS.Stickers['eternal']:apply(_card, true)
            G.GAME.starting_deck_size = #G.playing_cards
            return true
        end
        }))
    end,
    trigger_effect = function(self, args)
    end
}
-- Glitched Deck--
SMODS.Back{
    key = 'glitched_deck',
    discovered = true,
    atlas = 'decks',
    pos = {x = 1, y = 0},
    config = {hands = 0, discards = 0, hand_size = 0, ante_scaling = 1, joker_slot = 0},
    --config = { extra = {min_ante = 3} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.hands, self.config.discards, self.config.hand_size, self.config.ante_scaling, self.config.joker_slot} }
    end,
    loc_txt = {
        name = "Glitched Deck",
        text = {
            --"{C:blue}+1{} hand every round",
           -- "{C:red}+1{} discard every round",
            --"{C:attention}+2{} hand size",
            --"{C:red}-3{} Joker slots",
            "Start with an {C:attention}Eternal{}",
            "{C:red} Glitched Joker{}",
        },
      },
    apply = function(self)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.8,
            func = function()
                play_sound('timpani')
                local _card = SMODS.create_card({
                    set = 'Joker',
                    area = G.jokers,
                    --edition = 'e_negative',
                    --rarity = 5,
                    --legendary = true,
                    --soulable = true,
                    stickers = {'eternal'},
                    --key = G.P_CENTER_POOLS.Joker[math.random(#G.P_CENTER_POOLS.Joker)].key
                    key = 'j_dndj_glitched_joker'
                })
                --_card.sell_cost = 0
                --_card:set_eternal(_eternal)
                _card:add_to_deck()
                --SMODS.Stickers['dndj_explosive']:apply(_card, true)
                G.jokers:emplace(_card)
                _card:start_materialize()
                G.GAME.joker_buffer = 0
            return true
        end
        }))
    end,
    trigger_effect = function(self, args)
    end
}

-- RANDOMIZATION for Random deck
local a = math.random(0,5)
local b = math.random(0,8)
local c = math.random(0,8)
local d = math.random(0,10)
local e = math.random(0,8)
local f = math.random(0,5)

--local function zero_out()
 --   a = 0
  --  b = 0
   -- c = 0 
   -- d = 0
   -- e = 0
   -- f = 0
--end

local function distribute_stats()
--Randomize stats after each run begins
    a = math.random(0,5)
    b = math.random(0,8)
    c = math.random(0,8)
    d = math.random(0,10)
    e = math.random(0,8)
    f = math.random(0,5)
--If the stat total is below 12 or above 16, randomize again
while a + b + c + d + e + f <= 12 or a + b + c + d + e + f >= 16 do
    a = math.random(0,5)
    b = math.random(0,8)
    c = math.random(0,8)
    d = math.random(0,10)
    e = math.random(0,8)
    f = math.random(0,5)
end
return true
end

-- Random Deck --
SMODS.Back{
    --reset_stats(),
    --math.randomseed(os.time()),
    --distribute_stats(),
    key = 'random_deck',
    discovered = true,
    atlas = 'decks',
    pos = {x = 2, y = 0},
    --config = {dollars = math.random(-4,6), hands = math.random(-2,6), discards = math.random(-1,7), hand_size = math.random(-3,7),  joker_slot = math.random(-5,5), consumable_slot = math.random(-2,3), ante_scaling = 0.5+math.random()*1.5, win_ante = math.random(6,10)},
    config = {},
    --config = { extra = {min_ante = 3} },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    loc_txt = {
        name = "Random Deck",
        text = {
            "All starting conditions",
            "are {C:dark_edition}randomized{}"
        },
      },
    apply = function(self, back)
        math.randomseed(os.time())
        distribute_stats()
        G.GAME.starting_params.dollars = 2*a
        G.GAME.starting_params.hands = b+2
        G.GAME.starting_params.discards = c+2
        G.GAME.starting_params.hand_size = d+5
        G.GAME.starting_params.joker_slots = e+2
        G.GAME.starting_params.consumable_slots = f
        --G.GAME.starting_params.ante_scaling = 0.5+math.random()*1.5
        --G.GAME.win_ante = math.random(6,10)
        G.GAME.starting_params.erratic_suits_and_ranks = true
        --distribute_stats()
    end,
    trigger_effect = function(self, args)
    end
}

if not ortalab then
SMODS.Back{
    key = 'striped_deck',
    atlas = 'decks',
    discovered = true,
    pos = {x = 3, y = 0},
    config = {},
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    loc_txt = {
        name = "Striped Deck",
        text= {
            "Start run with",
            "{C:attention}26{C:clubs} Clubs{} and",
            "{C:attention}26{C:diamonds} Diamonds{} in deck",
        },
      },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v.base.suit == 'Spades' then 
                        v:change_suit('Clubs')
                    end
                    if v.base.suit == 'Hearts' then 
                        v:change_suit('Diamonds')
                    end
                end
            return true
            end
        }))
    end
}
end

SMODS.Back{
    key = 'full_deck',
    atlas = 'decks',
    discovered = true,
    pos = {x = 4, y = 0},
    config = {},
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    loc_txt = {
        name = "Full Deck",
        text= {
            "Start run with a full deck",
            "including all {C:attention}illegal ranks{}",
            "{C:attention}Contraband cards {}",
            "will spawn naturally"
        },
      },
    apply = function(self)
        --contraband_booster_rate = {0, 0, 0, 0}
        G.GAME.banned_keys['p_dndj_contraband_1'] = true
        G.GAME.banned_keys['p_dndj_contraband_2'] = true
        G.GAME.banned_keys['p_dndj_contraband_3'] = true
        G.GAME.banned_keys['p_dndj_contraband_4'] = true
        --G.GAME.pool_flags.full_deck_exception = true
        setPoolRankFlagEnable('dndj_0', true)
        setPoolRankFlagEnable('dndj_0.5', true)
        setPoolRankFlagEnable('dndj_1', true)
        setPoolRankFlagEnable('dndj_Pi', true)
        setPoolRankFlagEnable('dndj_11', true)
        setPoolRankFlagEnable('dndj_12', true)
        setPoolRankFlagEnable('dndj_13', true)
        setPoolRankFlagEnable('dndj_21', true)
        local added_rank = {'dndj_0', 'dndj_0.5', 'dndj_1', 'dndj_Pi', 'dndj_11', 'dndj_12', 'dndj_13', 'dndj_21'}
				
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

    end
}
