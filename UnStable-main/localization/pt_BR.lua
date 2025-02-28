return {
	["misc"] = {
		["dictionary"] = {
		
			--Config Stuff
		
			["unstb_config_requires_restart"] = "Necessário reiniciar o jogo para aplicar os efeitos",
			
			["unstb_config_header_mech_setting"] = "Mecânicas",
			
			["unstb_config_header_rank"] = "Classe",
			["unstb_config_rank21"] = "Classe 21",
			["unstb_config_rank_bi"] = "Classes 0 e 1",
			["unstb_config_rank_decimal"] = "Classes Decimais",
		
			["unstb_config_header_enh"] = "Aprimoramento",
			["unstb_config_enh_custom"] = "Novo aprimoramento",
			["unstb_config_enh_disenh"] = "Desaprimoramento",
			
			["unstb_config_header_mechanics"] = "Novas Mecânicas",
			["unstb_config_mech_upgrade"] = "Aprimoramento de Edição",
			["unstb_config_mech_suitseal"] = "Selos de Naipe e Classe",
			["unstb_config_mech_aux"] = "Carta Auxiliar",
			["unstb_config_mech_music"] = "Música Personalizada",
			["unstb_config_mech_fallback"] = "Espectrais Alternativos",
			["unstb_config_mech_fallback_desc"] = {
				"Contém as mesmas propriedades da Carta Auxiliar, ",
				"é recomendado ligar se Carta Auxiliar estiver desligado",
			},
			["unstb_config_mech_new_spectral"] = "Novas Cartas Espectrais",
			
			["unstb_config_header_joker_settings"] = "Curingas",
			
			--Extra Flavour Badge Text
			["k_tarot_exclaim"] = "Tarô!?",
			
			["k_blueprint_l_compatible"] = "Esquerda: compatível",
			["k_blueprint_l_incompatible"] = "Esquerda: incompatível",
			["k_blueprint_r_compatible"] = "Direita: compatível",
			["k_blueprint_r_incompatible"] = "Direita: incompatível",
			
			--Auxiliary Card stuff
			--Category Name
			["k_auxiliary"] = "Auxiliar",
			
			--Gallery Button
			["b_auxiliary_cards"] = "Cartas Auxiliares", 
			
			--Booster Packs
			["k_booster_group_p_unstb_aux_1"] = "Pacote de Expansão",
			["k_booster_group_p_unstb_aux_2"] = "Pacote de Expansão",
			["k_booster_group_p_unstb_aux_mega"] = "Pacote de Expansão",
			["k_booster_group_p_unstb_aux_jumbo"] = "Pacote de Expansão",
			
			["k_booster_group_p_unstb_prem_1"] = "Pacote Padrão Premium",
			["k_booster_group_p_unstb_prem_2"] = "Pacote Padrão Premium",
			["k_booster_group_p_unstb_prem_mega"] = "Pacote Padrão Premium",
			["k_booster_group_p_unstb_prem_jumbo"] = "Pacote Padrão Premium",
		},
		["ranks"] = {
		
			["unstb_21"] = "21",
			["unstb_???"] = "???",
		
			["unstb_0"] = "0",
			["unstb_1"] = "1",
		
			["unstb_0.5"] = "Meio",
			["unstb_r2"] = "Raiz de 2",
			["unstb_e"] = "e",
			["unstb_Pi"] = "Pi",
			
			["unstb_11"] = "11",
			["unstb_12"] = "12",
			["unstb_13"] = "13",
			["unstb_25"] = "25",
			["unstb_161"] = "161",
			
		},
		["labels"] = {
		
			["unstb_spades_seal"] = "Selo de Espadas",
			["unstb_hearts_seal"] = "Selo de Copas",
			["unstb_clubs_seal"] = "Selo de Paus",
			["unstb_diamonds_seal"] = "Selo de Ouros",
			
			["unstb_face_seal"] = "Selo de Realeza",
			["unstb_heal_seal"] = "Selo de Cura",
			
		},
	},
	["descriptions"] = {
	
		["Back"] = {
		
			["b_unstb_utility"] = {
				["name"] = "Baralho Utilitário",
				["text"] = {
					"Comece a tentativa com o",
					"cupom {C:auxiliary}Loja de Ferragens{}",
					"e {C:attention}1{} cópia de {C:auxiliary}A Interrogação{},",
					"{C:auxiliary}Cartas Auxiliares{} podem aparecer",
					"na {C:attention}loja{} mais frequentemente",
				},
			},
			
			["b_unstb_lowkey"] = {
				["name"] = "Baralho Discreto",
				["text"] = {
					"Comece a tentativa com apenas",
					"cartas de {C:attention}classes 0-5{}",
					"e todas as {C:attention}classes",
					"{C:attention}decimais{} entre elas",
				},
			},
			
		},
		
		["Sleeve"] = {
		
			["sleeve_unstb_utility"] = {
				["name"] = "Capa Utilitária",
				["text"] = {
					"Comece a tentativa com o",
					"cupom {C:auxiliary}Loja de Ferragens{}",
					"e {C:attention}1{} cópia de {C:auxiliary}A Interrogação{},",
					"{C:auxiliary}Cartas Auxiliares{} podem aparecer",
					"na {C:attention}loja{} mais frequentemente",
				},
			},
			
			["sleeve_unstb_utility_alt"] = {
				["name"] = "Capa Utilitária",
				["text"] = {
					"Comece a tentativa com o",
					"cupom {C:auxiliary}Ferramentas Robustas{}",
					"e um {C:attenttion}Amostra Grátis{} {C:dark_edition}Negativo{}",
				},
			},
			
			["sleeve_unstb_lowkey"] = {
				["name"] = "Capa Discreta",
				["text"] = {
					"Comece a tentativa com apenas",
					"cartas de {C:attention}classes 0-5{}",
					"e todas as {C:attention}classes",
					"{C:attention}decimais{} entre elas",
				},
			},
			
			["sleeve_unstb_lowkey_alt"] = {
				["name"] = "Capa Discreta",
				["text"] = {
					"Cartas com classe maior que ",
					"{C:attention}5{} não aparecem na tentativa",
				},
			},
			
		},
		
		["Other"] = {
			
			--Playing Card Ability Text
			
			["no_chip"] = {
				["text"] = {
					"Sem Fichas",
				},
			},
			["decimal_rank_ability"] = {
				["text"] = {
					"Pode fucionar como uma {C:attention}classe diferente{}",
					"quando a mão for uma {C:purple}Sequência{}",
					"{C:inactive}[#1#, #2#, #3#]{}",
				},
			},
			["decimal_rank_ability_2"] = {
				["text"] = {
					"Pode fucionar como uma {C:attention}classe diferente{}",
					"quando a mão for uma {C:purple}Sequência{}",
					"{C:inactive}[#1#, #2#]{}",
				},
			},
			
			-- Other Mechanics
			
			["upgrade_edition"] = {
				["name"] = "Aprimorar Edição",
				["text"] = {
					"Mude a {C:attention}edição{} da carta",
					"em {C:attention}1{} passo na ordem",
					"{C:inactive}(Nenhuma){} -> {C:dark_edition}Foil{} ->",
					"{C:dark_edition}Holograma{} -> {C:dark_edition}Policromática{}",
				},
			},
			
			["disenhancement"] = {
				["name"] = "Desaprimoramento",
				["text"] = {
					"Aprimoramento que possui",
					"efeitos negativos",
					"{C:attention}(Radiação, Contágio, Veneno){}",
				},
			},
			
			--Extra Tooltip for description that does not lend itself well in tooltip form
			
			["acorn_tooltip"] = {
				["name"] = "Carta Bolota",
				["text"] = {
					"Ganhe {C:chips}o dobro{} de fichas",
					"quando esta carta estiver na mão,",
					"não dá fichas quando contabilizda",
				},
			},
			["resource_tooltip"] = {
				["name"] = "Carta de Recurso",
				["text"] = {
					"Não tem classe, sempre é contabilizada.",
					"Ganhe {X:mult,C:white}X5{} Multi",
					"se a mão jogada tiver pelo menos",
					"uma carta com naipe de {C:attention}(Corresponding Suit){}",
					"{C:red}Destruída depois de contabilizada{}",
					"{C:inactive}(Não conta com outras Cartas de Recurso){}",
				},
			},
			["poison_tooltip"] = {
				["name"] = "Carta Venenosa",
				["text"] = {
					"Dá um {C:red}valor negativo{} de fichas,",
					"{C:attention}Cartas Venenosas{} descartadas",
					"voltam para o baralho",
				},
			},
			
			--Seal
			
			["suit_seal"] = {
				["name"] = "Selo de Naipe",
				["label"] = "Selo de Naipe",
				["text"] = {
					"Faz esta carta também",
					"contar como {C:attention}(Naipe respectivo){}",
				},
			},
			["unstb_spades_seal"] = {
				["name"] = "Selo de Espadas",
				["label"] = "Selo de Espadas",
				["text"] = {
					"Esta carta também",
					"conta como {V:1}#1#{}",
				},
			},
			["unstb_hearts_seal"] = {
				["name"] = "Selo de Copas",
				["label"] = "Selo de Copas",
				["text"] = {
					"Esta carta também",
					"conta como {V:1}#1#{}",
				},
			},
			["unstb_clubs_seal"] = {
				["name"] = "Selo de Paus",
				["label"] = "Selo de Paus",
				["text"] = {
					"Esta carta também",
					"conta como {V:1}#1#{}",
				},
			},
			["unstb_diamonds_seal"] = {
				["name"] = "Selo de Ouros",
				["label"] = "Selo de Ouros",
				["text"] = {
					"Esta carta também",
					"conta como {V:1}#1#{}",
				},
			},
			["unstb_face_seal"] = {
				["name"] = "Selo Real",
				["label"] = "Selo Real",
				["text"] = {
					"Esta carta também conta",
					"como uma carta de {C:attention}realeza{}",
				},
			},
			["unstb_heal_seal"] = {
				["name"] = "Selo de Cura",
				["label"] = "Selo de Cura",
				["text"] = {
					"Remove o {C:red}Desaprimoramento{} de uma",
					"carta aleatória na mão quando pontuada.",
					"Esta carta não pode ser {C:red}Desaprimorada{}.",
				},
			},
			
			--Auxiliary Card-related stuff
			
			["undiscovered_auxiliary"] = {
				["name"] = "Não Descoberto",
				["text"] = {
					"Compre ou use",
					"esta carta em uma",
					"tentativa sem código",
					"para descobrir o que ela faz",
				},
			},
			
			["p_unstb_aux_1"] = {
				["group_name"] = "Pacote de Expansão",
				["name"] = "Pacote de Expansão",
				["text"] = {
					"Escolha {C:attention}#1#{} de até",
					"{C:attention}#2#{} cartas {C:auxiliary}Auxiliares{} para",
					"adicionar à sua área de consumíveis",
				},
			},
			["p_unstb_aux_2"] = {
				["group_name"] = "Pacote de Expansão",
				["name"] = "Pacote de Expansão",
				["text"] = {
					"Escolha {C:attention}#1#{} de até",
					"{C:attention}#2#{} cartas {C:auxiliary}Auxiliares{} para",
					"adicionar à sua área de consumíveis",
				},
			},
			["p_unstb_aux_mega"] = {
				["group_name"] = "Pacote de Expansão",
				["name"] = "Pacote de Expansão Mega",
				["text"] = {
					"Escolha {C:attention}#1#{} de até",
					"{C:attention}#2#{} cartas {C:auxiliary}Auxiliares{} para",
					"adicionar à sua área de consumíveis",
				},
			},
			["p_unstb_aux_jumbo"] = {
				["group_name"] = "Pacote de Expansão",
				["name"] = "Pacote de Expansão Jumbo",
				["text"] = {
					"Escolha {C:attention}#1#{} de até",
					"{C:attention}#2#{} cartas {C:auxiliary}Auxiliares{} para",
					"adicionar à sua área de consumíveis",
				},
			},
			
			["p_unstb_prem_1"] = {
				["group_name"] = "Pacote Padrão Premium",
				["name"] = "Pacote Padrão Premium",
				["text"] = {
					"Escolha {C:attention}#1#{} de até",
                    "{C:attention}#2# cartas de Jogo Aprimoradas{} com",
                    "{C:attention}classe especial{} para adicionar ao seu baralho"
				},
			},
			["p_unstb_prem_2"] = {
				["group_name"] = "Pacote Padrão Premium",
				["name"] = "Pacote Padrão Premium",
				["text"] = {
					"Escolha {C:attention}#1#{} de até",
                    "{C:attention}#2# cartas de Jogo Aprimoradas{} com",
                    "{C:attention}classe especial{} para adicionar ao seu baralho"
				},
			},
			["p_unstb_prem_mega"] = {
				["group_name"] = "Pacote Padrão Premium",
				["name"] = "Pacote Padrão Premium Mega",
				["text"] = {
					"Escolha {C:attention}#1#{} de até",
                    "{C:attention}#2# cartas de Jogo Aprimoradas{} com",
                    "{C:attention}classe especial{} para adicionar ao seu baralho"
				},
			},
			["p_unstb_prem_jumbo"] = {
				["group_name"] = "Pacote Padrão Premium",
				["name"] = "Pacote Padrão Premium Jumbo",
				["text"] = {
					"Escolha {C:attention}#1#{} de até",
                    "{C:attention}#2# cartas de Jogo Aprimoradas{} com",
                    "{C:attention}classe especial{} para adicionar ao seu baralho"
				},
			},
		},
		
		["Spectral"] = {
			
			--Fallback Spectral Cards
			
			["c_unstb_spc_elixir"] = {
				["name"] = "Elixir da Vida",
				["text"] = {
					"Cure todas as {C:red}Cartas Desaprimoradas{} no baralho",
					"Reduza o dinheiro pela metade {C:inactive}(Arrendondando para cima){}",
				},
			},
			["c_unstb_spc_vessel"] = {
				["name"] = "Receptáulo",
				["text"] = {
					"Selecione até {C:attention}#1#{} cartas,",
					"destrua a carta mais à {C:attention}esquerda{}",
					"e dê o {C:red}Selo de Naipe{} correspondente",
					"para todas as cartas {C:attention}restantes{}",
					"{C:inactive}(Arraste para reorganizar){}",
				},
			},
			["c_unstb_spc_conferment"] = {
				["name"] = "Concessão",
				["text"] = {
					"Adicione um {C:attention}Selo Real{}",
					"a {C:attention}#1#{} cartas aleatórias",
					"na sua mão,",
					"{C:red}-$#2#{} {C:inactive}(Sem limite de débito){}",
				},
			},
			["c_unstb_spc_amnesia"] = {
				["name"] = "Amnésia",
				["text"] = {
					"Converte {C:attention}#1#{} cartas",
					"aleatórias na sua mão",
					"para {C:attention}Classe 0{}",
				},
			},
			["c_unstb_spc_altar"] = {
				["name"] = "Altar",
				["text"] = {
					"Destrua {C:attention}#1#{} cartas",
					"aleatórias na sua mão,",
					"adicione {C:attention}#2#{} {C:attention}21s{} {C:attention}Aprimorados{}",
					"para a sua mão",
				},
			},
			["c_unstb_spc_contract"] = {
				["name"] = "Contrato Diabólico",
				["text"] = {
					"{C:purple}Aprimora {C:attention}#1#{} carta",
					"aleatória na sua mão",
					"{C:red}Desaprimora {C:attention}#2#{} cartas",
					"aleatórias na sua mão",
				},
			},
			
			--Other New Spectral Cards
			
			["c_unstb_spc_poltergeist"] = {
				["name"] = "Poltergeist",
				["text"] = {
					"Embaralhe todas as",
					"{C:dark_edition}Edições{} dos seus Curingas",
				},
			},
			["c_unstb_spc_projection"] = {
				["name"] = "Projeção Astral",
				["text"] = {
					"Troque {C:dark_edition}edições{} entre",
					"o {C:attention}Curinga Selecionado{}",
					"e o que está {C:attention}à sua direita{}",
					"{C:green}#1# de #2#{} chance de {C:red}destruir{}",
					"um dos Curingas",
				},
			},
			["c_unstb_spc_siphon"] = {
				["name"] = "Sifão",
				["text"] = {
					"Destrua {C:attention}1 Curinga{} selecionado",
					"com uma {C:dark_edition}edição{}",
					"Dá essa mesma {C:dark_edition}edição{} para",
					"{C:attention}#1#{} cartas aleatórias na sua mão",
					"{C:inactive}(Exceto{} {C:dark_edition}Negativo{}{C:inactive}){}",
				},
			},
		},
		
		["Tarot"] = {
			
			--Enhancement Conversion Tarot
		
			["c_unstb_trt_time"] = {
				["name"] = "Tempo",
				["text"] = {
					"Aprimora {C:attention}#1#{} ",
					"cartas selecionadas para",
					"{C:attention}Cartas Retrô{}",
				},
			},
			["c_unstb_trt_acorn"] = {
				["name"] = "A Bolota",
				["text"] = {
					"Aprimora {C:attention}#1#{} ",
					"carta selecionada para",
					"{C:attention}Carta de Bolota{}",
				},
			},
			["c_unstb_trt_greed"] = {
				["name"] = "Ganância",
				["text"] = {
					"Aprimora {C:attention}#1#{} ",
					"cartas selecionadas para",
					"{C:attention}Cartas Promocionais{}",
				},
			},
			
			--Rank-addition Tarot
			
			["c_unstb_trt_half"] = {
				["name"] = "A Metade",
				["text"] = {
					"Divide {C:attention}1{} carta de {C:attention}classe inteira{}",
					"em {C:attention}2{} cartas com {C:attention}metade da classe{}.",
					"Se a Classe inicial for {C:attention}ímpar{}, também adicione {C:attention}1{}",
					"carta {C:attention}classe 0.5{} com o mesmo {C:attention}Aprimoramento{}.",
				},
			},
			["c_unstb_trt_knowledge"] = {
				["name"] = "Sabedoria",
				["text"] = {
					"Adiciona uma carta de {C:attention}classe decimal{}",
					"aleatória do naipe de {C:attention}1{} carta selecionada pra mão",
				},
			},
			
		},
		
		["Enhanced"] = {
			
			--Standard Enhancement
			
			["m_unstb_vintage"] = {
				["name"] = "Carta Retrô",
				["text"] = {
					"Ganha {C:chips}+#1#{} fichas extra quando pontuada",
					"{C:green}#2# de #3#{} chance de se autodestruir",
					"{C:inactive}Chance aumenta em {C:green}+#4#{C:inactive} quando pontuada{}",
				},
			},
			["m_unstb_acorn"] = {
				["name"] = "Carta de Bolota",
				["text"] = {
					"Dá {C:chips}+#1#{} fichas quando estiver na mão,",
					"Não dá fichas quando pontuada",
				},
			},
			["m_unstb_promo"] = {
				["name"] = "Carta Promocional",
				["text"] = {
					"Dá {C:gold}$#1#{} enquanto esta carta é contida na mão",
					"Ganha {C:gold}+$#2#{} e tem {C:green}#3# de #4#{}",
					"chance de se autodestruir quando pontuada",
				},
			},
			
			--Special Joker-centric Enhancement
			
			["m_unstb_resource"] = {
				["name"] = "Carta de Recurso",
				["text"] = {
					"Não tem classe, sempre pontua.",
					"Dá {X:mult,C:white}X#1#{} Multi se a",
					"mão jogada tiver ao menos uma",
					"carta com o naipe de {V:1}#2#{}",
					"{C:red}Se autodestrói após pontuada{}",
					"{C:inactive}(Outras Cartas de Recursos não contam){}",
				},
			},
			["m_unstb_slop"] = {
				["name"] = "Carta Malfeita",
				["text"] = {
					"{C:chips}+#1#{} chips",
					"Always scored",
					"Random suit and rank after scored",
					"Current: {C:attention}#3#{} of {V:1}#2#{}",
				},
			},
			
			--Unhancements
			
			["m_unstb_radioactive"] = {
				["name"] = "Carta Radioativa",
				["text"] = {
					"{C:chips}+#1#{} Fichas, sem classe ou naipe",
					"Quando jogada, {C:green}#2# de #3#{} chance de",
					"converter outras cartas jogadas para {C:attention}Cartas Radioativas{}",
					"",
					"Quando contida na mão, {C:green}#2# de #4#{} chance de dar",
					"{X:mult,C:white}X#5#{} Multi, caso contrário {X:mult,C:white}X#6#{} Multi",
				},
			},
			["m_unstb_biohazard"] = {
				["name"] = "Carta Contagiosa",
				["text"] = {
					"{X:mult,C:white}X#1#{} Multi, sem classe ou naipe",
					"Perca {C:red}-$#2#{} enquanto esta carta é contida na mão",
					"Quando descartada, {C:green}#3# de #4#{} chance de converter",
					"uma carta no baralho para {C:attention}Carta Contagiosa{}",
				},
			},
			["m_unstb_poison"] = {
				["name"] = "Carta Venenosa",
				["text"] = {
					"{C:red}-#1#{} Fichas",
					"Volta para o baralho",
					"quando descartada",
				},
			},
		},
		
		["Auxiliary"] = {
			
			["c_unstb_aux_spades"] = {
				["name"] = "Essência de Espadas",
				["text"] = {
					"Adicione um {V:1}#2#{} para",
					"{C:attention}#1#{} cartas selecionadas",
					"na sua mão",
				},
			},
			["c_unstb_aux_hearts"] = {
				["name"] = "Essência de Copas",
				["text"] = {
					"Adicione um {V:1}#2#{} para",
					"{C:attention}#1#{} cartas selecionadas",
					"na sua mão",
				},
			},
			["c_unstb_aux_clubs"] = {
				["name"] = "Essência de Paus",
				["text"] = {
					"Adicione um {V:1}#2#{} para",
					"{C:attention}#1#{} cartas selecionadas",
					"na sua mão",
				},
			},
			["c_unstb_aux_diamonds"] = {
				["name"] = "Essência de Ouros",
				["text"] = {
					"Adicione um {V:1}#2#{} para",
					"{C:attention}#1#{} cartas selecionadas",
					"na sua mão",
				},
			},
			
			["c_unstb_aux_face"] = {
				["name"] = "Possessão",
				["text"] = {
					"Adicione um {C:attention}Selo Real{} para",
					"{C:attention}#1#{} cartas selecionadas",
					"na sua mão",
				},
			},
			
			["c_unstb_aux_plus_two"] = {
				["name"] = "+2",
				["text"] = {
					"Cria {C:attention}#1#{} cartas na",
					"na sua mão com uma {C:attention}classe{}",
					"aleatória e o mesmo {C:attention}naipe{}",
					"da carta selecionada",
				},
			},
			["c_unstb_aux_plus_four_wild"] = {
				["name"] = "+4",
				["text"] = {
					"Cria {C:attention}#1#{} cartas na",
					"na sua mão com um {C:attention}naipe{}",
					"aleatório e a mesma {C:attention}classe{}",
					"da carta selecionada",
				},
			},
			
			["c_unstb_aux_inst_disc"] = {
				["name"] = "O Passado",
				["text"] = {
					"{C:red}+#1#{} descartes nesta rodada",
				},
			},
			["c_unstb_aux_inst_hsize"] = {
				["name"] = "O Presente",
				["text"] = {
					"{C:attention}+#1#{} tamanho de mão nesta rodada",
				},
			},
			["c_unstb_aux_inst_hand"] = {
				["name"] = "O Futuro",
				["text"] = {
					"{C:blue}+#1#{} mãos nesta rodada",
				},
			},
			
			["c_unstb_aux_seal_move"] = {
				["name"] = "Troca de Selos",
				["text"] = {
					"Troque {C:attention}selos{} entre",
					"{C:attention}2{} cartas selecionadas",
				},
			},
			
			["c_unstb_aux_conv_1"] = {
				["name"] = "Todos-Por-Um",
				["text"] = {
					"Converte a classe de",
					"até {C:attention}#1#{} scartas",
					"selecionadas para {C:attention}1{}",
				},
			},
			
			["c_unstb_aux_21"] = {
				["name"] = "O Vinte-e-Um",
				["text"] = {
					"Selecione até {C:attention}#1#{} cartas",
					"cujas classes somam {C:attention}21 ou mais{}.",
					"Destrói todas as cartas selecionadas e cria uma",
					"carta {C:attention}classe 21{} de um naipe aleatório",
				},
			},
			
			["c_unstb_aux_upgrade"] = {
				["name"] = "Pata do Macaco",
				["text"] = {
					"{C:purple}Aprimora{} a {C:attention}edição{} de {C:attention}1{} carta selecionada ",
					"Converte cartas adjacentes para {C:attention}Cartas Venenosas{}",
					"{C:inactive}(Dá a volta nas bordas da mão){}",
				},
			},
			
			["c_unstb_aux_heal"] = {
				["name"] = "Guardião da Cura",
				["text"] = {
					"Addicione um {C:attention}Selo de Cura{}",
					"para {C:attention}#1#{} carta",
					"selecionada na sua mão",
				},
			},
			["c_unstb_aux_heal_hand"] = {
				["name"] = "Aura de Cura",
				["text"] = {
					"Cure todas as",
					"{C:red}Cartas Desaprimoradas{}",
					"na sua mão",
				},
			},
			
			["c_unstb_aux_lottery"] = {
				["name"] = "Loteria",
				["text"] = {
					"{C:green}#1# de #2#{} chance",
					"de ganhar {C:gold}$#3#{}",
				},
			},
			
			["c_unstb_aux_blank"] = {
				["name"] = "Carta em Branco",
				["text"] = {
					"Não faz nada..?",
				},
			},
			["c_unstb_aux_dark_matter"] = {
				["name"] = "Matéria Escura",
				["text"] = {
					"Permanentemente ganhe",
					"{C:dark_edition}+#1#{} espaço de Curinga",
					"{C:red}Não pode ser negativa",
				},
			},
			["c_unstb_aux_dark_matter_n"] = {
				["name"] = "Matéria Escura..?",
				["text"] = {
					"Permanentemente ganhe",
					"{C:red}-#1#{} espaço de Curinga",
				},
			},
			
			["c_unstb_aux_random"] = {
				["name"] = "A Interrogação",
				["text"] = {
					"Cria até {C:attention}#1#{} cartas",
					"{C:auxiliary}Auxiliares{} aleatórias",
					"{C:inactive}(Deve ter espaço)",
				},
			},
		},
		
		["Voucher"] = {
		
			["v_unstb_aux1"] = {
				["name"] = "Loja de Ferragens",
				["text"] = {
					"Cartas {C:auxiliary}Auxiliares{}",
					"podem ser compradas",
					"na {C:attention}loja{}",
				},
			},
			
			["v_unstb_aux2"] = {
				["name"] = "Ferramentas Robustas",
				["text"] = {
					"Cartas {C:auxiliary}Auxiliares{} nos",
					"{C:attention}Pacotes de Expansão{} podem",
					"ser {C:dark_edition}Negativas{}, às vezes",
				},
			},
			
		},
		
		["Joker"] = {
			--Basic Common Jokers
			
			["j_unstb_lunar_calendar"] = {
				["name"] = "Calendário Lunar",
				["text"] = {
					"Cartas jogadas com",
					"o naipe de {V:1}#1#{} têm",
					"{C:green}#2# de #3#{} chance de criar uma",
					"carta de {C:planet}Planeta{} aleatória quando pontuadas",
					"{C:inactive}(Deve ter espaço)",
					"{s:0.8}O naipe muda no fim da rodada",
				},
			},
			
			["j_unstb_dragon_hoard"] = {
				["name"] = "Tesouro do Dragão",
				["text"] = {
					"Dá {C:mult}+#1#{} Multi para",
					"cada {C:attention}#2#{} {C:attention}consumíveis{}",
					"na sua {C:attention}área de consumíveis{}",
					"{C:inactive}(No momento, {C:mult}+#3#{C:inactive} Multi)",
				},
			},
			
			["j_unstb_card_dealer"] = {
				["name"] = "Crupiê",
				["text"] = {
					"{C:chips}+#1#{} Fichas por carta",
					"{C:attention}jogada{} nesta tentativa",
					"{C:attention}Reseta{} no fim da rodada",
					"{C:inactive}(No momento, {C:chips}+#2#{C:inactive} Fichas)",
				},
			},
			
			["j_unstb_match_three"] = {
				["name"] = "Formar 3",
				["text"] = {
					"{C:mult}+#1#{} Multi se a mão jogada contém",
					"{C:attention}#2#{} ou mais cartas adjacentes",
					"com o {C:attention}mesmo naipe base{}",
				},
			},
			
			--Extra Uncommons
			
			["j_unstb_furry_joker"] = {
				["name"] = "Curinga Furry",
				["text"] = {
					"Cartas {C:attention}Naipe Curinga{} jogadas têm",
					"{C:green}#1# de #2#{} chance de",
					"virarem {C:dark_edition}Policromáticas{} quando pontuadas",
				},
			},
			
			["j_unstb_luxurious_handbag"] = {
				["name"] = "Bolsa Luxuosa",
				["text"] = {
					"{C:attention}+#1#{} espaço de consumível",
					"{C:red}Aumenta o preço{} de tudo na",
					"{C:attention}loja{} (exceto atualizações) em {C:gold}$#2#{}",
				},
			},
			
			["j_unstb_portal"] = {
				["name"] = "Portal",
				["text"] = {
					"{C:attention}Ázes{} podem ser usados",
					"no meio de uma {C:purple}Sequência{}",
					"{C:inactive}(Ex: 3, 2, Ás, Rei, Rainha)",
				},
			},
			
			--Selo de Naipe Support
			
			["j_unstb_vainglorious_joker"] = {
				["name"] = "Curinga Vanglorioso",
				["text"] = {
					"Cartas jogadas com um",
					"{C:attention}Selo de Naipe{} dão",
					"{C:attention}+#1#{} Multi quando pontuadas",
				},
			},
			
			["j_unstb_acedia_joker"] = {
				["name"] = "Curinga Apático",
				["text"] = {
					"Cartas jogadas com um",
					"{C:attention}Selo de Naipe{} da mesma",
					"{C:purple}categoria{} do naipe da carta",
					"dão {C:attention}+#1#{} Multi quando pontuadas",
				},
			},
			
			["j_unstb_cinnabar"] = {
				["name"] = "Cinábrio",
				["text"] = {
					"Cartas jogadas com um {C:attention}Selo de Naipe{} têm",
					"{C:green}#1# de #2#{} chance de criar a carta",
					"{C:auxiliary}Auxiliar de Selo{} respectiva quando pontuada",
					"{C:inactive}(Deve ter espaço)",
				},
			},
			
			--Auxiliary Support
			
			["j_unstb_free_trial"] = {
				["name"] = "Amostra Grátis",
				["text"] = {
					"{C:green}#1# de #2#{} chance de criar",
					"uma carta {C:auxiliary}Auxiliar{} {C:dark_edition}Negativa{} aleatória",
					"quando uma carta {C:auxiliary}Auxiliar{} for usada",
				},
			},
			
			["j_unstb_extended_warranty"] = {
				["name"] = "Garantia Extendida",
				["text"] = {
					"Cartas {C:auxiliary}Auxiliares{} na",
					"sua área de {C:attention}consumíveis{}",
					"dão {X:mult,C:white}X#1#{} Multi",
				},
			},
			
			["j_unstb_technician"] = {
				["name"] = "Técnico",
				["text"] = {
					"{C:chips}+#1#{} Fichas por",
					"Carta {C:auxiliary}Auxiliar{}",
					"usada nesta tentativa",
					"{C:inactive}(No momento, {C:chips}+#2#{C:inactive} Fichas){}",
				},
			},
			
			["j_unstb_season_pass"] = {
				["name"] = "Passe de Temporada",
				["text"] = {
					"{C:green}#1# de #2#{} chance de criar",
					"uma carta {C:auxiliary}Auxiliar{}",
					"ao descartar uma carta de {C:attention}realeza{}",
					"{C:inactive}(Deve ter espaço)",
				},
			},
			
			--Rank 21
			
			["j_unstb_black_jack"] = {
				["name"] = "Vinte e Um",
				["text"] = {
					"Este Curinga ganha {C:chips}Fichas{} igual ao {C:attention}valor total{}",
					"das classes da mão pontuada se for menor que {C:attention}#1#{}.",
					"{C:red}Dobra as Fichas acumuladas{} se o {C:attention}valor total{} for exatamente {C:attention}#1#{}.",
					"Reseta se o valor total for maior que {C:attention}#1#{}.",
					"{s:0.8}Redefine no fim do Blind de Chefe",
					"{C:inactive}(No momento, {C:chips}+#2#{C:inactive} Fichas)",
				},
			},
			
			["j_unstb_what"] = {
				["name"] = "É o quê?",
				["text"] = {
					"{C:attention}???{} jogados",
					"dão {C:chips}+#1#{} Fichas e",
					"{C:mult}+#2#{} Multi quando pontuadas",
				},
			},
			
			--Decimal Rank
			
			["j_unstb_floating_point_error"] = {
				["name"] = "Erro de Ponto Flutuante",
				["text"] = {
					"Toda carta de {C:attention}Classe Decimal{} jogada",
					"permanentemente ganha {C:chips}fichas extra{}",
					"iguais à sua {C:attention}classe{}",
				},
			},
			
			["j_unstb_academic_journal"] = {
				["name"] = "Revista Acadêmica",
				["text"] = {
					"Adiciona uma carta {C:attention}Aprimorada{} aleatória",
					"com uma {C:attention}classe decimal{} ao baralho se",
					"a mão pontuada não tem uma carta de {C:attention}realeza{}",
					"{C:inactive}(Uma vez por rodada. No momento, {C:red}#1#/#2#{C:inactive})",
				},
			},
			
			["j_unstb_engineer"] = {
				["name"] = "Engenheiro",
				["text"] = {
					"cartas com {C:attention}classes decimais{} contam como",
					"a maior {C:attention}classe inteira{} mais próxima quando",
					"jogadas, exceto quando a mão for {C:purple}SeqUência{}",
					"{C:inactive}(EX: 3.14 -> 4)",
				},
			},
			
			["j_unstb_thesis_proposal"] = {
				["name"] = "Proposta de Tese",
				["text"] = {
					"Reativa {C:attention}#1#{} vezes adicionais",
					"todas as cartas de",
					"{C:attention}classe decimal{} jogadas"
				},
			},
			
			["j_unstb_rainbow_flag"] = {
				["name"] = "Bandeira Arco-Íris",
				["text"] = {
					"Se uma mão que contém {C:purple}Sequência{} tem",
					"ao menos 1 carta de {C:attention}classe decimal{},",
					"{C:green}#1# de #2#{} chance de converter",
					"uma das cartas para {C:dark_edition}Policromático{}",
				},
			},
			
			--Binary Ranks
			
			["j_unstb_dummy_data"] = {
				["name"] = "Dados Fictícios",
				["text"] = {
					"Para cada carta {C:attention}não-pontuada{}",
					"{C:green}#1# de #2#{} chance de",
					"converter a sua classe para {C:attention}0{}",
					"(Mantém a quantidade de Fichas)",
				},
			},
			
			["j_unstb_micro_sd_card"] = {
				["name"] = "Cartão de Memória",
				["text"] = {
					"Se este Curinga estiver na ponta da {C:attention}esquerda{},",
					"pega todas as Fichas de {C:attention}cartas numeradas{} base",
					"{C:attention}descartadas{} e converte a classe dessas cartas para {C:attention}0{}",
					"{C:green}#1# de #2#{} chance de se autodestruir ao fim da rodada",
					"A chance aumenta na quantidade de Fichas salvas",
					"{C:inactive}(No momento, {C:chips}+#4#{C:inactive} Fichas)",
					"{C:inactive}Status: {V:1}#5#{}",
				},
			},
			
			["j_unstb_social_experiment"] = {
				["name"] = "Experimento Social",
				["text"] = {
					"Para cada carta {C:attention}não-realeza{} pontuada,",
					"com menos de {C:attention}128{} {C:chips}fichas extra{},",
					"dobre suas Fichas, dê para a próxima carta",
					"e converta sua {C:attention}classe{} para {C:attention}0{}",
				},
			},
			
			["j_unstb_power_of_one"] = {
				["name"] = "Um-Por-Todos",
				["text"] = {
					"Dá {C:mult}+#1#{} Multi por cada",
					"{C:attention}1{} no seu {C:attention}baralho completo{}",
					"{C:inactive}(No momento, {C:mult}+#2#{C:inactive})",
				},
			},
			
			["j_unstb_binary_number"] = {
				["name"] = "Número Binário",
				["text"] = {
					"Se a mão jogada contém {C:attention}4{} cartas ou menos",
					"e só tem cartas de classe {C:attention}0{} e {C:attention}1{},",
					"crie uma carta de {C:attention}classe{} igual ao",
					"ao número binário representado pela mão",
					"({C:red}Ex:{} {C:attention}1001{} -> {C:attention}9{})",
					"{C:inactive}[Jack, Queen, King, Ace são 11-14, respectivamente]{}",
				},
			},
			
			--Basegame Enhancement
			
			["j_unstb_quintuplets"] = {
				["name"] = "Quintigêmeos",
				["text"] = {
					"Se a mão jogada contém um",
					"{C:attention}Five of a Kind{}",
					"cria uma {C:dark_edition}Marca Negativa{}",
				},
			},
			
			--Edition Line
			
			["j_unstb_graphic_card"] = {
				["name"] = "Placa de Vídeo",
				["text"] = {
					"Cria uma {C:attention}Marca Dupla{}",
					"no fim da rodada se",
					"{C:attention}#1#{} ou mais cartas com",
					"{C:dark_edition}edições{} pontuaram neste round",
					"{C:inactive}(No momento, {C:attention}#2# {C:inactive}cartas)",
				},
			},
			
			["j_unstb_connoiseur"] = {
				["name"] = "Conhecedor",
				["text"] = {
					"Reative todas as cartas jogadas",
					"com {C:dark_edition}edições{}",
				},
			},
			
			["j_unstb_jeweler"] = {
				["name"] = "Joalheiro",
				["text"] = {
					"{C:green}#1# de #2#{} chance de reduzir",
					"o nível da {C:attention}mão de pôquer{}",
					"e {C:purple}aprimorar{} a edição",
					"de todas as cartas pontuadas",
				},
			},
			
			--Slop
			
			["j_unstb_joker_diffusion"] = {
				["name"] = "Difusão Instável",
				["text"] = {
					"Converte {C:attention}#1#{} carta {C:attention}não-aprimorada{} aleatória",
					"na mão para {C:attention}Carta Malfeita{} toda vez que",
					"uma mão é jogada com uma carta {C:attention}não-pontuada{}",
				},
			},
			
			["j_unstb_nonfungible_joker"] = {
				["name"] = "Curinga Não Fungível",
				["text"] = {
					"Se uma mão descartada contém",
					"apenas {C:attention}#1# Carta Malfeita{}, destrua-a e",
					"e receba um valor monetário aleatório {C:inactive}(Máx. {C:gold}$#2# {C:inactive})",
					"{s:0.7,C:red}Valor máximo e preço de venda caem no fim da rodada",
				},
			},
			
			["j_unstb_prompt"] = {
				["name"] = "Prompt",
				["text"] = {
					"{C:attention}Cartas Malfeitas{} pontuadas têm",
					"{C:attention}classe{} e {C:attention}naipe{} de",
					"outras cartas {C:attention}Não-Malfeitas{}",
					"ao invés de aleatórios (se possível)",
				},
			},
			
			["j_unstb_uninterested_primate"] = {
				["name"] = "Primata Desinteressado",
				["text"] = {
					"Ganha {C:chips}+#1#{} Fichas a cada {C:attention}#2# {C:inactive}[#6#]",
					"{C:attention}Cartas Malfeitas{} pontuadas.",
					"{C:green}#3# de #4#{} chance desta carta ser",
					"destruída no fim da rodada",
					"{C:inactive}(No momento, {C:chips}+#5# {C:inactive}Fichas)",
				},
			},
			
			["j_unstb_lethargic_lion"] = {
				["name"] = "Leão Letárgico",
				["text"] = {
					"Ganha {X:mult,C:white}X#1#{} Multi a cada {C:attention}#2# {C:inactive}[#6#]",
					"{C:attention}Cartas Malfeitas{} pontuadas.",
					"{C:green}#3# de #4#{} chance desta carta ser",
					"destruída no fim da rodada",
					"{C:inactive}(No momento, {X:mult,C:white}+#5# {C:inactive}Multi)",
				},
			},
			
			--New Enhancement Support

			["j_unstb_vintage_joker"] = {
				["name"] = "Curinga Retrô",
				["text"] = {
					"{C:attention}Cartas Retrô{} pontuadas têm",
					"{C:green}#1# de #2#{} chance de resetar",
					"sua chance de destruição",
				},
			},
			
			["j_unstb_rules_errata"] = {
				["name"] = "Lista de Regras",
				["text"] = {
					"{C:attention}Cartas de Bolota{} dão {C:attention}metade{} do valor",
					"de sua {C:attention}classe{} em Multi ao pontuar",
				},
			},
			
			["j_unstb_auction_winner"] = {
				["name"] = "Vencedor do Leilão",
				["text"] = {
					"Se uma {C:attention}Carta Promocional{} for",
					"destruída ao pontuar, este Curinga",
					"ganha {C:gold}dinheiro{} igual ao",
					"{C:gold}dinheiro{} que qquela carta dava",
					"antes de sua destruição",
				},
			},
			
			["j_unstb_joker_island"] = {
				["name"] = "Sobrevivência na Ilha",
				["text"] = {
					"Para cada carta pontuada",
					"com {C:attention}classe{} {C:attention}#1#{}, {C:green}#2# de #3#{} chance",
					"de adicionar uma {C:attention}Carta de Recurso{}",
					"do mesmo naipe ao baralho",
					"{s:0.8}Classe muda no dim da rodada",
				},
			},
			
			--Unhancement Jokers
			
			["j_unstb_kaiju"] = {
				["name"] = "Kaiju",
				["text"] = {
					"{C:dark_edition}+#1#{} espaço de Curinga",
					"Converte uma carta aleatória",
					"para {C:attention}Carta Radioativa{} quando",
					"a primeira mão é retirada",
				},
			},
			
			["j_unstb_poison_the_well"] = {
				["name"] = "Envenenar o Poço",
				["text"] = {
					"{C:red}+#1#{} Descartes",
					"Converte uma carta aleatória",
					"em cada mão descartada",
					"para {C:attention}Carta Venenosa{}",
				},
			},
			
			["j_unstb_petri_dish"] = {
				["name"] = "Placa de Petri",
				["text"] = {
					"{C:blue}+#1#{} Mãos",
					"{C:green}#2# de #3#{} chance de converter",
					"uma carta jogada aleatória",
					"para {C:attention}Carta Contagiosa{}",
				},
			},
			
			--Unhancement Support
			
			["j_unstb_geiger_counter"] = {
				["name"] = "Contador Geiger",
				["text"] = {
					"Dá {C:mult}+#1#{} Multi por",
					"cada {C:attention}Carta Radioativa{}",
					"no seu {C:attention}baralho completo{}",
					"{C:inactive}(No momento, {C:mult}+#2#{C:inactive} Multi)",
				},
			},
			
			["j_unstb_strych_nine"] = {
				["name"] = "Estricnina",
				["text"] = {
					"Dá {C:chips}+#1#{} Fichas por",
					"cada {C:attention}Carta Venenosa{}",
					"no seu {C:attention}baralho completo{}",
					"{C:inactive}(No momento, {C:chips}+#2#{C:inactive} Fichas)",
				},
			},
			
			["j_unstb_vaccination_card"] = {
				["name"] = "Cartão de Vacinação",
				["text"] = {
					"Neutralize todos os efeitos passivos das ",
					"{C:attention}Cartas Contagiosas{} e ganha {X:mult,C:white}X#1#{} Multi por cada",
					"{C:attention}Carta Contagiosa{} contida na mão",
					"{C:inactive}(No momento, {X:mult,C:white}X#2#{C:inactive} Multi)",
				},
			},
			
			--Shitposts
			
			["j_unstb_joker2"] = {
				["name"] = "Joker2",
				["text"] = {
					"{C:mult}+#1#{} Multi",
					"{X:mult,C:white}X#2#{} Multi",
					"{C:green}#3# in #4#{} chance this",
					"card is destroyed",
					"at end of round",
				},
			},
			
			["j_unstb_joker_stairs"] = {
				["name"] = "Escadaria do Curinga",
				["text"] = {
					"Ganha {C:mult}+#1#{} Multi quando um Curinga",
					"com {C:attention}\"Curinga\"{} no nome é",
					"comprado diretamente da loja",
					"{C:inactive}(No momento, {C:mult}+#2#{C:inactive} Multi){}",
				},
			},
			
			["j_unstb_plagiarism"] = {
				["name"] = "Plágio",
				["text"] = {
					"Copia a habilidade do",
					"{C:attention}Curinga{} à direita",
					"ou esquerda, aleatoriamente",
					"{s:0.8}A direção muda a cada mão jogada",
				},
			},
			
			["j_unstb_joker_throwing_card"] = {
				["name"] = "Carta Curinga de Arremesso",
				["text"] = {
					"Reduza o tamanho do {C:attention}Blind{} em {C:attention}#1#%{}",
					"{C:green}#2# de #3#{} chance de destruir",
					"uma das cartas pontuadas",
					"Aumenta a porcentagem em {C:attention}#4#%{}",
					"se uma carta for destruída dessa maneira",
				},
			},
			
			--Face Card Jokers
			
			["j_unstb_jackhammer"] = {
				["name"] = "Vale-te 5 Vezes",
				["text"] = {
					"Se a {C:attention}mão jogada{} tem",
					"apenas um {C:attention}Valete{},",
					"reative-o {C:attention}#1#{} vezes adicionais",
					"e em seguida {C:red}destrua-o{}",
				},
			},
			
			["j_unstb_jack_of_all_trades"] = {
				["name"] = "Valete Trabalhador",
				["text"] = {
					"{C:attention}Valetes{} jogados dão",
					"{C:chips}+#1#{} Fichas, {C:mult}+#2#{} Multi, ",
					"{X:mult,C:white}X#3#{} Multi, e {C:gold}$#4#",
				},
			},
			
			["j_unstb_magic_trick_card"] = {
				["name"] = "Carta de Mágico",
				["text"] = {
					"As {V:1}#1#{} pontuadas",
					"viram {V:2}#2#{}",
					"{s:0.8}Após Descartar, gira o curinga",
				},
			},
			
			["j_unstb_queensland"] = {
				["name"] = "Queensland",
				["text"] = {
					"{C:attention}Rainhas{} pontuadas adicionam",
					"{C:attention}Cartas de Recurso{} do",
					"naipe correspondente ao baralho",
					"{C:inactive}({C:red}#1#{C:inactive} vezes por round, {C:red}restam #2#{C:inactive})",
				},
			},
			
			["j_unstb_king_of_pop"] = {
				["name"] = "Rei do Pop",
				["text"] = {
					"{C:attention}Reis Aprimorados{} têm",
					"{C:green}#1# de #2#{} chance de serem",
					"destruídos e criarem uma {C:dark_edition}Marca Dupla",
				},
			},
			
			["j_unstb_prssj"] = {
				["name"] = "Curinga de Aço Policromático com Selo Vermelho",
				["text"] = {
					"{C:green}#1# de #2#{} chance de {C:purple}aprimorar{} a edição de {C:attention}Reis{} pontuados",
					"{C:green}#1# de #3#{} chance de {C:attention}reativar Reis{} pontuados",
					"{C:green}#1# de #4#{} chance de {C:attention}Reis{} contidos na mão darem {X:mult,C:white}X#5#{} Multi",
				},
			},
			
			["j_unstb_master_of_one"] = {
				["name"] = "Mestre de Um",
				["text"] = {
					"Adicione uma carta {C:attention}classe 1 Aprimorada{}",
					"ao baralho quando o {C:attention}Blind{} é selecionado",
				},
			},
			
			--Intermission
			
			["j_unstb_spectre"] = {
				["name"] = "Espectro",
				["text"] = {
					"{X:mult,C:white}X#1#{} Multi por carta {C:spectral}Espectral{}",
					"usada nesta tentativa",
					"{C:inactive}(No momento, {X:mult,C:white}X#2#{C:inactive} Multi){}",
				},
			},
			
			["j_unstb_library_card"] = {
				["name"] = "Cartão de Biblioteca",
				["text"] = {
					"Para cada {C:attention}nome de naipe{} no {C:attention}singular",
					"em Inglês, este Curinga dá:",
					"{C:chips}+#1#{} Fichas por {C:attention}Consoante",
					"{C:mult}+#2#{} Multi por {C:attention}Vogal",
					"{C:inactive}(Exemplo: Spade = {C:chips}+15{C:inactive} Fichas, {C:mult}+4{C:inactive} Multi)",
				},
			},
			
			["j_unstb_collector_album"] = {
				["name"] = "Álbum de Coleção",
				["text"] = {
					"Curingas com {C:attention}\"Carta\", \"Card\"{}",
					"ou {C:attention}\"Cartão\"{} no seu nome dão",
					"{C:chips}+#1#{} Fichas",
				},
			},
			
			["j_unstb_throwing_hands"] = {
				["name"] = "Mãozada",
				["text"] = {
					"{X:mult,C:white}X#1#{} Multi",
					"{C:green}#2# de #3#{} chance de se {E:1,C:red}autodestruir{}",
					"se a mão de pôquer pontuada",
					"não for {C:attention}#4#{}",
					"{s:0.7}A mão muda no fim da rodada",
				},
			},
			
			--Historic Cards
			
			["j_unstb_imperial_bower"] = {
				["name"] = "Imperial Bower",
				["text"] = {
					"{X:mult,C:white}X#1#{} Multi se a mão jogada",
					"contém uma {C:attention}Sequência{} e",
					"tem ao menos uma carta de {C:attention}realeza{}",
				},
			},
			
			["j_unstb_the_jolly_joker"] = {
				["name"] = "O \"Curinga Alegre\"",
				["text"] = {
					"Ganha {C:mult}+#1#{} Multi se a",
					"mão jogada contém um {C:attention}Par{}",
					"{C:red}Reseta{} se a mão jogada",
					"não contém um {C:attention}Par{}",
					"{C:inactive}(No momento, {C:mult}+#2#{C:inactive} Multi)",
				},
			},
			
			["j_unstb_get_out_of_jail_free_card"] = {
				["name"] = "Carta Saída Livre da Prisão",
				["text"] = {
					"Venda este Curinga para",
					"vencer o Blind instantaneamente",
					"{C:inactive}Status: {V:1}#1#{}",
				},
			},
			
			["j_unstb_tanzaku"] = {
				["name"] = "Tanzaku",
				["text"] = {
					"Reativa cartas jogadas com",
					"{C:attention}selos{} {C:attention}#1#{} vezes adicionais",
					"A quantidade aumenta em {C:attention}#2#{} por",
					"cada {C:attention}#3# {C:inactive}[#4#]{} cartas descartadas com um {C:attention}selo{}",
					"{s:0.8}Reseta após cada rodada",
				},
			},
			
			--Misc Jokers
			
			["j_unstb_glass_cannon"] = {
				["name"] = "Canhão de Vidro",
				["text"] = {
					"Reativa cada",
					"{C:attention}Carta de Vidro{} jogada",
					"{C:red}Cartas de Vidro sempre",
					"{C:red}quebram quando pontuadas",
				},
			},
			
			["j_unstb_pity_rate_drop"] = {
				["name"] = "Oitavo Drop Garantido",
				["text"] = {
					"Quando o {C:attention}Blind{} é selecionado,",
					"{C:green}#1# de #2#{} chance de criar um {C:attention}Curinga{} {C:red}Raro{}",
					"Chance aumenta em {C:green}#3#{} se nenhum {C:attention}Curinga{} criado,",
					"Caso contrário, reseta para {C:green}#4#{}",
					"{C:inactive}(Deve ter espaço)",
				},
			},
			
			["j_unstb_salmon_run"] = {
				["name"] = "Corrida de Salmão",
				["text"] = {
					"Cada {C:attention}7{} pontuado tem",
					"{C:green}#1# em #2#{} chances de adicionar uma",
					"cópia permanente ao baralho",
				},
			},
			
			["j_unstb_cool_s"] = {
				["name"] = "S Daora",
				["text"] = {
					"{C:attention}8s{} pontuados tornam-se",
					"uma carta {C:attention}Aprimorada{} aleatória",
				},
			},
			
			["j_unstb_memoriam_photo"] = {
				["name"] = "Foto Póstuma",
				["text"] = {
					"quando uma carta de jogo é {C:attention}destruída{},",
					"este Curinga ganha Fichas igual ao {C:attention}double{}",
					"da classe da {C:attention}carta destruída{}",
					"{C:inactive}(No momento, {C:chips}+#1#{C:inactive} Fichas)",
				},
			},
			
			["j_unstb_schrodinger_cat"] = {
				["name"] = "Gato de Schrödinger",
				["text"] = {
					"Quando uma carta de jogo é {C:attention}destruída{},",
					"{C:green}#1# de #2#{} chance de adicionar",
					"uma cópia da carta ao baralho",
				},
			},
			
			["j_unstb_cashback_card"] = {
				["name"] = "Cartão de Cashback",
				["text"] = {
					"No fim de um {C:attention}Blind de Chefe{},",
					"ganhe {C:gold}dinheiro{} igual à quantidade",
					"de {C:attention}consumíveis{} usados nesta {C:attention}Aposta",
					"{C:inactive}(No momento, {C:gold}$#1#{C:inactive})",
				},
			},
			
			["j_unstb_raffle"] = {
				["name"] = "Rifa",
				["text"] = {
					"No final de cada {C:attention}loja{},",
					"{C:green}#1# de #2#{} chance de ganhar {C:gold}$#3#",
					"Chance aumenta em {C:green}#4#{}",
					"por cada compra na {C:attention}loja",
					"{s:0.8, C:red}Reseta após sair da loja",
				},
			},
			
			["j_unstb_ic_card"] = {
				["name"] = "Cartão IC",
				["text"] = {
					"Guarde {C:gold}$#1#{} neste Curinga toda",
					"vez que uma mão é jogada",
					"Ao gastar dinheiro, o {C:attention}saldo",
					"neste Curinga é gasto primeiro",
					"{C:red}Usável apenas por #2# rodadas",
					"{s:0.8,C:inactive}(No momento, {C:gold}$#3#{C:inactive}, {C:red}Restam #4# rodadas{C:inactive}){}",
				},
			},
			
			["j_unstb_j2048"] = {
				["name"] = "2048",
				["text"] = {
					"Se a mão jogada contém um {C:attention}Par{},",
					"destrói a carta da esquerda e dá",
					"suas fichas para a da direita",
					"{C:inactive}(Arraste para reorganizar){}",
				},
			},
			["j_unstb_j2048_ex"] = {
				["name"] = "2048",
				["text"] = {
					"Se a mão jogada contém um {C:attention}Par{} com",
					"classes potências de 2 {C:attention}(0, 1, 2, 4, 8){}, destrói",
					"a da esquerda e dá as Fichas para a outra",
					"{C:inactive}(Arraste para reorganizar){}",
				},
			},
			
			["j_unstb_inductor"] = {
				["name"] = "Indutor",
				["text"] = {
					"Para cada carta jogada com os mesmos",
					"{C:attention}naipe{} e {C:attention}classe{} de outra carta jogada:",
					"{C:green}#1# de #2#{} chance de copiar o {C:attention}Aprimoramento{}",
					"{C:green}#1# de #3#{} chance de copiar a {C:attention}Edição{}",
					"{C:green}#1# de #4#{} chance de copiar o {C:attention}Selo{}",
				},
			},
			
			
			--Vanilla Joker Override
			
			["j_fibonacci_ex"] = {
				["name"] = "Fibonacci",
				["text"] = {
					"Cada {C:attention}0{}, {C:attention}1{}, {C:attention}Ás{},",
					"{C:attention}2{}, {C:attention}3{}, {C:attention}5{}, {C:attention}8{}, {C:attention}13{}, ou {C:attention}21{} jogados",
					"dão {C:mult}+#1#{} Multi quando pontuados",
				},
			},
			
			["j_odd_todd_ex"] = {
				["name"] = "Crispimpar",
				["text"] = {
					"Cartas jogadas com",
					"classe {C:attention}ímpar{} dão",
					"{C:mult}+#1#{} Multi quando pontuadas",
					"{C:inactive}(161, 21, 13, 11, A, 9, 7, 5, 3, 1){}",
				},
			},
			
			["j_even_steven_ex"] = {
				["name"] = "Gaspar",
				["text"] = {
					"Cartas jogadas com",
					"classe {C:attention}par{} dão",
					"{C:mult}+#1#{} Multi quando pontuadas",
					"{C:inactive}(12, 10, 8, 6, 4, 2, 0){}",
				},
			},
			
			["j_hack_ex"] = {
				["name"] = "Impostor",
				["text"] = {
					"Reativa cada",
					"{C:attention}0{}, {C:attention}1{}, {C:attention}2{},",
					"{C:attention}3{}, {C:attention}4{}, ou {C:attention}5{}",
				},
			},
		},
		
	},
}
