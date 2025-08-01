-- Portuguese (Brazil) by PinkMaggit
return {
    descriptions = {
		Mod = {
            CardSleeves = {
                name = "Card Sleeves",
                text = {
                    "{s:1.3}Adiciona {s:1.3,C:attention}15{} {s:1.3,E:1,C:dark_edition}Capas{} {s:1.3}que modificam baralhos.",
                    " ",
                    "Inclui uma API para outros mods",
                    "adicionarem suas próprias capas.",
                    " ",
                    "Programação e implementação por {C:blue}Larswijn{}.",
                    "Ideia e arte original por {C:red}Sable{}.",
                    " ",
                    "{s:1.1}Visite https://github.com/larswijn/CardSleeves para mais informações."
                }
            }
        },
        Sleeve = {
            sleeve_casl_none = {
                name = "Sem Capa",
                text = { "Sem modificadores de capa" }
            },

            sleeve_locked = {
                name = "Bloqueada",
                text = {
                    "Vença uma tentativa com",
                    "{C:attention}#1#{} na",
                    "dificuldade {V:1}#2#{}, ao menos"
                }
            },

            sleeve_casl_red = {
                name = "Capa Vermelha",
                text = G.localization.descriptions.Back["b_red"].text
            },
	        sleeve_casl_red_alt = {
                name = "Capa Vermelha",
                text = {
                    "{C:red}+#1#{} descarte em cada rodada",
                    "",
                    "{C:blue}#2#{} mão em cada rodada"
                },
            },

            sleeve_casl_blue = {
                name = "Capa Azul",
                text = G.localization.descriptions.Back["b_blue"].text
            },
			sleeve_casl_blue_alt = {
                name = "Capa Azul",
                text = {
                    "{C:blue}+#1#{} mão em cada rodada",
                    "",
                    "{C:red}#2#{} descarte em cada rodada"
                },
            },

            sleeve_casl_yellow = {
                name = "Capa Amarela",
                text = G.localization.descriptions.Back["b_yellow"].text
            },
			sleeve_casl_yellow_alt = {
                name = "Capa Amarela",
                text = {
                    "Comece a tentativa com o",
                    "cupom de {C:money,T:v_seed_money}#1#{}"
                },
            },

            sleeve_casl_green = {
                name = "Capa Verde",
                text = G.localization.descriptions.Back["b_green"].text
            },
            sleeve_casl_green_alt = {
                name = "Capa Verde",
                text = {
                    "Tenha até",
                    "{C:red}-$#1#{} em dívida por",
                    "cada Mão e Descarte",
                    "{C:inactive}(Currently {C:red}-$#2#{C:inactive})"
                },
            },

            sleeve_casl_black = {
                name = "Capa Preta",
                text = G.localization.descriptions.Back["b_black"].text
            },
            sleeve_casl_black_alt = {
                name = "Capa Preta",
                text = {
                    "{C:attention}+#1#{} espaço de Curinga",
                    "",
                    "{C:red}-#2#{} descarte",
                    "em cada rodada"
                }
            },

            sleeve_casl_magic = {
                name = "Capa Mágica",
                text = G.localization.descriptions.Back["b_magic"].text
            },
            sleeve_casl_magic_alt = {
                name = "Capa Mágica",
                text = {
                    "Comece a tentativa com o",
                    "cupom de {C:tarot,T:v_omen_globe}#1#{}",
                }
            },

            sleeve_casl_nebula = {
                name = "Capa de Nebulosa",
                text = G.localization.descriptions.Back["b_nebula"].text
            },
            sleeve_casl_nebula_alt = {
                name = "Capa de Nebulosa",
                text = {
                    "Comece a tentativa com o",
                    "cupom de {C:planet,T:v_observatory}#1#{}",
                    }
            },

            sleeve_casl_ghost = {
                name = "Capa Fantasma",
                text = G.localization.descriptions.Back["b_ghost"].text
            },
            sleeve_casl_ghost_alt = {
                name = "Capa Fantasma",
                text = {
                    "Cartas {C:spectral}Espectrais{} aparecem na",
                    "loja com o dobro da frequência,",
                    "{C:spectral}Pacotes Espectrais{} têm {C:attention}#1#{}",
                    "opções extra para escolher",
                }
            },

            sleeve_casl_abandoned = {
                name = "Capa Abandonada",
                text = G.localization.descriptions.Back["b_abandoned"].text
            },
            sleeve_casl_abandoned_alt = {
                name = "Capa Abandonada",
                text = {
                    "{C:attention}Cartas de Realeza{} não",
                    "aparecerão durante a tentativa"
                }
            },

            sleeve_casl_checkered = {
                name = "Capa Xadrez",
                text = G.localization.descriptions.Back["b_checkered"].text
            },
            sleeve_casl_checkered_alt = {
                name = "Capa Xadrez",
                text = {
                    "Todas as cartas de {C:clubs}Paus{} serão",
                    "convertidas para {C:spades}Espadas{} e",
                    "todas as cartas de {C:diamonds}Ouros{} serão",
                    "convertidas para {C:hearts}Copas{}",
                }
            },

            sleeve_casl_zodiac = {
                name = "Capa do Zodíaco",
                text = G.localization.descriptions.Back["b_zodiac"].text
            },
            sleeve_casl_zodiac_alt = {
                name = "Capa do Zodíaco",
                text = {
                    "Pacotes {C:tarot}Arcanos{} e {C:planet}Celestiais{} terão",
                    "{C:attention}#1#{} opções extra para escolher",
                }
            },

            sleeve_casl_painted = {
                name = "Capa Pintada",
                text = G.localization.descriptions.Back["b_painted"].text
            },
			sleeve_casl_painted_alt = {
                name = "Capa Pintada",
                text = {
                    "{C:attention}+#1#{} limite de",
					"seleção de cartas,",
                    "{C:red}#2#{} espaço de Curinga",
                }
            },

            sleeve_casl_anaglyph = {
                name = "Capa Anáglifa",
                text = G.localization.descriptions.Back["b_anaglyph"].text
            },
            sleeve_casl_anaglyph_alt = {
                name = "Capa Anáglifa",
                text = {
                    "Após derrotar cada",
                    "{C:attention}Small{} ou {C:attention}Big Blind{}, ganhe",
                    "uma {C:attention,T:tag_double}#1#"
                }
            },

            sleeve_casl_plasma = {
                name = "Capa de Plasma",
                text = G.localization.descriptions.Back["b_plasma"].text
            },
            sleeve_casl_plasma_alt = {
                name = "Capa de Plasma",
                text = {
                    "Equilibre o {C:money}preço{} de todos",
                    "os itens da {C:attention}loja{}",
                }
            },

            sleeve_casl_erratic = {
                name = "Capa Errática",
                text = G.localization.descriptions.Back["b_erratic"].text
            },
            sleeve_casl_erratic_alt = {
                name = "Capa Errática",
                text = {
                    "Os valores iniciais de {C:blue}mãos{}, {C:red}descartes{},",
                    "{C:money}dinheiro{} e {C:attention}espaços de Curinga{}",
                    "são todos randomizados entre {C:attention}#1#{} e {C:attention}#2#{}",
                }
            }
        }
    },
    misc = {
        dictionary = {
            k_sleeve = "Capa",
			k_sleeves = "Capas",
            gald_sleeves = "Capa",
            gald_random_sleeve = "Aleatória",
            sleeve_unique_effect_desc = "Algumas capas têm efeitos únicos quando combinadas com baralhos específicos",
            adjust_deck_alignment = "Empilhar baralho",
            adjust_deck_alignment_desc = {
                "Empilha as cartas do baralho de forma",
                "bem mais compacta durante a rodada",
                "para prevenir o esticamento da capa (apenas visual)"
            },
            adjust_deck_alignment_options = {
                "Sempre empilhar",
                "Quando usar capa",
                "Nunca empilhar"
            },
            allow_any_sleeve_selection = "Desbloquear todas as capas",
            allow_any_sleeve_selection_desc = {
                "Permite que qualquer capa seja selecionada",
                "no menu de nova tentativa, como se estivesse desbloqueada"
            },
            sleeve_info_location = "Local de informação da capa",
            sleeve_info_location_desc = {
                "Em qual menu o nome e a descrição",
                "da capa usada no momento serão mostrados",
                "(apenas visual)"
            },
            sleeve_info_location_options = {
                "Apenas na visualização do baralho",
                "Apenas nas informações da tentativa",
                "Mostrar em ambos",
                "Esconder a informação da capa"
            },
            sleeve_not_found_error = "Capa não encontrada! Você removeu este mod?"
        },
        v_text = {
            -- for challenges
            ch_m_sleeve = {
                "Comece com {C:attention}#1#{}"
            }
        }
    }
}
