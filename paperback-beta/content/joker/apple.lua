SMODS.Joker {
  key = "apple",
  config = {
    extra = {
      odds = 4,
    }
  },
  rarity = 1,
  pos = { x = 6, y = 6 },
  atlas = 'jokers_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  perishable_compat = true,
  soul_pos = { x = 7, y = 6 },
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative

    return {
      vars = {
        G.GAME.probabilities.normal,
        card.ability.extra.odds,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.buying_card then
      if pseudorandom("Apple_creation") < G.GAME.probabilities.normal / card.ability.extra.odds then
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          func = function()
            -- Give the negative consumable
            local copy = copy_card(context.card)
            copy:add_to_deck()

            copy = copy_card(context.card)
            copy:set_edition('e_negative', true)
            G.consumeables:emplace(copy)

            return true
          end
        }))
      end
      if pseudorandom("Apple_destruction") < G.GAME.probabilities.normal / card.ability.extra.odds then
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          func = function()
            PB_UTIL.destroy_joker(card)

            if not context.blueprint then
              SMODS.calculate_effect({
                message = localize('paperback_destroyed_ex'),
              }, card)
            end

            return true
          end
        }))
      end
    end
  end,
}
