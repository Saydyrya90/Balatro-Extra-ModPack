SMODS.Joker {
  key = "apple",
  config = {
    extra = {
      odds = 10,
      card_generated = false,
    }
  },
  rarity = 1,
  pos = { x = 6, y = 6 },
  atlas = 'jokers_atlas',
  cost = 1,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  soul_pos = { x = 7, y = 6 },
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative

    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card:is_suit("Hearts") then
        if not card.ability.extra.card_generated then
          if pseudorandom("Apple") < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
              trigger = 'before',
              func = function()
                -- Give the negative consumable
                SMODS.add_card {
                  set = PB_UTIL.poll_consumable_type('apple').key,
                  area = G.consumables,
                  edition = 'e_negative',
                  soulable = true,
                  key_append = 'apple',
                }

                return true
              end
            }))

            card.ability.extra.card_generated = true
            PB_UTIL.destroy_joker(card)

            if not context.blueprint then
              SMODS.calculate_effect({
                message = localize('paperback_destroyed_ex'),
              }, card)
            end
          end
        end
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = 'localized_text', colour = lighten(G.C.SUITS['Hearts'], 0.35) },
        { text = ")" }
      },

      extra = {
        {
          { text = "(" },
          { ref_table = "card.joker_display_values", ref_value = 'odds' },
          { text = ")" }
        }
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
        card.joker_display_values.localized_text = localize("Hearts", 'suits_plural')
      end,
    }
  end,
}
