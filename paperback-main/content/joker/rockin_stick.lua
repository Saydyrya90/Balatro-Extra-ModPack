SMODS.Joker {
  key = 'rockin_stick',
  config = {
    extra = {
      xMult = 1.5
    }
  },
  rarity = 1,
  pos = { x = 8, y = 8 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  yes_pool_flag = "sticks_can_spawn",
  paperback = {
    requires_stars = true
  },

  loc_vars = function(self, info_queue, card)
    local xMult = PB_UTIL.calculate_stick_xMult(card)

    return {
      vars = {
        card.ability.extra.xMult,
        xMult
      }
    }
  end,

  calculate = PB_UTIL.stick_joker_logic,
  joker_display_def = PB_UTIL.stick_joker_display_def
}
