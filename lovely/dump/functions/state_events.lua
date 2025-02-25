LOVELY_INTEGRITY = '3af4e3fae6a5c490442886fab46dd1473445b766dfd472647563c38b98b9d2e6'

function win_game()
    if (not G.GAME.seeded and not G.GAME.challenge) or SMODS.config.seeded_unlocks then
        set_joker_win()
        set_deck_win()
        
        check_and_set_high_score('win_streak', G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt+1)
        check_and_set_high_score('current_streak', G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt+1)
        check_for_unlock({type = 'win_no_hand'})
        check_for_unlock({type = 'win_no'})
        check_for_unlock({type = 'win_custom'})
        check_for_unlock({type = 'win_deck'})
        check_for_unlock({type = 'win_stake'})
        check_for_unlock({type = 'win'})
        inc_career_stat('c_wins', 1)
    end

    set_profile_progress()

    if G.GAME.challenge then
        G.PROFILES[G.SETTINGS.profile].challenge_progress.completed[G.GAME.challenge] = true
        set_challenge_unlock()
        check_for_unlock({type = 'win_challenge'})
        G:save_settings()
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            for k, v in pairs(G.I.CARD) do
                v.sticker_run = nil
            end
            
            play_sound('win')
            G.SETTINGS.paused = true

            G.FUNCS.overlay_menu{
                definition = create_UIBox_win(),
                config = {no_esc = true}
            }
            local Jimbo = nil

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 2.5,
                blocking = false,
                func = (function()
                    if G.OVERLAY_MENU and G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot') then 
                        Jimbo = Card_Character({x = 0, y = 5})
                        local spot = G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot')
                        spot.config.object:remove()
                        spot.config.object = Jimbo
                        Jimbo.ui_object_updated = true
                        Jimbo:add_speech_bubble('wq_'..math.random(1,7), nil, {quip = true})
                        Jimbo:say_stuff(5)
                        if G.F_JAN_CTA then 
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    Jimbo:add_button(localize('b_wishlist'), 'wishlist_steam', G.C.DARK_EDITION, nil, true, 1.6)
                                    return true
                                end}))
                        end
                        end
                    return true
                end)
            }))
            
            return true
        end)
    }))

    if (not G.GAME.seeded and not G.GAME.challenge) or SMODS.config.seeded_unlocks then
        G.PROFILES[G.SETTINGS.profile].stake = math.max(G.PROFILES[G.SETTINGS.profile].stake or 1, (G.GAME.stake or 1)+1)
    end
    G:save_progress()
    G.FILE_HANDLER.force = true
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            if not G.SETTINGS.paused then
                G.GAME.current_round.round_text = 'Endless Round '
                return true
            end
        end)
    }))
end

function end_round()
if G.GAME.Shield == true then
    if type(G.GAME.chips) ~= 'table' then
        if G.GAME.chips - G.GAME.blind.chips >= 0 then
            G.GAME.overscore = (G.GAME.overscore or 0) + G.GAME.chips - G.GAME.blind.chips
        end
    else
        if G.GAME.chips - G.GAME.blind.chips >= to_big(0) then
            G.GAME.overscore = (G.GAME.overscore or 0) + G.GAME.chips - G.GAME.blind.chips
        end
    end
end

if not G.GAME.blind.disabled then
    local locked_card

    for i = 1, #G.P_LOCKED do
        locked_card = G.P_LOCKED[i]

        if not locked_card.unlocked and locked_card.check_for_unlock and type(locked_card.check_for_unlock) == 'function' then
            locked_card:check_for_unlock({type = 'defeat_blind', blind = G.GAME.blind})
        end
    end
end

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        G.GAME.blind.in_blind = false
        local game_over = true
        local game_won = false
        G.RESET_BLIND_STATES = true
        G.RESET_JIGGLES = true
        if G.GAME.current_round.semicolon then
            game_over = false
        end
            if to_big(G.GAME.chips) >= to_big(G.GAME.blind.chips) then
                game_over = false
            end
            -- context.end_of_round calculations
            SMODS.saved = false
            SMODS.calculate_context({end_of_round = true, game_over = game_over })
            if SMODS.saved then game_over = false end
            -- TARGET: main end_of_round evaluation
            local i = 1
            while i <= #G.jokers.cards do
                local gone = G.jokers.cards[i]:calculate_banana()
                if not gone then i = i + 1 end
            end
            if G.GAME.round_resets.ante >= G.GAME.win_ante and G.GAME.blind_on_deck == 'Boss' then
                game_won = true
                G.GAME.won = true
            end
            if game_over then
                G.STATE = G.STATES.GAME_OVER
                if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then 
                    G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
                end
                G:save_settings()
                G.FILE_HANDLER.force = true
                G.STATE_COMPLETE = false
            else
                G.GAME.unused_discards = (G.GAME.unused_discards or 0) + G.GAME.current_round.discards_left
                if G.GAME.blind and G.GAME.blind.config.blind then 
                    discover_card(G.GAME.blind.config.blind)
                end

                if G.GAME.blind_on_deck == 'Boss' then
                    local _handname, _played, _order = 'High Card', -1, 100
                    for k, v in pairs(G.GAME.hands) do
                        if v.played > _played or (v.played == _played and _order > v.order) then 
                            _played = v.played
                            _handname = k
                        end
                    end
                    
                    if G.GAME.played_ranks ~= nil then
                        local max_rank = nil
                        local max_count = -1
                    
                        for _, rank in ipairs(SMODS.Rank.obj_buffer) do
                            count = G.GAME.played_ranks[rank] or 0
                            -- tiebreak with highest rank
                            if count >= max_count then
                                max_count = count
                                max_rank = rank
                            end
                        end
                    
                        G.GAME.current_round.most_played_rank = max_rank
                    end
                    
                    
                    
                    local lowestValue = math.huge
                    local leastPlayedHand = ''
                    
                    for i = #G.handlist, 1, -1 do
                        local v = G.handlist[i]
                        local playedCount = G.GAME.hands and G.GAME.hands[v] and G.GAME.hands[v].played or 0
                        if (playedCount < lowestValue) and G.GAME.hands[v].visible then
                            lowestValue = G.GAME.hands[v].visible and playedCount or lowestValue
                            leastPlayedHand = G.GAME.hands[v].visible and v or leastPlayedHand
                        end
                    end
                    
                    G.GAME.current_round.least_played_poker_hand = leastPlayedHand
                    
                    G.GAME.current_round.most_played_poker_hand = _handname
                end

                if G.GAME.blind:get_type() == 'Boss' and not G.GAME.seeded and not G.GAME.challenge  then
                    G.GAME.current_boss_streak = G.GAME.current_boss_streak + 1
                    check_and_set_high_score('boss_streak', G.GAME.current_boss_streak)
                end
                
                if G.GAME.current_round.hands_played == 1 then 
                    inc_career_stat('c_single_hand_round_streak', 1)
                else
                    if not G.GAME.seeded and not G.GAME.challenge  then
                        G.PROFILES[G.SETTINGS.profile].career_stats.c_single_hand_round_streak = 0
                        G:save_settings()
                    end
                end

                check_for_unlock({type = 'round_win'})
                set_joker_usage()
                if game_won and not G.GAME.win_notified then
                    G.GAME.win_notified = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        blocking = false,
                        blockable = false,
                        func = (function()
                            if G.STATE == G.STATES.ROUND_EVAL then 
                                win_game()
                                G.GAME.won = true
                                return true
                            end
                        end)
                    }))
                end
                for _,v in ipairs(SMODS.get_card_areas('playing_cards', 'end_of_round')) do
                    SMODS.calculate_end_of_round_effects({ cardarea = v, end_of_round = true })
                end



                local i = 1
                while i <= #G.hand.cards do
                    local gone = G.hand.cards[i]:calculate_banana()
                    if not gone then i = i + 1 end
                end
                for i = 1, #G.discard.cards do
                    G.discard.cards[i]:calculate_perishable()
                end
                i = 1
                while i <= #G.deck.cards do
                    G.deck.cards[i]:calculate_perishable()
                    local gone = G.deck.cards[i]:calculate_banana()
                    if not gone then i = i + 1 end
                end
                if G.GAME.used_vouchers.v_cry_double_down then
                    local function update_dbl(area)
                        for i = 1, #area.cards do
                            if area.cards[i].dbl_side then
                                --tweak to do deck effects with on the flip side
                                cry_misprintize(area.cards[i].dbl_side, {min = 1.5, max = 1.5}, nil, true)
                                card_eval_status_text(area.cards[i], "extra", nil, nil, nil, { message = localize("k_upgrade_ex") })
                            end
                        end
                    end
                    update_dbl(G.jokers)
                    update_dbl(G.consumeables)
                    update_dbl(G.hand)
                    update_dbl(G.discard)
                    update_dbl(G.deck)
                end
                G.FUNCS.draw_from_hand_to_discard()
                if G.GAME.blind_on_deck == 'Boss' then
                    G.GAME.voucher_restock = nil
                    if G.GAME.modifiers.set_eternal_ante and (G.GAME.round_resets.ante == G.GAME.modifiers.set_eternal_ante) then 
                        for k, v in ipairs(G.jokers.cards) do
                            v:set_eternal(true)
                        end
                    end
                    if G.GAME.modifiers.set_joker_slots_ante and (G.GAME.round_resets.ante == G.GAME.modifiers.set_joker_slots_ante) then 
                        G.jokers.config.card_limit = 0
                    end
                    delay(0.4); ease_ante(G.GAME.blind and G.GAME.blind:cry_calc_ante_gain() or 1); cry_apply_ante_tax(); delay(0.4); check_for_unlock({type = 'ante_up', ante = G.GAME.round_resets.ante + 1})
                end
                G.FUNCS.draw_from_discard_to_deck()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                        G.STATE = G.STATES.ROUND_EVAL
                        G.STATE_COMPLETE = false

                        if G.GAME.blind_on_deck == 'Small' then
                            G.GAME.round_resets.blind_states.Small = 'Defeated'
                        elseif G.GAME.blind_on_deck == 'Big' then
                            G.GAME.round_resets.blind_states.Big = 'Defeated'
                        else
                            if G.GAME.current_round.cry_voucher_stickers.pinned == false then
                            	if not G.GAME.modifiers.cry_no_vouchers then
                            	    if not G.GAME.modifiers.cry_voucher_restock_antes or G.GAME.round_resets.ante % G.GAME.modifiers.cry_voucher_restock_antes == 0 then
                            	        G.GAME.current_round.voucher = get_next_voucher_key()
                            	        G.GAME.current_round.cry_voucher_stickers = cry_get_next_voucher_stickers()
                            	        G.GAME.current_round.cry_voucher_edition = cry_get_next_voucher_edition() or {}
                            	        G.GAME.current_round.cry_bonusvouchers = {}
                            	        G.GAME.cry_bonusvouchersused = {}	-- i'm not sure why i'm putting these in two separate tables but it doesn't matter much
                            	        for i = 1, G.GAME.cry_bonusvouchercount do
                            	        	G.GAME.current_round.cry_bonusvouchers[i] = get_next_voucher_key()
                            	        end
                            	    end
                            	else
                            	    very_fair_quip = pseudorandom_element(G.localization.misc.very_fair_quips, pseudoseed("cry_very_fair"))
                            	end
                            end
                            G.GAME.round_resets.blind_states.Boss = 'Defeated'
                            for k, v in ipairs(G.playing_cards) do
                                v.ability.played_this_ante = nil
                            end
                        end

                        if G.GAME.round_resets.temp_handsize then G.hand:change_size(-G.GAME.round_resets.temp_handsize); G.GAME.round_resets.temp_handsize = nil end
                        if G.GAME.round_resets.temp_reroll_cost then G.GAME.round_resets.temp_reroll_cost = nil; calculate_reroll_cost(true) end
                        for _, v in pairs(find_joker("cry-loopy")) do
                        	if v.ability.extra.retrigger ~= 0 then
                        		v.ability.extra.retrigger = 0
                        		card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize("k_reset"), colour = G.C.GREEN})
                        	end
                        end
                        SMODS.calculate_context{end_of_round2 = true}

                        reset_idol_card()
                        reset_mail_rank()
                        reset_ancient_card()
                        reset_castle_card()                        for _, mod in ipairs(SMODS.mod_list) do
                        	if mod.reset_game_globals and type(mod.reset_game_globals) == 'function' then
                        		mod.reset_game_globals(false)
                        	end
                        end
                        for k, v in ipairs(G.playing_cards) do
                            v.ability.discarded = nil
                            v.ability.forced_selection = nil
                        end
                    return true
                    end
                }))
            end
        return true
      end
    }))
  end
  
