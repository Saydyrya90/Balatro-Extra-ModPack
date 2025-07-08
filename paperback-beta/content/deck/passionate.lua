if PB_UTIL.config.tags_enabled then
  SMODS.Back {
    key = 'passionate',
    atlas = 'decks_atlas',
    pos = { x = 5, y = 0 },
    config = {
      no_interest = true
    },

    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          localize {
            type = 'name_text',
            set = 'Tag',
            key = 'tag_paperback_high_risk'
          }
        }
      }
    end,

    calculate = function(self, back, context)
      if context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
        PB_UTIL.add_tag('tag_paperback_high_risk', nil, false)
      end
    end
  }
end
