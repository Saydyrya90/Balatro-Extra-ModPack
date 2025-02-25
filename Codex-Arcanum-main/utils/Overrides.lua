-- creates cards in boosters and etc.
local create_cardref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    if not forced_key
    and soulable
    and not G.GAME.banned_keys["c_soul"]     -- game checks for G.GAME.banned_keys["c_soul"] even for black hole spectral
    and (_type == "Alchemical" or _type == "Spectral")
    and (not G.GAME.used_jokers["c_alchemy_philosopher_stone"] or next(find_joker("Showman")))
    and pseudorandom("philosopher_stone_" .. _type .. G.GAME.round_resets.ante) > 0.997 then
        forced_key = "c_alchemy_philosopher_stone"
    end
    local card = create_cardref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    if G.GAME.used_vouchers.v_alchemy_cauldron and pseudorandom("cauldron") > 0.5 and _type == "Alchemical" then
        card:set_edition({ negative = true }, true)
    end
    return card
end

-- Philosopher's Stone retriggers override
local eval_cardref = eval_card
function eval_card(card, context)
    context = context or {}
    local ret, sub = eval_cardref(card, context)
    if context.repetition_only and G.deck.config.philosopher and not card.debuff then
        ret.seals = ret.seals or {}
        ret.seals.message = ret.seals.message or localize("k_again_ex")
        ret.seals.repetitions = (ret.seals.repetitions or 0) + 1
        ret.seals.card = card
    end
    return ret, sub
end

local function hue_to_rgb(hue)
    local r, g, b = 0, 0, 0
    local saturation = 0.5
    local lightness = 0.75
    if hue < 60 then
        r = 1
        g = saturation + (1 - saturation) * (hue / 60)
        b = 1 - saturation
    elseif hue < 120 then
        r = saturation + (1 - saturation) * ((120 - hue) / 60)
        g = 1
        b = 1 - saturation
    elseif hue < 180 then
        r = 1 - saturation
        g = 1
        b = saturation + (1 - saturation) * ((hue - 120) / 60)
    elseif hue < 240 then
        r = 1 - saturation
        g = saturation + (1 - saturation) * ((240 - hue) / 60)
        b = 1
    elseif hue < 300 then
        r = saturation + (1 - saturation) * ((hue - 240) / 60)
        g = 1 - saturation
        b = 1
    else
        r = 1
        g = 1 - saturation
        b = saturation + (1 - saturation) * ((360 - hue) / 60)
    end

    local gray = 0.2989 * r + 0.5870 * g + 0.1140 * b
    local w = 0.5
    r = ((1 - w) * r + w * gray) * lightness
    g = ((1 - w) * g + w * gray) * lightness
    b = ((1 - w) * b + w * gray) * lightness
    return r, g, b
end

local game_updateref = Game.update
function Game:update(dt)
    game_updateref(self, dt)
    -- RGB background from Philosopher's Stone
    if not self.C.RAINBOW_EDITION then
        self.C.RAINBOW_EDITION = { 0, 0, 0, 1 }
        self.C.RAINBOW_EDITION_HUE = 0
    end
    local r, g, b = hue_to_rgb(self.C.RAINBOW_EDITION_HUE)
    self.C.RAINBOW_EDITION[1] = r
    self.C.RAINBOW_EDITION[3] = g
    self.C.RAINBOW_EDITION[2] = b
    self.C.RAINBOW_EDITION_HUE = (self.C.RAINBOW_EDITION_HUE + 0.25) % 360

    if G.deck and G.deck.config.philosopher then
        G.GAME.blind:change_colour(G.C.RAINBOW_EDITION)
        ease_background_colour{ new_colour = G.C.RAINBOW_EDITION, contrast = 1 }
    end
    -- if used some alchemical ways to reduce blind score - check if chips is enought to win
    if G.GAME and G.GAME.blind and G.GAME.blind.alchemy_chips_win and G.STATE == G.STATES.SELECTING_HAND then
        G.GAME.blind.alchemy_chips_win = false
        if CodexArcanum.utils.check_for_chips_win() then -- double check in case of modified score
            G.STATE = G.STATES.HAND_PLAYED
            G.STATE_COMPLETE = true
            end_round()
        end
    end
end

