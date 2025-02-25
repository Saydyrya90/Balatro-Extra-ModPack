function CodexArcanum:description_loc_vars()
    return { shadow = true, scale = 1 / 0.75, text_colour = G.C.UI.TEXT_LIGHT, background_colour = G.C.CLEAR }
end

local function create_ttoggle(args)
    args = args or {}
    args.active_colour = args.active_colour or G.C.RED
    args.inactive_colour = args.inactive_colour or G.C.BLACK
    args.scale = args.scale or 1
    args.label_scale = args.label_scale or 0.4
    args.ref_table = args.ref_table or {}
    args.ref_value = args.ref_value or "test"
    local check = Sprite(0, 0, 0.5 * args.scale, 0.5 * args.scale, G.ASSET_ATLAS["icons"], { x = 1, y = 0 })
    check.states.drag.can = false
    check.states.visible = false
    return {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.1, r = 0.1, colour = G.C.CLEAR, focus_args = { funnel_from = true } },
        nodes = {
            { n = G.UIT.T, config = { text = args.label, scale = args.label_scale, colour = G.C.UI.TEXT_LIGHT } },
            { n = G.UIT.B, config = { w = 0.1, h = 0.1 } },
            {
                n = G.UIT.C,
                config = { align = "cm", r = 0.1, colour = G.C.BLACK },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {
                            align = "cm",
                            r = 0.1,
                            padding = 0.03,
                            minw = 0.4 * args.scale,
                            minh = 0.4 * args.scale,
                            outline_colour = G.C.WHITE,
                            outline = 1.2 * args.scale,
                            line_emboss = 0.5 * args.scale,
                            ref_table = args,
                            colour = args.inactive_colour,
                            button = "toggle_button",
                            button_dist = 0.2,
                            hover = true,
                            toggle_callback = args.callback,
                            func = "toggle",
                            focus_args = { funnel_to = true }
                        },
                        nodes = {
                            { n = G.UIT.O, config = { object = check } },
                        }
                    },
                }
            }
        }
    }
end

local function create_category_pane(args)
    table.insert(args.nodes, 1, {
        n = G.UIT.R,
        config = { align = "tm", padding = 0.2 },
        nodes = {
            { n = G.UIT.T, config = { text = args.text.title[1], shadow = true, scale = 0.5, colour = G.C.UI.TEXT_LIGHT } }
        }
    })
    return create_UIBox_generic_options{
        back_func = G.ACTIVE_MOD_UI and "openModUI_" .. G.ACTIVE_MOD_UI.id or "your_collection",
        contents = {
            {
                n = G.UIT.C,
                config = { r = 0.1, padding = 0.25, minw = 6, align = args.align or "tm", colour = args.colour or G.C.BLACK, outline = args.outline, outline_colour = args.outline_colour },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { r = 0.1, padding = 0.1, minw = 6, align = args.align or "tm", colour = args.colour or G.C.BLACK, outline = args.outline, outline_colour = args.outline_colour },
                        nodes = args.nodes
                    }
                }
            }
        }
    }
end

