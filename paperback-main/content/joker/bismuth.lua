SMODS.Joker {
  key = "bismuth",
  config = {
    extra = {
      odds = 5,
      suit1 = 'paperback_Crowns',
      suit2 = 'paperback_Stars'
    }
  },
  rarity = 2,
  pos = { x = 3, y = 9 },
  atlas = "jokers_atlas",
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,
  paperback = {
    requires_custom_suits = true
  },

  in_pool = function(self, args)
    -- Only in pool if you have either a Star or Crown
    return PB_UTIL.has_suit_in_deck(self.config.extra.suit1, true)
        or PB_UTIL.has_suit_in_deck(self.config.extra.suit2, true)
  end,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome

    return {
      vars = {
        localize(card.ability.extra.suit1, 'suits_plural'),
        localize(card.ability.extra.suit2, 'suits_plural'),
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
        colours = {
          G.C.SUITS[card.ability.extra.suit1] or G.C.PAPERBACK_CROWNS_LC,
          G.C.SUITS[card.ability.extra.suit2] or G.C.PAPERBACK_STARS_LC,
        }
      }
    }
  end,

  calculate = function(self, card, context)
    local ctx = context.paperback

    if not context.blueprint and ctx and ctx.modify_final_hand then
      local triggered

      for k, v in pairs(ctx.full_hand) do
        local roll = pseudorandom('bismuth') < G.GAME.probabilities.normal / card.ability.extra.odds
        if not v.edition and not v.debuff and roll and
            (v:is_suit(card.ability.extra.suit1) or v:is_suit(card.ability.extra.suit2)) then
          triggered = true

          local edition = poll_edition('bismuth', nil, nil, true, {
            'e_foil',
            'e_holo',
            'e_polychrome'
          })

          v:set_edition(edition)
        end
      end

      if triggered then
        return {
          message = localize('paperback_edition_ex'),
          colour = G.C.DARK_EDITION
        }
      end
    end
  end
}
