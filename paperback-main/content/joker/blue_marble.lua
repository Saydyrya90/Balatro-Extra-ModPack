SMODS.Joker {
  key = "blue_marble",
  config = {
    extra = {
      suit = 'Clubs',
    }
  },
  rarity = 1,
  pos = { x = 11, y = 1 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.suit, 'suits_plural'),
        colours = {
          G.C.SUITS[card.ability.extra.suit]
        }
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.after and context.main_eval then
      card.ability.extra.ready = true

      for _, v in ipairs(context.full_hand) do
        if not v:is_suit(card.ability.extra.suit) then
          card.ability.extra.ready = false
          break
        end
      end
    end

    if context.end_of_round and context.main_eval and card.ability.extra.ready then
      card.ability.extra.ready = false

      if PB_UTIL.try_spawn_card { set = 'Planet' } then
        return {
          message = localize('k_plus_planet'),
          colour = G.C.SECONDARY_SET.Planet
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = '(' },
        { ref_table = 'card.joker_display_values', ref_value = 'localized_suit' },
        { text = ')' }
      },

      calc_function = function(card)
        card.joker_display_values.localized_suit = localize(card.ability.extra.suit, 'suits_plural')
      end,

      style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[2] then
          reminder_text.children[2].config.colour = G.C.SUITS[card.ability.extra.suit]
        end
      end,
    }
  end
}
