SMODS.Joker {
  key = "find_jimbo",
  config = {
    extra = {
      money = 5,
      rank = 'Ace',
      id = 14,
      suit = 'Spades'
    }
  },
  rarity = 1,
  pos = { x = 1, y = 7 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize(card.ability.extra.rank, 'ranks'),
        localize(card.ability.extra.suit, 'suits_plural'),
        card.ability.extra.money,
        colours = {
          G.C.SUITS[card.ability.extra.suit]
        }
      }
    }
  end,

  set_ability = function(self, card, initial, delay_sprites)
    if G.STAGE == G.STAGES.RUN then
      PB_UTIL.reset_find_jimbo(card)
    end
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.after then
      for k, v in pairs(context.full_hand) do
        if v:is_suit(card.ability.extra.suit) and v:get_id() == card.ability.extra.id then
          local calculated_card = context.blueprint_card or card

          G.E_MANAGER:add_event(Event({
            func = function()
              calculated_card:juice_up()
              return true
            end
          }))

          SMODS.calculate_effect({
            dollars = card.ability.extra.money
          }, v)
        end
      end
    end

    if not context.blueprint and context.end_of_round and not (context.individual or context.repetition) then
      PB_UTIL.reset_find_jimbo(card)
    end
  end
}
