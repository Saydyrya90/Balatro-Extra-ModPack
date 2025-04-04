---@meta

---@class SMODS.Enhancement: SMODS.Center
---@field super? SMODS.Center|table Parent class. 
---@field replace_base_card? boolean Don't draw base card sprite or give base chips. 
---@field no_rank? boolean Enhanced cards have no rank
---@field no_suit? boolean Enhanced cards have no suit. 
---@field any_suit? boolean Enhanced cards have all suits. 
---@field overrides_base_rank? boolean Enhancement cannot be generated by consumables. Automatically set to `true` if Enhancement has `no_rank`. 
---@field always_scores? boolean Enhanced cards always score. 
---@field weight? number Weight of the enhancement. 
---@field __call? fun(self: SMODS.Enhancement|table, o: SMODS.Enhancement|table): nil|table|SMODS.Enhancement
---@field extend? fun(self: SMODS.Enhancement|table, o: SMODS.Enhancement|table): table Primary method of creating a class. 
---@field check_duplicate_register? fun(self: SMODS.Enhancement|table): boolean? Ensures objects already registered will not register. 
---@field check_duplicate_key? fun(self: SMODS.Enhancement|table): boolean? Ensures objects with duplicate keys will not register. Checked on `__call` but not `take_ownership`. For take_ownership, the key must exist. 
---@field register? fun(self: SMODS.Enhancement|table) Registers the object. 
---@field check_dependencies? fun(self: SMODS.Enhancement|table): boolean? Returns `true` if there's no failed dependencies. 
---@field process_loc_text? fun(self: SMODS.Enhancement|table) Called during `inject_class`. Handles injecting loc_text. 
---@field send_to_subclasses? fun(self: SMODS.Enhancement|table, func: string, ...: any) Starting from this class, recusively searches for functions with the given key on all subordinate classes and run all found functions with the given arguments. 
---@field pre_inject_class? fun(self: SMODS.Enhancement|table) Called before `inject_class`. Injects and manages class information before object injection. 
---@field post_inject_class? fun(self: SMODS.Enhancement|table) Called after `inject_class`. Injects and manages class information after object injection. 
---@field inject_class? fun(self: SMODS.Enhancement|table) Injects all direct instances of class objects by calling `obj:inject` and `obj:process_loc_text`. Also injects anything necessary for the class itself. Only called if class has defined both `obj_table` and `obj_buffer`. 
---@field inject? fun(self: SMODS.Enhancement|table, i?: number) Called during `inject_class`. Injects the object into the game. 
---@field take_ownership? fun(self: SMODS.Enhancement|table, key: string, obj: SMODS.Enhancement|table, silent?: boolean): nil|table|SMODS.Enhancement Takes control of vanilla objects. Child class must have get_obj for this to function
---@field get_obj? fun(self: SMODS.Enhancement|table, key: string): SMODS.Enhancement|table? Returns an object if one matches the `key`. 
---@field get_weight? fun(self: SMODS.Enhancement|table): number? Used to modify the weight of the Enhancement. 
---@overload fun(self: SMODS.Enhancement): SMODS.Enhancement
SMODS.Enhancement = setmetatable({}, {
    __call = function(self)
        return self
    end
})

---@param self Card|table
---@param context CalcContext|table
---@return table?
--- Calculates Enhancements on cards. 
function Card:calculate_enhancement(context) end

---@param args table|{key?: string, type_key?: string, mod?: number, guaranteed?: true, options?: table}
---@return string?
--- Polls all Enhancements with `args` for additional settings, and returns the key to a selected enhancement. 
function SMODS.poll_enhancement(args) end
