----------------------------------------------
------------MOD CODE -------------------------

SMODS.load_file("data/main.lua")()
SMODS.load_file("data/jokers.lua")()
SMODS.load_file("data/boosters.lua")()
SMODS.load_file("data/cines.lua")()
SMODS.load_file("data/tags.lua")()
SMODS.load_file("data/backs.lua")()
SMODS.load_file("data/consumables.lua")()
SMODS.load_file("data/vouchers.lua")()
SMODS.load_file("data/atlases.lua")()
SMODS.load_file("data/shaders.lua")()

if Reverie.find_mod("JokerDisplay") and _G["JokerDisplay"] then
    SMODS.load_file("data/joker_display.lua")()
end

if Reverie.find_mod("CardSleeves") and CardSleeves.Sleeve then
    SMODS.load_file("data/sleeves.lua")()
end