-- set 'locked' sprite to alchemical card if it is locked
local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
    set_spritesref(self, _center, _front);
    if _center and _center.set == "Alchemical" and not _center.unlocked and not self.params.bypass_discovery_center then
        self.bypass_discovery_center = true -- hide (?) icon
        -- Until SMODS do 'LockedSprite' it will be like that
        self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS[G.c_alchemy_locked.atlas], G.c_alchemy_locked.pos)
        self.children.center.states.hover = self.states.hover
        self.children.center.states.click = self.states.click
        self.children.center.states.drag = self.states.drag
        self.children.center.states.collide.can = false
        self.children.center:set_role{ major = self, role_type = "Glued", draw_major = self }
    end
end

-- changes use button to select button for cards in alchemy pack
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    if (card.ability.set == "Alchemical" or card.ability.name == "c_alchemy_philosopher_stone") and (G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and (card.area == G.pack_cards and G.pack_cards) then
        return { n = G.UIT.ROOT, config = { padding = 0, colour = G.C.CLEAR }, nodes = { { n = G.UIT.R, config = { mid = true }, nodes = {} }, { n = G.UIT.R, config = { ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5 * card.T.w - 0.15, minh = 0.8 * card.T.h, maxw = 0.7 * card.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = "select_alchemical", func = "can_select_alchemical" }, nodes = { { n = G.UIT.T, config = { text = localize("b_select"), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true } } } } } }
    end
    return G_UIDEF_use_and_sell_buttons_ref(card)
end

-- pick card from booster
local func_use_cardref = G.FUNCS.use_card
G.FUNCS.use_card = function(e, mute, nosave)
    func_use_cardref(e, mute, nosave)
    local card = e.config.ref_table
    local area = card.area
    local prev_state = G.STATE
    local dont_dissolve = nil
    local delay_fac = 1
    if card:check_use() then
        G.E_MANAGER:add_event(Event{
            func = function()
                e.disable_button = nil
                e.config.button = "use_card"
                return true
            end
        })
        return
    end
    if card.ability.set == "Booster" and not nosave and G.STATE == G.STATES.SHOP then
        save_with_action{
            type = "use_card",
            card = card.sort_id,
        }
    end
end

-- function that changes button
G.FUNCS.can_select_alchemical = function(e)
    if (e.config.ref_table.edition and e.config.ref_table.edition.negative) or #G.consumeables.cards < G.consumeables.config.card_limit then
        e.config.colour = G.C.GREEN
        e.config.button = "select_alchemical"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

-- ui aligment and add selected card to deck
G.FUNCS.select_alchemical = function(e, mute, nosave)
    e.config.button = nil
    local card = e.config.ref_table
    local area = card.area
    local prev_state = G.STATE
    local dont_dissolve = nil
    local delay_fac = 1

    if card.ability.set == "Booster" then
        G.GAME.PACK_INTERRUPT = G.STATE
    end

    G.CONTROLLER.locks.use = true
    if G.booster_pack and not G.booster_pack.alignment.offset.py and (G.GAME.pack_choices and G.GAME.pack_choices < 2) then
        G.booster_pack.alignment.offset.py = G.booster_pack.alignment.offset.y
        G.booster_pack.alignment.offset.y = G.ROOM.T.y + 29
    end
    if G.shop and not G.shop.alignment.offset.py then
        G.shop.alignment.offset.py = G.shop.alignment.offset.y
        G.shop.alignment.offset.y = G.ROOM.T.y + 29
    end
    if G.blind_select and not G.blind_select.alignment.offset.py then
        G.blind_select.alignment.offset.py = G.blind_select.alignment.offset.y
        G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
    end
    if G.round_eval and not G.round_eval.alignment.offset.py then
        G.round_eval.alignment.offset.py = G.round_eval.alignment.offset.y
        G.round_eval.alignment.offset.y = G.ROOM.T.y + 29
    end

    if card.children.use_button then
        card.children.use_button:remove()
        card.children.use_button = nil
    end
    if card.children.sell_button then
        card.children.sell_button:remove()
        card.children.sell_button = nil
    end
    if card.children.price then
        card.children.price:remove()
        card.children.price = nil
    end

    if card.area then
        card.area:remove_card(card)
    end

    if card.ability.set == "Alchemical" or card.ability.name == "c_alchemy_philosopher_stone" then
        card:add_to_deck()
        G.consumeables:emplace(card)
        play_sound("card1", 0.8, 0.6)
        play_sound("generic1")
        dont_dissolve = true
        delay_fac = 0.2
    end
    G.E_MANAGER:add_event(Event{
        trigger = "after",
        delay = 0.2,
        func = function()
            if not dont_dissolve then
                card:start_dissolve()
            end
            G.E_MANAGER:add_event(Event{
                trigger = "after",
                delay = 0.1,
                func = function()
                    G.STATE = prev_state
                    G.TAROT_INTERRUPT = nil
                    G.CONTROLLER.locks.use = false
                    if CodexArcanum.utils.is_in_booster_state(prev_state) and G.booster_pack then
                        if area == G.consumeables then
                            G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                            G.booster_pack.alignment.offset.py = nil
                        elseif G.GAME.pack_choices and G.GAME.pack_choices > 1 then
                            if G.booster_pack.alignment.offset.py then
                                G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                                G.booster_pack.alignment.offset.py = nil
                            end
                            G.GAME.pack_choices = G.GAME.pack_choices - 1
                        else
                            G.CONTROLLER.interrupt.focus = true
                            G.FUNCS.end_consumeable(nil, delay_fac)
                        end
                    else
                        if G.shop then
                            G.shop.alignment.offset.y = G.shop.alignment.offset.py
                            G.shop.alignment.offset.py = nil
                        end
                        if G.blind_select then
                            G.blind_select.alignment.offset.y = G.blind_select.alignment.offset.py
                            G.blind_select.alignment.offset.py = nil
                        end
                        if G.round_eval then
                            G.round_eval.alignment.offset.y = G.round_eval.alignment.offset.py
                            G.round_eval.alignment.offset.py = nil
                        end
                        if area and area.cards[1] then
                            G.E_MANAGER:add_event(Event{
                                func = function()
                                    G.E_MANAGER:add_event(Event{
                                        func = function()
                                            G.CONTROLLER.interrupt.focus = nil
                                            if card.ability.set == "Voucher" then
                                                G.CONTROLLER:snap_to{ node = G.shop:get_UIE_by_ID("next_round_button") }
                                            elseif area then
                                                G.CONTROLLER:recall_cardarea_focus(area)
                                            end
                                            return true
                                        end
                                    })
                                    return true
                                end
                            })
                        end
                    end
                    return true
                end
            })
            return true
        end
    })
end

-- unlocks achievement popup
local create_UIBox_notify_alertref = create_UIBox_notify_alert
function create_UIBox_notify_alert(_achievement, _type)
    local uibox = create_UIBox_notify_alertref(_achievement, _type)
    if _type == "Alchemical" then
        local _c = G.P_CENTERS[_achievement]
        local _atlas = G.ASSET_ATLAS[_c.atlas]
        local t_s = Sprite(0, 0, 1.5 * (_atlas.px / _atlas.py), 1.5, _atlas, _c and _c.pos or { x = 5, y = 4 })
        t_s.states.drag.can = false
        t_s.states.hover.can = false
        t_s.states.collide.can = false
        local subtext = localize("k_alchemical")
        return {
            n = G.UIT.ROOT,
            config = { align = "cl", r = 0.1, padding = 0.06, colour = G.C.UI.TRANSPARENT_DARK },
            nodes = { {
                n = G.UIT.R,
                config = { align = "cl", padding = 0.2, minw = 20, r = 0.1, colour = G.C.BLACK, outline = 1.5, outline_colour = G.C.GREY },
                nodes = { {
                    n = G.UIT.R,
                    config = { align = "cm", r = 0.1 },
                    nodes = { {
                        n = G.UIT.R,
                        config = { align = "cm", r = 0.1 },
                        nodes = { {
                            n = G.UIT.O,
                            config = { object = t_s }
                        } }
                    },
                        _type ~= "achievement" and {
                            n = G.UIT.R,
                            config = { align = "cm", padding = 0.04 },
                            nodes = { {
                                n = G.UIT.R,
                                config = { align = "cm", maxw = 3.4 },
                                nodes = { {
                                    n = G.UIT.T,
                                    config = { text = subtext, scale = 0.5, colour = G.C.FILTER, shadow = true }
                                } }
                            },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 3.4 },
                                    nodes = { {
                                        n = G.UIT.T,
                                        config = { text = localize("k_unlocked_ex"), scale = 0.35, colour = G.C.FILTER, shadow = true }
                                    } }
                                }
                            }
                        } or {
                            n = G.UIT.R,
                            config = { align = "cm", padding = 0.04 },
                            nodes = { {
                                n = G.UIT.R,
                                config = { align = "cm", maxw = 3.4, padding = 0.1 },
                                nodes = { { n = G.UIT.T, config = { text = _type == "achievement" and localize(_achievement, "achievement_names") or "ERROR", scale = 0.4, colour = G.C.UI.TEXT_LIGHT, shadow = true } } }
                            }, {
                                n = G.UIT.R,
                                config = { align = "cm", maxw = 3.4 },
                                nodes = { { n = G.UIT.T, config = { text = subtext, scale = 0.3, colour = G.C.FILTER, shadow = true } } }
                            }, {
                                n = G.UIT.R,
                                config = { align = "cm", maxw = 3.4 },
                                nodes = { {
                                    n = G.UIT.T,
                                    config = { text = localize("k_unlocked_ex"), scale = 0.35, colour = G.C.FILTER, shadow = true }
                                } }
                            } }
                        }
                    }
                } }
            } }
        }
    end
    return uibox