function new_round()
    G.RESET_JIGGLES = nil
    delay(0.4)
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
            
            local deck_size = 0
            
            G.GAME.last_deck_size = G.GAME.last_deck_size
            
            for k, v in pairs(G.playing_cards) do
                deck_size = deck_size + 1
            end
            
            if G.GAME.last_deck_size ~= deck_size then
                local locked_card
                local difference = deck_size - G.GAME.last_deck_size
            
                for i = 1, #G.P_LOCKED do
                    locked_card = G.P_LOCKED[i]
            
                    if not locked_card.unlocked and locked_card.check_for_unlock and type(locked_card.check_for_unlock) == 'function' then
                        locked_card:check_for_unlock({type = 'round_deck_size', round_deck_size_diff = difference})
                    end
                end
            end
            
            G.GAME.last_deck_size = deck_size
            
            G.GAME.money_spend_this_round = 0
            G.GAME.current_round.discards_left = math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards)
            G.GAME.current_round.hands_left = (math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands))
            G.GAME.current_round.hands_played = 0
            G.GAME.current_round.discards_used = 0
            G.GAME.current_round.reroll_cost_increase = 0
            G.GAME.current_round.used_packs = {}

            for k, v in pairs(G.GAME.hands) do 
                v.played_this_round = 0
            end

            for k, v in pairs(G.playing_cards) do
                v.ability.wheel_flipped = nil
            end

            local chaos = find_joker('Chaos the Clown')
            G.GAME.current_round.free_rerolls = #chaos
            calculate_reroll_cost(true)

            G.GAME.round_bonus.next_hands = 0
            G.GAME.round_bonus.discards = 0

            local blhash = ''
            if G.GAME.blind_on_deck == 'Small' then
                G.GAME.round_resets.blind_states.Small = 'Current'
                G.GAME.current_boss_streak = 0
                blhash = 'S'
            elseif G.GAME.blind_on_deck == 'Big' then
                G.GAME.round_resets.blind_states.Big = 'Current'
                G.GAME.current_boss_streak = 0
                blhash = 'B'
            else
                G.GAME.round_resets.blind_states.Boss = 'Current'
                blhash = 'L'
            end
            G.GAME.subhash = (G.GAME.round_resets.ante)..(blhash)

            G.GAME.blind:set_blind(G.GAME.round_resets.blind)
            if G.GAME.modifiers.cry_card_each_round then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local front = pseudorandom_element(G.P_CARDS, pseudoseed('cry_horizon'))
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local edition = G.P_CENTERS.c_base
                        local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.c_base, {playing_card = G.playing_card})
                        card:start_materialize()
                        if G.GAME.selected_back.effect.config.cry_force_edition and G.GAME.selected_back.effect.config.cry_force_edition ~= "random" then
                            local edition = {}
                            edition[G.GAME.selected_back.effect.config.cry_force_edition] = true
                            card:set_edition(edition, true, true);
                        end
                        G.play:emplace(card)
                        table.insert(G.playing_cards, card)
                        playing_card_joker_effects({true})
                        return true
                    end}))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end}))
                draw_card(G.play,G.deck, 90,'up', nil)
            end
            if G.GAME.modifiers.cry_conveyor and #G.jokers.cards>0 then
                local duplicated_joker = copy_card(G.jokers.cards[#G.jokers.cards])
                duplicated_joker:add_to_deck()
                G.jokers:emplace(duplicated_joker)
                G.jokers.cards[1]:start_dissolve()
            end
            G.GAME.current_round.semicolon = false
            
            SMODS.calculate_context({setting_blind = true, blind = G.GAME.round_resets.blind})
            
            -- TARGET: setting_blind effects
            delay(0.4)

            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.STATE = G.STATES.DRAW_TO_HAND
                    G.deck:shuffle('nr'..G.GAME.round_resets.ante)
                    G.deck:hard_set_T()
if G.SCORING_COROUTINE then return false end 
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
            return true
            end
        }))
