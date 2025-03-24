-- TODO: Jeb art: Quaoar, Makemake, Sedna, Haumea

-- defs --
Buffoonery = SMODS.current_mod

-- ATLASES --
buf = {}
SMODS.Atlas {
	key = 'buf_jokers',
	path = "jokers.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'buf_special',
	path = "special.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = "buf_consumables",
	path = "consumables.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'buf_enhancements',
	path = "enhancements.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'buf_decks',
	path = "decks.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'buf_sleeves',
	path = "sleeves.png",
	px = 73,
	py = 95
}
SMODS.Atlas {
	key = 'rouletteatlas',
	path = "roulette.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'kermanatlas',
	path = "kerman.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'sayatlas',
	path = "sayajimbo.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = 'tailoratlas',
	path = "tailored.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = "modicon",
	path = "buf_icon.png",
	px = 34,
	py = 34
}
SMODS.Atlas {
	key = 'buf_stakes', 
	path = 'stakes.png', 
	px = 29, 
	py = 29
}
SMODS.Atlas {
	key = 'buf_stickers', 
	path = 'stickers.png', 
	px = 71, 
	py = 95
}

-- COMPAT SECTION --
buf.compat = {
	sleeves = (SMODS.Mods['CardSleeves'] or {}).can_load,
	unstable = (SMODS.Mods['UnStable'] or {}).can_load,
	talisman = (SMODS.Mods['Talisman'] or {}).can_load,
	bunco = (SMODS.Mods['Bunco'] or {}).can_load,
}

if not buf.compat.talisman then
	NFS.load(Buffoonery.path .. 'notalisman.lua')()
end

-- UTILS / FUNCS --
local VanillaHighlight = CardArea.add_to_highlighted -- Fix Bunco incompat with Patronizing Joker
origCalcIndiv = SMODS.calculate_individual_effect -- Save original behavior of func to global (for JokerGebra/Integral)

function expire_card(_card, msg, color) -- function to remove card with the Cavendish animation and display a message
	G.E_MANAGER:add_event(Event({
		func = function()
			if msg then SMODS.calculate_effect({message = msg, colour = color}, _card) end
			play_sound('tarot1')
			_card.T.r = -0.2
			_card:juice_up(0.3, 0.4)
			_card.states.drag.is = true
			_card.children.center.pinch.x = true
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
				func = function()
						G.jokers:remove_card(_card)
						_card:remove()
						_card = nil
					return true; 
				end})) 
			return true
		end
	}))
end

function buf_add_to_highlighted(card, silent) -- Fix Bunco incompatibility. Bunco modifies CadArea.add_to_highlighted and breaks Patronizing Joker, so I made a separate function.
    VanillaHighlight(G.hand, card, silent)
end

function buf_stake_order()
	if buf.compat.bunco then
		SMODS.Stakes.stake_bunc_cyan.order = SMODS.Stakes.stake_orange.order + 1
		SMODS.Stakes.stake_bunc_pink.order = SMODS.Stakes.stake_bunc_cyan.order + 1
	end
	SMODS.Stakes.stake_buf_prismatic.order = SMODS.Stakes.stake_gold.order + 1
	SMODS.Stakes.stake_buf_platinum.order = SMODS.Stakes.stake_buf_prismatic.order + 1
end

function buf_get_stake_order(_stake)
	local order = SMODS.Stakes[_stake].order
	return order
end


-- CONFIG --
NFS.load(Buffoonery.path .. 'mod_tabs.lua')()

-- RARITY --
SMODS.Rarity{
	key = "spc",
	loc_txt = {
		name = localize('k_buf_spc')
	},
	badge_colour = HEX('ee8f8d'),
	pools = {["Joker"] = false},
	get_weight = function(self, weight, object_type)
		return weight
	end,
}

-- JOKERS --
-- common
NFS.load(Buffoonery.path .. 'data/jokers/afan.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/cashout.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/clays.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/fivefingers.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/gfondue.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/camarosa.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/kerman.lua')()  -- (Jebediah Kerman, a.k.a. Jeb)
NFS.load(Buffoonery.path .. 'data/jokers/korny.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/laidback.lua')()
-- uncommon
NFS.load(Buffoonery.path .. 'data/jokers/denial.lua')() -- (Arstotzkan Denial)
NFS.load(Buffoonery.path .. 'data/jokers/clown.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/jokergebra.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/argument.lua')() -- (Pertinent Argument)
NFS.load(Buffoonery.path .. 'data/jokers/porcelainj.lua')() 
NFS.load(Buffoonery.path .. 'data/jokers/rerollin.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/roulette.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/sayajimbo.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/tailored.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/whitepony.lua')()
-- rare
NFS.load(Buffoonery.path .. 'data/jokers/abyssalp.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/dorkshire.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/lemmesolo.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/memcard.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/patronizing.lua')()
-- legendary
NFS.load(Buffoonery.path .. 'data/jokers/maggit.lua')()
-- special
NFS.load(Buffoonery.path .. 'data/jokers/special/afan_spc.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/integral.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/kerman_spc.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/supportive.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/van.lua')()
NFS.load(Buffoonery.path .. 'data/jokers/special/blackstallion.lua')()
-- Sleeve-Dependent Special Jokers:
if buf.compat.sleeves then
	NFS.load(Buffoonery.path .. 'data/jokers/special/memcard_dx.lua')()
	NFS.load(Buffoonery.path .. 'data/jokers/special/dorkshire_g.lua')()
