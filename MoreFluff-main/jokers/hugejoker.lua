local huger = SMODS.current_mod.config["Huger Joker"]
local scale = 1.5
if huger then
  scale = 2
end

local joker = {
  name = "Huge Joker",
  config = {
    h_size = -2,
    extra = {
      x_mult = 3
    }
  },
  pos = {x = 3, y = 3},
  rarity = 3,
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  display_size = { w = 71.0 * scale, h = 95 * scale },
	pools = { ["Meme"] = true },
  loc_txt = {
    name = "Huge Joker",
    text = {
      "{X:red,C:white} X#1# {} Mult",
      "{C:attention}#2#{} hand size"
    },
  },
  loc_vars = function(self, info_queue, center)
    return {
      vars = { center.ability.extra.x_mult, 
      center.ability.h_size < 0 and center.ability.h_size or "+" .. center.ability.h_size, }
    }
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
      return {
        message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
        Xmult_mod = card.ability.extra.x_mult,
      }
    end
  end
}

if JokerDisplay then
  JokerDisplay.Definitions["j_mf_hugejoker"] = {
    text = {
      {
        border_nodes = {
          { text = "X" },
          { ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" },
        },
      }
    },
  }
end

return joker