end

G.FUNCS.draw_from_deck_to_hand = function(e)
    if not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
        G.hand.config.card_limit <= 0 and #G.hand.cards == 0 then 
        G.STATE = G.STATES.GAME_OVER; G.STATE_COMPLETE = false 
        return true
    end

    local hand_space = e
    if not hand_space then
        local limit = G.hand.config.card_limit - #G.hand.cards
        local n = 0
        while n < #G.deck.cards do
            local card = G.deck.cards[#G.deck.cards-n]
            limit = limit - 1 + (card.edition and card.edition.card_limit or 0)
            if limit < 0 then break end
            n = n + 1
        end
        hand_space = n
    end
    if G.GAME.modifiers.cry_forced_draw_amount and (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) then
    	hand_space = math.min(#G.deck.cards, G.GAME.modifiers.cry_forced_draw_amount)
    end
    if G.GAME.blind.name == 'The Serpent' and
        not G.GAME.blind.disabled and
        (G.GAME.current_round.hands_played > 0 or
        G.GAME.current_round.discards_used > 0) then
            hand_space = math.min(#G.deck.cards, 3)
    end
    delay(0.3)
    if not G.GAME.USING_RUN then
    for i=1, hand_space do --draw cards from deckL
        if G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK then 
            draw_card(G.deck,G.hand, i*100/hand_space,'up', true)
        else
            draw_card(G.deck,G.hand, i*100/hand_space,'up', true)
        end
    end
else
	for i = 1, #G.cry_runarea.cards do
		draw_card(G.cry_runarea,G.hand, i*100/#G.cry_runarea.cards,'up', true)
	end
end
G.FUNCS.draw_from_hand_to_run = function(e)	-- might as well just slap this here
	local hand_count = #G.hand.cards
	for i=1, hand_count do --draw cards from deck
		draw_card(G.hand, G.cry_runarea, i*100/hand_count,'down', nil, nil,  0.08)
	end
end
end

G.FUNCS.discard_cards_from_highlighted = function(e, hook)

G.hand.crackers_highlighted = {}
local crackers_in_hand = false

for i = 1, #G.hand.cards do
    if G.hand.cards[i] and G.hand.cards[i].highlighted
    and G.hand.cards[i].config.center == G.P_CENTERS.m_bunc_cracker
    and not G.hand.cards[i].debuff then
        crackers_in_hand = true
        break
    end
end

for i = 1, #G.hand.cards do
    if G.hand.cards[i] and G.hand.cards[i].highlighted
    and (((G.hand.cards[i].config.center == G.P_CENTERS.m_bunc_cracker) and not G.hand.cards[i].debuff) or (crackers_in_hand and #SMODS.find_card('j_bunc_pica', false) > 0)) then
        table.insert(G.hand.crackers_highlighted, G.hand.cards[i])
        G.hand:remove_from_highlighted(G.hand.cards[i], true)
    end
end


if G.GAME.blind and G.GAME.blind.name == 'bl_bunc_final_dagger' and not G.GAME.blind.disabled then
    G.GAME.blind:wiggle()
    G.GAME.blind.antiscore = true
    G.FUNCS.play_cards_from_highlighted()
    return
end


if G.GAME.blind and G.GAME.blind.name == 'bl_bunc_paling' and not G.GAME.blind.disabled then
    G.GAME.blind:wiggle()
    delay(0.7)
end

    stop_use()
    G.CONTROLLER.interrupt.focus = true
    G.CONTROLLER:save_cardarea_focus('hand')

    for k, v in ipairs(G.playing_cards) do
        v.ability.forced_selection = nil
    end

    if G.CONTROLLER.focused.target and G.CONTROLLER.focused.target.area == G.hand then G.card_area_focus_reset = {area = G.hand, rank = G.CONTROLLER.focused.target.rank} end
    local highlighted_count = math.min(#G.hand.highlighted, G.discard.config.card_limit - #G.play.cards)
    if highlighted_count > 0 then 
        update_hand_text({immediate = true, nopulse = true, delay = 0}, {mult = 0, chips = 0, level = '', handname = ''})
        table.sort(G.hand.highlighted, function(a,b) return a.T.x < b.T.x end)
        inc_career_stat('c_cards_discarded', highlighted_count)
        SMODS.calculate_context({pre_discard = true, full_hand = G.hand.highlighted, hook = hook})
        
        -- TARGET: pre_discard
        local cards = {}
        local destroyed_cards = {}
        
        if G.GAME.blind and G.GAME.blind.name == 'bl_bunc_paling' and not G.GAME.blind.disabled then
            for i=1, highlighted_count do
                G.E_MANAGER:add_event(Event({func = function() G.hand.highlighted[i]:juice_up(); return true end })) 
                ease_dollars(-1)
                delay(0.23)
            end
        end
        
        for i=1, highlighted_count do
            G.hand.highlighted[i]:calculate_seal({discard = true})
            local removed = false
            local effects = {}
            SMODS.calculate_context({discard = true, other_card =  G.hand.highlighted[i], full_hand = G.hand.highlighted}, effects)
            SMODS.trigger_effects(effects)
            for _, eval in pairs(effects) do
                if type(eval) == 'table' then
                    for key, eval2 in pairs(eval) do
                        if key == 'remove' or (type(eval2) == 'table' and eval2.remove) then removed = true end
                    end
                end
            end
            table.insert(cards, G.hand.highlighted[i])
            if removed then
                destroyed_cards[#destroyed_cards + 1] = G.hand.highlighted[i]
                if SMODS.has_enhancement(G.hand.highlighted[i], 'm_glass') then
                    G.hand.highlighted[i]:shatter()
                else
                    G.hand.highlighted[i]:start_dissolve()
                end
            else 
                G.hand.highlighted[i].ability.discarded = true
                
                if G.GAME.blind and G.GAME.blind.name == 'bl_bunc_claw' and not G.GAME.blind.disabled then
                    draw_card(G.hand, G.deck, i*100/highlighted_count, 'down', false, G.hand.highlighted[i])
                    G.deck:shuffle('claw'..G.GAME.round_resets.ante)
                else
                    draw_card(G.hand, G.discard, i*100/highlighted_count, 'down', false, G.hand.highlighted[i])
                end
                
            end
        end

        -- context.remove_playing_cards from discard
        if destroyed_cards[1] then
            SMODS.calculate_context({remove_playing_cards = true, removed = destroyed_cards})
        end
        
        -- TARGET: effects after cards destroyed in discard

        G.GAME.round_scores.cards_discarded.amt = G.GAME.round_scores.cards_discarded.amt + #cards
        check_for_unlock({type = 'discard_custom', cards = cards})
        if not hook then
            if G.GAME.modifiers.discard_cost then
                ease_dollars(-G.GAME.modifiers.discard_cost)
            end
            ease_discard(-1)
            G.GAME.current_round.discards_used = G.GAME.current_round.discards_used + 1
            
            if G.hand.crackers_highlighted and #G.hand.crackers_highlighted >= 1 then
                for i = 1, #G.hand.crackers_highlighted do
                    if not G.hand.crackers_highlighted[i].highlighted then
                        G.hand:add_to_highlighted(G.hand.crackers_highlighted[i], true)
                    end
                    G.hand.crackers_highlighted[i].marked_cracker = true
                end
            
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.ignore_hand_played = true
                    G.FUNCS.play_cards_from_highlighted()
                return true end}))
            
                return
            end
            
            
            if G.GAME.blind and G.GAME.blind.name == 'bl_bunc_swing' and not G.GAME.blind.disabled then
                G.E_MANAGER:add_event(Event({ func = function()
                    for k, v in ipairs(G.hand.cards) do
                        v:flip()
                    end
            
                    G.GAME.blind:wiggle()
                    G.GAME.blind.triggered = true
            
                    if G.GAME.Swing == true then
                        G.GAME.Swing = false
                    else
                        G.GAME.Swing = true
                    end
                return true end }))
            end
            
            G.STATE = G.STATES.DRAW_TO_HAND
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
if G.SCORING_COROUTINE then return false end 
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        end
    end
if G.hand.crackers_highlighted and #G.hand.crackers_highlighted >= 1 then

    ease_discard(-1)

    for i = 1, #G.hand.crackers_highlighted do
        if not G.hand.crackers_highlighted[i].highlighted then
            G.hand:add_to_highlighted(G.hand.crackers_highlighted[i], true)
        end
        G.hand.crackers_highlighted[i].marked_cracker = true
    end

    if #G.play.cards ~= 0 then
        for i=1, #G.hand.highlighted do
            if G.hand.highlighted[i] and G.hand.highlighted[i].config.center == G.P_CENTERS.m_bunc_cracker then
                if G.hand.highlighted[i]:is_face() then inc_career_stat('c_face_cards_played', 1) end
                G.hand.highlighted[i].base.times_played = G.hand.highlighted[i].base.times_played + 1
                G.hand.highlighted[i].ability.played_this_ante = true
                G.GAME.round_scores.cards_played.amt = G.GAME.round_scores.cards_played.amt + 1
                draw_card(G.hand, G.play, i*100/#G.hand.highlighted, 'up', nil, G.hand.highlighted[i])
            end
        end
    end

    G.E_MANAGER:add_event(Event({func = function()
        if #G.play.cards == 0 then
            G.GAME.ignore_hand_played = true
            G.FUNCS.play_cards_from_highlighted()
        end
    return true end}))

    return
end


end
  
G.FUNCS.play_cards_from_highlighted = function(e)
    if G.play and G.play.cards[1] then return end
    --check the hand first
    
    local unlock_all_flipped = true
    
    for i = 1, #G.hand.highlighted do
        if G.hand.highlighted[i].facing ~= 'back' then
            unlock_all_flipped = false
        end
    end
    
    if (not G.hand.highlighted) or (#G.hand.highlighted == 0) then unlock_all_flipped = false end
    
    if unlock_all_flipped and #G.hand.highlighted >= 5 then
        local locked_card
    
        for i = 1, #G.P_LOCKED do
            locked_card = G.P_LOCKED[i]
    
            if not locked_card.unlocked and locked_card.check_for_unlock and type(locked_card.check_for_unlock) == 'function' then
                locked_card:check_for_unlock({type = 'play_all_flipped'})
            end
        end
    end
    
    
    if G.jokers ~= nil then
        for _, v in ipairs(G.jokers.cards) do
            if v.config.center.key == 'j_bunc_vandalism' and not v.debuff then
                v:calculate_joker({play_cards = true})
            end
        end
    end
    

    stop_use()
    G.GAME.blind.triggered = false
    G.CONTROLLER.interrupt.focus = true
    G.CONTROLLER:save_cardarea_focus('hand')

    for k, v in ipairs(G.playing_cards) do
        v.ability.forced_selection = nil
    end
    
    table.sort(G.hand.highlighted, function(a,b) return a.T.x < b.T.x end)

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.STATE = G.STATES.HAND_PLAYED
            G.STATE_COMPLETE = true
            return true
        end
    }))
    inc_career_stat('c_cards_played', #G.hand.highlighted)
    inc_career_stat('c_hands_played', 1)
    
    if G.GAME.blind and G.GAME.blind.name == 'bl_bunc_swing' and not G.GAME.blind.disabled then
        G.E_MANAGER:add_event(Event({ func = function()
            for k, v in ipairs(G.hand.cards) do
                if not (v.area == G.hand and v.highlighted and v.facing == 'front') then
                    v:flip()
                end
            end
    
            G.GAME.blind:wiggle()
            G.GAME.blind.triggered = true
    
            if G.GAME.Swing == true then
                G.GAME.Swing = false
            else
                G.GAME.Swing = true
            end
        return true end }))
    end
    
    
    if G.GAME.blind and G.GAME.blind.name == 'bl_bunc_umbrella' and not G.GAME.blind.disabled then
        G.E_MANAGER:add_event(Event({func = function()
    
            for k, v in ipairs(G.hand.cards) do
                if v.facing == 'front' and not v.highlighted then
                    v:flip()
                end
            end
    
            G.GAME.blind:wiggle()
            G.GAME.blind.triggered = true
    
        return true end }))
    end
    
    
    if G.jokers ~= nil then
        for _, v in ipairs(G.jokers.cards) do
            if v.config.center.key == 'j_bunc_cellphone' and v.ability.extra.active and not v.debuff then
                v:calculate_joker({press_play = true})
                break
            end
        end
    end
    
    
    local function calculate_discard()
        for i = 1, #G.hand.cards do
            eval_card(G.hand.cards[i], {pre_discard = true, full_hand = G.hand.highlighted, hook = hook})
        end
        for j = 1, #G.jokers.cards do
            G.jokers.cards[j]:calculate_joker({pre_discard = true, full_hand = G.hand.highlighted, hook = hook})
        end
    end
    
    if not G.GAME.ignore_hand_played then
        if G.GAME.blind.antiscore then
            ease_discard(-1)
            calculate_discard()
        else
            ease_hands_played(-1)
        end
    else
        G.GAME.ignore_hand_played = nil
    end
    
    delay(0.4)

        for i=1, #G.hand.highlighted do
            if G.hand.highlighted[i]:is_face() then inc_career_stat('c_face_cards_played', 1) end
            G.hand.highlighted[i].base.times_played = G.hand.highlighted[i].base.times_played + 1
            G.hand.highlighted[i].ability.played_this_ante = true
            G.GAME.round_scores.cards_played.amt = G.GAME.round_scores.cards_played.amt + 1
            draw_card(G.hand, G.play, i*100/#G.hand.highlighted, 'up', nil, G.hand.highlighted[i])
        end

        check_for_unlock({type = 'run_card_replays'})

        if G.GAME.blind:press_play() then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = (function()
                    SMODS.juice_up_blind()
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    return true
                end)
            }))
            delay(0.4)
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
                check_for_unlock({type = 'hand_contents', cards = G.play.cards})

                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.FUNCS.evaluate_play()
                        
                        if G.GAME.blind.antiscore then
                            G.GAME.blind.antiscore = false
                        end
                        
                        return true
                    end
                }))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if G.SCORING_COROUTINE then return false end 
                        check_for_unlock({type = 'play_all_hearts'})
                        G.FUNCS.draw_from_play_to_discard()
                        G.GAME.hands_played = G.GAME.hands_played + 1
                        G.GAME.current_round.hands_played = G.GAME.current_round.hands_played + 1
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
if G.SCORING_COROUTINE then return false end 
                        G.STATE_COMPLETE = false
                        return true
                    end
                }))
                return true
            end)
        }))
