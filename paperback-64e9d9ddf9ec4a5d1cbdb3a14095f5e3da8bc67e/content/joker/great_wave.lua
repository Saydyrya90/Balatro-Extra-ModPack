SMODS.Joker {
  key = "great_wave",
  rarity = 2,
  pos = { x = 4, y = 2 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  calculate = function(self, card, context)
    if not card.debuff then
      if context.repetition and context.cardarea == G.play then
        if context.other_card == context.scoring_hand[#context.scoring_hand] then
          return {
            message = localize('k_again_ex'),
            repetitions = #G.play.cards,
            card = card
          }
        end
      end
    end
  end
}
