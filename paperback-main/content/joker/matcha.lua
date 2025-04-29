SMODS.Joker {
  key = "matcha",
  config = {
    extra = {
      odds = 8,
      a_chips = 2,
      chips = 0
    }
  },
  rarity = 1,
  pos = { x = 10, y = 5 },
  atlas = "jokers_atlas",
  cost = 3,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.a_chips,
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.individual and context.cardarea == G.play then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.a_chips

      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.CHIPS,
        card = card
      }
    end

    if not context.blueprint and context.discard then
      if pseudorandom('matcha') < G.GAME.probabilities.normal / card.ability.extra.odds then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT,
          card = card
        }
      end
    end

    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }
    end
  end
}
