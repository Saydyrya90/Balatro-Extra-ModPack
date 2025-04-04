SMODS.Blind {
  key = 'quarter',
  boss = {
    min = 1
  },
  boss_colour = HEX("E27A7A"),
  atlas = 'music_blinds_atlas',
  pos = { y = 5 },

  odds = 4,

  loc_vars = function(self)
    return {
      vars = {
        G.GAME.probabilities.normal,
        self.odds
      }
    }
  end,

  collection_loc_vars = function(self)
    return {
      vars = {
        1,
        4
      }
    }
  end,

  recalc_debuff = function(self, card, from_blind)
    if card.area ~= G.jokers then
      if pseudorandom('the_quarter') < G.GAME.probabilities.normal / G.GAME.blind.config.blind.odds then
        return true
      end
      return false
    end
  end,
}