end

G.FUNCS.get_poker_hand_info = function(_cards)
    local poker_hands = evaluate_poker_hand(_cards)
    local scoring_hand = {}
    local text,disp_text,loc_disp_text = 'NULL','NULL', 'NULL'
    if next(poker_hands["Flush Five"]) then text = "Flush Five"; scoring_hand = poker_hands["Flush Five"][1]
    elseif next(poker_hands["Flush House"]) then text = "Flush House"; scoring_hand = poker_hands["Flush House"][1]
    elseif next(poker_hands["Five of a Kind"]) then text = "Five of a Kind"; scoring_hand = poker_hands["Five of a Kind"][1]
    elseif next(poker_hands["Straight Flush"]) then text = "Straight Flush"; scoring_hand = poker_hands["Straight Flush"][1]
    elseif next(poker_hands["Four of a Kind"]) then text = "Four of a Kind"; scoring_hand = poker_hands["Four of a Kind"][1]
    elseif next(poker_hands["Full House"]) then text = "Full House"; scoring_hand = poker_hands["Full House"][1]
    elseif next(poker_hands["Flush"]) then text = "Flush"; scoring_hand = poker_hands["Flush"][1]
    elseif next(poker_hands["Straight"]) then text = "Straight"; scoring_hand = poker_hands["Straight"][1]
    elseif next(poker_hands["Three of a Kind"]) then text = "Three of a Kind"; scoring_hand = poker_hands["Three of a Kind"][1]
    elseif next(poker_hands["Two Pair"]) then text = "Two Pair"; scoring_hand = poker_hands["Two Pair"][1]
    elseif next(poker_hands["Pair"]) then text = "Pair"; scoring_hand = poker_hands["Pair"][1]
    elseif next(poker_hands["High Card"]) then text = "High Card"; scoring_hand = poker_hands["High Card"][1] end

    disp_text = text
    if text =='Straight Flush' then
        local min = 10
        for j = 1, #scoring_hand do
            if scoring_hand[j]:get_id() < min then min =scoring_hand[j]:get_id() end
        end
        if min >= 10 then 
            disp_text = 'Royal Flush'
        end
    end
    loc_disp_text = localize(disp_text, 'poker_hands')
    return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end
  
