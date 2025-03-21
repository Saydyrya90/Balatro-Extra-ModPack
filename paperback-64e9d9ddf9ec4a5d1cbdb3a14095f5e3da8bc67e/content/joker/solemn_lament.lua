SMODS.Joker {
  key = "solemn_lament",
  rarity = 3,
  pos = { x = 3, y = 1 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,
  paperback = {
    ignores_the_world = true
  },

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if context.other_card == context.scoring_hand[1] then
        local reps = G.GAME.current_round.hands_left + G.GAME.current_round.discards_left

        return {
          message = localize('k_again_ex'),
          repetitions = reps,
          card = card
        }
      end
    end
  end
}
