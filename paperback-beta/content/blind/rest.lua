SMODS.Blind {
  key = 'rest',
  boss = {
    min = 3
  },
  mult = 1,
  boss_colour = HEX('90CDAF'),
  atlas = 'music_blinds_atlas',
  pos = { y = 8 },

  loc_vars = function(self)
    return {
      vars = {
        G.GAME.probabilities.normal * self.chance_numerator,
        self.chance_denominator
      }
    }
  end,

  collection_loc_vars = function(self)
    return {
      vars = {
        self.chance_numerator,
        self.chance_denominator
      }
    }
  end,

  chance_numerator = 3,
  chance_denominator = 4,

  stay_flipped = function(self, area, card)
    if area == G.hand then
      if not card:is_face() and not SMODS.has_no_rank(card) and
          pseudorandom('paperback_rest') < G.GAME.probabilities.normal*self.chance_numerator/self.chance_denominator then
        return true
      end
    end
  end,

  disable = function(self)
    for k, v in pairs(G.hand.cards) do
      if v.facing == 'back' then
        v:flip()
      end
      for k, v in pairs(G.playing_cards) do
        v.ability.wheel_flipped = nil
      end
    end
  end
}
