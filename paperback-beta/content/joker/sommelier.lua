SMODS.Joker {
  key = 'sommelier',
  config = {
    extra = {
      active = true
    }
  },
  rarity = 2,
  pos = { x = 18, y = 0 },
  atlas = 'jokers_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = false,
  soul_pos = nil,
  enhancement_gate = "m_paperback_stained",
  paperback = {
    requires_enhancements = true
  },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_paperback_stained
    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Enhanced',
          key = 'm_paperback_stained'
        },
      }
    }
  end,

  calculate = function(self, card, context)
    if context.pre_discard and not context.blueprint and card.ability.extra.active and G.GAME.current_round.discards_used <= 0 then
      for _, v in ipairs(context.full_hand) do
        if SMODS.has_enhancement(v, "m_paperback_stained") then
          PB_UTIL.use_consumable_animation(card, context.other_card, function()
            v:set_seal((SMODS.poll_seal {
              key = 'sommelier_seal',
              guaranteed = true
            }
            ), nil, true)
          end)

          break
        end
      end
      card.ability.extra.active = false
    end

    if context.discard then
      card.ability.extra.active = true
    end
  end
}
