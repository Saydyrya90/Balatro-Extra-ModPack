SMODS.Joker {
  key = 'full_moon',
  config = {
    extra = {
      odds = 2
    }
  },
  rarity = 2,
  pos = { x = 5, y = 9 },
  atlas = 'jokers_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and context.consumeable.ability.set == 'Planet' then
      local hand = context.consumeable.ability.hand_type

      if hand and pseudorandom('full_moon') < G.GAME.probabilities.normal / card.ability.extra.odds then
        -- This is a copy of how a planet card sets the text when upgrading a hand (just formatted better)
        update_hand_text(
          { sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
          {
            handname = localize(hand, 'poker_hands'),
            chips = G.GAME.hands[hand].chips,
            mult = G.GAME.hands[hand].mult,
            level = G.GAME.hands[hand].level
          }
        )

        level_up_hand(context.blueprint_card or card, hand)

        update_hand_text(
          { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
          { mult = 0, chips = 0, handname = '', level = '' }
        )

        return nil, true
      end
    end
  end
}
