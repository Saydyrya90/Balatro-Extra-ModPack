SMODS.Joker {
  key = 'deadringer',
  config = {
    extra = {
      ["Ace"] = 1,
      ["7"] = 1,
      ["9"] = 2
    }
  },
  rarity = 2,
  pos = { x = 4, y = 8 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local vars = {}
    for k, _ in pairs(card.ability.extra) do
      vars[#vars + 1] = localize(k, 'ranks')
    end

    return {
      vars = vars
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition and not SMODS.has_no_rank(context.other_card) then
      return {
        repetitions = card.ability.extra[context.other_card.base.value]
      }
    end
  end,

  joker_display_def = function(JokerDisplay)
    return {
      reminder_text = {
        { text = '(',   colour = G.C.UI.TEXT_INACTIVE },
        { text = 'Ace', colour = G.C.IMPORTANT },
        { text = ', ',  colour = G.C.UI.TEXT_INACTIVE },
        { text = '7',   colour = G.C.IMPORTANT },
        { text = ', ',  colour = G.C.UI.TEXT_INACTIVE },
        { text = '9',   colour = G.C.IMPORTANT },
        { text = ')',   colour = G.C.UI.TEXT_INACTIVE },
      },
    }
  end,
}
