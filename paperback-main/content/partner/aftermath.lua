Partner_API.Partner {
  key = "aftermath",
  unlocked = false,
  discovered = true,
  pos = { x = 1, y = 0 },
  atlas = "partners_atlas",
  config = { extra = { upgrade = 2, upgrade_buffed = 5 } },
  link_config = { j_paperback_legacy = 1 },

  loc_vars = function(self, info_queue, card)
    if next(SMODS.find_card("j_paperback_legacy")) then
      return {
        vars = { card.ability.extra.upgrade_buffed }
      }
    else
      return {
        vars = { card.ability.extra.upgrade }
      }
    end
  end,
  calculate = function(self, card, context)
    if context.individual and not context.retrigger and context.cardarea == G.play then
      if context.other_card:is_face() then
        if next(SMODS.find_card("j_paperback_legacy")) then
          context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus +
              card.ability.extra.upgrade_buffed
        else
          context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.upgrade
        end
        return {
          message = localize('k_upgrade_ex'),
        }
      end
    end
  end,

  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_paperback_legacy" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,
}
