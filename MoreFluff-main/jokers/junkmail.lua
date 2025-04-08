local joker = {
  name = "Junk Mail",
  config = { 
    val_mult = 1.5,
  },
  pos = {x = 2, y = 6},
  rarity = 2,
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  loc_vars = function(self, info_queue, center)
    return {
      vars = { center.ability.val_mult }
    }
  end,
  calculate = function(self, card, context)
    if context.mf_add_voucher then
      local voucher_key = get_next_voucher_key(true)
      G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
      local new_card = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2,
      G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[voucher_key],{bypass_discovery_center = true, bypass_discovery_ui = true})

      new_card.bonus_cost = (new_card.cost) * (card.ability.val_mult - 1)
      new_card:set_cost()

      create_shop_card_ui(new_card, 'Voucher', G.shop_vouchers)
      new_card:start_materialize()
      G.shop_vouchers:emplace(new_card)
      return {
        message = localize('k_plus_voucher')
      }
    end
  end
}

return joker