--[[
    modified SMODS.card_collection_UIBox(pool, rows, args)
    changes:
    -added card params to for example bypass unlock/discovery flags
    -remove unnecessary sorting via SMODS.collection_pool(_pool) that does NOTHING and SHUFFLES my already sorted array
]]
local function card_collection_UIBox(pool, rows, args)
    args = args or {}
    args.w_mod = args.w_mod or 1
    args.h_mod = args.h_mod or 1
    args.card_scale = args.card_scale or 1
    args.card_scale_h = args.card_scale * (args.card_scale_h or 1)
    local deck_tables = {}
    G.your_collection = {}
    local cards_per_page = 0
    local row_totals = {}
    for j = 1, #rows do
        if cards_per_page >= #pool and args.collapse_single_page then
            rows[j] = nil
        else
            row_totals[j] = cards_per_page
            cards_per_page = cards_per_page + rows[j]
            G.your_collection[j] = CardArea(
                G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
                (args.w_mod * rows[j] + 0.25) * G.CARD_W,
                args.h_mod * G.CARD_H,
                { card_limit = rows[j], type = args.area_type or "title", highlight_limit = 0, collection = true }
            )
            table.insert(deck_tables,
                {
                    n = G.UIT.R,
                    config = { align = "cm", padding = 0.07, no_fill = true },
                    nodes = {
                        { n = G.UIT.O, config = { object = G.your_collection[j] } }
                    }
                })
        end
    end
    local options = {}
    for i = 1, math.ceil(#pool / cards_per_page) do
        table.insert(options, localize("k_page") .. " " .. tostring(i) .. "/" .. tostring(math.ceil(#pool / cards_per_page)))
    end
    G.FUNCS.SMODS_card_collection_page = function(e)
        if not e or not e.cycle_config then return end
        for j = 1, #G.your_collection do
            for i = #G.your_collection[j].cards, 1, -1 do
                local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
                c:remove()
                c = nil
            end
        end
        for j = 1, #rows do
            for i = 1, rows[j] do
                local center = pool[i + row_totals[j] + (cards_per_page * (e.cycle_config.current_option - 1))]
                if not center then
                    break
                end
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w / 2, G.your_collection[j].T.y, G.CARD_W * args.card_scale, G.CARD_H * args.card_scale_h, G.P_CARDS.empty, (args.center and G.P_CENTERS[args.center]) or center, args.card_args)
                if args.modify_card then
                    args.modify_card(card, center, i, j)
                end
                if not args.no_materialize then
                    card:start_materialize(nil, i > 1 or j > 1)
                end
                G.your_collection[j]:emplace(card)
            end
        end
        INIT_COLLECTION_CARD_ALERTS()
    end
    G.FUNCS.SMODS_card_collection_page{ cycle_config = { current_option = 1 } }
    local t = create_UIBox_generic_options{
        back_func = (args and args.back_func) or G.ACTIVE_MOD_UI and "openModUI_" .. G.ACTIVE_MOD_UI.id or "your_collection",
        snap_back = args.snap_back,
        infotip = args.infotip,
        contents = {
            { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = deck_tables },
            (not args.hide_single_page or cards_per_page < #pool) and {
                n = G.UIT.R,
                config = { align = "cm" },
                nodes = {
                    create_option_cycle{ options = options, w = 4.5, cycle_shoulders = true, opt_callback = "SMODS_card_collection_page", current_option = 1, colour = G.C.RED, no_pips = true, focus_args = { snap_to = true, nav = "wide" } }
                }
            } or nil,
        }
    }
    return t
end

local function create_cards_disable_collection(configRef, pool, rows, args)
    args = args or {}
    args.area_type = args.area_type or "shop"
    args.no_materialize = true
    args.card_args = {
        bypass_discovery_center = true,
        bypass_discovery_ui = true,
        bypass_lock = true
    }
    args.modify_card = function(card, center, i, j)
        local key = card.config.center.key
        card.children.center:set_sprite_pos(center.pos)
        if not configRef[key] then
            card.debuff = true
        end

        card.states.focus.can = false
        card.states.drag.can = false
        card:set_base(card.config.card, true)
        card.hover = function(self)
            if self.states.focus.is and not self.children.focused_ui then
                self.children.focused_ui = G.UIDEF.card_focus_ui(self)
            end
            local debuff = self.debuff
            self.debuff = false
            self.ability_UIBox_table = generate_card_ui(self.config.center)
            self.config.h_popup = G.UIDEF.card_h_popup(self)
            self.config.h_popup_config = self:align_h_popup()
            self.debuff = debuff
            Node.hover(self)
        end
        card.click = function(self)
            configRef[key] = not configRef[key]
            play_sound("tarot1", 0.9 + 0.1 * math.random(), 0.4)
            card:juice_up(1, 0.5)
            card.debuff = not configRef[key]
        end
    end
    return card_collection_UIBox(pool, rows, args)
end

local disable_tabs = {
    alchemicals = {
        init = function()
            return create_cards_disable_collection(CodexArcanum.config.modules.Alchemicals, CodexArcanum.pools.Alchemicals, { 4, 4 }, {
                h_mod = 0.95,
            })
        end
    },
    boosters = {
        init = function()
            return create_cards_disable_collection(CodexArcanum.config.modules.BoosterPacks, CodexArcanum.pools.BoosterPacks, { 4, 3 }, {
                h_mod = 1.3,
                card_scale = 1.27
            })
        end
    },
    jokers = {
        init = function()
            return create_cards_disable_collection(CodexArcanum.config.modules.Jokers, CodexArcanum.pools.Jokers, { 4, 4 }, {
                h_mod = 0.95,
            })
        end
    },
    consumables = {
        init = function()
            return create_cards_disable_collection(CodexArcanum.config.modules.Consumables, CodexArcanum.pools.Consumables, { 1, 1 }, {
                h_mod = 0.95,
            })
        end
    },
    decks = {
        init = function()
            return create_cards_disable_collection(CodexArcanum.config.modules.Decks, CodexArcanum.pools.Decks, { 2 }, {
                h_mod = 0.95,
            })
        end
    },
    vouchers = {
        init = function()
            return create_cards_disable_collection(CodexArcanum.config.modules.Vouchers, CodexArcanum.pools.Vouchers, { 2, 2 })
        end
    },
    tags = {
        init = function()
            return create_cards_disable_collection(CodexArcanum.config.modules.Tags, CodexArcanum.pools.Tags, { 2 }, {
                w_mod = 0.5,
                h_mod = 0.5,
                card_scale_h = 71 / 95,
                card_scale = 0.5
            })
        end
    }
}

function G.FUNCS.alchemy_config_button_disable(e)
    G.FUNCS.overlay_menu{ definition = disable_tabs[e.config.id].init() }
end

local function config_category_button(loc, name, color)
    local button = UIBox_button{
        label = loc.title,
        id = name,
        shadow = true,
        scale = 0.5,
        colour = color,
        minw = 4.5,
        minh = 0.75,
        button = "alchemy_config_button_disable"
    }
    button.nodes[1].config.tooltip = { text = loc.tooltip }
    return button
end

local category_tabs = {
    alchemicals = {
        init = function()
            local loc = localize("b_alchemy_ui_config_alchemicals")
            return create_category_pane{ text = loc[1], nodes = {
                config_category_button(loc[2], "alchemicals", G.C.RED),
            } }
        end
    },
    boosters = {
        init = function()
            local enabled_loc = localize("b_alchemy_ui_enabled")
            local loc = localize("b_alchemy_ui_config_boosters")
            return create_category_pane{ text = loc[1], nodes = {
                -- create_ttoggle{ label = enabled_loc, tooltip = loc[2].tooltip, align = "cm", active_colour = G.C.RED, shadow = true, ref_table = CodexArcanum.config.modules, ref_value = "BoosterPacks" }
                config_category_button(loc[2], "boosters", G.C.RED)
            } }
        end
    },
    jokers = {
        init = function()
            local enabled_loc = localize("b_alchemy_ui_enabled")
            local loc = localize("b_alchemy_ui_config_jokers")
            return create_category_pane{ text = loc[1], nodes = {
                config_category_button(loc[2], "jokers", G.C.RED)
            } }
        end
    },
    consumables = {
        init = function()
            local enabled_loc = localize("b_alchemy_ui_enabled")
            local loc = localize("b_alchemy_ui_config_consumables")
            return create_category_pane{ text = loc[1], nodes = {
                config_category_button(loc[2], "consumables", G.C.RED)
            } }
        end
    },
    decks = {
        init = function()
            local enabled_loc = localize("b_alchemy_ui_enabled")
            local loc = localize("b_alchemy_ui_config_decks")
            return create_category_pane{ text = loc[1], nodes = {
                config_category_button(loc[2], "decks", G.C.RED)
            } }
        end
    },
    vouchers = {
        init = function()
            local enabled_loc = localize("b_alchemy_ui_enabled")
            local loc = localize("b_alchemy_ui_config_vouchers")
            return create_category_pane{ text = loc[1], nodes = {
                config_category_button(loc[2], "vouchers", G.C.RED)
            } }
        end
    },
    tags = {
        init = function()
            local enabled_loc = localize("b_alchemy_ui_enabled")
            local loc = localize("b_alchemy_ui_config_tags")
            return create_category_pane{ text = loc[1], nodes = {
                config_category_button(loc[2], "tags", G.C.RED)
            } }
        end
    }
}

function G.FUNCS.alchemy_config_button(e)
    G.FUNCS.overlay_menu{ definition = category_tabs[e.config.id].init() }
end

local function config_category_button(name, color)
    local loc = localize("b_alchemy_ui_config_" .. name)
    local button = UIBox_button{
        label = loc[1].title,
        id = name,
        shadow = true,
        scale = 0.5,
        colour = color,
        minw = 4.5,
        minh = 0.75,
        button = "alchemy_config_button"
    }
    button.nodes[1].config.tooltip = { text = loc[1].tooltip }
    return button
end

CodexArcanum.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { r = 0.25, align = "tm", padding = 0.25, colour = G.C.BLACK, minw = 9 },
        nodes = {
            {
                n = G.UIT.C,
                config = { align = "tm", padding = 0.15, },
                nodes = {
                    config_category_button("alchemicals", G.C.SECONDARY_SET.Alchemical),
                    config_category_button("boosters", G.C.BOOSTER),
                    config_category_button("jokers", G.C.SECONDARY_SET.Joker),
                    config_category_button("consumables", G.C.SECONDARY_SET.Tarot),
                    config_category_button("decks", HEX("3DAD82")),
                    config_category_button("vouchers", G.C.SECONDARY_SET.Voucher),
                    config_category_button("tags", HEX("878DC6")),
                }
            }
        }
    }
end
