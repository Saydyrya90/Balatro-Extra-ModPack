SMODS.Blind {
  key = 'half',
  boss = {
    min = 2
  },
  boss_colour = HEX('D1AB88'),
  atlas = 'music_blinds_atlas',
  pos = { y = 6 },

  set_blind = function(self)
    G.GAME.probabilities.normal = G.GAME.probabilities.normal / 2
  end,

  disable = function(self)
    G.GAME.probabilities.normal = G.GAME.probabilities.normal * 2
  end,

  defeat = function(self)
    if not G.GAME.blind.disabled then
      G.GAME.probabilities.normal = G.GAME.probabilities.normal * 2
    end
  end
}
