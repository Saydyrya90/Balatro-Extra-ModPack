SMODS.Back {
  key = 'paper',
  atlas = 'decks_atlas',
  pos = { x = 0, y = 0 },
  config = {
    jokers = {
      'j_paperback_shopping_center'
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        localize {
          type = 'name_text',
          set = 'Joker',
          key = 'j_paperback_shopping_center'
        }
      }
    }
  end
}
