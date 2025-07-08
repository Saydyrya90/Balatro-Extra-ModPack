SMODS.Joker {
  key = "mexican_train",
  config = {
    extra = {
      dollars = 1,
      scaling = 1,
      count = 0,
    }
  },
  rarity = 1,
  pos = { x = 17, y = 10 },
  atlas = "jokers_atlas",
  cost = 8,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  enhancement_gate = 'm_paperback_domino',
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_domino
    card.ability.extra.dollars = card.ability.extra.scaling * (card.ability.extra.count or 0) + 1
    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_paperback_domino'
        },
        card.ability.extra.dollars,
        card.ability.extra.scaling,
      }
    }
  end,

  calculate = function(self, card, context)
    card.ability.extra.dollars = card.ability.extra.scaling * (card.ability.extra.count or 0) + 1
    if context.individual and context.cardarea == G.play then
      if SMODS.has_enhancement(context.other_card, 'm_paperback_domino') then
        card.ability.extra.count = card.ability.extra.count + 1
        card.ability.extra.dollars = card.ability.extra.scaling * (card.ability.extra.count or 0) + 1
        return {
          dollars = card.ability.extra.dollars - 1
        }
      end
    end

    if context.end_of_round and context.cardarea == G.jokers then
      card.ability.extra.count = 0
      return {
        message = localize('k_reset')
      }
    end
  end
}
