SMODS.Joker {
  key = "cream_liqueur",
  config = {
    extra = {
      rounds_reset = 3,
      rounds = 3,
      money = 5
    }
  },
  rarity = 1,
  pos = { x = 5, y = 6 },
  atlas = "jokers_atlas",
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  soul_pos = nil,
  pools = {
    Food = true
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money,
        card.ability.extra.rounds
      }
    }
  end,

  calculate = function(self, card, context)
    if context.paperback and context.paperback.using_tag then
      return {
        dollars = card.ability.extra.money
      }
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      card.ability.extra.rounds = card.ability.extra.rounds - 1

      if card.ability.extra.rounds <= 0 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          -- Brown color taken from the sprite
          colour = HEX("C4A07D")
        }
      else
        return {
          message = localize {
            type = 'variable',
            key = 'a_remaining',
            vars = { card.ability.extra.rounds }
          }
        }
      end
    end
  end
}

local add_tag_ref = add_tag
function add_tag(tag)
  -- When a tag is added, reset the countdown for each existing Cream Liqueur
  for _, v in ipairs(SMODS.find_card('j_paperback_cream_liqueur')) do
    if v.ability.extra.rounds > 0 and v.ability.extra.rounds < v.ability.extra.rounds_reset then
      v.ability.extra.rounds = v.ability.extra.rounds_reset

      SMODS.calculate_effect({
        message = localize('k_reset')
      }, v)
    end
  end
  return add_tag_ref(tag)
end
