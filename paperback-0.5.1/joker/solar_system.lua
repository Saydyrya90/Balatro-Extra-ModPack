SMODS.Joker {
  key = "solar_system",
  config = {
    extra = {
      x_mult_mod = 2,
      x_mult = 1
    }
  },
  rarity = 3,
  pos = { x = 7, y = 0 },
  atlas = "jokers_atlas",
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = nil,

  set_ability = function(self, card, initial, delay_sprites)
    -- Count total levels using the same logic as white_hole
    local total_levels = to_big(0)
    for k, v in ipairs(G.handlist) do
      if to_big(G.GAME.hands[v].level) > to_big(1) then
        -- Add the levels above 1 to the total
        total_levels = total_levels:add(to_big(G.GAME.hands[v].level):subtract(to_big(1)))
      end
    end
    
    -- Set the multiplier based on total levels
    card.ability.extra.x_mult = to_big(1):add(total_levels:multiply(to_big(card.ability.extra.x_mult_mod)))
  end,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.x_mult_mod,
        card.ability.extra.x_mult
      }
    }
  end,

  calculate = function(self, card, context)
    -- If a hand is being leveled up, recalculate the xMult bonus
    if context.paperback and context.paperback.level_up_hand then
      self:set_ability(card)
    end

    -- Gives the xMult during play
    if context.joker_main then
      -- Make sure x_mult is a big number
      local x_mult = type(card.ability.extra.x_mult) == "table" 
        and card.ability.extra.x_mult 
        or to_big(card.ability.extra.x_mult)
      
      return {
        x_mult = x_mult,
        card = card
      }
    end
  end
}