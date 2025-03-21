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
  discovered = true,
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
            local copy = copy_card(context.card)
            copy:set_edition('e_negative', true)
            copy:add_to_deck()
            G.jokers:emplace(copy)
            PB_UTIL.modify_sell_value(copy, -(copy.sell_cost + card.ability.extra.sell_cost))
            return true
          end
        })

        -- Reset chance after a successful roll
        card.ability.extra.chance_mult = 1

        return {
          message = localize('k_duplicated_ex')
        }
      else
        card.ability.extra.chance_mult = card.ability.extra.chance_mult + 1
      end
    end
  end
}
