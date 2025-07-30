Partner_API.Partner {
  key = "faker",
  unlocked = false,
  discovered = true,
  pos = { x = 2, y = 0 },
  atlas = "partners_atlas",
  config = { extra = { active = true } },
  link_config = { j_paperback_subterfuge = 1 },

  loc_vars = function(self, info_queue, card)
    if next(SMODS.find_card("j_paperback_subterfuge")) then
      return {
        key = "pnr_paperback_faker_buffed"
      }
    end
  end,
  calculate = function(self, card, context)
    if context.destroy_card and context.cardarea == G.play then
      -- Destroy card
      if (card.ability.extra.active or next(SMODS.find_card("j_paperback_subterfuge"))) and #context.full_hand == 1 then
        card.ability.extra.active = false
        return {
          remove = true,
          message = localize('paperback_destroyed_ex'),
          colour = G.C.MULT
        }
      end
    end

    if context.setting_blind then
      card.ability.extra.active = true
    end
  end,

  check_for_unlock = function(self, args)
    for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
      if v.key == "j_paperback_subterfuge" then
        if get_joker_win_sticker(v, true) >= 8 then
          return true
        end
        break
      end
    end
  end,
}