G.FUNCS.evaluate_play = function(e)

local antiscore = G.GAME.blind.antiscore

    local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
    
    G.GAME.hands[text].played = G.GAME.hands[text].played + 1
    
    if text == 'bunc_Spectrum'
    or text == 'bunc_Straight Spectrum'
    or text == 'bunc_Spectrum House'
    or text == 'bunc_Spectrum Five' then
        enable_exotics()
        unlock_card(G.P_CENTERS.b_bunc_fairy)
    end
    
    if G.GAME.current_round.current_hand.cry_asc_num > (G.GAME.cry_exploit_override and 1 or 0) then
    	G.GAME.cry_asc_played = G.GAME.cry_asc_played and G.GAME.cry_asc_played+1 or 1
    end
    G.GAME.hands[text].played_this_round = G.GAME.hands[text].played_this_round + 1
    G.GAME.last_hand_played = text
    set_hand_usage(text)
    G.GAME.hands[text].visible = true

    --Add all the pure bonus cards to the scoring hand
    local pures = {}
    for i=1, #G.play.cards do
        if next(find_joker('Splash')) then
            scoring_hand[i] = G.play.cards[i]
        else
            if SMODS.always_scores(G.play.cards[i]) then
                local inside = false
                for j=1, #scoring_hand do
                    if scoring_hand[j] == G.play.cards[i] then
                        inside = true
                    end
                end
                if not inside then table.insert(pures, G.play.cards[i]) end
            end
        end
    end
    for i=1, #pures do
        table.insert(scoring_hand, pures[i])
    end
    table.sort(scoring_hand, function (a, b) return a.T.x < b.T.x end )
    delay(0.2)
    for i=1, #scoring_hand do
        --Highlight all the cards used in scoring and play a sound indicating highlight
        highlight_card(scoring_hand[i],(i-0.999)/5,'up')
        
        local played_rank = scoring_hand[i].base.value
        
        if G.GAME.played_ranks == nil then G.GAME.played_ranks = {} end
        
        if G.GAME.played_ranks[played_rank] then
            G.GAME.played_ranks[played_rank] = G.GAME.played_ranks[played_rank] + 1
        else
            G.GAME.played_ranks[played_rank] = 1
        end
        
    end

    percent = 0.3
    percent_delta = 0.08

    if G.GAME.current_round.current_hand.handname ~= disp_text then delay(0.3) end
    update_hand_text({sound = G.GAME.current_round.current_hand.handname ~= disp_text and 'button' or nil, volume = 0.4, immediate = true, nopulse = nil,
                                delay = G.GAME.current_round.current_hand.handname ~= disp_text and 0.4 or 0}, {handname=disp_text, level=G.GAME.hands[text].level, mult = cry_ascend(G.GAME.hands[text].mult), chips = cry_ascend(G.GAME.hands[text].chips)})

    if not G.GAME.blind:debuff_hand(G.play.cards, poker_hands, text) then
                mult = mod_mult(cry_ascend(G.GAME.hands[text].mult))
                hand_chips = mod_chips(cry_ascend(G.GAME.hands[text].chips))

        check_for_unlock({type = 'hand', handname = text, disp_text = non_loc_disp_text, scoring_hand = scoring_hand, full_hand = G.play.cards})

        delay(0.4)

        if G.GAME.first_used_hand_level and G.GAME.first_used_hand_level > 0 then
            level_up_hand(G.deck.cards[1], text, nil, G.GAME.first_used_hand_level)
            G.GAME.first_used_hand_level = nil
        end

        local hand_text_set = false
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, kcv_forecast_event = true})
        -- context.before calculations
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, before = true})
        
        -- TARGET: effects before scoring starts

                mult = mod_mult(cry_ascend(G.GAME.hands[text].mult))
                hand_chips = mod_chips(cry_ascend(G.GAME.hands[text].chips))

        
        for i = 1, #G.GAME.tags do
            G.GAME.tags[i]:apply_to_run({type = 'hand_played', before = true})
        end
        
        local modded = false

        mult, hand_chips, modded = G.GAME.blind:modify_hand(G.play.cards, poker_hands, text, mult, hand_chips)
        mult, hand_chips = mod_mult(mult), mod_chips(hand_chips)
        if modded then update_hand_text({sound = 'chips2', modded = modded}, {chips = hand_chips, mult = mult}) end
        for i=1, #G.jokers.cards do
            eval_card(G.jokers.cards[i], {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, before_but_not_as_much = true})
        end
        delay(0.3)
        for _, v in ipairs(SMODS.get_card_areas('playing_cards')) do
            SMODS.calculate_main_scoring({cardarea = v, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands}, v == G.play and scoring_hand or nil)
            delay(0.3)
        end
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        --Joker Effects
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        percent = percent + percent_delta
        for _, area in ipairs(SMODS.get_card_areas('jokers')) do for _, _card in ipairs(area.cards) do
            local effects = {}
            -- remove base game joker edition calc
            local eval = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, edition = true, pre_joker = true})
            if eval.edition then effects[#effects+1] = eval end
            

            -- Calculate context.joker_main
            local joker_eval, post = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true})
            if next(joker_eval) then
                if joker_eval.edition then joker_eval.edition = {} end
                table.insert(effects, joker_eval)
                for _, v in ipairs(post) do effects[#effects+1] = v end
                if joker_eval.retriggers then
                    for rt = 1, #joker_eval.retriggers do
                        local rt_eval, rt_post = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true, retrigger_joker = true})
                        table.insert(effects, {joker_eval.retriggers[rt]})
                        table.insert(effects, rt_eval)
                        for _, v in ipairs(rt_post) do effects[#effects+1] = v end
                    end
                end
            end

            -- Calculate context.other_joker effects
            for _, _area in ipairs(SMODS.get_card_areas('jokers')) do
                for _, _joker in ipairs(_area.cards) do
                    local other_key = 'other_unknown'
                    if _card.ability.set == 'Joker' then other_key = 'other_joker' end
                    if _card.ability.consumeable then other_key = 'other_consumeable' end
                    if _card.ability.set == 'Voucher' then other_key = 'other_voucher' end
                    -- TARGET: add context.other_something identifier to your cards
                    local joker_eval,post = eval_card(_joker, {full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, [other_key] = _card, other_main = _card })
                    if next(joker_eval) then
                        if joker_eval.edition then joker_eval.edition = {} end
                        joker_eval.jokers.juice_card = _joker
                        table.insert(effects, joker_eval)
                        for _, v in ipairs(post) do effects[#effects+1] = v end
                        if joker_eval.retriggers then
                            for rt = 1, #joker_eval.retriggers do
                                local rt_eval, rt_post = eval_card(_card, {full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, [other_key] = _card, retrigger_joker = true})
                                table.insert(effects, {joker_eval.retriggers[rt]})
                                table.insert(effects, rt_eval)
                                for _, v in ipairs(rt_post) do effects[#effects+1] = v end
                            end
                        end
                    end
                end
            end

            -- calculate edition multipliers
            local eval = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, edition = true, post_joker = true})
            if eval.edition then effects[#effects+1] = eval end

            SMODS.trigger_effects(effects, _card)
            local deck_effect = G.GAME.selected_back:trigger_effect({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_joker = _card.ability.set == 'Joker' and _card or false, other_consumeable = _card.ability.set ~= 'Joker' and _card or false})
            if deck_effect then SMODS.calculate_effect(deck_effect, G.deck.cards[1] or G.deck) end
        end end

        -- context.final_scoring_step calculations
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, final_scoring_step = true})
        
        -- TARGET: effects before deck final_scoring_step
        
        for i=1, BUNCOMOD and BUNCOMOD.vars and BUNCOMOD.vars.jokerlike_consumable_editions and 0 or #G.consumeables.cards do
            local _card = G.consumeables.cards[i]
            local effects = {}
            -- remove base game joker edition calc
            local eval = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, edition = true, pre_joker = true})
            
        
            -- Calculate context.joker_main
            local joker_eval, post = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true})
            if next(joker_eval) then
                table.insert(effects, joker_eval)
                if next(post) then 
                    for _, v in ipairs(post) do
                        table.insert(effects, v) 
                    end
                end
                if joker_eval.retriggers then
                    for rt = 1, #joker_eval.retriggers do
                        local rt_eval, rt_post = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true, retrigger_joker = true})
                        table.insert(effects, {joker_eval.retriggers[rt]})
                        table.insert(effects, rt_eval)
                        if next(rt_post) then table.insert(effects, rt_post) end
                    end
                end
            end
        
            -- Calculate context.other_joker effects
            for k=1, #G.consumeables.cards do
                local _joker = G.consumeables.cards[k]
                local joker_eval,post = eval_card(_joker, {full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_joker = _card.ability.set == 'Joker' and _card or false, other_consumeable = _card.ability.set ~= 'Joker' and _card or false})
                if next(joker_eval) then
                    joker_eval.jokers.juice_card = _joker
                    table.insert(effects, joker_eval)
                    if next(post) then
                        for _, v in ipairs(post) do
                            table.insert(effects, v) 
                        end
                    end
                    if joker_eval.retriggers then
                        for rt = 1, #joker_eval.retriggers do
                            local rt_eval, rt_post = eval_card(_card, {full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_joker = _card.ability.set == 'Joker' and _card or false, other_consumeable = _card.ability.set ~= 'Joker' and _card or false, retrigger_joker = true})
                            table.insert(effects, {joker_eval.retriggers[rt]})
                            table.insert(effects, rt_eval)
                            if next(rt_post) then table.insert(effects, rt_post) end
                        end
                    end
                end
            end
        
            SMODS.trigger_effects(effects, _card)
            local deck_effect = G.GAME.selected_back:trigger_effect({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_joker = _card.ability.set == 'Joker' and _card or false, other_consumeable = _card.ability.set ~= 'Joker' and _card or false})
            if deck_effect then SMODS.calculate_effect(deck_effect, G.deck.cards[1] or G.deck) end
        end
        
        local nu_chip, nu_mult = G.GAME.selected_back:trigger_effect{context = 'final_scoring_step', chips = hand_chips, mult = mult}
        mult = mod_mult(nu_mult or mult)
        hand_chips = mod_chips(nu_chip or hand_chips)

        local cards_destroyed = {}
        for _,v in ipairs(SMODS.get_card_areas('playing_cards', 'destroying_cards')) do
            SMODS.calculate_destroying_cards({ full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, cardarea = v }, cards_destroyed, v == G.play and scoring_hand or nil)
        end
        
        -- context.remove_playing_cards calculations
        if cards_destroyed[1] then
            SMODS.calculate_context({scoring_hand = scoring_hand, remove_playing_cards = true, removed = cards_destroyed})
        end
        
        -- TARGET: effects when cards are removed
        


        local glass_shattered = {}
        for k, v in ipairs(cards_destroyed) do
            if v.shattered then glass_shattered[#glass_shattered+1] = v end
        end

        check_for_unlock{type = 'shatter', shattered = glass_shattered}
        
        for i=1, #cards_destroyed do
            G.E_MANAGER:add_event(Event({
                func = function()
                    if SMODS.has_enhancement(cards_destroyed[i], 'm_glass') then
                        cards_destroyed[i]:shatter()
                    else
                        cards_destroyed[i]:start_dissolve()
                    end
                  return true
                end
              }))
        end
    
    if G.GAME.blind and G.GAME.blind.name == 'bl_bunc_blade' and not G.GAME.blind.disabled then
    
        local overscore = G.GAME.blind.chips * 1.5
    
        if type(hand_chips) == 'table' then overscore = to_big(overscore) end
    
        if (overscore < math.floor(hand_chips*mult) + G.GAME.chips) then
    
            mult = mod_mult(0)
            hand_chips = mod_chips(0)
    
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function()
                    G.GAME.blind:disable()
                    return true
                end)
            }))
    
            local blade_message = G.localization.misc.dictionary.bunc_exceeded_score
            play_area_status_text(blade_message)
    
        end
    end
    
    
    for i = 1, #G.GAME.tags do
        G.GAME.tags[i]:apply_to_run({type = 'hand_played', after = true})
    end
    
    else
        mult = mod_mult(0)
        hand_chips = mod_chips(0)
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
                SMODS.juice_up_blind()
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                    play_sound('tarot2', 0.76, 0.4);return true end}))
                play_sound('tarot2', 1, 0.4)
                return true
            end)
        }))

        play_area_status_text("Not Allowed!")--localize('k_not_allowed_ex'), true)
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        --Joker Debuff Effects
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        -- context.debuffed_hand calculations
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, debuffed_hand = true})
        
        -- TARGET: effects after hand debuffed by blind
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',delay = 0.4,
        func = (function()  update_hand_text({delay = 0, immediate = true}, {mult = 0, chips = 0, chip_total = G.GAME.blind.cry_cap_score and G.GAME.blind:cry_cap_score(math.floor(hand_chips*mult)) or math.floor(hand_chips*mult), level = '', handname = ''});play_sound('button', 0.9, 0.6);return true end)
      }))
          G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function() G.GAME.current_round.current_hand.cry_asc_num = 0;G.GAME.current_round.current_hand.cry_asc_num_text = '';return true end)
          }))
      check_and_set_high_score('hand', hand_chips*mult)

      check_for_unlock({type = 'chip_score', chips = math.floor(hand_chips*mult)})
   
    if to_big(hand_chips)*mult > to_big(0) then
        delay(0.8)
        G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() play_sound('chips2');return true end)
        }))
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'ease',
      blocking = false,
      ref_table = G.GAME,
      ref_value = 'chips',
      ease_to = G.GAME.chips + (G.GAME.blind.cry_cap_score and G.GAME.blind:cry_cap_score(math.floor(hand_chips*mult)) or math.floor(hand_chips*mult)),
      delay =  0.5,
      func = (function(t) return math.floor(t) end)
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'ease',
      blocking = true,
      ref_table = G.GAME.current_round.current_hand,
      ref_value = 'chip_total',
      ease_to = 0,
      delay =  0.5,
      func = (function(t) return math.floor(t) end)
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = (function() G.GAME.current_round.current_hand.handname = '';return true end)
    }))
    delay(0.3)

    -- context.after calculations
    SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, after = true})
    
    calculate_cracker_cards({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, after = true})
    
    
    -- TARGET: effects after hand evaluation
    G.E_MANAGER:add_event(Event({
    	func = function()
    		G.GAME.cry_exploit_override = nil
    		return true
    	end
    }))

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()     
            if G.GAME.modifiers.debuff_played_cards then 
                for k, v in ipairs(scoring_hand) do v.ability.perma_debuff = true end
            end
        return true end)
      }))

  end
  
  G.FUNCS.draw_from_play_to_discard = function(e)
    local play_count = #G.play.cards
    local it = 1
    for k, v in ipairs(G.play.cards) do
        if (not v.shattered) and (not v.destroyed) then 
            
            local cards_to_hand = {}
            
            if G.jokers ~= nil then
                for _, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == 'j_bunc_cellphone' and joker.ability.extra.active and not joker.debuff then
                        for __, card in ipairs(joker.ability.extra.cards_to_hand) do
                            table.insert(cards_to_hand, card)
                        end
                        break
                    end
                end
            end
            
            if cards_to_hand ~= {} then
                local condition = false
                for _, card_to_hand in ipairs(cards_to_hand) do
                    if v == card_to_hand then
                        condition = true
                    end
                end
                if condition then
                    draw_card(G.play,G.hand, it*100/play_count,'up', true, v)
                else
                    draw_card(G.play,G.discard, it*100/play_count,'down', false, v)
                end
            else
                draw_card(G.play,G.discard, it*100/play_count,'down', false, v)
            end
            
            it = it + 1
        end
    end
  end

  G.FUNCS.draw_from_play_to_hand = function(cards)
    local gold_count = #cards
    for i=1, gold_count do --draw cards from play
        if not cards[i].shattered and not cards[i].destroyed then
            draw_card(G.play,G.hand, i*100/gold_count,'up', true, cards[i])
        end
    end
  end
  
  G.FUNCS.draw_from_discard_to_deck = function(e)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            local discard_count = #G.discard.cards
            for i=1, discard_count do --draw cards from deck
                draw_card(G.discard, G.deck, i*100/discard_count,'up', nil ,nil, 0.005, i%2==0, nil, math.max((21-i)/20,0.7))
            end
            return true
        end
      }))
  end

  G.FUNCS.draw_from_hand_to_deck = function(e)
    local hand_count = #G.hand.cards
    for i=1, hand_count do --draw cards from deck
        draw_card(G.hand, G.deck, i*100/hand_count,'down', nil, nil,  0.08)
    end
  end
  
  G.FUNCS.draw_from_hand_to_discard = function(e)
    local hand_count = #G.hand.cards
    for i=1, hand_count do
        draw_card(G.hand,G.discard, i*100/hand_count,'down', nil, nil, 0.07)
    end
