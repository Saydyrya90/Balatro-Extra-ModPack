return {
    descriptions = {
        Alchemical = {
            c_alchemy_ignis = {
                name = "Ignis",
                text = {
                    "Gain {C:red}+#1#{} #2#",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_aqua = {
                name = "Aqua",
                text = {
                    "Gain {C:blue}+#1#{} #2#",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_terra = {
                name = "Terra",
                text = {
                    "Reduce {C:attention}Blind score{} by {C:attention}#1#%"
                }
            },
            c_alchemy_aero = {
                name = "Aero",
                text = {
                    "Draw {C:attention}#1#{} #2#"
                }
            },
            c_alchemy_quicksilver = {
                name = "Quicksilver",
                text = {
                    "{C:attention}+#1#{} hand size",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_salt = {
                name = "Salt",
                text = {
                    "Gain {C:attention}#1#{} #2#"
                }
            },
            c_alchemy_sulfur = {
                name = "Sulfur",
                text = {
                    "Reduce {C:blue}hands{} to {C:blue}1",
                    "Gain {C:money}$#1#{} for each",
                    "hand removed"
                }
            },
            c_alchemy_phosphorus = {
                name = "Phosphorus",
                text = {
                    "Return {C:attention}all{} discarded",
                    "cards to deck"
                }
            },
            c_alchemy_bismuth = {
                name = "Bismuth",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected #2#",
                    "to {C:dark_edition}Polychrome",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_cobalt = {
                name = "Cobalt",
                text = {
                    "Upgrade currently",
                    "selected {C:legendary,E:1}poker hand",
                    "by {C:attention}#1#{} #2#"
                }
            },
            c_alchemy_arsenic = {
                name = "Arsenic",
                text = {
                    "{C:attention}Swap{} your current",
                    "{C:blue}hands{} and {C:red}discards"
                }
            },
            c_alchemy_antimony = {
                name = "Antimony",
                text = {
                    "Create #1# {C:dark_edition}Negative",
                    "{C:eternal}eternal{} {C:attention}#2#{} of",
                    "a random joker",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_soap = {
                name = "Soap",
                text = {
                    "Replace up to {C:attention}#1#",
                    "selected #2# with",
                    "#2# from your deck"
                }
            },
            c_alchemy_manganese = {
                name = "Manganese",
                text = {
                    "Enhances up to",
                    "{C:attention}#1#{} selected #2#",
                    "into {C:attention}Steel #2#",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_wax = {
                name = "Wax",
                text = {
                    "Create {C:attention}#1#{} temporary",
                    "{C:attention}#2#{} of selected card",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_borax = {
                name = "Borax",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected #2# into",
                    "the most common {C:attention}suit",
                    "for current {C:attention}Blind",
                    "{C:inactive}(Current suit: {V:1}#3#{C:inactive})"
                }
            },
            c_alchemy_glass = {
                name = "Glass",
                text = {
                    "Enhances up to",
                    "{C:attention}#1#{} selected #2#",
                    "into {C:attention}Glass #2#",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_magnet = {
                name = "Magnet",
                text = {
                    "Draw {C:attention}#1#{} #2#",
                    "of the same {C:attention}rank",
                    "as the selected card"
                }
            },
            c_alchemy_gold = {
                name = "Gold",
                text = {
                    "Enhances up to",
                    "{C:attention}#1#{} selected #2#",
                    "into {C:attention}Gold #2#",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_silver = {
                name = "Silver",
                text = {
                    "Enhances up to",
                    "{C:attention}#1#{} selected #2#",
                    "into {C:attention}Lucky #2#",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_oil = {
                name = "Oil",
                text = {
                    "Removes {C:attention}debuffs{} from",
                    "all cards in hand",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_acid = {
                name = "Acid",
                text = {
                    "{C:attention}Destroy{} all cards",
                    "of the same rank",
                    "as#1# selected #2#",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_brimstone = {
                name = "Brimstone",
                text = {
                    "{C:blue}+#1# #2#{}, {C:red}+#3# #4#",
                    "{C:attention}Debuff{} the left most",
                    "non-debuffed joker",
                    "for current {C:attention}Blind"
                }
            },
            c_alchemy_uranium = {
                name = "Uranium",
                text = {
                    "Copy the selected card's",
                    "{C:attention}enhancement{}, {C:attention}seal{}, and {C:attention}edition",
                    "to {C:attention}#1#{} unenhanced #2#",
                    "for current {C:attention}Blind"
                },
                unlock = {
                    "Use {C:attention}#1#",
                    "{E:1,C:alchemical}Alchemical{} #2# in",
                    "the same run"
                }
            }
        },
        Back = {
            b_alchemy_herbalist = {
                name = "Herbalist's Deck",
                text = {
                    "Start run with the",
                    "{C:tarot,T:v_alchemy_mortar_and_pestle}Mortar and Pestle{} voucher",
                    "Gain an {C:alchemical}Alchemical{} card",
                    "before each {C:attention}Boss Blind"
                }
            },
            b_alchemy_philosopher = {
                name = "Philosopher's Deck",
                text = {
                    "Start run with the",
                    "{C:tarot,T:v_alchemy_alchemical_merchant}Alchemical Merchant{} voucher",
                    "and a copy of {C:tarot,T:c_alchemy_seeker}The Seeker"
                }
            }
        },
        Joker = {
            j_alchemy_studious_joker = {
                name = "Studious Joker",
                text = {
                    "{C:mult}+#1#{} Mult. Sell this",
                    "joker to get one",
                    "{C:alchemical} Alchemical{} card"
                }
            },
            j_alchemy_bottled_buffoon = {
                name = "Bottled Buffoon",
                text = {
                    "Create an {C:alchemical}Alchemical{} card",
                    "every {C:attention}#1#{} hands played",
                    "{C:inactive}(#2#)"
                }
            },
            j_alchemy_mutated_joker = {
                name = "Mutated Joker",
                text = {
                    "{C:chips}+#1#{} Chips for each",
                    "unique {C:alchemical}Alchemical{} card",
                    "used this run",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_alchemy_chain_reaction = {
                name = "Chain Reaction",
                text = {
                    "Create a {C:dark_edition}Negative{} {C:attention}copy",
                    "of the first {C:alchemical}Alchemical{} ",
                    "card used each {C:attention}Blind"
                }
            },
            j_alchemy_essence_of_comedy = {
                name = "Essence of Comedy",
                text = {
                    "This Joker gains",
                    "{X:mult,C:white}X#1#{} Mult every time an",
                    "{C:alchemical}Alchemical{} card is used",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_alchemy_shock_humor = {
                name = "Shock Humor",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "create an {C:alchemical}Alchemical{} card",
                    "when you discard a {C:attention}Gold{},",
                    "{C:attention}Steel{} or {C:attention}Stone{} card"
                }
            },
            j_alchemy_breaking_bozo = {
                name = "Breaking Bozo",
                text = {
                    "After you use an {C:alchemical}Alchemical",
                    "card, does one the following: ",
                    "Reduce {C:attention}Blind score{} by {C:attention}#1#%",
                    "Draw {C:attention}#2#{} cards",
                    "Earn {C:money}$#3#"
                }
            },
            j_alchemy_catalyst_joker = {
                name = "Catalyst Joker",
                text = {
                    "{C:attention}+#1#{} consumable slots.",
                    "Gains {X:mult,C:white}X#2#{} Mult for",
                    "every {C:attention}Consumable Card{} held",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
                }
            },
        },
        Tarot = {
            c_alchemy_seeker = {
                name = "The Seeker",
                text = {
                    "Creates up to {C:attention}#1#",
                    "random {C:alchemical}Alchemical{} #2#",
                    "{C:inactive}(Must have room)"
                }
            }
        },
        Spectral = {
            c_alchemy_philosopher_stone = {
                name = "Philosopher's Stone",
                text = {
                    "{C:attention}Retrigger{} all played cards",
                    "for current {C:attention}Blind"
                }
            }
        },
        Tag = {
            tag_alchemy_elemental = {
                name = "Elemental Tag",
                text = {
                    "Gives a free",
                    "{C:alchemical}Mega Alchemy Pack"
                }
            }
        },
        Voucher = {
            v_alchemy_mortar_and_pestle = {
                name = "Mortar and Pestle",
                text = {
                    "{C:attention}+1{} consumable slot"
                }
            },
            v_alchemy_cauldron = {
                name = "Cauldron",
                text = {
                    "{C:alchemical}Alchemical{} cards from",
                    "{C:alchemical}Alchemy Packs{} may come",
                    "with the {C:dark_edition}Negative{} Edition"
                }
            },
            v_alchemy_alchemical_merchant = {
                name = "Alchemical Merchant",
                text = {
                    "{C:alchemical}Alchemical{C:attention} cards{} can",
                    "be purchased",
                    "from the {C:attention}shop"
                }
            },
            v_alchemy_alchemical_tycoon = {
                name = "Alchemical Tycoon",
                text = {
                    "{C:alchemical}Alchemical{} cards appear",
                    "{C:attention}2X{} more frequently",
                    "in the shop"
                }
            },
        },
        Other = {
            p_alchemy_normal = {
                name = "Alchemy Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:alchemical} Alchemical{} cards to",
                    "add to your consumables"
                }
            },
            p_alchemy_jumbo = {
                name = "Jumbo Alchemy Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:alchemical} Alchemical{} cards to",
                    "add to your consumables"
                }
            },
            p_alchemy_mega = {
                name = "Mega Alchemy Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:alchemical} Alchemical{} cards to",
                    "add to your consumables"
                }
            },
            undiscovered_alchemical = {
                name = "Not Discovered",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does"
                }
            },
            alchemical_card = {
                name = "Alchemical",
                text = {
                    "Can only be used",
                    "during a {C:attention}Blind"
                }
            },
            a_alchemy_unlock_counter = {
                text = {
                    "{C:inactive}(#1#)"
                }
            }
        },
        Mod = {
            CodexArcanum = {
                name = "Codex Arcanum",
                text = {
                    "Adds a new set of consumable cards - {C:alchemical}Alchemicals{},",
                    "and additional content that will help to use them!",
                    " ",
                    "{C:alchemical}Alchemical{} cards are usually {C:attention}stronger{} than other",
                    "consumables, but their {C:attention}effect stays only until the",
                    "{C:attention}end of the Blind"
                }
            }
        }
    },
    misc = {
        dictionary = {
            k_alchemical = "Alchemical",
            k_alchemy_pack = "Alchemy Pack",
            p_plus_alchemical = "+1 Alchemical",
            p_alchemy_plus_card = "+2 Cards",
            a_alchemy_reduce_blind = "Reduce score",
            b_stat_alchemicals = "Alchemicals",
            b_alchemical_cards = "Alchemical Cards",
            b_alchemy_ui_enabled = "Enabled",
            b_alchemy_ui_config_alchemicals = {
                { title = { "Alchemicals" }, tooltip = { "Tweaks for Alchemical cards added by mod" } },
                { title = { "Disable" }, tooltip = { "Disable specific Alchemical cards by selecting them", "Contains Alchemical cards spoilers!" } }
            },
            b_alchemy_ui_config_boosters = {
                { title = { "Booster Packs" }, tooltip = { "Tweaks for Booster Packs added by mod" } },
                { title = { "Disable" }, tooltip = { "Disable specific Booster Packs by selecting them", "Contains Booster Packs spoilers!" } }
            },
            b_alchemy_ui_config_jokers = {
                { title = { "Jokers" }, tooltip = { "Tweaks for Jokers added by mod" } },
                { title = { "Disable" }, tooltip = { "Disable specific Jokers by selecting them", "Contains Jokers spoilers!" } }
            },
            b_alchemy_ui_config_consumables = {
                { title = { "Consumables" }, tooltip = { "Tweaks for Consumable cards added by mod" } },
                { title = { "Disable" }, tooltip = { "Disable specific Consumable (Tarot, Spectral) cards by selecting them", "Contains Consumable cards spoilers!" } }
            },
            b_alchemy_ui_config_decks = {
                { title = { "Decks" }, tooltip = { "Tweaks for Decks added by mod" } },
                { title = { "Disable" }, tooltip = { "Disable specific Decks by selecting them", "Contains Decks spoilers!" } }
            },
            b_alchemy_ui_config_vouchers = {
                { title = { "Vouchers" }, tooltip = { "Tweaks for Vouchers added by mod" } },
                { title = { "Disable" }, tooltip = { "Disable specific Vouchers by selecting them", "Contains Vouchers spoilers!" } }
            },
            b_alchemy_ui_config_tags = {
                { title = { "Tags" }, tooltip = { "Tweaks for Tags added by mod" } },
                { title = { "Disable" }, tooltip = { "Disable specific Tags by selecting them", "Contains Tags spoilers!" } }
            },
        },
        --I'm not a schizo, different languages ​​may have several variants of plural form
        CodexArcanum_plurals = {
            hand = function(count)
                return count > 1 and "hands" or "hand"
            end,
            discard = function(count)
                return count > 1 and "discards" or "discard"
            end,
            card = function(count)
                return count > 1 and "cards" or "card"
            end,
            level = function(count)
                return count > 1 and "levels" or "level"
            end,
            copy = function(count)
                return count > 1 and "copies" or "copy"
            end,
            tag = function(count)
                return count > 1 and "tags" or "tag"
            end,
        }
    }
}
