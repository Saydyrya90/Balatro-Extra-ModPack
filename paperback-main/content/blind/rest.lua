SMODS.Blind {
  key = 'rest',
  boss = {
    min = 3
  },
  mult = 1,
  boss_colour = HEX('90CDAF'),
  atlas = 'music_blinds_atlas',
  pos = { y = 8 },

  stay_flipped = function(self, area, card)
    if not card:is_face() then
      return true
    end
    return false
  end
}