end

G.FUNCS.evaluate_round = function()
    total_cashout_rows = 0
    local pitch = 0.95
    local dollars = 0

    if to_big(G.GAME.chips) >= to_big(G.GAME.blind.chips) then
        add_round_eval_row({dollars = G.GAME.blind.dollars, name='blind1', pitch = pitch})
        pitch = pitch + 0.06
        dollars = dollars + G.GAME.blind.dollars
    else
        add_round_eval_row({dollars = 0, name='blind1', pitch = pitch, saved = true})
        pitch = pitch + 0.06
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 1.3*math.min(G.GAME.blind.dollars+2, 7)/2*0.15 + 0.5,
        func = function()
          G.GAME.blind:defeat()
          return true
        end
      }))
    delay(0.2)
    G.E_MANAGER:add_event(Event({
        func = function()
            ease_background_colour_blind(G.STATES.ROUND_EVAL, '')
            return true
        end
    }))
    G.GAME.selected_back:trigger_effect({context = 'eval'})

    if G.GAME.current_round.hands_left > 0 and not G.GAME.modifiers.no_extra_hand_money then
        add_round_eval_row({dollars = G.GAME.current_round.hands_left*(G.GAME.modifiers.money_per_hand or 1), disp = G.GAME.current_round.hands_left, bonus = true, name='hands', pitch = pitch})
        pitch = pitch + 0.06
        dollars = dollars + G.GAME.current_round.hands_left*(G.GAME.modifiers.money_per_hand or 1)
    end
    if G.GAME.current_round.discards_left > 0 and G.GAME.modifiers.money_per_discard then
        add_round_eval_row({dollars = G.GAME.current_round.discards_left*(G.GAME.modifiers.money_per_discard), disp = G.GAME.current_round.discards_left, bonus = true, name='discards', pitch = pitch})
        pitch = pitch + 0.06
        dollars = dollars +  G.GAME.current_round.discards_left*(G.GAME.modifiers.money_per_discard)
    end
    local i = 0
    for _, area in ipairs(SMODS.get_card_areas('jokers')) do
            for _, _card in ipairs(area.cards) do
            local ret = _card:calculate_dollar_bonus()
    
            -- TARGET: calc_dollar_bonus per card
            if ret then
                i = i+1
                add_round_eval_row({dollars = ret, bonus = true, name='joker'..i, pitch = pitch, card = _card})
                pitch = pitch + 0.06
                dollars = dollars + ret
            end
        end
    end
    for i = 1, #G.GAME.tags do
        local ret = G.GAME.tags[i]:apply_to_run({type = 'eval'})
        if ret then
            add_round_eval_row({dollars = ret.dollars, bonus = true, name='tag'..i, pitch = pitch, condition = ret.condition, pos = ret.pos, tag = ret.tag})
            pitch = pitch + 0.06
            dollars = dollars + ret.dollars
        end
    end
    if to_big(G.GAME.dollars) >= to_big(5) and not G.GAME.modifiers.no_interest and G.GAME.cry_payload then
        add_round_eval_row({bonus = true, payload = G.GAME.cry_payload, name='interest_payload', pitch = pitch, dollars = G.GAME.interest_amount*G.GAME.cry_payload*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5)})
        pitch = pitch + 0.06
        if not G.GAME.seeded and not G.GAME.challenge then
            if G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5) == G.GAME.interest_amount*G.GAME.interest_cap/5 then
                G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak = G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak + 1
            else
                G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak = 0
            end
        end
        check_for_unlock({type = 'interest_streak'})
        dollars = dollars + G.GAME.interest_amount*G.GAME.cry_payload*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5)
        G.GAME.cry_payload = nil
    elseif to_big(G.GAME.dollars) >= to_big(5) and not G.GAME.modifiers.no_interest then
        add_round_eval_row({bonus = true, name='interest', pitch = pitch, dollars = G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5)})
        pitch = pitch + 0.06
        if (not G.GAME.seeded and not G.GAME.challenge) or SMODS.config.seeded_unlocks then
            if G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5) == G.GAME.interest_amount*G.GAME.interest_cap/5 then 
                G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak = G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak + 1
            else
                G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak = 0
            end
        end
        check_for_unlock({type = 'interest_streak'})
        dollars = dollars + G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5)
    end

    pitch = pitch + 0.06

    if total_cashout_rows > 7 then
        local total_hidden = total_cashout_rows - 7
    
        G.E_MANAGER:add_event(Event({
            trigger = 'before',delay = 0.38,
            func = function()
                local hidden = {n=G.UIT.R, config={align = "cm"}, nodes={
                    {n=G.UIT.O, config={object = DynaText({
                        string = {localize{type = 'variable', key = 'cashout_hidden', vars = {total_hidden}}}, 
                        colours = {G.C.WHITE}, shadow = true, float = false, 
                        scale = 0.45,
                        font = G.LANGUAGES['en-us'].font, pop_in = 0
                    })}}
                }}
    
                G.round_eval:add_child(hidden, G.round_eval:get_UIE_by_ID('bonus_round_eval'))
                return true
            end
        }))
    end
    add_round_eval_row({name = 'bottom', dollars = dollars})
    Talisman.dollars = dollars
