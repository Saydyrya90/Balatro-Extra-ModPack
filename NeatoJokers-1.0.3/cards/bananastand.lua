SMODS.Joker {
    key = "bananastand",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    config = {extra = {earn_chance = 4, destroy_chance = 25, earn_amt = 10}},
    rarity = 1,
    atlas = "NeatoJokers",
    pos = { x = 3, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                card.ability.extra.earn_chance,
                card.ability.extra.destroy_chance,
                card.ability.extra.earn_amt
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
            if pseudorandom('stand') < G.GAME.probabilities.normal/card.ability.extra.earn_chance then
                return {
                    dollars = card.ability.extra.earn_amt
                }
            end
        elseif context.end_of_round and not context.repetition and not context.game_over and not context.blueprint and not context.individual then
            if pseudorandom('stand') < G.GAME.probabilities.normal/card.ability.extra.destroy_chance then
                G.E_MANAGER:add_event(Event{
                    -- mostly a copy-paste from gros michel
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event{trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true
                            end
                        })
                        return true
                    end
                })
                if G.GAME.dollars > 0 then
                    ease_dollars(-G.GAME.dollars, true)  -- if not instant=true multiple extinct copies will put you in debt due to race condition
                end
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end
}
