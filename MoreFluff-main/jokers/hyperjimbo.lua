local joker = {
  name = "Hyperjimbo",
  config = {
    val = 1.04
  },
  pos = {x = 0, y = 0},
  display_size = { w = 95, h = 95 },
  -- pixel_size = { w = 95, h = 95 },
  rarity = 3,
  cost = 10,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  immutable = true, -- pretty important
	pools = { ["Meme"] = true }, -- fuck it. jimball 2 goes in the meme packs
  loc_txt = {
    name = "Hyperjimbo",
    text = {
      "bla bla bla."
    }
  },
  loc_vars = function(self, info_queue, center)
    return {vars = { center.ability.val } }
  end,
  calculate = function(self, card, context)
    if context.mf_before_cards and #G.play.cards == 4 then
      return {
        eechips = card.ability.val
      }
    end
  end
}

return joker