end

-- can't debuff oiled cards
local blind_debuff_cardref = Blind.debuff_card
function Blind:debuff_card(card, from_blind)
    if card.ability and card.ability.oil then
        return
    end
    blind_debuff_cardref(self, card, from_blind)
end

-- options -> stats -> card stats -> Alchemicals
local usage_tabsref = G.UIDEF.usage_tabs
function G.UIDEF.usage_tabs(args)
    local tabs = usage_tabsref(args)
    args = args or {}
    args.colour = args.colour or G.C.RED
    args.tab_alignment = args.tab_alignment or "cm"
    args.opt_callback = args.opt_callback or nil
    args.scale = args.scale or 1
    args.tab_w = args.tab_w or 0
    args.tab_h = args.tab_h or 0
    args.text_scale = (args.text_scale or 0.5)
    local v = { label = localize("b_stat_alchemicals"), tab_definition_function = create_UIBox_usage, tab_definition_function_args = { "consumeable_usage", "Alchemical" } }
    local new_tab = UIBox_button{ id = "tab_but_" .. (v.label or ""), ref_table = v, button = "change_tab", label = { v.label }, minh = 0.8 * args.scale, minw = 2.5 * args.scale, col = true, choice = true, scale = args.text_scale, chosen = v.chosen, func = v.func, focus_args = { type = "none" } }
    -- Jokers1 Consumables2 Tarots3 Planets4 Spectrals5 <Alchemicals>6 Vouchers7
    -- trying to insert after Spectrals wich is 5, so insert as 6
    table.insert(tabs.nodes[1].nodes[1].nodes[1].nodes[1].nodes[1].nodes[2].nodes, 6, new_tab)
    return tabs
