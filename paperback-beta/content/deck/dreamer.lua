if PB_UTIL.config.minor_arcana_enabled then
  SMODS.Back {
    key = 'dreamer',
    atlas = 'decks_atlas',
    pos = { x = 3, y = 0 },
    config = {
      joker_slot = -1,
      consumables = {
        'c_paperback_apostle_of_wands'
      }
    },

    loc_vars = function(self)
      return {
        vars = {
          localize { type = 'name_text', key = 'c_paperback_apostle_of_wands', set = 'Spectral' },
          self.config.joker_slot
        }
      }
    end
  }
end
