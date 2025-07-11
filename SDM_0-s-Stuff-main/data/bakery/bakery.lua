SMODS.ConsumableType {
    key = 'Bakery',
    collection_rows = { 5, 6 },
    primary_colour = HEX('e69138'),
    secondary_colour = HEX('ff7f00'),
    default = "c_sdm_chocolate_truffles",
}

SMODS.Bakery = SMODS.Consumable:extend({
    set = "Bakery",
    config = {center = {config = {choose = 1}}},
    cost = 4,
    can_use = function(self, card, area, copier)
        return false
    end,
    selectable_from_pack = function(self, card, pack)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {
            (G.GAME and G.GAME.used_vouchers.v_sdm_bakery_factory and card.area ~= G.consumeables and card.ability.extra.amount * 2) or card.ability.extra.amount,
            (G.GAME and G.GAME.used_vouchers.v_sdm_bakery_shop and card.area ~= G.consumeables and card.ability.extra.remaining * 2) or card.ability.extra.remaining
        }}
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff and not card.sdm_copy then
            if G.GAME and G.GAME.used_vouchers.v_sdm_bakery_shop then
                card.ability.extra.remaining = card.ability.extra.remaining * 2
            end
            if G.GAME and G.GAME.used_vouchers.v_sdm_bakery_factory then
                card.ability.extra.amount = card.ability.extra.amount * 2
            end
        end
    end,
    atlas = "sdm_bakery_consumables"
})


SMODS.load_file("data/bakery/consumables.lua")()
SMODS.load_file("data/bakery/boosters.lua")()
SMODS.load_file("data/bakery/tags.lua")()
SMODS.load_file("data/bakery/vouchers.lua")()

--Code from Betmma's Vouchers
G.FUNCS.can_pick_card = function(e)
    if #G.consumeables.cards < G.consumeables.config.card_limit then
        e.config.colour = G.C.GREEN
        e.config.button = 'pick_card'
    else
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
    end
end
G.FUNCS.pick_card = function(e)
    local c1 = e.config.ref_table
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
          c1.area:remove_card(c1)
          c1:add_to_deck()
          if c1.children.price then c1.children.price:remove() end
          c1.children.price = nil
          if c1.children.buy_button then c1.children.buy_button:remove() end
          c1.children.buy_button = nil
          remove_nils(c1.children)
          G.consumeables:emplace(c1)
          G.GAME.pack_choices = G.GAME.pack_choices - 1
          if G.GAME.pack_choices <= 0 then
            G.FUNCS.end_consumeable(nil, delay_fac)
          end
          return true
        end
    }))
end