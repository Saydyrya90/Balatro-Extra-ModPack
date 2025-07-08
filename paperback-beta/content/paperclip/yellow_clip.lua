PB_UTIL.Paperclip {
  key = 'yellow_clip',
  atlas = 'paperclips_atlas',
  pos = { x = 0, y = 1 },
  badge_colour = G.C.YELLOW,
  badge_text_colour = G.C.PAPERBACK_BLACK,
  config = {
    dollar_odds = 3,
    dollars = 3,
    mult_odds = 5,
    mult = 15,
    xmult_odds = 5,
    xmult = 1.5
  },

  loc_vars = function(self, info_queue, card)
    local clip = card.ability[self.key]
    return {
      vars = {
        G.GAME.probabilities.normal,
        clip.mult_odds,
        clip.mult,
        clip.xmult_odds,
        clip.xmult,
        clip.dollar_odds,
        clip.dollars,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
      if PB_UTIL.count_paperclips { area = G.hand, exclude_highlighted = true } > 0 then
        local ret = {}
        local clip = card.ability[self.key]
        if pseudorandom("yellow_clip_money") < G.GAME.probabilities.normal / clip.dollar_odds then
          ret.dollars = clip.dollars
        end
        if pseudorandom("yellow_clip_mult") < G.GAME.probabilities.normal / clip.mult_odds then
          ret.mult = clip.mult
        end
        if pseudorandom("yellow_clip_xmult") < G.GAME.probabilities.normal / clip.xmult_odds then
          ret.xmult = clip.xmult
        end
        return ret
      end
    end
  end
}