end

G.FUNCS.tutorial_controller = function()
    if G.F_SKIP_TUTORIAL then
        G.SETTINGS.tutorial_complete = true
        G.SETTINGS.tutorial_progress = nil
        return
    end
    G.SETTINGS.tutorial_progress = G.SETTINGS.tutorial_progress or 
    {
        forced_shop = {'j_joker', 'c_empress'},
        forced_voucher = 'v_grabber',
        forced_tags = {'tag_handy', 'tag_garbage'},
        hold_parts = {},
        completed_parts = {},
    }
    if not G.SETTINGS.paused and (not G.SETTINGS.tutorial_complete) then
        if G.STATE == G.STATES.BLIND_SELECT and G.blind_select and not G.SETTINGS.tutorial_progress.completed_parts['small_blind'] then
            G.SETTINGS.tutorial_progress.section = 'small_blind'
            G.FUNCS.tutorial_part('small_blind')
            G.SETTINGS.tutorial_progress.completed_parts['small_blind']  = true
            G:save_progress()
        end
        if G.STATE == G.STATES.BLIND_SELECT and G.blind_select and not G.SETTINGS.tutorial_progress.completed_parts['big_blind'] and G.GAME.round > 0 then
            G.SETTINGS.tutorial_progress.section = 'big_blind'
            G.FUNCS.tutorial_part('big_blind')
            G.SETTINGS.tutorial_progress.completed_parts['big_blind']  = true
            G.SETTINGS.tutorial_progress.forced_tags = nil
            G:save_progress()
        end
        if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['second_hand'] and G.SETTINGS.tutorial_progress.hold_parts['big_blind'] then
            G.SETTINGS.tutorial_progress.section = 'second_hand'
            G.FUNCS.tutorial_part('second_hand')
            G.SETTINGS.tutorial_progress.completed_parts['second_hand']  = true
            G:save_progress()
        end
        if G.SETTINGS.tutorial_progress.hold_parts['second_hand'] then
            G.SETTINGS.tutorial_complete = true
        end
        if not G.SETTINGS.tutorial_progress.completed_parts['first_hand_section'] then 
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['first_hand'] then
                G.SETTINGS.tutorial_progress.section = 'first_hand'
                G.FUNCS.tutorial_part('first_hand')
                G.SETTINGS.tutorial_progress.completed_parts['first_hand']  = true
                G:save_progress()
            end
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['first_hand_2'] and G.SETTINGS.tutorial_progress.hold_parts['first_hand']  then
                G.FUNCS.tutorial_part('first_hand_2')
                G.SETTINGS.tutorial_progress.completed_parts['first_hand_2']  = true
                G:save_progress()
            end
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['first_hand_3'] and G.SETTINGS.tutorial_progress.hold_parts['first_hand_2']  then
                G.FUNCS.tutorial_part('first_hand_3')
                G.SETTINGS.tutorial_progress.completed_parts['first_hand_3']  = true
                G:save_progress()
            end
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['first_hand_4'] and G.SETTINGS.tutorial_progress.hold_parts['first_hand_3']  then
                G.FUNCS.tutorial_part('first_hand_4')
                G.SETTINGS.tutorial_progress.completed_parts['first_hand_4']  = true
                G.SETTINGS.tutorial_progress.completed_parts['first_hand_section']  = true
                G:save_progress()
            end
        end
         if G.STATE == G.STATES.SHOP and G.shop and G.shop.VT.y < 5 and not G.SETTINGS.tutorial_progress.completed_parts['shop_1'] then
            G.SETTINGS.tutorial_progress.section = 'shop'
            G.FUNCS.tutorial_part('shop_1')
            G.SETTINGS.tutorial_progress.completed_parts['shop_1']  = true
            G.SETTINGS.tutorial_progress.forced_voucher = nil
            G:save_progress()
        end
    end
