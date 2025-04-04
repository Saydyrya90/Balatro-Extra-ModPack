SMODS.Sticker {
  key = 'temporary',
  atlas = 'stickers_atlas',
  pos = { x = 1, y = 0 },
  badge_colour = G.C.PAPERBACK_TEMPORARY,
  should_apply = false,
  rate = 0,

  draw = function(self, card)
    -- Don't draw the shine over the sticker
    G.shared_stickers[self.key].role.draw_major = card
    G.shared_stickers[self.key]:draw_shader('dissolve', nil, nil, nil, card.children.center)
  end,
}

-- Hook end_round to destroy Jokers with this sticker

local end_round_ref = end_round
function end_round()
  for _, v in ipairs(G.jokers and G.jokers.cards or {}) do
    if v.ability.paperback_temporary then
      PB_UTIL.destroy_joker(v)
    end
  end

  return end_round_ref()
end
