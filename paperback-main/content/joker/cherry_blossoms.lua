SMODS.Joker {
  key = "cherry_blossoms",
  config = {
    extra = {
      xMult = 1.05,
      xMult_gain = 0.05,
      xMult_base = 1.05,
      suit = "Hearts",
    }
  },
  rarity = 1,
  pos = { x = 2, y = 4 },
  atlas = "jokers_atlas",
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xMult_base,
        card.ability.extra.xMult_gain
      }
    }
  end,

  calculate = function(self, card, context)
    return PB_UTIL.panorama_logic(card, context)
  end
}