end

G.FUNCS.tutorial_part = function(_part)
    local step = 1
    G.SETTINGS.paused = true
    if _part == 'small_blind' then 
        step = tutorial_info({
            text_key = 'sb_1',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'sb_2',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'sb_3',
            highlight = {
                G.blind_select.UIRoot.children[1].children[1].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[1].config.object:get_UIE_by_ID('blind_desc'),
            },
            attach = {major =  G.blind_select.UIRoot.children[1].children[1], type = 'tr', offset = {x = 2, y = 4}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'sb_4',
            highlight = {
                G.blind_select.UIRoot.children[1].children[1]
            },
            snap_to = function() 
                if G.blind_select and G.blind_select.UIRoot and G.blind_select.UIRoot.children[1] and G.blind_select.UIRoot.children[1].children[1] and G.blind_select.UIRoot.children[1].children[1].config.object then 
                    return G.blind_select.UIRoot.children[1].children[1].config.object:get_UIE_by_ID('select_blind_button') end
                end,
            attach = {major =  G.blind_select.UIRoot.children[1].children[1], type = 'tr', offset = {x = 2, y = 4}},
            step = step,
            no_button = true,
            button_listen = 'select_blind'
        })
    elseif _part == 'big_blind' then 
        step = tutorial_info({
            text_key = 'bb_1',
            highlight = {
                G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('blind_desc'),
            },
            hard_set = true,
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'bb_2',
            highlight = {
                G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('tag_desc'),
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'bb_3',
            highlight = {
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_desc'),
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'bb_4',
            highlight = {
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_desc'),
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_extras'),
                G.HUD:get_UIE_by_ID('hud_ante')
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'bb_5',
            loc_vars = {G.GAME.win_ante},
            highlight = {
                G.blind_select,
                G.HUD:get_UIE_by_ID('hud_ante')
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
            no_button = true,
            snap_to = function() 
                if G.blind_select and G.blind_select.UIRoot and G.blind_select.UIRoot.children[1] and G.blind_select.UIRoot.children[1].children[2] and
                G.blind_select.UIRoot.children[1].children[2].config.object then 
                    return G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('select_blind_button') end
                end,
            button_listen = 'select_blind'
        })
    elseif _part == 'first_hand' then
        step = tutorial_info({
            text_key = 'fh_1',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'fh_2',
            highlight = {
                G.HUD:get_UIE_by_ID('hand_text_area')
            },
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'fh_3',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            highlight = {
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            no_button = true,
            button_listen = 'run_info',
            snap_to = function() return G.HUD:get_UIE_by_ID('run_info_button') end,
            step = step,
        })
    elseif _part == 'first_hand_2' then
        step = tutorial_info({
            hard_set = true,
            text_key = 'fh_4',
            highlight = {
                G.hand,
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            snap_to = function() return G.hand.cards[1] end,
            step = step,
        })
        step = tutorial_info({
            text_key = 'fh_5',
            highlight = {
                G.hand,
                G.buttons:get_UIE_by_ID('play_button'),
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            no_button = true,
            button_listen = 'play_cards_from_highlighted',
            step = step,
        })
    elseif _part == 'first_hand_3' then
        step = tutorial_info({
            hard_set = true,
            text_key = 'fh_6',
            highlight = {
                G.hand,
                G.buttons:get_UIE_by_ID('discard_button'),
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            no_button = true,
            button_listen = 'discard_cards_from_highlighted',
            step = step,
        })
    elseif _part == 'first_hand_4' then
        step = tutorial_info({
            hard_set = true,
            text_key = 'fh_7',
            highlight = {
                G.HUD:get_UIE_by_ID('hud_hands').parent,
            },
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'fh_8',
            highlight = {
                G.HUD:get_UIE_by_ID('hud_hands').parent,
                G.HUD:get_UIE_by_ID('row_dollars_chips'),
                G.HUD_blind
            },
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
    elseif _part == 'second_hand' then
        step = tutorial_info({
            text_key = 'sh_1',
            hard_set = true,
            highlight = {
                G.jokers
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        local empress = find_joker('The Empress')[1]
        if empress then 
            step = tutorial_info({
                text_key = 'sh_2',
                highlight = {
                    empress
                },
                attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
                step = step,
            })
            step = tutorial_info({
                text_key = 'sh_3',
                attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
                highlight = {
                    empress,
                    G.hand
                },
                no_button = true,
                button_listen = 'use_card',
                snap_to = function() return G.hand.cards[1] end,
                step = step,
            })
        end
    elseif _part == 'shop_1' then
        step = tutorial_info({
            hard_set = true,
            text_key = 's_1',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent
            },
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 4}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_2',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_jokers.cards[2],
            },
            snap_to = function() return G.shop_jokers.cards[2] end,
            attach = {major = G.shop, type = 'tr', offset = {x = -0.5, y = 6}},
            no_button = true,
            button_listen = 'buy_from_shop',
            step = step,
        })
        step = tutorial_info({
            text_key = 's_3',
            loc_vars = {#G.P_CENTER_POOLS.Joker},
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.jokers.cards[1],
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_4',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.jokers.cards[1],
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_5',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.jokers,
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_6',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_jokers.cards[1],
            } end,
            snap_to = function() return G.shop_jokers.cards[1] end,
            no_button = true,
            button_listen = 'buy_from_shop',
            attach = {major = G.shop, type = 'tr', offset = {x = -0.5, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_7',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.consumeables.cards[#G.consumeables.cards],
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_8',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.consumeables
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_9',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_vouchers,
            } end,
            snap_to = function() return G.shop_vouchers.cards[1] end,
            attach = {major = G.shop, type = 'tr', offset = {x = -4, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_10',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_vouchers,
            } end,
            attach = {major = G.shop, type = 'tr', offset = {x = -4, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_11',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_booster,
            } end,
            snap_to = function() return G.shop_booster.cards[1] end,
            attach = {major = G.shop, type = 'tl', offset = {x = 3, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_12',
            highlight = function() return {
                G.shop:get_UIE_by_ID('next_round_button'),
            } end,
            snap_to = function() if G.shop then return G.shop:get_UIE_by_ID('next_round_button') end end,
            no_button = true,
            button_listen = 'toggle_shop',
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
    end

    
    G.E_MANAGER:add_event(Event({
        blockable = false,
        timer = 'REAL',
        func = function()
            if (G.OVERLAY_TUTORIAL.step == step and
            not G.OVERLAY_TUTORIAL.step_complete) or G.OVERLAY_TUTORIAL.skip_steps then
                if G.OVERLAY_TUTORIAL.Jimbo then G.OVERLAY_TUTORIAL.Jimbo:remove() end
                if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end
                G.OVERLAY_TUTORIAL:remove()
                G.OVERLAY_TUTORIAL = nil
                G.SETTINGS.tutorial_progress.hold_parts[_part]=true
                return true
            end
            return G.OVERLAY_TUTORIAL.step > step or G.OVERLAY_TUTORIAL.skip_steps
        end
    }), 'tutorial') 
    G.SETTINGS.paused = false
end
