CodexArcanum.FakeCard = SMODS.Center:extend{
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 0 },
    legendaries = {},
    config = {},
    set = "Consumeables",
    required_params = {
        "loc_set",
        "key",
    },
    inject = function(self)
        SMODS.Center.inject(self)
        if self.type and self.type.inject_card and type(self.type.inject_card) == "function" then
            self.type:inject_card(self)
        end
    end,
    delete = function(self)
        if self.type and self.type.delete_card and type(self.type.delete_card) == "function" then
            self.type:delete_card(self)
        end
        SMODS.Consumable.super.delete(self)
    end,
    create_fake_card = function(self)
        local ret = SMODS.Center.create_fake_card(self)
        ret.ability.consumeable = copy_table(self.config)
        return ret
    end,
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    process_loc_text = function(self)
        SMODS.process_loc_text(G.localization.descriptions[self.loc_set], self.key, self.loc_txt)
    end
}

CodexArcanum.FakeBooster = SMODS.Center:extend{
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 0 },
    config = {},
    loc_txt = {},
    class_prefix = "p",
    set = "Consumeables",
    required_params = {
        "key",
    },
    process_loc_text = function(self)
        SMODS.process_loc_text(G.localization.descriptions.Other, self.key, self.loc_txt)
        SMODS.process_loc_text(G.localization.misc.dictionary, "k_booster_group_" .. self.key, self.loc_txt, "group_name")
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if not card then
            card = self:create_fake_card()
        end
        local target = {
            type = "other",
            key = self.key,
            nodes = desc_nodes,
            vars = {}
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == "function" then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
            target.scale = res.scale
            target.text_colour = res.text_colour
        end
        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            full_UI_table.name = localize{ type = "name", set = "Other", key = res.name_key or target.key, nodes = full_UI_table.name, vars = res.name_vars or target.vars or {} }
        elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
            desc_nodes.name = localize{ type = "name_text", key = res.name_key or target.key, set = "Other" }
        end
        localize(target)
        desc_nodes.background_colour = res.background_colour
    end,
}

CodexArcanum.FakeTag = SMODS.GameObject:extend{
    obj_table = SMODS.Tags,
    obj_buffer = {},
    required_params = {
        "key",
    },
    discovered = false,
    min_ante = nil,
    atlas = "tags",
    class_prefix = "tag",
    set = "Tag",
    pos = { x = 0, y = 0 },
    config = {},
    process_loc_text = function(self)
        SMODS.process_loc_text(G.localization.descriptions.Tag, self.key, self.loc_txt)
    end,
    inject = function(self)
        SMODS.insert_pool(G.P_CENTER_POOLS[self.set], self)
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if not card then
            card = { config = copy_table(self.config), fake_tag = true }
        end
        local target = {
            type = "descriptions",
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            vars = specific_vars
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == "function" then
            -- card is actually a `Tag` here
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
            target.set = res.set or target.set
            target.scale = res.scale
            target.text_colour = res.text_colour
        end
        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            full_UI_table.name = localize{ type = "name", set = target.set, key = res.name_key or target.key, nodes = full_UI_table.name, vars = res.name_vars or res.vars or {} }
        elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
            desc_nodes.name = localize{ type = "name_text", key = res.name_key or target.key, set = target.set }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end
        localize(target)
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end
        desc_nodes.background_colour = res.background_colour
    end
}
