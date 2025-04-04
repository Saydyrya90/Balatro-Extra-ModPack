SMODS.Joker {
  key = "j_and_js",
  config = {
    extra = {
      tags = 2,
      rounds = 3,
      rounds_reset = 3,
    }
  },
  rarity = 2,
  pos = { x = 11, y = 8 },
  atlas = "jokers_atlas",
  cost = 6,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,
  paperback = {
    requires_custom_suits = true
  },

  in_pool = function(self, args)
    return PB_UTIL.spectrum_played() or PB_UTIL.has_modded_suit_in_deck()
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.tags,
        card.ability.extra.rounds
      }
    }
  end,

  calculate = function(self, card, context)
    if not context.blueprint and context.paperback and context.paperback.tag_acquired then
      if card.ability.extra.rounds > 0 and card.ability.extra.rounds < card.ability.extra.rounds_reset then
        card.ability.extra.rounds = card.ability.extra.rounds_reset

        return {
          message = localize('k_reset')
        }
      end
    end

    if context.before and context.main_eval then
      -- We can't check for a hand exactly, because we don't know which mod is adding it
      for k, _ in pairs(context.poker_hands) do
        if k:find('Spectrum', nil, true) then
          for i = 1, card.ability.extra.tags do
            -- Only play sound on the last tag
            PB_UTIL.add_tag(PB_UTIL.poll_tag('j_and_js'), true, i < card.ability.extra.tags)
          end

          return {
            message = localize('paperback_plus_tag')
          }
        end
      end
    end

    if not context.blueprint and context.end_of_round and context.main_eval then
      card.ability.extra.rounds = card.ability.extra.rounds - 1

      if card.ability.extra.rounds <= 0 then
        PB_UTIL.destroy_joker(card)

        return {
          message = localize('paperback_consumed_ex'),
          colour = G.C.MULT
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
