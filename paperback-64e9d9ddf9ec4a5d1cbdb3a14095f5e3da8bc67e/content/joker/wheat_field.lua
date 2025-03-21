SMODS.Joker {
  key = "wheat_field",
  config = {
    extra = {
      xMult = 1.075,
      xMult_gain = 0.075,
      xMult_base = 1.075,
      suit = "paperback_Crowns",
    }
  },
  rarity = 1,
  pos = { x = 3, y = 10 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  paperback = {
    requires_crowns = true,
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        tostring(card.ability.extra.xMult_base),
        tostring(card.ability.extra.xMult_gain)
      }
    }
  end,

  calculate = function(self, card, context)
    return PB_UTIL.panorama_logic(card, context)
  end
}
