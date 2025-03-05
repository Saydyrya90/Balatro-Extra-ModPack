-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--            TAROTS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-

SMODS.Consumable {
    set = "Tarot",
    atlas = "arcanum_others",
    key = "seeker",
    -- loc_txt = {
    --     name = 'The Seeker',
    --     text = {
    --         "Creates up to {C:attention}#1#",
    --         "random {C:alchemical}Alchemical{} cards",
    --         "{C:inactive}(Must have room)",
    --     }
    -- },
    loc_vars = function(self, info_queue, center)
        return { vars = { self.config.extra.alchemicals } }
    end,
    unlocked = true,
    discovered = false,
    config = { extra = { alchemicals = 2 } },
    cost = 3,
    pos = { x = 0, y = 0 },

    can_use = function(self)
        if #G.consumeables.cards <= G.consumeables.config.card_limit or self.area == G.consumeables then
            return true
        else
            return false
        end
    end,

    use = function(self, used_tarot)
        for _ = 1, math.min(self.config.extra.alchemicals, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        local card = create_alchemical(G.consumeables, nil, nil, nil, nil, nil, "see")
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        used_tarot:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
}

-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--          SPECTRALS
-- -+-+-+-+-+-+-+-+-+-+-+-+-+-+-


function hue_to_rgb(hue) 
    local r, g, b = 0, 0, 0;
  
    local saturation = 0.1;
    local lightness = 0.75;
  
    if hue < 60 then 
      r = 1; 
      g = saturation + (1 - saturation) * (hue / 60); 
      b = 1 - saturation; 
    elseif hue < 120 then 
      r = saturation + (1 - saturation) * ((120 - hue) / 60); 
      g = 1; 
      b = 1 - saturation;
    elseif hue < 180 then 
      r = 1 - saturation; 
      g = 1; 
      b = saturation + (1 - saturation) * ((hue - 120) / 60);
    elseif hue < 240 then 
      r = 1 - saturation; 
      g = saturation + (1 - saturation) * ((240 - hue) / 60); 
      b = 1;
    elseif hue < 300 then 
      r = saturation + (1 - saturation) * ((hue - 240) / 60); 
      g = 1 - saturation; 
      b = 1;
    else 
      r = 1; 
      g = 1 - saturation; 
      b = saturation + (1 - saturation) * ((360 - hue) / 60); end
  
    -- local gray = 0.2989 * r + 0.5870 * g + 0.1140 * b
  
    -- r = (1 - 0.5) * r + 0.5 * gray
    -- g = (1 - 0.5) * g + 0.5 * gray
    -- b = (1 - 0.5) * b + 0.5 * gray
  
    r = r * lightness;
    g = g * lightness;
    b = b * lightness;
  
    return r, g, b
  end

philosopher_stone = {
    set = "Spectral",
    atlas = "arcanum_others",
    key = "philosopher_stone",
    -- loc_txt = {
    --     name = "The Philosopher's Stone",
    --     text = {
    --         "{C:attention}Retrigger{} the",
    --         "next {C:legendary,E:1}played hand{}"
    --     }
    -- },
    loc_vars = function(self, info_queue, center)
        if not ReduxArcanumMod.config.new_content then
            return { key = self.key .. '_classic' }
        end
    end,

    hidden = true,
    soul_rate = 0.003,
    soul_set = 'Alchemical',
    unlocked = true,
    discovered = false,
    config = { },
    cost = 4,
    pos = { x = 0, y = 1 },

    can_use = alchemical_can_use,

    use = function(self, card)
        G.deck.config.played_alchemicals = G.deck.config.played_alchemicals or {}
        table.insert(G.deck.config.played_alchemicals, {self, card})
        G.deck.config.ra_philo_stone = G.deck.config.ra_philo_stone or 0
        G.deck.config.ra_philo_stone_classic = G.deck.config.ra_philo_stone_classic or 0
        if ReduxArcanumMod.config.new_content then
            G.deck.config.ra_philo_stone = G.deck.config.ra_philo_stone + 1
        else
            G.deck.config.ra_philo_stone_classic = G.deck.config.ra_philo_stone_classic + 1
        end

        -- G.GAME.blind:change_colour(G.C.RAINBOW_EDITION)
        -- ease_background_colour{new_colour = G.C.RAINBOW_EDITION, contrast = 1}

        -- if not G.C.RAINBOW_EDITION then
        --     G.C.RAINBOW_EDITION = {0,0,0,1}
        --     G.C.RAINBOW_EDITION_HUE = 0
        -- end
        -- G.ARGS.spin.real = G.ARGS.spin.real * 2

        -- This triggers once blind is finished
        -- There is a "condition" trigger I found, but it doesn't seem to do anything special. Simply returning false has the same effect
        G.E_MANAGER:add_event(Event({
            blocking = false,
            func = function()
                if G.deck.config.ra_philo_stone > 0 or G.deck.config.ra_philo_stone_classic > 0 then
                    ease_background_colour{new_colour = G.C.ORANGE, special_colour = G.C.BLUE, tertiary_colour = darken(G.C.BLACK, 0.4), contrast = 3}

                    -- G.C.RAINBOW_EDITION_HUE = (G.C.RAINBOW_EDITION_HUE + 0.25) % 360
                    -- local r, g, b = hue_to_rgb(G.C.RAINBOW_EDITION_HUE)
                  
                    -- G.C.RAINBOW_EDITION[1] = r
                    -- G.C.RAINBOW_EDITION[3] = g
                    -- G.C.RAINBOW_EDITION[2] = b

                    -- local r2, g2, b2 = hue_to_rgb(G.C.RAINBOW_EDITION_HUE + 90)

                    -- -- G.GAME.blind:change_colour(G.C.RAINBOW_EDITION)
                    -- ease_background_colour{new_colour = G.C.RAINBOW_EDITION, special_colour = {r2, b2, g2, 1}, tertiary_colour = darken(G.C.BLACK, 0.4), contrast = 1}

                    return false
                else
                    return true
                end
            end
        }))
    end,
    end_blind = function(self, card)
        G.deck.config.ra_philo_stone_classic = 0
    end
}
SMODS.Consumable (philosopher_stone)