end

-- add catalyst +1 consumable size
local add_to_deckref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not self.added_to_deck then
        if self.ability.name == "j_alchemy_catalyst_joker" then
            G.consumeables:change_size(self.ability.extra.slots)
        end
    end
    add_to_deckref(self, from_debuff)
end

-- remove catalyst +1 consumable size
local remove_from_deckref = Card.remove_from_deck
function Card:remove_from_deck(from_debuff)
    if self.added_to_deck then
        if self.ability.name == "j_alchemy_catalyst_joker" then
            G.consumeables:change_size(-self.ability.extra.slots)
        end
    end
    remove_from_deckref(self, from_debuff)
end

-- alchemical undos and end round evals
local evaluate_roundref = G.FUNCS.evaluate_round
function G.FUNCS.evaluate_round()
    if G.GAME.alchemy_quicksilver then
        G.hand:change_size(-G.GAME.alchemy_quicksilver)
        G.GAME.alchemy_quicksilver = nil
    end

    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.name == "j_alchemy_chain_reaction" then
            G.jokers.cards[i].ability.extra.used = false
        end
    end

    if G.deck.config.philosopher then
        G.deck.config.philosopher = false
    end

    evaluate_roundref()
    -- runs through undo tables of cards
    if G.deck.config.alchemy_undo_table then
        for k, v in pairs(G.deck.config.alchemy_undo_table) do
            if v then -- empty is also allowed in case that no table is needed actually
                G.P_CENTERS[k]:undo(v)
            end
            G.deck.config.alchemy_undo_table[k] = nil
        end
    end
end
