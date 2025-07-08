return {
	["misc"] = {
		["dictionary"] = {
		
			--Config Stuff
		
			["unstb_config_requires_restart"] = "Requires Restart to Apply Effects",
			
			["unstb_config_header_mech_setting"] = "Mechanics Settings",
			
			["unstb_config_header_rank"] = "Rank",
			["unstb_config_rank21"] = "High-Numbered Ranks",
			["unstb_config_rank_bi"] = "Rank 0 and 1",
			["unstb_config_rank_decimal"] = "Decimal Ranks",
		
			["unstb_config_header_enh"] = "Enhancement",
			["unstb_config_enh_custom"] = "New Enhancement",
			["unstb_config_enh_disenh"] = "Unhancement",
			
			["unstb_config_header_mechanics"] = "New Mechanics",
			["unstb_config_mech_upgrade"] = "Edition Upgrade",
			["unstb_config_mech_suitseal"] = "Suit and Face Seal",
			["unstb_config_mech_aux"] = "Auxiliary Card",
			["unstb_config_mech_music"] = "Custom Music",
			["unstb_config_mech_fallback"] = "Fallback Spectrals",
			["unstb_config_mech_fallback_desc"] = {
				"Contains same feature as Auxiliary Card, ",
				"recommended to turn on if Auxiliary Card is turned off",
			},
			["unstb_config_mech_new_spectral"] = "New Spectral Cards",
			
			["unstb_config_header_joker_settings"] = "Joker Settings",
			
			--Extra Flavour Badge Text
			["k_tarot_exclaim"] = "Tarot!?",
			
			["k_blueprint_l_compatible"] = "Left: compatible",
			["k_blueprint_l_incompatible"] = "Left: incompatible",
			["k_blueprint_r_compatible"] = "Right: compatible",
			["k_blueprint_r_incompatible"] = "Right: incompatible",
			
			--Auxiliary Card stuff
			--Category Name
			["k_auxiliary"] = "Auxiliary",
			
			--Gallery Button
			["b_auxiliary_cards"] = "Auxiliary Cards", 
			
			--Booster Packs
			["k_booster_group_p_unstb_aux_1"] = "Expansion Pack",
			["k_booster_group_p_unstb_aux_2"] = "Expansion Pack",
			["k_booster_group_p_unstb_aux_mega"] = "Expansion Pack",
			["k_booster_group_p_unstb_aux_jumbo"] = "Expansion Pack",
			
			["k_booster_group_p_unstb_prem_1"] = "Premium Standard Pack",
			["k_booster_group_p_unstb_prem_2"] = "Premium Standard Pack",
			["k_booster_group_p_unstb_prem_mega"] = "Premium Standard Pack",
			["k_booster_group_p_unstb_prem_jumbo"] = "Premium Standard Pack",
		},
		["ranks"] = {
		
			["unstb_21"] = "21",
			["unstb_???"] = "???",
		
			["unstb_0"] = "0",
			["unstb_1"] = "1",
		
			["unstb_0.5"] = "Half",
			["unstb_r2"] = "Root 2",
			["unstb_e"] = "e",
			["unstb_Pi"] = "Pi",
			
			["unstb_11"] = "11",
			["unstb_12"] = "12",
			["unstb_13"] = "13",
			["unstb_25"] = "25",
			["unstb_161"] = "161",
			
		},
		["labels"] = {
		
			["unstb_spades_seal"] = "Spade Seal",
			["unstb_hearts_seal"] = "Heart Seal",
			["unstb_clubs_seal"] = "Club Seal",
			["unstb_diamonds_seal"] = "Diamond Seal",
			
			["unstb_face_seal"] = "Face Seal",
			["unstb_heal_seal"] = "Heal Seal",
			
		},
	},
	["descriptions"] = {
	
		["Back"] = {
		
			["b_unstb_utility"] = {
				["name"] = "Utility Deck",
				["text"] = {
					"Start run with the",
					"{C:auxiliary}Hardware Store{} voucher",
					"and {C:attention}1{} copy of {C:auxiliary}The Question{},",
					"{C:auxiliary}Auxiliary Cards{} can appear",
					"in the {C:attention}shop{} more often",
				},
			},
			
			["b_unstb_lowkey"] = {
				["name"] = "Lowkey Deck",
				["text"] = {
					"Start run with only",
					"{C:attention}rank 0-5{} cards",
					"and all {C:attention}decimal",
					"{C:attention}ranks{} in between",
				},
			},
			
		},
		
		["Sleeve"] = {
		
			["sleeve_unstb_utility"] = {
				["name"] = "Utility Sleeve",
				["text"] = {
					"Start run with the",
					"{C:auxiliary}Hardware Store{} voucher",
					"and {C:attention}1{} copy of {C:auxiliary}The Question{},",
					"{C:auxiliary}Auxiliary Cards{} can appear",
					"in the {C:attention}shop{} more often",
				},
			},
			
			["sleeve_unstb_utility_alt"] = {
				["name"] = "Utility Sleeve",
				["text"] = {
					"Start run with the",
					"{C:auxiliary}Heavy Duty Tools{} voucher",
					"and a {C:dark_edition}Negative{} {C:attenttion}Free Trial{}",
				},
			},
			
			["sleeve_unstb_lowkey"] = {
				["name"] = "Lowkey Sleeve",
				["text"] = {
					"Start run with only",
					"{C:attention}rank 0-5{} cards",
					"and all {C:attention}decimal",
					"{C:attention}ranks{} in between",
				},
			},
			
			["sleeve_unstb_lowkey_alt"] = {
				["name"] = "Lowkey Sleeve",
				["text"] = {
					"Card with rank higher than",
					"{C:attention}5{} cannot appear in the run",
				},
			},
			
		},
		
		["Other"] = {
			
			--Playing Card Ability Text
			
			["no_chip"] = {
				["text"] = {
					"No chips",
				},
			},
			["decimal_rank_ability"] = {
				["text"] = {
					"Can act as {C:attention}different rank{}",
					"when played in {C:purple}Straight{} hand",
					"{C:inactive}[#1#, #2#, #3#]{}",
				},
			},
			["decimal_rank_ability_2"] = {
				["text"] = {
					"Can act as {C:attention}different rank{}",
					"when played in {C:purple}Straight{} hand",
					"{C:inactive}[#1#, #2#]{}",
				},
			},
			
			-- Other Mechanics
			
			["upgrade_edition"] = {
				["name"] = "Upgrade Edition",
				["text"] = {
					"Change the card's {C:attention}edition{}",
					"by {C:attention}1{} step from",
					"{C:inactive}(None){} -> {C:dark_edition}Foil{} ->",
					"{C:dark_edition}Hologram{} -> {C:dark_edition}Polychrome{}",
				},
			},
			
			["disenhancement"] = {
				["name"] = "Unhancement",
				["text"] = {
					"Enhancement that have",
					"negative effects",
					"{C:attention}(Radioactive, Biohazard, Poison){}",
				},
			},
			
			--Extra Tooltip for description that does not lend itself well in tooltip form
			
			["acorn_tooltip"] = {
				["name"] = "Acorn Mark Card",
				["text"] = {
					"Gives {C:chips}double amount{}",
					"of chips when in hand,",
					"does not give any chips when scored",
				},
			},
			["resource_tooltip"] = {
				["name"] = "Resource Card",
				["text"] = {
					"Has no rank, always scored.",
					"Gives {X:mult,C:white}X5{} Mult",
					"if the played hand has at least",
					"one card with {C:attention}(Corresponding Suit){} suit",
					"{C:red}Destroys itself after scored{}",
					"{C:inactive}(Does not count other Resource Cards){}",
				},
			},
			["poison_tooltip"] = {
				["name"] = "Poison Card",
				["text"] = {
					"Gives {C:red}negative amount{} of chips,",
					"discarded {C:attention}Poison Cards{}",
					"go back into the deck",
				},
			},
			
			--Seal
			
			["suit_seal"] = {
				["name"] = "Suit Seal",
				["label"] = "Suit Seal",
				["text"] = {
					"Makes the card also",
					"count as {C:attention}(Respective Suit){}",
				},
			},
			["unstb_spades_seal"] = {
				["name"] = "Spade Seal",
				["label"] = "Spade Seal",
				["text"] = {
					"This card also",
					"counts as {V:1}#1#{}",
				},
			},
			["unstb_hearts_seal"] = {
				["name"] = "Heart Seal",
				["label"] = "Heart Seal",
				["text"] = {
					"This card also",
					"counts as {V:1}#1#{}",
				},
			},
			["unstb_clubs_seal"] = {
				["name"] = "Club Seal",
				["label"] = "Club Seal",
				["text"] = {
					"This card also",
					"counts as {V:1}#1#{}",
				},
			},
			["unstb_diamonds_seal"] = {
				["name"] = "Diamond Seal",
				["label"] = "Diamond Seal",
				["text"] = {
					"This card also",
					"counts as {V:1}#1#{}",
				},
			},
			["unstb_face_seal"] = {
				["name"] = "Face Seal",
				["label"] = "Face Seal",
				["text"] = {
					"This card also",
					"counts as {C:attention}face{} card",
				},
			},
			["unstb_heal_seal"] = {
				["name"] = "Heal Seal",
				["label"] = "Heal Seal",
				["text"] = {
					"Removes {C:red}Unhancement{} from one",
					"random card held in hand when scored.",
					"This card also cannot be {C:red}Unhanced{}.",
				},
			},
			
			--Auxiliary Card-related stuff
			
			["undiscovered_auxiliary"] = {
				["name"] = "Not Discovered",
				["text"] = {
					"Purchase or use",
					"this card in an",
					"unseeded run to",
					"learn what it does",
				},
			},
			
			["p_unstb_aux_1"] = {
				["group_name"] = "Expansion Pack",
				["name"] = "Expansion Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:auxiliary} Auxiliary{} cards to",
					"add to your consumable area",
				},
			},
			["p_unstb_aux_2"] = {
				["group_name"] = "Expansion Pack",
				["name"] = "Expansion Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:auxiliary} Auxiliary{} cards to",
					"add to your consumable area",
				},
			},
			["p_unstb_aux_mega"] = {
				["group_name"] = "Expansion Pack",
				["name"] = "Mega Expansion Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:auxiliary} Auxiliary{} cards to",
					"add to your consumable area",
				},
			},
			["p_unstb_aux_jumbo"] = {
				["group_name"] = "Expansion Pack",
				["name"] = "Jumbo Expansion Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:auxiliary} Auxiliary{} cards to",
					"add to your consumable area",
				},
			},
			
			["p_unstb_prem_1"] = {
				["group_name"] = "Premium Standard Pack",
				["name"] = "Premium Standard Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:attention} Enhanced Playing{} cards with",
                    "{C:attention}special rank{} to add to your deck"
				},
			},
			["p_unstb_prem_2"] = {
				["group_name"] = "Premium Standard Pack",
				["name"] = "Premium Standard Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:attention} Enhanced Playing{} cards with",
                    "{C:attention}special rank{} to add to your deck"
				},
			},
			["p_unstb_prem_mega"] = {
				["group_name"] = "Premium Standard Pack",
				["name"] = "Mega Premium Standard Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:attention} Enhanced Playing{} cards with",
                    "{C:attention}special rank{} to add to your deck"
				},
			},
			["p_unstb_prem_jumbo"] = {
				["group_name"] = "Premium Standard Pack",
				["name"] = "Jumbo Premium Standard Pack",
				["text"] = {
					"Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:attention} Enhanced Playing{} cards with",
                    "{C:attention}special rank{} to add to your deck"
				},
			},
		},
		
		["Spectral"] = {
			
			--Fallback Spectral Cards
			
			["c_unstb_spc_elixir"] = {
				["name"] = "Elixir of Life",
				["text"] = {
					"Heal all {C:red}Unhanced Cards{} in the deck",
					"Reduce money by half {C:inactive}(rounded up){}",
				},
			},
			["c_unstb_spc_vessel"] = {
				["name"] = "Vessel",
				["text"] = {
					"Select up to {C:attention}#1#{} cards,",
					"destroy the {C:attention}leftmost{} card",
					"and give the corresponding {C:red}Suit Seal{}",
					"to all {C:attention}remaining{} cards",
					"{C:inactive}(Drag to rearrange){}",
				},
			},
			["c_unstb_spc_conferment"] = {
				["name"] = "Conferment",
				["text"] = {
					"Add a {C:attention}Face Seal{}",
					"to {C:attention}#1#{} random cards",
					"in your hand,",
					"{C:red}-$#2#{} {C:inactive}(no debt limit){}",
				},
			},
			["c_unstb_spc_amnesia"] = {
				["name"] = "Amnesia",
				["text"] = {
					"Converts {C:attention}#1#{} random",
					"cards in your hand",
					"to {C:attention}Rank 0{}",
				},
			},
			["c_unstb_spc_altar"] = {
				["name"] = "Altar",
				["text"] = {
					"Destroy {C:attention}#1#{} random",
					"cards in your hand,",
					"add {C:attention}#2#{} random {C:attention}Enhanced{}",
					"{C:attention}21s{} to your hand",
				},
			},
			["c_unstb_spc_contract"] = {
				["name"] = "Devil's Contract",
				["text"] = {
					"{C:purple}Upgrades {C:attention}#1#{} random",
					"card in your hand",
					"Randomly {C:red}unhances {C:attention}#2#{}",
					"random cards in your hand",
				},
			},
			
			--Other New Spectral Cards
			
			["c_unstb_spc_poltergeist"] = {
				["name"] = "Poltergeist",
				["text"] = {
					"Shuffles all",
					"Jokers' {C:dark_edition}editions{}",
				},
			},
			["c_unstb_spc_projection"] = {
				["name"] = "Astral Projection",
				["text"] = {
					"Swap {C:dark_edition}editions{} between",
					"the {C:attention}selected Joker{}",
					"and the one {C:attention}to its right{}",
					"{C:green}#1# in #2#{} chance that",
					"one of the Jokers are {C:red}destroyed{}",
				},
			},
			["c_unstb_spc_siphon"] = {
				["name"] = "Siphon",
				["text"] = {
					"Destroys {C:attention}1{} selected {C:attention}Joker{}",
					"with an {C:dark_edition}edition{}",
					"Gives the {C:attention}Joker's {C:dark_edition}edition{} to",
					"{C:attention}#1#{} random card in your hand",
					"{C:inactive}({C:dark_edition}Negative{} {C:inactive}excluded){}",
				},
			},
		},
		
		["Tarot"] = {
			
			--Enhancement Conversion Tarot
		
			["c_unstb_trt_time"] = {
				["name"] = "Time",
				["text"] = {
					"Enhances {C:attention}#1#{} ",
					"selected cards to",
					"{C:attention}Vintage Cards{}",
				},
			},
			["c_unstb_trt_acorn"] = {
				["name"] = "The Acorn",
				["text"] = {
					"Enhances {C:attention}#1#{} selected",
					"card into an",
					"{C:attention}Acorn Mark Card{}",
				},
			},
			["c_unstb_trt_greed"] = {
				["name"] = "Greed",
				["text"] = {
					"Enhances {C:attention}#1#{} ",
					"selected cards to",
					"{C:attention}Promo Cards{}",
				},
			},
			
			--Rank-addition Tarot
			
			["c_unstb_trt_half"] = {
				["name"] = "The Half",
				["text"] = {
					"Splits {C:attention}1{} selected {C:attention}integer-numbered rank{} card",
					"into {C:attention}2{} cards with {C:attention}half the rank{} (rounded down).",
					"If the initial rank is {C:attention}odd{}, also adds {C:attention}1{}",
					"{C:attention}0.5 rank{} card of the same {C:attention}enhancement{}.",
				},
			},
			["c_unstb_trt_knowledge"] = {
				["name"] = "Knowledge",
				["text"] = {
					"Adds one random {C:attention}decimal-rank{} card",
					"of {C:attention}1{} selected card's suit to hand",
				},
			},
			
		},
		
		["Enhanced"] = {
			
			--Standard Enhancement
			
			["m_unstb_vintage"] = {
				["name"] = "Vintage Card",
				["text"] = {
					"Gains {C:chips}+#1#{} extra chips when scored",
					"{C:green}#2# in #3#{} chance to destroy itself",
					"{C:inactive}Chance increases by {C:green}+#4#{C:inactive} when scored{}",
				},
			},
			["m_unstb_acorn"] = {
				["name"] = "Acorn Mark Card",
				["text"] = {
					"Gives {C:chips}+#1#{} chips when in hand,",
					"does not give any chips when scored",
				},
			},
			["m_unstb_promo"] = {
				["name"] = "Promo Card",
				["text"] = {
					"Gives {C:gold}$#1#{} while this card stays in hand",
					"Gains {C:gold}+$#2#{} when scored",
					"{C:green}#3# in #4#{} chance to destroy when scored",
				},
			},
			
			--Special Joker-centric Enhancement
			
			["m_unstb_resource"] = {
				["name"] = "Resource Card",
				["text"] = {
					"Has no rank, always scored.",
					"Gives {X:mult,C:white}X#1#{} Mult",
					"if the played hand has at least",
					"one card with {V:1}#2#{} suit",
					"{C:red}Destroys itself after scored{}",
					"{C:inactive}(Does not count other Resource Cards){}",
				},
			},
			["m_unstb_slop"] = {
				["name"] = "Slop Card",
				["text"] = {
					"{C:chips}+#1#{} chips",
					"Always scored",
					"Random suit and rank after scored",
					"Current: {C:attention}#3#{} of {V:1}#2#{}",
				},
			},
			
			--Unhancements
			
			["m_unstb_radioactive"] = {
				["name"] = "Radioactive Card",
				["text"] = {
					"{C:chips}+#1#{} Chips, no rank or suit",
					"When played, {C:green}#2# in #3#{} chance to",
					"convert other played cards to {C:attention}Radioactive Cards{}",
					"",
					"When held in hand, {C:green}#2# in #4#{} chance to give",
					"{X:mult,C:white}X#5#{} Mult, otherwise gives {X:mult,C:white}X#6#{} Mult",
				},
			},
			["m_unstb_biohazard"] = {
				["name"] = "Biohazard Card",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult, no rank or suit",
					"Lose {C:red}-$#2#{} while this card stays in hand",
					"When discarded, {C:green}#3# in #4#{} chance to turn one random",
					"card in the deck into {C:attention}Biohazard Card{}",
				},
			},
			["m_unstb_poison"] = {
				["name"] = "Poison Card",
				["text"] = {
					"{C:red}-#1#{} Chips",
					"Goes back into deck",
					"when discarded",
				},
			},
		},
		
		["Auxiliary"] = {
			
			["c_unstb_aux_spades"] = {
				["name"] = "Essence of Spades",
				["text"] = {
					"Add {V:1}#2#{} to",
					"{C:attention}#1#{} selected cards",
					"in your hand",
				},
			},
			["c_unstb_aux_hearts"] = {
				["name"] = "Essence of Hearts",
				["text"] = {
					"Add {V:1}#2#{} to",
					"{C:attention}#1#{} selected cards",
					"in your hand",
				},
			},
			["c_unstb_aux_clubs"] = {
				["name"] = "Essence of Clubs",
				["text"] = {
					"Add {V:1}#2#{} to",
					"{C:attention}#1#{} selected cards",
					"in your hand",
				},
			},
			["c_unstb_aux_diamonds"] = {
				["name"] = "Essence of Diamonds",
				["text"] = {
					"Add {V:1}#2#{} to",
					"{C:attention}#1#{} selected cards",
					"in your hand",
				},
			},
			
			["c_unstb_aux_face"] = {
				["name"] = "Possessions",
				["text"] = {
					"Add a {C:attention}Face Seal{}",
					"to {C:attention}#1#{} selected cards",
					"in your hand",
				},
			},
			
			["c_unstb_aux_plus_two"] = {
				["name"] = "+2",
				["text"] = {
					"Creates {C:attention}#1#{} cards in",
					"your hand with a random",
					"{C:attention}rank{} and the same {C:attention}suit{}",
					"as the selected card",
				},
			},
			["c_unstb_aux_plus_four_wild"] = {
				["name"] = "Wild +4",
				["text"] = {
					"Creates {C:attention}#1#{} cards in",
					"your hand with a random",
					"{C:attention}suit{} and the same {C:attention}rank{}",
					"as the selected card",
				},
			},
			
			["c_unstb_aux_inst_disc"] = {
				["name"] = "The Past",
				["text"] = {
					"{C:red}+#1#{} discards this round",
				},
			},
			["c_unstb_aux_inst_hsize"] = {
				["name"] = "The Present",
				["text"] = {
					"{C:attention}+#1#{} hand size this round",
				},
			},
			["c_unstb_aux_inst_hand"] = {
				["name"] = "The Future",
				["text"] = {
					"{C:blue}+#1#{} hands this round",
				},
			},
			
			["c_unstb_aux_seal_move"] = {
				["name"] = "Seal Exchange",
				["text"] = {
					"Swap {C:attention}seals{} between",
					"{C:attention}2{} selected cards",
				},
			},
			
			["c_unstb_aux_conv_1"] = {
				["name"] = "All for One",
				["text"] = {
					"Converts rank of",
					"up to {C:attention}#1#{} selected",
					"cards to {C:attention}1{}",
				},
			},
			
			["c_unstb_aux_21"] = {
				["name"] = "The Twenty-One",
				["text"] = {
					"Select up to {C:attention}#1#{} cards",
					"with total rank of {C:attention}21 or more{}.",
					"Destroys all selected cards and creates one",
					"{C:attention}rank 21{} card of a random suit.",
				},
			},
			
			["c_unstb_aux_upgrade"] = {
				["name"] = "Monkey Paw",
				["text"] = {
					"{C:purple}Upgrades {C:attention}1{} selected card's {C:attention}edition{}",
					"Turns adjacent cards into {C:attention}Poison Cards{}",
					"{C:inactive}(Loops around hand edges){}",
				},
			},
			
			["c_unstb_aux_heal"] = {
				["name"] = "Heal Guardian",
				["text"] = {
					"Add a {C:attention}Heal Seal{}",
					"to {C:attention}#1#{} selected",
					"card in your hand",
				},
			},
			["c_unstb_aux_heal_hand"] = {
				["name"] = "Heal Aura",
				["text"] = {
					"Heal all",
					"{C:red}Unhanced Cards{}",
					"in your hand",
				},
			},
			
			["c_unstb_aux_lottery"] = {
				["name"] = "Lottery",
				["text"] = {
					"{C:green}#1# in #2#{} chance",
					"to win {C:gold}$#3#{}",
				},
			},
			
			["c_unstb_aux_blank"] = {
				["name"] = "Blank Card",
				["text"] = {
					"Does nothing..?",
				},
			},
			["c_unstb_aux_dark_matter"] = {
				["name"] = "Dark Matter",
				["text"] = {
					"Permanently gain",
					"{C:dark_edition}+#1#{} Joker slot",
					"{C:red}Cannot be Negative",
				},
			},
			["c_unstb_aux_dark_matter_n"] = {
				["name"] = "Dark Matter..?",
				["text"] = {
					"Permanently gain",
					"{C:red}-#1#{} Joker slot",
				},
			},
			
			["c_unstb_aux_random"] = {
				["name"] = "The Question",
				["text"] = {
					"Creates up to {C:attention}#1#{}",
					"random {C:auxiliary}Auxiliary{} cards",
					"{C:inactive}(Must have room)",
				},
			},
		},
		
		["Voucher"] = {
		
			["v_unstb_aux1"] = {
				["name"] = "Hardware Store",
				["text"] = {
					"{C:auxiliary}Auxiliary{} cards",
					"can be purchased",
					"from the {C:attention}shop{}",
				},
			},
			
			["v_unstb_aux2"] = {
				["name"] = "Heavy Duty Tools",
				["text"] = {
					"{C:auxiliary}Auxiliary{} cards in",
					"{C:attention}Expansion Packs{} can",
					"sometimes be {C:dark_edition}Negative{}",
				},
			},
			
		},
		
		["Joker"] = {
			--Basic Common Jokers
			
			["j_unstb_lunar_calendar"] = {
				["name"] = "Lunar Calendar",
				["text"] = {
					"Played cards with",
					"{V:1}#1#{} suit have",
					"{C:green}#2# in #3#{} chance to create a",
					"random {C:planet}Planet{} card when scored",
					"{C:inactive}(Must have room)",
					"{s:0.8}Suit changes at the end of the round",
				},
			},
			
			["j_unstb_dragon_hoard"] = {
				["name"] = "Dragon Hoard",
				["text"] = {
					"Gives {C:mult}+#1#{} Mult for",
					"every {C:attention}#2#{} {C:attention}consumables{}",
					"in your {C:attention}consumable{} area",
					"{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
				},
			},
			
			["j_unstb_card_dealer"] = {
				["name"] = "Card Dealer",
				["text"] = {
					"{C:chips}+#1#{} Chips per {C:attention}played{}",
					"cards this round",
					"{C:attention}Resets{} at the end",
					"of the round",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
				},
			},
			
			["j_unstb_match_three"] = {
				["name"] = "Match Three",
				["text"] = {
					"{C:mult}+#1#{} Mult if played hand contains",
					"{C:attention}#2#{} or more adjacent cards",
					"with the {C:attention}same base suit{}",
				},
			},
			
			--Extra Uncommons
			
			["j_unstb_furry_joker"] = {
				["name"] = "Furry Joker",
				["text"] = {
					"Played {C:attention}Wild Cards{} have",
					"{C:green}#1# in #2#{} chance to",
					"turn {C:dark_edition}Polychrome{} when scored",
				},
			},
			
			["j_unstb_luxurious_handbag"] = {
				["name"] = "Luxurious Handbag",
				["text"] = {
					"{C:attention}+#1#{} consumable slot",
					"{C:red}Raises prices{} of everything in the",
					"{C:attention}shop{} (except reroll) by {C:gold}$#2#{}",
				},
			},
			
			["j_unstb_portal"] = {
				["name"] = "Portal",
				["text"] = {
					"{C:attention}Aces{} can be used in the",
					"middle of a {C:purple}Straight{} hand",
					"{C:inactive}(Ex: 3, 2, Ace, King, Queen)",
				},
			},
			
			--Suit Seal Support
			
			["j_unstb_vainglorious_joker"] = {
				["name"] = "Vainglorious Joker",
				["text"] = {
					"Played cards with",
					"{C:attention}Suit Seal{} give",
					"{C:attention}+#1#{} Mult when scored",
				},
			},
			
			["j_unstb_acedia_joker"] = {
				["name"] = "Acedia Joker",
				["text"] = {
					"Played cards with",
					"{C:attention}Suit Seal{} in the same",
					"{C:purple}suit category{} as the card's suit",
					"give {C:attention}+#1#{} Mult when scored",
				},
			},
			
			["j_unstb_cinnabar"] = {
				["name"] = "Cinnabar",
				["text"] = {
					"Played cards with {C:attention}Suit Seal{} have",
					"{C:green}#1# in #2#{} chance to create respective",
					"{C:auxiliary}Seal Auxiliary{} Card when scored",
					"{C:inactive}(Must have room)",
				},
			},
			
			--Auxiliary Support
			
			["j_unstb_free_trial"] = {
				["name"] = "Free Trial",
				["text"] = {
					"{C:green}#1# in #2#{} chance to create",
					"a {C:dark_edition}Negative{} random {C:auxiliary}Auxiliary{} Card",
					"when an {C:auxiliary}Auxiliary{} Card is used",
				},
			},
			
			["j_unstb_extended_warranty"] = {
				["name"] = "Extended Warranty",
				["text"] = {
					"{C:auxiliary}Auxiliary{} Cards in",
					"your {C:attention}consumable{} area",
					"give {X:mult,C:white}X#1#{} Mult",
				},
			},
			
			["j_unstb_technician"] = {
				["name"] = "Technician",
				["text"] = {
					"{C:chips}+#1#{} Chips per",
					"{C:auxiliary}Auxiliary{} Card",
					"used this run",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips){}",
				},
			},
			
			["j_unstb_season_pass"] = {
				["name"] = "Season Pass",
				["text"] = {
					"{C:green}#1# in #2#{} chance to create",
					"a random {C:auxiliary}Auxiliary{} Card",
					"when discarding a {C:attention}face{} card",
					"{C:inactive}(Must have room)",
				},
			},
			
			--Rank 21
			
			["j_unstb_black_jack"] = {
				["name"] = "Black Jack",
				["text"] = {
					"This Joker gains {C:chips}Chips{} equal to {C:attention}total rank{}",
					"of the scored hand if it is under {C:attention}#1#{}.",
					"{C:red}Doubles all chips{} if the {C:attention}total rank{} is exactly {C:attention}#1#{}.",
					"Resets if the total rank is more than {C:attention}#1#{}.",
					"{s:0.8}Resets at the end of Boss Blind",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
				},
			},
			
			["j_unstb_what"] = {
				["name"] = "What",
				["text"] = {
					"Played {C:attention}???{}",
					"give {C:chips}+#1#{} Chips and",
					"{C:mult}+#2#{} Mult when scored",
				},
			},
			
			--Decimal Rank
			
			["j_unstb_floating_point_error"] = {
				["name"] = "Floating-Point Error",
				["text"] = {
					"Every played {C:attention}Decimal Rank{} card",
					"permanently gains {C:chips}extra chips{}",
					"equal to its own {C:attention}rank{}",
				},
			},
			
			["j_unstb_academic_journal"] = {
				["name"] = "Academic Journal",
				["text"] = {
					"Adds one random {C:attention}Enhanced Card{}",
					"with {C:attention}decimal rank{} to deck if",
					"scored hand does not have a {C:attention}face{} card",
					"{C:inactive}({C:red}#1#{C:inactive} times per round, {C:red}#2# left{C:inactive})",
				},
			},
			
			["j_unstb_engineer"] = {
				["name"] = "Engineer",
				["text"] = {
					"Cards with {C:attention}decimal ranks{} count as",
					"the nearest {C:attention}integer rank{} rounded up when",
					"played in non-{C:purple}Straight{} hands",
					"{C:inactive}(EX: 3.14 -> 4)",
				},
			},
			
			["j_unstb_thesis_proposal"] = {
				["name"] = "Thesis Proposal",
				["text"] = {
					"Retrigger all",
					"{C:attention}decimal rank{} cards",
					"{C:attention}#1#{} additional times",
				},
			},
			
			["j_unstb_rainbow_flag"] = {
				["name"] = "Rainbow Flag",
				["text"] = {
					"If a hand containing {C:purple}Straight{} has",
					"at least 1 {C:attention}decimal rank{} card,",
					"{C:green}#1# in #2#{} chance to turn",
					"one of the cards {C:dark_edition}Polychrome{}",
				},
			},
			
			--Binary Ranks
			
			["j_unstb_dummy_data"] = {
				["name"] = "Dummy Data",
				["text"] = {
					"For each {C:attention}unscored card{}",
					"{C:green}#1# in #2#{} chance to",
					"convert its rank to {C:attention}0{}",
					"(Retains amount of Chips)",
				},
			},
			
			["j_unstb_micro_sd_card"] = {
				["name"] = "Micro SD Card",
				["text"] = {
					"If this Joker is in the {C:attention}leftmost position{},",
					"take all Chips from discarded base {C:attention}numbered cards{}",
					"and strip those cards' ranks to {C:attention}0{}",
					"{C:green}#1# in #2#{} chance to destroy itself at the end of round",
					"Chance increases by the amount of Chips stored",
					"{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips)",
					"{C:inactive}Status: {V:1}#5#{}",
				},
			},
			
			["j_unstb_social_experiment"] = {
				["name"] = "Social Experiment",
				["text"] = {
					"For each scored {C:attention}non-face card{}",
					"with {C:chips}extra chips{} less than {C:attention}128{},",
					"double its Chips, give it to the next card",
					"and strip its {C:attention}rank{} to {C:attention}0{}",
				},
			},
			
			["j_unstb_power_of_one"] = {
				["name"] = "Power of One",
				["text"] = {
					"Gives {C:mult}+#1#{} Mult for each",
					"{C:attention}1{} in your {C:attention}full deck{}",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive})",
				},
			},
			
			["j_unstb_binary_number"] = {
				["name"] = "Binary Number",
				["text"] = {
					"If played hand contains {C:attention}4{} or fewer cards",
					"and only consists of {C:attention}rank 0{} and {C:attention}1{} cards,",
					"create a card with {C:attention}rank{} equal",
					"to the number represented in binary",
					"({C:red}Ex:{} {C:attention}1001{} -> {C:attention}9{})",
					"{C:inactive}[Jack, Queen, King, Ace is 11-14, respectively]{}",
				},
			},
			
			--Basegame Enhancement
			
			["j_unstb_quintuplets"] = {
				["name"] = "Quintuplets",
				["text"] = {
					"If played hand",
					"contains {C:attention}Five of a Kind{},",
					"create a {C:dark_edition}Negative Tag{}",
				},
			},
			
			--Edition Line
			
			["j_unstb_graphic_card"] = {
				["name"] = "Graphics Card",
				["text"] = {
					"Create a {C:attention}Double Tag{}",
					"at the end of the round",
					"if {C:attention}#1#{} or more cards with",
					"{C:dark_edition}editions{} were scored this round",
					"{C:inactive}(Currently {C:attention}#2# {C:inactive}cards)",
				},
			},
			
			["j_unstb_connoiseur"] = {
				["name"] = "Connoiseur",
				["text"] = {
					"Retrigger all played cards",
					"with {C:dark_edition}editions{}",
				},
			},
			
			["j_unstb_jeweler"] = {
				["name"] = "Jeweler",
				["text"] = {
					"{C:green}#1# in #2#{} chance to downgrade",
					"level of played {C:attention}poker hand{}",
					"and {C:purple}upgrade{} edition",
					"of all scored cards",
				},
			},
			
			--Slop
			
			["j_unstb_joker_diffusion"] = {
				["name"] = "Joker Diffusion",
				["text"] = {
					"Converts {C:attention}#1#{} random {C:attention}non-enhanced{} card",
					"in hand to {C:attention}Slop Card{} every time",
					"a hand is played with {C:attention}unscored card{}",
				},
			},
			
			["j_unstb_nonfungible_joker"] = {
				["name"] = "Non-Fungible Joker",
				["text"] = {
					"If a discarded hand contains",
					"only {C:attention}#1# Slop Card{}, destroy it and",
					"earn random amount of up to {C:gold}$#2#",
					"{s:0.8,C:red}Maximum Payout and Sell Value drops at the end of the round",
				},
			},
			
			["j_unstb_prompt"] = {
				["name"] = "Prompt",
				["text"] = {
					"Scored {C:attention}Slop Cards{} take",
					"the {C:attention}rank{} and {C:attention}suit{} from",
					"other scored {C:attention}non-Slop Cards{}",
					"instead of random (if possible)",
				},
			},
			
			["j_unstb_uninterested_primate"] = {
				["name"] = "Uninterested Primate",
				["text"] = {
					"Gains {C:chips}+#1#{} Chips every {C:attention}#2# {C:inactive}[#6#]",
					"{C:attention}Slop Cards{} scored.",
					"{C:green}#3# in #4#{} chance this card is",
					"destroyed at end of round",
					"{C:inactive}(Currently {C:chips}+#5# {C:inactive}Chips)",
				},
			},
			
			["j_unstb_lethargic_lion"] = {
				["name"] = "Lethargic Lion",
				["text"] = {
					"Gains {X:mult,C:white}X#1#{} Mult every {C:attention}#2# {C:inactive}[#6#]",
					"{C:attention}Slop Cards{} scored.",
					"{C:green}#3# in #4#{} chance this card is",
					"destroyed at end of round",
					"{C:inactive}(Currently {X:mult,C:white}X#5#{C:inactive} Mult)",
				},
			},
			
			--New Enhancement Support

			["j_unstb_vintage_joker"] = {
				["name"] = "Vintage Joker",
				["text"] = {
					"Scored {C:attention}Vintage Cards{} have",
					"{C:green}#1# in #2#{} chance to reset",
					"their destroy chance",
				},
			},
			
			["j_unstb_rules_errata"] = {
				["name"] = "Rules Errata",
				["text"] = {
					"{C:attention}Acorn Mark Cards{} give {C:attention}half{} of their",
					"{C:attention}rank{}'s value as Mult when scored",
				},
			},
			
			["j_unstb_auction_winner"] = {
				["name"] = "Auction Winner",
				["text"] = {
					"If a {C:attention}Promo Card{} is",
					"destroyed from scoring, this Joker",
					"gains {C:gold}money{} equal to",
					"the {C:gold}money{} that card gave",
					"before its destruction",
				},
			},
			
			["j_unstb_joker_island"] = {
				["name"] = "Joker Island",
				["text"] = {
					"For every scored card",
					"with {C:attention}rank{} {C:attention}#1#{},",
					"{C:green}#2# in #3#{} chance to add a",
					"{C:attention}Resource Card{} of the same suit to deck",
					"{s:0.8}rank changes at end of round",
				},
			},
			
			--Unhancement Jokers
			
			["j_unstb_kaiju"] = {
				["name"] = "Kaiju",
				["text"] = {
					"{C:dark_edition}+#1#{} Joker slot",
					"Converts one random card",
					"into a {C:attention}Radioactive Card{} when",
					"first hand is drawn",
				},
			},
			
			["j_unstb_poison_the_well"] = {
				["name"] = "Poison the Well",
				["text"] = {
					"{C:red}+#1#{} Discards",
					"Converts one random card",
					"in each discarded hand",
					"into a {C:attention}Poison Card{}",
				},
			},
			
			["j_unstb_petri_dish"] = {
				["name"] = "Petri Dish",
				["text"] = {
					"{C:blue}+#1#{} Hands",
					"{C:green}#2# in #3#{} chance of converting",
					"one random played card",
					"into a {C:attention}Biohazard Card{}",
				},
			},
			
			--Unhancement Support
			
			["j_unstb_geiger_counter"] = {
				["name"] = "Geiger Counter",
				["text"] = {
					"Gives {C:mult}+#1#{} Mult for",
					"each {C:attention}Radioactive Card{}",
					"in your {C:attention}full deck{}",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				},
			},
			
			["j_unstb_strych_nine"] = {
				["name"] = "Strych-Nine",
				["text"] = {
					"Gives {C:chips}+#1#{} Chips",
					"for each {C:attention}Poison Card{}",
					"in your {C:attention}full deck{}",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
				},
			},
			
			["j_unstb_vaccination_card"] = {
				["name"] = "Vaccination Card",
				["text"] = {
					"Neutralize all {C:attention}Biohazard Card{} passive effects",
					"Gives additional {X:mult,C:white}X#1#{} Mult for each",
					"{C:attention}Biohazard Card{} held in hand",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
			},
			
			--Shitposts
			
			["j_unstb_joker2"] = {
				["name"] = "Joker2",
				["text"] = {
					"{C:mult}+#1#{} Mult",
					"{X:mult,C:white}X#2#{} Mult",
					"{C:green}#3# in #4#{} chance this",
					"card is destroyed",
					"at end of round",
				},
			},
			
			["j_unstb_joker_stairs"] = {
				["name"] = "Joker Stairs",
				["text"] = {
					"Gain {C:mult}+#1#{} Mult when buying a Joker",
					"with {C:attention}\"Joker\"{} in its name",
					"directly from the shop",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}",
				},
			},
			
			["j_unstb_plagiarism"] = {
				["name"] = "Plagiarism",
				["text"] = {
					"Copies ability of",
					"{C:attention}Joker{} to the",
					"left or right at random",
					"{s:0.8}Direction changes each hand played",
				},
			},
			
			["j_unstb_joker_throwing_card"] = {
				["name"] = "Joker Throwing Card",
				["text"] = {
					"Decrease {C:attention}Blind{} size by {C:attention}#1#%{}",
					"{C:green}#2# in #3#{} chance to destroy",
					"one of the scored cards",
					"Increases percentage by {C:attention}#4#%{}",
					"if a card is destroyed this way",
				},
			},
			
			--Face Card Jokers
			
			["j_unstb_jackhammer"] = {
				["name"] = "Jackhammer",
				["text"] = {
					"If the {C:attention}played hand{} has only one {C:attention}Jack{},",
					"retrigger it {C:attention}#1#{} more times",
					"and {C:red}destroy it{} afterward",
				},
			},
			
			["j_unstb_jack_of_all_trades"] = {
				["name"] = "Jack of All Trades",
				["text"] = {
					"Played {C:attention}Jacks{} give",
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult, ",
					"{X:mult,C:white}X#3#{} Mult, and {C:gold}$#4#",
				},
			},
			
			["j_unstb_magic_trick_card"] = {
				["name"] = "Magic Trick Card",
				["text"] = {
					"Scored {V:1}#1#{} cards",
					"turn into {V:2}#2#{} cards",
					"{s:0.8}On discard, flips over the Joker",
				},
			},
			
			["j_unstb_queensland"] = {
				["name"] = "Queensland",
				["text"] = {
					"Scored {C:attention}Queens{} add",
					"{C:attention}Resource Cards{} of",
					"the corresponding suits to deck",
					"{C:inactive}({C:red}#1#{C:inactive} times per round, {C:red}#2# left{C:inactive})",
				},
			},
			
			["j_unstb_king_of_pop"] = {
				["name"] = "King of Pop",
				["text"] = {
					"Played {C:attention}Enhanced Kings{} have",
					"{C:green}#1# in #2#{} chance to be",
					"destroyed and create a {C:dark_edition}Double Tag",
				},
			},
			
			["j_unstb_prssj"] = {
				["name"] = "Polychrome Red Seal Steel Joker",
				["text"] = {
					"{C:green}#1# in #2#{} chance for scored {C:attention}Kings{} to {C:purple}upgrade{} edition",
					"{C:green}#1# in #3#{} chance for scored {C:attention}Kings{} to {C:attention}retrigger",
					"{C:green}#1# in #4#{} chance for {C:attention}Kings{} held in hand to give {X:mult,C:white}X#5#{} Mult",
				},
			},
			
			["j_unstb_master_of_one"] = {
				["name"] = "Master of One",
				["text"] = {
					"Adds one {C:attention}Enhanced Rank 1{} card",
					"to deck when {C:attention}Blind{} is selected",
				},
			},
			
			--Intermission
			
			["j_unstb_spectre"] = {
				["name"] = "Spectre",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult per {C:spectral}Spectral{}",
					"card used this run",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult){}",
				},
			},
			
			["j_unstb_library_card"] = {
				["name"] = "Library Card",
				["text"] = {
					"For each scored card's {C:attention}singular",
					"{C:attention}suit name{} in English, give:",
					"{C:chips}+#1#{} Chips per {C:attention}Consonant",
					"{C:mult}+#2#{} Mult per {C:attention}Vowel",
					"{C:inactive}(Example: Spade = {C:chips}+15{C:inactive} Chips, {C:mult}+4{C:inactive} Mult)",
				},
			},
			
			["j_unstb_collector_album"] = {
				["name"] = "Collector's Album",
				["text"] = {
					"Jokers with {C:attention}\"Card\"{} in",
					"their name each give",
					"{C:chips}+#1#{} Chips",
				},
			},
			
			["j_unstb_throwing_hands"] = {
				["name"] = "Throwing Hands",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult",
					"{C:green}#2# in #3#{} chance to {C:red}self destruct{}",
					"if the poker hand is not {C:attention}#4#{},",
					"{s:0.8}hand changes at end of round",
				},
			},
			
			--Historic Cards
			
			["j_unstb_imperial_bower"] = {
				["name"] = "Imperial Bower",
				["text"] = {
					"{X:mult,C:white}X#1#{} Mult if played hand",
					"contains a {C:attention}Straight{} and",
					"has at least one {C:attention}face{} card",
				},
			},
			
			["j_unstb_the_jolly_joker"] = {
				["name"] = "The \"Jolly Joker\"",
				["text"] = {
					"Gains {C:mult}+#1#{} Mult if",
					"played hand contains a {C:attention}Pair{}",
					"{C:red}Resets{} if played hand",
					"does not contain a {C:attention}Pair{}",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				},
			},
			
			["j_unstb_get_out_of_jail_free_card"] = {
				["name"] = "Get Out of Jail Free Card",
				["text"] = {
					"Sell this Joker to",
					"win the blind instantly",
					"{C:inactive}Status: {V:1}#1#{}",
				},
			},
			
			["j_unstb_tanzaku"] = {
				["name"] = "Tanzaku",
				["text"] = {
					"Retrigger played cards with",
					"{C:attention}seals{} {C:attention}#1#{} additional times",
					"Amount increases by {C:attention}#2#{} for",
					"every {C:attention}#3# {C:inactive}[#4#]{} discarded cards with a {C:attention}seal{}",
					"{s:0.8}Resets after each round",
				},
			},
			
			--Misc Jokers
			
			["j_unstb_glass_cannon"] = {
				["name"] = "Glass Cannon",
				["text"] = {
					"Retrigger each",
					"played {C:attention}Glass Card{}",
					"{C:red}Glass Cards are guaranteed",
					"{C:red}to break when scored",
				},
			},
			
			["j_unstb_pity_rate_drop"] = {
				["name"] = "Pity Rate Drop",
				["text"] = {
					"When {C:attention}Blind{} is selected,",
					"{C:green}#1# in #2#{} chance to create a {C:red}Rare {C:attention}Joker{}",
					"Chance increase by {C:green}#3#{} if no {C:attention}Joker{} created,",
					"resets to {C:green}#4#{} otherwise",
					"{C:inactive}(Must have room)",
				},
			},
			
			["j_unstb_salmon_run"] = {
				["name"] = "Salmon Run",
				["text"] = {
					"Each played {C:attention}7{} has a",
					"{C:green}#1# in #2#{} chance of adding a",
					"permanent copy to deck when scored",
				},
			},
			
			["j_unstb_cool_s"] = {
				["name"] = "Cool S",
				["text"] = {
					"Scored {C:attention}8s{} become",
					"a random {C:attention}Enhanced card{}",
				},
			},
			
			["j_unstb_memoriam_photo"] = {
				["name"] = "Memoriam Photo",
				["text"] = {
					"When a playing card is {C:attention}destroyed{},",
					"this Joker gains Chips equal to {C:attention}double{}",
					"the rank of the {C:attention}destroyed card{}",
					"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
				},
			},
			
			["j_unstb_schrodinger_cat"] = {
				["name"] = "Schrödinger's Cat",
				["text"] = {
					"When a playing card is {C:attention}destroyed{},",
					"{C:green}#1# in #2#{} chance to add",
					"a copy of the card to deck",
				},
			},
			
			["j_unstb_cashback_card"] = {
				["name"] = "Cashback Card",
				["text"] = {
					"At the end of a {C:attention}Boss Blind{},",
					"earn {C:gold}money{} equals to the amount",
					"of {C:attention}consumables{} used this {C:attention}Ante",
					"{C:inactive}(Currently {C:gold}$#1#{C:inactive})",
				},
			},
			
			["j_unstb_raffle"] = {
				["name"] = "Raffle",
				["text"] = {
					"At the end of each {C:attention}shop{},",
					"{C:green}#1# in #2#{} chance to win {C:gold}$#3#",
					"Chance increases by {C:green}#4#{}",
					"for each purchase in the {C:attention}shop",
					"{s:0.8, C:red}Resets after exiting the shop",
				},
			},
			
			["j_unstb_ic_card"] = {
				["name"] = "IC Card",
				["text"] = {
					"Gain {C:gold}$#1#{} to store in this Joker",
					"every time a hand is played",
					"When spending money, the {C:attention}balance",
					"in this Joker is spent first",
					"{C:red}Only usable for #2# rounds",
					"{C:inactive}(Currently {C:gold}$#3#{C:inactive}, {C:red}#4# Rounds left{C:inactive}){}",
				},
			},
			
			["j_unstb_j2048"] = {
				["name"] = "2048",
				["text"] = {
					"If played hand contains a {C:attention}Pair{}",
					"destroy the left one and",
					"give all chips to the other",
					"{C:inactive}(Drag to rearrange){}",
				},
			},
			
			["j_unstb_inductor"] = {
				["name"] = "Inductor",
				["text"] = {
					"For every played card with the same",
					"{C:attention}rank{} and {C:attention}suit{} as another played card:",
					"{C:green}#1# in #2#{} chance to copy {C:attention}Enhancement{}",
					"{C:green}#1# in #3#{} chance to copy {C:attention}Edition{}",
					"{C:green}#1# in #4#{} chance to copy {C:attention}Seal{}",
				},
			},
			
			
			--Vanilla Joker Override
			
			["j_fibonacci_ex"] = {
				["name"] = "Fibonacci",
				["text"] = {
					"Each played {C:attention}0{}, {C:attention}1{}, {C:attention}Ace{},",
					"{C:attention}2{}, {C:attention}3{}, {C:attention}5{}, {C:attention}8{}, {C:attention}13{}, or {C:attention}21{} gives",
					"{C:mult}+#1#{} Mult when scored",
				},
			},
			
			["j_odd_todd_ex"] = {
				["name"] = "Odd Todd",
				["text"] = {
					"Played cards with",
					"{C:attention}odd{} rank give",
					"{C:chips}+#1#{} Chips when scored",
					"{C:inactive}(161, 21, 13, 11, A, 9, 7, 5, 3, 1){}",
				},
			},
			
			["j_even_steven_ex"] = {
				["name"] = "Even Steven",
				["text"] = {
					"Played cards with",
					"{C:attention}even{} rank give",
					"{C:mult}+#1#{} Mult when scored",
					"{C:inactive}(12, 10, 8, 6, 4, 2, 0){}",
				},
			},
			
			["j_hack_ex"] = {
				["name"] = "Hack",
				["text"] = {
					"Retrigger",
					"each played",
					"{C:attention}0{}, {C:attention}1{}, {C:attention}2{},",
					"{C:attention}3{}, {C:attention}4{}, or {C:attention}5{}",
				},
			},
		},
		
		["Mod"] = {
			["UnStable"] = {
				["name"] = "UnStable",
				["text"] = {
					"Mod with a lot of new but vanilla-style mechanics.",
					"Contains new Jokers, consumables, and other stuff!",
					" ",
					"{C:blue}Brazilian Portuguese{} localization by {C:attention}PinkMaggit{}",
					"{C:blue}Simplified Chinese{} localization by {C:attention}Ethylenediamine{}"
				}
			}
		}
		
	},
}
