SMODS.Joker {
  key = 'resurrections',
  config = {
    extra = {
      sell_cost = 10,
      odds = 5,
      chance_mult = 1
    }
  },
  rarity = 3,
  pos = { x = 0, y = 10 },
  atlas = 'jokers_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative

    return {
      vars = {
        G.GAME.probabilities.normal * card.ability.extra.chance_mult,
        card.ability.extra.odds,
        card.ability.extra.sell_cost,
        G.GAME.probabilities.normal
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.selling_card and context.card ~= card and context.card.ability.set == 'Joker' then
      local chance = G.GAME.probabilities.normal * card.ability.extra.chance_mult
      local roll = pseudorandom("resurrections") < chance / card.ability.extra.odds

      if roll then
        G.E_MANAGER:add_event(Event {
          func = function()
            -- Create a copy of the sold Joker
            local copy = copy_card(context.card)
            copy:add_to_deck()
            G.jokers:emplace(copy)

            -- Create the negative copy
            local n_copy = copy_card(context.card)
            n_copy:set_edition('e_negative', true)
            n_copy:add_to_deck()
            G.jokers:emplace(n_copy)
            PB_UTIL.set_sell_value(n_copy, -card.ability.extra.sell_cost)
            return true
          end
        })

        -- Self destruct
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('k_duplicated_ex')
        }
      else
        card.ability.extra.chance_mult = card.ability.extra.chance_mult + 1
      end
    end
  end
}
