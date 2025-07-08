PB_UTIL.MinorArcana {
  key = 'queen_of_swords',
  config = {
    targets = 3,
  },
  atlas = 'minor_arcana_atlas',
  pos = { x = 5, y = 5 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.targets
      }
    }
  end,

  can_use = function(self, card)
    return #G.hand.highlighted == 1 and not SMODS.has_no_suit(G.hand.highlighted[1])
  end,

  use = function(self, card, area)
    local ref = G.hand.highlighted[1].base.suit
    local targets = {}
    while #targets < card.ability.targets do
      local target = pseudorandom_element(G.playing_cards, pseudoseed('queen_of_swords'))
      if not SMODS.has_no_suit(target) and target.base.suit ~= ref then
        table.insert(targets, target)
      end
    end
    PB_UTIL.use_consumable_animation(card, G.hand.highlighted, function()
      for k, v in ipairs(targets) do
        assert(SMODS.change_base(v, ref))
      end
    end)
  end
}