end
NFS.load(Buffoonery.path .. 'data/jokers/special/abyssalecho.lua')()

-- CONSUMABLES
function conversionTarot(hand, newcenter) -- For tarots that change enhancements. Directly stolen from Kirbio's UnStable mod (with his permission, ofc. thanks, Kirbio!)
	for i=1, #hand do
		local percent = 1.15 - (i-0.999)/(#hand-0.998)*0.3
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() hand[i]:flip();play_sound('card1', percent);hand[i]:juice_up(0.3, 0.3);return true end }))
	end
	delay(0.2)
	
	for i=1, #hand do
	G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
				hand[i]:set_ability(G.P_CENTERS[newcenter])
				return true end }))
	end
	
	for i=1, #hand do
		local percent = 0.85 + (i-0.999)/(#hand-0.998)*0.3
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() hand[i]:flip();play_sound('tarot2', percent, 0.6);hand[i]:juice_up(0.3, 0.3);return true end }))
	end
	G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
	delay(0.5)
end

NFS.load(Buffoonery.path .. 'data/consumables/nobility.lua')()

-- STAKES --
NFS.load(Buffoonery.path .. 'data/stakes.lua')()

-- DECKS --
NFS.load(Buffoonery.path .. 'data/decks/galloping.lua')()
NFS.load(Buffoonery.path .. 'data/decks/jstation.lua')()
NFS.load(Buffoonery.path .. 'data/decks/porcelain.lua')()
NFS.load(Buffoonery.path .. 'data/decks/sandstone.lua')()

-- ENHANCEMENTS --
NFS.load(Buffoonery.path .. 'data/enhancements/porcelain.lua')()
NFS.load(Buffoonery.path .. 'data/enhancements/porcelain_g.lua')()

-- SLEEVES --
if buf.compat.sleeves then
	NFS.load(Buffoonery.path .. 'data/sleeves/sl_galloping.lua')()
	NFS.load(Buffoonery.path .. 'data/sleeves/sl_jstation.lua')()
	NFS.load(Buffoonery.path .. 'data/sleeves/sl_porcelain.lua')()
	NFS.load(Buffoonery.path .. 'data/sleeves/sl_sandstone.lua')()	
end

-- SOUNDS --
SMODS.Sound({key = 'phase', path = 'phase.ogg'})
SMODS.Sound({key = 'explosion', path = 'explosion.ogg'})
SMODS.Sound({key = 'roul1', path = 'roul1.ogg'})
SMODS.Sound({key = 'roul2', path = 'roul2.ogg'})
SMODS.Sound({key = 'emult', path = 'emult.wav'})  -- Sound effect by HexaCryonic
SMODS.Sound({key = 'echip', path = 'echip.wav'})  -- Sound effect by HexaCryonic

-- Gradients for XChips and EMult text
SMODS.Gradient{
	key = 'expmult',
	colours = { G.C.EMULT, G.C.RED },
    cycle = 2.6,
}
SMODS.Gradient{
	key = 'expchips',
	colours = { G.C.ECHIP, G.C.BLUE },
    cycle = 2.6,
}
loc_colour('') -- initializes args in case they're not there yet (thanks, aure!)
G.ARGS.LOC_COLOURS.expmult = SMODS.Gradients.buf_expmult
G.ARGS.LOC_COLOURS.expchips = SMODS.Gradients.buf_expchips

-- CHANGELOG MOVED TO SEPARATE .md FILE ------
-- fixed clown upgrading by 20 the first time
-- fixed clown's scaling bugging out or being lost when starting a new run
-- fixed patronizing joker not selecting cards during Cerulean Bell bossfight
-- fixed erosion not working properly with porcelain deck
-- fixed memory card / clay shooting jiggling too much
-- fixed abyssal prism not properly accounting for already-negative jokers inside it when converting the others into negatives
-- fixed abyssal prism crashing the game when continuing a run and trying to sell it
-- fixed galloping deck+sleeve showing 4 hands left before selecting a blind, instead of 2
-- abyssal prism no longer strips upgrades
-- Banish replaced with Exile
-- Nerfed Roulette: money increases with chance, starts at $15
-- Reverted Gold Fondue to $8/-$2
-- Added custom gradients for Exponential Mult and Exponential Chips
-- Corrected the outline in Adoring Fan's artwork to be pixel-perfect
-- Jebediah Kerman's artwork now dynamically changes based on last planet used. All Vanilla planets included, Bunco/Paperback planets on the way
-- Removed "Memory Card Performance Mode" as it is no longer needed
-- Special cards are now shown in collection by default
-- All jokers are now undiscovered by default
-- Added "Soul" card unlock requirement for Maggit
-- Added an unlock requirement for Galloping Deck
-- Added Van
-- Added Abyssal Echo
-- Added Kerman Reborn
-- Added Supportive Joker
-- Added Bitter Fan
-- Added Let Me Solo Her
-- Added Sayajimbo
-- added JokerGebra
-- Added Integral
-- added Palladium and Spinel stakes
-- added Sandstone Deck/Sleeve