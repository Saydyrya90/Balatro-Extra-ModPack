ReduxArcanumMod = SMODS.current_mod

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--        SMOD CONFIG
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

G.FUNCS.cycle_options = function(args)
    -- G.FUNCS.cycle_update from Galdur
    args = args or {}
    if args.cycle_config and args.cycle_config.ref_table and args.cycle_config.ref_value then
        args.cycle_config.ref_table[args.cycle_config.ref_value] = args.to_key
    end
    local success = SMODS.save_mod_config(ReduxArcanumMod)
    if success then
        sendDebugMessage("Config Saved", "ReduxArcanumDebugLogger")
    else
        sendDebugMessage("Config Not saved", "ReduxArcanumDebugLogger")
    end
end

-- Shamelessly copying Bunco's config tab layout
ReduxArcanumMod.config_tab = function()
    -- local current_overlapping = ReduxArcanumMod.config.overlapping_cards or 1
    local current_new_content = ReduxArcanumMod.config.new_content or true
    local bunco_linked_acid = ReduxArcanumMod.config.bunco_linked_acid or true
    t = {
        -- create_option_cycle {
        --     label = "Conflicting Cards",
        --     info = {
        --         "How to handle known similar cards from other mods",
        --         "(Requires restart)"
        --     },
        --     options = {
        --         "Remove from this mod",
        --         "Remove from the other mod",
        --         "Do nothing"
        --     },
        --     w = 5,
        --     text_scale = 0.4,
        --     current_option = current_overlapping,
        --     ref_table = ReduxArcanumMod.config,
        --     ref_value = "overlapping_cards",
        --     opt_callback = 'cycle_options',
        -- },
        create_toggle {
            label = "New Content",
            info = {
                "Include new content and balance changes",
                "(Requires restart)"
            },
            current_option = current_new_content,
            ref_table = ReduxArcanumMod.config,
            ref_value = "new_content"
        }
    }
    if next(SMODS.find_mod("Bunco")) then
        table.insert(t, create_toggle {
            label = "Acid + Bunco Linked Cards",
            info = {
                "When acid destroys a linked card,",
                "treat linked cards as destroyed by Acid",
                "(Won't trigger jokers + returns after blind)"
            },
            current_option = bunco_linked_acid,
            ref_table = ReduxArcanumMod.config,
            ref_value = "bunco_linked_acid"
        })
    end

    for i, _ in ipairs(t) do
        t[i] = {
            n = G.UIT.R,
            config = {
                align = "cm",
                r = 0.1,
                emboss = 0.1,
                outline = 1,
                padding = 0.14
            },
            nodes = { t[i] }
        }
    end

    return {
        n = G.UIT.ROOT,
        config = { align = "cm", minh = G.ROOM.T.h * 0.25, padding = 0.2, r = 0.1, colour = G.C.BLACK },
        nodes = t
    }
end

-- Mod Icon

-- Registers the mod icon
SMODS.Atlas { key = 'modicon', px = 32, py = 32, path = 'modicon.png' }


-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--           LOCALIZATION
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

function ReduxArcanumMod.process_loc_text()
    -- will crash the game if removed
    G.localization.descriptions.Alchemical = G.localization.descriptions.Alchemical or {}
end

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--     ALCHEMICAL INTERFACE
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/api/alchemicalAPI.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--      ALCHEMICAL UTILS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

function poll_alchemical_edition(_key, _mod, _no_poly)
    _mod = _mod or 1
    local edition_poll = pseudorandom(pseudoseed(_key or 'edition_generic'))
    if ReduxArcanumMod.config.new_content then
        if edition_poll > 1 - 0.003 * _mod * (G.GAME.used_vouchers.v_ReduxArcanum_cauldron and 50 or 1) then
            return { negative = true }
        elseif edition_poll > 1 - 0.006 * G.GAME.edition_rate * _mod and not _no_poly then
            return { polychrome = true }
        end
    else
        if edition_poll > 1 - (G.GAME.used_vouchers.v_ReduxArcanum_cauldron and 0.5 or 0) then
            return { negative = true }
        end
    end
    return nil
end

-- Use this function to apply cauldron effect
function create_alchemical(...)
    local card = create_card("Alchemical", ...)
    local edition = poll_alchemical_edition("random_alchemical", 1, not (card.ability.extra and card.ability.extra > 0))
    card:set_edition(edition)
    return card
end

function add_random_alchemical(self)
    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = (function()
                local card = create_alchemical(G.consumeables)
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                return true
            end)
        }))
    end
end

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--          ATLASES
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.Atlas { key = 'arcanum_alchemical', path = 'alchemical_atlas.png', px = 71, py = 95 }
SMODS.Atlas { key = 'arcanum_alchemical_undiscovered', path = 'c_alchemy_undiscovered.png', px = 71, py = 95 }
SMODS.Atlas { key = 'arcanum_alchemical_locked', path = 'c_alchemy_locked.png', px = 71, py = 95 }

SMODS.Atlas({ key = 'ca_booster_atlas', path = 'ca_booster_atlas.png', px = 71, py = 95 })

SMODS.Atlas({ key = 'arcanum_decks', path = 'ca_decks_atlas.png', px = 71, py = 95 })

SMODS.Atlas { key = 'arcanum_joker_atlas', path = 'ca_joker_atlas.png', px = 71, py = 95 }

SMODS.Atlas { key = 'ca_tag_elemental', path = 'tag_elemental.png', px = 34, py = 34 }

SMODS.Atlas({ key = 'arcanum_others', path = 'ca_others_atlas.png', px = 71, py = 95 })

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--          GLOBALS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

function ReduxArcanumMod.reset_game_globals(run_start)
    if run_start then
        -- Globals for a whole run (like Fortune Teller)
    else
        -- Globals for a single blind (like Idol)
        ra_reset_played_alchemicals()
    end
end

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--     ALCHEMICAL CARDS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/alchemicals.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--      ALCHEMICAL BOOSTER
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/boosters.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--            TAGS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/tags.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--            JOKERS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/jokers.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--     JOKER DISPLAY COMPAT
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

if JokerDisplay then
    SMODS.load_file("/data/display_definitions.lua")()
end

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--     TAROTS (and spectral)
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/tarots.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--           VOUCHERS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/vouchers.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--     DECKS AND CARD SLEEVES
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/decks.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--          BOSS BLINDS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/blind.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--         ACHIEVEMENTS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.load_file("/data/achievements.lua")()

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--          EDITIONS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

-- Alchemical Polychromes

SMODS.Edition:take_ownership('polychrome', {
    calculate = function(self, card, context)
        if card.ability.set == "Alchemical" then
            return
        end
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.edition.x_mult
            }
        end
    end
}, true)

-- Only for collection
SMODS.Edition {
    key = "e_polychrome_alchemical",
    shader = 'polychrome',
    atlas = "arcanum_alchemical",
    pos = { x = 0, y = 0 },
    -- no_collection = true,
    prefix_config = { key = false, shader = false },
    loc_vars = function()
        return { vars = { 1.5 } }
    end
}
