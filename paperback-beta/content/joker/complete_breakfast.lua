SMODS.Joker {
  key = 'complete_breakfast',
  config = {
    extra = {
      mult = 5,
      chips = 50,
      odds = 8,
      -- For compatibility with Oops! All 6s
      chance_multiplier = 1
    }
  },
  rarity = 1,
  pos = { x = 6, y = 5 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.chips,
        -- For compatibility with Oops! All 6s
        card.ability.extra.chance_multiplier * G.GAME.probabilities.normal,
        card.ability.extra.odds,
        G.GAME.probabilities.normal
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea ~= G.jokers then return end

    -- Give mult and chips when evaluating joker
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
        chips = card.ability.extra.chips
      }
    end

    -- Check if Joker needs to be eaten, and if not, increase the chance it will be eaten next time
    if context.after and not context.blueprint then
      local chance = card.ability.extra.chance_multiplier * G.GAME.probabilities.normal

      if pseudorandom("Complete Breakfast") < chance / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('k_eaten_ex'),
          colour = G.C.MULT
        }
      else
        card.ability.extra.chance_multiplier = card.ability.extra.chance_multiplier + 1

        return {
          message = localize('k_safe_ex'),
          colour = G.C.CHIPS,
        }
      end
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      text = {
        { text = '+',                       colour = G.C.MULT },
        { ref_table = 'card.ability.extra', ref_value = 'mult',  colour = G.C.MULT },
        { text = ' +',                      colour = G.C.CHIPS },
        { ref_table = 'card.ability.extra', ref_value = 'chips', colour = G.C.CHIPS },
      },

      extra = {
        {
          { text = '(' },
          { ref_table = 'card.joker_display_values', ref_value = 'odds' },
          { text = ')' },
        }
      },
      extra_config = {
        colour = G.C.GREEN,
        scale = 0.3,
      },

      calc_function = function(card)
        card.joker_display_values.odds = localize { type = 'variable', key = 'jdis_odds', vars = { (G.GAME and G.GAME.probabilities.normal or 1) * card.ability.extra.chance_multiplier, card.ability.extra.odds } }
      end
    }
  end
}
