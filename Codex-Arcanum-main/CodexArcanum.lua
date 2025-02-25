CodexArcanum = SMODS.current_mod

SMODS.Atlas{ key = "modicon", px = 32, py = 32, path = "modicon.png" }

SMODS.load_file("utils/CardUtil.lua")()
SMODS.load_file("utils/Overrides.lua")()
SMODS.load_file("utils/FakeGameObjects.lua")()
SMODS.load_file("utils/UI.lua")()

CodexArcanum.pools = CodexArcanum.pools or {}
for k, _ in pairs(CodexArcanum.config.modules) do
    SMODS.load_file("data/" .. k .. ".lua")()
end
