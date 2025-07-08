return {
	["misc"] = {
		["dictionary"] = {
		
			--Config Stuff
		
			["unstb_config_requires_restart"] = "需要重启生效",
			
			["unstb_config_header_mech_setting"] = "机制设置",
			
			["unstb_config_header_rank"] = "点数",
			["unstb_config_rank21"] = "大点数",
			["unstb_config_rank_bi"] = "0和1点",
			["unstb_config_rank_decimal"] = "小数点数",
		
			["unstb_config_header_enh"] = "增强",
			["unstb_config_enh_custom"] = "新增增强",
			["unstb_config_enh_disenh"] = "削弱",
			
			["unstb_config_header_mechanics"] = "新增机制",
			["unstb_config_mech_upgrade"] = "版本升级",
			["unstb_config_mech_suitseal"] = "花色和人头蜡封",
			["unstb_config_mech_aux"] = "工具牌",
			["unstb_config_mech_music"] = "自定义音乐",
			["unstb_config_mech_fallback"] = "备用设置",
			["unstb_config_mech_fallback_desc"] = {
				"包含类似工具牌的设定",
				"建议在禁用工具牌时开启",
			},
			["unstb_config_mech_new_spectral"] = "新增幻灵牌",
			
			["unstb_config_header_joker_settings"] = "小丑设置",
			
			--Extra Flavour Badge Text
			["k_tarot_exclaim"] = "塔罗牌！？",
			
			["k_blueprint_l_compatible"] = "左侧：兼容",
			["k_blueprint_l_incompatible"] = "左侧：不兼容",
			["k_blueprint_r_compatible"] = "右侧：兼容",
			["k_blueprint_r_incompatible"] = "右侧：不兼容",
			
			--Auxiliary Card stuff
			--Category Name
			["k_auxiliary"] = "工具",
			
			--Gallery Button
			["b_auxiliary_cards"] = "工具牌", 
			
			--Booster Packs
			["k_booster_group_p_unstb_aux_1"] = "拓展包",
			["k_booster_group_p_unstb_aux_2"] = "拓展包",
			["k_booster_group_p_unstb_aux_mega"] = "拓展包",
			["k_booster_group_p_unstb_aux_jumbo"] = "拓展包",
			
			["k_booster_group_p_unstb_prem_1"] = "高级标准包",
			["k_booster_group_p_unstb_prem_2"] = "高级标准包",
			["k_booster_group_p_unstb_prem_mega"] = "高级标准包",
			["k_booster_group_p_unstb_prem_jumbo"] = "高级标准包",
		},
		["ranks"] = {
		
			["unstb_21"] = "21",
			["unstb_???"] = "???",
		
			["unstb_0"] = "0",
			["unstb_1"] = "1",
		
			["unstb_0.5"] = "0.5",
			["unstb_r2"] = "√2",
			["unstb_e"] = "e",
			["unstb_Pi"] = "Pi",
			
			["unstb_11"] = "11",
			["unstb_12"] = "12",
			["unstb_13"] = "13",
			["unstb_25"] = "25",
			["unstb_161"] = "161",
			
		},
		["labels"] = {
		
			["unstb_spades_seal"] = "黑桃蜡封",
			["unstb_hearts_seal"] = "红桃蜡封",
			["unstb_clubs_seal"] = "梅花蜡封",
			["unstb_diamonds_seal"] = "方片蜡封",
			
			["unstb_face_seal"] = "人头蜡封",
			["unstb_heal_seal"] = "治疗蜡封",
			
		},
	},
	["descriptions"] = {
	
		["Back"] = {
		
			["b_unstb_utility"] = {
				["name"] = "工具牌组",
				["text"] = {
					"开局时拥有",
					"{C:auxiliary}五金店{}优惠券",
					"和{C:attention}1{}张{C:auxiliary}疑问{},",
					"{C:auxiliary}工具牌{}在{C:attention}商店{}",
					"出现得更频繁",
				},
			},
			
			["b_unstb_lowkey"] = {
				["name"] = "低调牌组",
				["text"] = {
					"初始仅拥有",
					"{C:attention}点数0-5{}以及",
					"它们之间所有的",
					"{C:attention}小数点数{}的牌",
				},
			},
			
		},
		
		["Sleeve"] = {
		
			["sleeve_unstb_utility"] = {
				["name"] = "工具卡套",
				["text"] = {
					"开局时拥有",
					"{C:auxiliary}五金店{}优惠券",
					"和{C:attention}1{}张{C:auxiliary}疑问{},",
					"{C:auxiliary}工具牌{}在{C:attention}商店{}",
					"出现得更频繁",
				},
			},
			
			["sleeve_unstb_utility_alt"] = {
				["name"] = "工具卡套",
				["text"] = {
					"开局时拥有",
					"{C:auxiliary}重型机械{}优惠券",
					"和{C:attention}1{}张{C:dark_edition}负片{}{C:attenttion}免费试用{}",
				},
			},
			
			["sleeve_unstb_lowkey"] = {
				["name"] = "低调卡套",
				["text"] = {
					"初始仅拥有",
					"{C:attention}点数0-5{}以及",
					"它们之间所有的",
					"{C:attention}小数点数{}的牌",
				},
			},
			
			["sleeve_unstb_lowkey_alt"] = {
				["name"] = "低调卡套",
				["text"] = {
					"点数大于{C:attention}5{}的卡牌",
					"不会在本局出现",
				},
			},
			
		},
		
		["Other"] = {
			
			--Playing Card Ability Text
			
			["no_chip"] = {
				["text"] = {
					"不提供筹码",
				},
			},
			["decimal_rank_ability"] = {
				["text"] = {
					"在{C:purple}顺子{}中打出时",
					"可以视为{C:attention}不同点数{}",
					"{C:inactive}[#1#, #2#, #3#]{}",
				},
			},
			["decimal_rank_ability_2"] = {
				["text"] = {
					"在{C:purple}顺子{}中打出时",
					"可以视为{C:attention}不同点数{}",
					"{C:inactive}[#1#, #2#]{}",
				},
			},
			
			-- Other Mechanics
			
			["upgrade_edition"] = {
				["name"] = "版本升级",
				["text"] = {
					"改变卡牌的{C:attention}版本{}",
					"按以下顺序：",
					"{C:inactive}(无){} -> {C:dark_edition}闪箔{} ->",
					"{C:dark_edition}镭射{} -> {C:dark_edition}多彩{}",
				},
			},
			
			["disenhancement"] = {
				["name"] = "削弱",
				["text"] = {
					"拥有负面",
					"效果的增强",
					"{C:attention}(放射，生化，毒素){}",
				},
			},
			
			--Extra Tooltip for description that does not lend itself well in tooltip form
			
			["acorn_tooltip"] = {
				["name"] = "松果牌",
				["text"] = {
					"留在手牌中时",
					"提供{C:chips}双倍{}筹码",
					"计分时不提供筹码",
				},
			},
			["resource_tooltip"] = {
				["name"] = "资源牌",
				["text"] = {
					"无点数，总是计分",
					"如果打出的牌中包含",
					"{C:attention}(对应花色){}的牌",
					"则提供{X:mult,C:white}X5{}倍率",
					"{C:red}计分后自毁{}",
					"{C:inactive}(不计入其他资源牌){}",
				},
			},
			["poison_tooltip"] = {
				["name"] = "毒素牌",
				["text"] = {
					"筹码为{C:red}负数{}",
					"弃掉的{C:attention}毒素牌{}",
					"会回到手牌中",
				},
			},
			
			--Seal
			
			["suit_seal"] = {
				["name"] = "花色蜡封",
				["label"] = "花色蜡封",
				["text"] = {
					"使这张牌也视为",
					"{C:attention}(对应花色){}",
				},
			},
			["unstb_spades_seal"] = {
				["name"] = "黑桃蜡封",
				["label"] = "黑桃蜡封",
				["text"] = {
					"这张牌也视为",
					"{V:1}#1#{}",
				},
			},
			["unstb_hearts_seal"] = {
				["name"] = "红桃蜡封",
				["label"] = "红桃蜡封",
				["text"] = {
					"这张牌也视为",
					"{V:1}#1#{}",
				},
			},
			["unstb_clubs_seal"] = {
				["name"] = "梅花蜡封",
				["label"] = "梅花蜡封",
				["text"] = {
					"这张牌也视为",
					"{V:1}#1#{}",
				},
			},
			["unstb_diamonds_seal"] = {
				["name"] = "方片蜡封",
				["label"] = "方片蜡封",
				["text"] = {
					"这张牌也视为",
					"{V:1}#1#{}",
				},
			},
			["unstb_face_seal"] = {
				["name"] = "人头蜡封",
				["label"] = "人头蜡封",
				["text"] = {
					"这张牌也视为",
					"{C:attention}人头牌{}",
				},
			},
			["unstb_heal_seal"] = {
				["name"] = "治疗蜡封",
				["label"] = "治疗蜡封",
				["text"] = {
					"计分时移除手牌中",
					"随机一张牌的{C:red}削弱{}",
					"这张牌无法被{C:red}削弱{}",
				},
			},
			
			--Auxiliary Card-related stuff
			
			["undiscovered_auxiliary"] = {
				["name"] = "未发现",
				["text"] = {
					"在非预设局",
					"中购买或",
					"使用此牌",
					"以了解其效果",
				},
			},
			
			["p_unstb_aux_1"] = {
				["group_name"] = "拓展包",
				["name"] = "拓展包",
				["text"] = {
					"从最多{C:attention}#2#{}张{C:auxiliary}工具牌{}中",
					"选择{C:attention}#1#{}张",
					"到你的消耗牌区"
				},
			},
			["p_unstb_aux_2"] = {
				["group_name"] = "拓展包",
				["name"] = "拓展包",
				["text"] = {
					"从最多{C:attention}#2#{}张{C:auxiliary}工具牌{}中",
					"选择{C:attention}#1#{}张",
					"到你的消耗牌区"
				},
			},
			["p_unstb_aux_mega"] = {
				["group_name"] = "拓展包",
				["name"] = "超级拓展包",
				["text"] = {
					"从最多{C:attention}#2#{}张{C:auxiliary}工具牌{}中",
					"选择{C:attention}#1#{}张",
					"到你的消耗牌区"
				},
			},
			["p_unstb_aux_jumbo"] = {
				["group_name"] = "拓展包",
				["name"] = "巨型拓展包",
				["text"] = {
					"从最多{C:attention}#2#{}张{C:auxiliary}工具牌{}中",
					"选择{C:attention}#1#{}张",
					"到你的消耗牌区"
				},
			},
			
			["p_unstb_prem_1"] = {
				["group_name"] = "高级标准包",
				["name"] = "高级标准包",
				["text"] = {
					"从最多{C:attention}#2#{}张{C:attention}特殊点数{}的",
					"{C:attention}增强游戏牌{}中选择{C:attention}#1#{}张",
					"添加到你的牌组"
				},
			},
			["p_unstb_prem_2"] = {
				["group_name"] = "高级标准包",
				["name"] = "高级标准包",
				["text"] = {
					"从最多{C:attention}#2#{}张{C:attention}特殊点数{}的",
					"{C:attention}增强游戏牌{}中选择{C:attention}#1#{}张",
					"添加到你的牌组"
				},
			},
			["p_unstb_prem_mega"] = {
				["group_name"] = "高级标准包",
				["name"] = "超级高级标准包",
				["text"] = {
					"从最多{C:attention}#2#{}张{C:attention}特殊点数{}的",
					"{C:attention}增强游戏牌{}中选择{C:attention}#1#{}张",
					"添加到你的牌组"
				},
			},
			["p_unstb_prem_jumbo"] = {
				["group_name"] = "高级标准包",
				["name"] = "巨型高级标准包",
				["text"] = {
					"从最多{C:attention}#2#{}张{C:attention}特殊点数{}的",
					"{C:attention}增强游戏牌{}中选择{C:attention}#1#{}张",
					"添加到你的牌组"
				},
			},
		},
		
		["Spectral"] = {
			
			--Fallback Spectral Cards
			
			["c_unstb_spc_elixir"] = {
				["name"] = "生命之水",
				["text"] = {
					"治疗牌组中所有{C:red}削弱牌{}",
					"资金减半{C:inactive}(向上取整){}",
				},
			},
			["c_unstb_spc_vessel"] = {
				["name"] = "容器",
				["text"] = {
					"选择最多{C:attention}#1#{}张牌,",
					"摧毁{C:attention}最左侧{}的牌",
					"并将它的{C:red}花色蜡封{}",
					"应用到{C:attention}其余的{}牌上",
					"{C:inactive}(拖动更改顺序){}",
				},
			},
			["c_unstb_spc_conferment"] = {
				["name"] = "授予",
				["text"] = {
					"为手牌中",
					"随机{C:attention}#1#{}张牌",
					"添加{C:attention}人头蜡封{}",
					"{C:red}-$#2#{} {C:inactive}(无负债限制){}",
				},
			},
			["c_unstb_spc_amnesia"] = {
				["name"] = "失忆",
				["text"] = {
					"将手牌中",
					"随机{C:attention}#1#{}张牌",
					"点数变为{C:attention}0{}",
				},
			},
			["c_unstb_spc_altar"] = {
				["name"] = "祭坛",
				["text"] = {
					"摧毁{C:attention}#1#{}张随机手牌",
					"并添加{C:attention}#2#{}张",
					"随机{C:attention}增强{}的{C:attention}21{}",
				},
			},
			["c_unstb_spc_contract"] = {
				["name"] = "魔鬼契约",
				["text"] = {
					"{C:purple}升级{C:attention}#1#{}张随机手牌",
					"{C:red}削弱{C:attention}#2#{}张随机手牌",
				},
			},
			
			--Other New Spectral Cards
			
			["c_unstb_spc_poltergeist"] = {
				["name"] = "吵闹鬼",
				["text"] = {
					"打乱所有",
					"小丑的{C:dark_edition}版本{}",
				},
			},
			["c_unstb_spc_projection"] = {
				["name"] = "星际投影",
				["text"] = {
					"交换{C:attention}选中的小丑{}",
					"和它{C:attention}右边的小丑{}",
					"的{C:dark_edition}版本{}",
					"{C:green}#1#/#2#{}几率{C:red}摧毁{}",
					"其中一个小丑",
				},
			},
			["c_unstb_spc_siphon"] = {
				["name"] = "虹吸",
				["text"] = {
					"摧毁{C:attention}1{}张选中的",
					"带有{C:dark_edition}版本{}的{C:attention}小丑{}",
					"将它的{C:dark_edition}版本{}添加到",
					"{C:attention}#1#{}张随机的手牌",
					"{C:inactive}(除了{C:dark_edition}负片{}{C:inactive}){}",
				},
			},
		},
		
		["Tarot"] = {
			
			--Enhancement Conversion Tarot
		
			["c_unstb_trt_time"] = {
				["name"] = "时间",
				["text"] = {
					"增强{C:attention}#1#{}张选定",
					"卡牌成为",
					"{C:attention}古旧牌{}",
				},
			},
			["c_unstb_trt_acorn"] = {
				["name"] = "松果",
				["text"] = {
					"增强{C:attention}#1#{}张选定",
					"卡牌成为",
					"{C:attention}松果牌{}",
				},
			},
			["c_unstb_trt_greed"] = {
				["name"] = "贪婪",
				["text"] = {
					"增强{C:attention}#1#{}张选定",
					"卡牌成为",
					"{C:attention}宣传牌{}",
				},
			},
			
			--Rank-addition Tarot
			
			["c_unstb_trt_half"] = {
				["name"] = "拆分",
				["text"] = {
					"拆分{C:attention}1{}张选定{C:attention}整数点数{}的卡牌",
					"为{C:attention}2{}张原卡牌{C:attention}一半点数{}的牌（向下取整）",
					"如果原点数为{C:attention}奇数{}，额外添加{C:attention}1{}张",
					"点数为{C:attention}0.5{}的拥有相同{C:attention}增强{}的牌",
				},
			},
			["c_unstb_trt_knowledge"] = {
				["name"] = "知识",
				["text"] = {
					"添加{C:attention}1{}张与选定卡牌同花色的",
					"{C:attention}小数{}点数卡牌到手牌",
				},
			},
			
		},
		
		["Enhanced"] = {
			
			--Standard Enhancement
			
			["m_unstb_vintage"] = {
				["name"] = "古旧牌",
				["text"] = {
					"计分时{C:chips}+#1#{}筹码",
					"{C:green}#2#/#3#{}几率自毁",
					"{C:inactive}(计分时几率提升{C:green}+#4#{C:inactive}){}",
				},
			},
			["m_unstb_acorn"] = {
				["name"] = "松果牌",
				["text"] = {
					"留在手牌中时",
					"提供{C:chips}+#1#{}筹码",
					"计分时不提供筹码",
				},
			},
			["m_unstb_promo"] = {
				["name"] = "宣传牌",
				["text"] = {
					"留在手牌中时获得{C:gold}$#1#{}",
					"计分时增加{C:gold}+$#2#{}",
					"{C:green}#3#/#4#{}几率计分时自毁",
				},
			},
			
			--Special Joker-centric Enhancement
			
			["m_unstb_resource"] = {
				["name"] = "资源牌",
				["text"] = {
					"无点数，总是计分",
					"如果打出的牌中包含",
					"{V:1}#2#{}花色的牌",
					"则提供{X:mult,C:white}X#1#{}倍率",
					"{C:red}计分后自毁{}",
					"{C:inactive}(不计入其他资源牌){}",
				},
			},
			["m_unstb_slop"] = {
				["name"] = "摇摆牌",
				["text"] = {
					"{C:chips}+#1#{}筹码",
					"总是计分",
					"计分后变成随机点数花色",
					"当前：{V:1}#2#{} {C:attention}#3#{}",
				},
			},
			
			--Unhancements
			
			["m_unstb_radioactive"] = {
				["name"] = "放射牌",
				["text"] = {
					"{C:chips}+#1#{}筹码，无点数花色",
					"打出时有{C:green}#2#/#3#{}几率将",
					"其他打出的牌转换为{C:attention}放射牌{}",
					"",
					"留在手牌中时有{C:green}#2#/#4#{}几率",
					"提供{X:mult,C:white}X#5#{}倍率，否则提供{X:mult,C:white}X#6#{}倍率",
				},
			},
			["m_unstb_biohazard"] = {
				["name"] = "生化牌",
				["text"] = {
					"{X:mult,C:white}X#1#{}倍率，无点数花色",
					"留在手牌中时失去{C:red}-$#2#{}",
					"被弃掉时有{C:green}#3#/#4#{}几率将牌组中",
					"随机一张牌转换为{C:attention}生化牌{}",
				},
			},
			["m_unstb_poison"] = {
				["name"] = "毒素牌",
				["text"] = {
					"{C:red}-#1#{}筹码",
					"被弃掉时",
					"会回到手牌中",
				},
			},
		},
		
		["Auxiliary"] = {
			
			["c_unstb_aux_spades"] = {
				["name"] = "黑桃精华",
				["text"] = {
					"给你手牌中的",
					"{C:attention}#1#{}张所选卡牌",
					"加上{V:1}#2#{}",
				},
			},
			["c_unstb_aux_hearts"] = {
				["name"] = "红桃精华",
				["text"] = {
					"给你手牌中的",
					"{C:attention}#1#{}张所选卡牌",
					"加上{V:1}#2#{}",
				},
			},
			["c_unstb_aux_clubs"] = {
				["name"] = "梅花精华",
				["text"] = {
					"给你手牌中的",
					"{C:attention}#1#{}张所选卡牌",
					"加上{V:1}#2#{}",
				},
			},
			["c_unstb_aux_diamonds"] = {
				["name"] = "方片精华",
				["text"] = {
					"给你手牌中的",
					"{C:attention}#1#{}张所选卡牌",
					"加上{V:1}#2#{}",
				},
			},
			
			["c_unstb_aux_face"] = {
				["name"] = "附身",
				["text"] = {
					"给你手牌中的",
					"{C:attention}#1#{}张所选卡牌",
					"加上{C:attention}人头蜡封{}",
				},
			},
			
			["c_unstb_aux_plus_two"] = {
				["name"] = "+2",
				["text"] = {
					"选择一张卡牌",
					"创造{C:attention}#1#{}张",
					"与所选牌同{C:attention}花色{}",
					"随机{C:attention}点数{}的牌",
				},
			},
			["c_unstb_aux_plus_four_wild"] = {
				["name"] = "万能+4",
				["text"] = {
					"选择一张卡牌",
					"创造{C:attention}#1#{}张",
					"与所选牌同{C:attention}点数{}",
					"随机{C:attention}花色{}的牌",
				},
			},
			
			["c_unstb_aux_inst_disc"] = {
				["name"] = "过去",
				["text"] = {
					"本回合{C:red}+#1#{}弃牌",
				},
			},
			["c_unstb_aux_inst_hsize"] = {
				["name"] = "现在",
				["text"] = {
					"本回合{C:attention}+#1#{}手牌上限",
				},
			},
			["c_unstb_aux_inst_hand"] = {
				["name"] = "未来",
				["text"] = {
					"本回合{C:blue}+#1#{}出牌",
				},
			},
			
			["c_unstb_aux_seal_move"] = {
				["name"] = "蜡封交换",
				["text"] = {
					"选定{C:attention}2{}张牌",
					"互换{C:attention}蜡封{}",
				},
			},
			
			["c_unstb_aux_conv_1"] = {
				["name"] = "一心一意",
				["text"] = {
					"将最多",
					"{C:attention}#1#{}张选定",
					"卡牌点数变成{C:attention}1{}",
				},
			},
			
			["c_unstb_aux_21"] = {
				["name"] = "二十一",
				["text"] = {
					"选定最多{C:attention}#1#{}张",
					"点数总和{C:attention}大于21{}的卡牌",
					"摧毁所有所选卡牌并",
					"生成一张随机花色的{C:attention}21{}",
				},
			},
			
			["c_unstb_aux_upgrade"] = {
				["name"] = "猴爪",
				["text"] = {
					"{C:purple}升级{C:attention}1{}选定卡牌的{C:attention}版本{}",
					"将相邻卡牌转换为{C:attention}毒素牌{}",
					"{C:inactive}(手牌两头相接){}",
				},
			},
			
			["c_unstb_aux_heal"] = {
				["name"] = "治疗守护",
				["text"] = {
					"给你手牌中的",
					"{C:attention}#1#{}张所选卡牌",
					"加上{C:attention}治疗蜡封{}",
				},
			},
			["c_unstb_aux_heal_hand"] = {
				["name"] = "治疗光环",
				["text"] = {
					"治疗手牌",
					"中所有",
					"{C:red}削弱卡牌{}",
				},
			},
			
			["c_unstb_aux_lottery"] = {
				["name"] = "彩票",
				["text"] = {
					"{C:green}#1#/#2#{}几率",
					"赢得{C:gold}$#3#{}",
				},
			},
			
			["c_unstb_aux_blank"] = {
				["name"] = "空白",
				["text"] = {
					"什么都没有？",
				},
			},
			["c_unstb_aux_dark_matter"] = {
				["name"] = "暗物质",
				["text"] = {
					"永久获得",
					"{C:dark_edition}+#1#{}小丑槽位",
					"{C:red}无法成为负片",
				},
			},
			["c_unstb_aux_dark_matter_n"] = {
				["name"] = "暗物质？",
				["text"] = {
					"永久获得",
					"{C:red}-#1#{}小丑槽位",
				},
			},
			
			["c_unstb_aux_random"] = {
				["name"] = "疑问",
				["text"] = {
					"创造最多{C:attention}#1#{}张",
					"随机{C:auxiliary}工具牌{}",
					"{C:inactive}(需要空间)",
				},
			},
		},
		
		["Voucher"] = {
		
			["v_unstb_aux1"] = {
				["name"] = "五金店",
				["text"] = {
					"{C:attention}商店{}里面",
					"有{C:auxiliary}工具牌{}",
					"可供选购",
				},
			},
			
			["v_unstb_aux2"] = {
				["name"] = "重型机械",
				["text"] = {
					"{C:attention}拓展包{}中",
					"的{C:auxiliary}工具牌{}",
					"可能为{C:dark_edition}负片{}",
				},
			},
			
		},
		
		["Joker"] = {
			--Basic Common Jokers
			
			["j_unstb_lunar_calendar"] = {
				["name"] = "月相",
				["text"] = {
					"打出的{V:1}#1#{}花色卡牌",
					"计分时有{C:green}#2#/#3#{}几率",
					"创造一张{C:planet}星球牌{}",
					"{C:inactive}(需要空间)",
					"{s:0.8}花色每回合改变",
				},
			},
			
			["j_unstb_dragon_hoard"] = {
				["name"] = "巨龙宝藏",
				["text"] = {
					"你的{C:attention}消耗牌{}区",
					"每{C:attention}#2#{}张{C:attention}消耗牌{}",
					"提供{C:mult}+#1#{}倍率",
					"{C:inactive}(当前{C:mult}+#3#{C:inactive}倍率)",
				},
			},
			
			["j_unstb_card_dealer"] = {
				["name"] = "卡牌商人",
				["text"] = {
					"本回合每打出一张牌",
					"提供{C:chips}+#1#{}筹码",
					"回合结束{C:attention}重置{}",
					"{C:inactive}(当前{C:chips}+#2#{C:inactive}筹码)",
				},
			},
			
			["j_unstb_match_three"] = {
				["name"] = "消消乐",
				["text"] = {
					"如果打出的牌包含",
					"至少{C:attention}#2#{}张{C:attention}相同花色{}的牌",
					"{C:mult}+#1#{}倍率",
				},
			},
			
			--Extra Uncommons
			
			["j_unstb_furry_joker"] = {
				["name"] = "福瑞小丑",
				["text"] = {
					"打出的{C:attention}万能牌{}",
					"计分时有{C:green}#1#/#2#{}几率",
					"变成{C:dark_edition}多彩{}",
				},
			},
			
			["j_unstb_luxurious_handbag"] = {
				["name"] = "奢侈提包",
				["text"] = {
					"{C:attention}+#1#{}消耗牌槽位",
					"{C:attention}商店{}所有商品{C:red}涨价{}{C:gold}$#2#{}",
					" (重掷除外)",
				},
			},
			
			["j_unstb_portal"] = {
				["name"] = "传送门",
				["text"] = {
					"{C:attention}A{}可以在",
					"{C:purple}顺子{}中间打出",
					"{C:inactive}(例如：3、2、A、K、Q)",
				},
			},
			
			--Suit Seal Support
			
			["j_unstb_vainglorious_joker"] = {
				["name"] = "自负小丑",
				["text"] = {
					"打出带有{C:attention}花色蜡封{}",
					"的卡牌计分时",
					"提供{C:mult}+#1#{}倍率",
				},
			},
			
			["j_unstb_acedia_joker"] = {
				["name"] = "懒惰小丑",
				["text"] = {
					"打出带有与卡牌本身",
					"{C:purple}相同花色{}的{C:attention}花色蜡封{}",
					"的卡牌计分时",
					"提供{C:mult}+#1#{}倍率",
				},
			},
			
			["j_unstb_cinnabar"] = {
				["name"] = "朱砂",
				["text"] = {
					"打出带有{C:attention}花色蜡封{}的卡牌",
					"计分时有{C:green}#1#/#2#{}几率创造",
					"对应花色的{C:auxiliary}蜡封工具牌{}",
					"{C:inactive}(需要空间)",
				},
			},
			
			--Auxiliary Support
			
			["j_unstb_free_trial"] = {
				["name"] = "免费试用",
				["text"] = {
					"使用{C:auxiliary}工具牌{}时",
					"有{C:green}#1#/#2#{}几率创造",
					"一张随机{C:dark_edition}负片{}{C:auxiliary}工具牌{}",
				},
			},
			
			["j_unstb_extended_warranty"] = {
				["name"] = "延长保修",
				["text"] = {
					"{C:attention}消耗牌{}区内",
					"每张{C:auxiliary}工具牌{}",
					"给予{X:mult,C:white}X#1#{}倍率",
				},
			},
			
			["j_unstb_technician"] = {
				["name"] = "技术员",
				["text"] = {
					"本局内每使用",
					"一张{C:auxiliary}工具牌{}",
					"{C:chips}+#1#{}筹码",
					"{C:inactive}(当前{C:chips}+#2#{C:inactive}筹码){}",
				},
			},
			
			["j_unstb_season_pass"] = {
				["name"] = "赛季通行证",
				["text"] = {
					"弃掉{C:attention}人头牌{}时",
					"有{C:green}#1#/#2#{}概率创造",
					"一张随机{C:auxiliary}工具牌{}",
					"{C:inactive}(需要空间)",
				},
			},
			
			--Rank 21
			
			["j_unstb_black_jack"] = {
				["name"] = "黑杰克",
				["text"] = {
					"出牌时将计分牌",
					"{C:attention}总点数{}与{C:attention}#1#{}比较",
					"若小于，这张小丑获得",
					"等同于{C:attention}总点数{}的{C:chips}筹码{}",
					"若等于，使{C:red}所有筹码翻倍{}",
					"若大于，效果重置",
					"{s:0.8}击败Boss盲注时重置",
					"{C:inactive}(当前{C:chips}+#2#{C:inactive}筹码)",
				},
			},
			
			["j_unstb_what"] = {
				["name"] = "啥",
				["text"] = {
					"打出的{C:attention}???{}",
					"计分时提供",
					"{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
				},
			},
			
			--Decimal Rank
			
			["j_unstb_floating_point_error"] = {
				["name"] = "浮点错误",
				["text"] = {
					"每张打出的{C:attention}小数点数{}卡牌",
					"永久获得等同于它{C:attention}点数{}",
					"的{C:chips}额外筹码{}",
				},
			},
			
			["j_unstb_academic_journal"] = {
				["name"] = "学术期刊",
				["text"] = {
					"如果打出的计分牌不包含{C:attention}人头牌{}",
					"添加一张随机的{C:attention}小数点数{}的",
					"{C:attention}增强牌{}到你的牌组",
					"{C:inactive}(每回合限{C:red}#1#{C:inactive}次，剩余{C:red}#2#{C:inactive}次)",
				},
			},
			
			["j_unstb_engineer"] = {
				["name"] = "工程师",
				["text"] = {
					"打出的牌型不是{C:purple}顺子{}时",
					"带有{C:attention}小数点数{}的牌也",
					"向上取整为最近的{C:attention}整数点数{}",
					"{C:inactive}(例如：3.14 -> 4)",
				},
			},
			
			["j_unstb_thesis_proposal"] = {
				["name"] = "论文提案",
				["text"] = {
					"所有{C:attention}小数点数{}",
					"的卡牌重新",
					"触发{C:attention}#1#{}次",
				},
			},
			
			["j_unstb_rainbow_flag"] = {
				["name"] = "彩虹旗",
				["text"] = {
					"如果打出的{C:purple}顺子{}包含",
					"{C:attention}小数点数{}的卡牌",
					"有{C:green}#1#/#2#{}概率将其中",
					"一张牌变成{C:dark_edition}多彩{}",
				},
			},
			
			--Binary Ranks
			
			["j_unstb_dummy_data"] = {
				["name"] = "虚拟数据",
				["text"] = {
					"每张{C:attention}不计分{}的卡牌",
					"打出时有{C:green}#1#/#2#{}概率",
					"将它的点数变成{C:attention}0{}",
					"(保留筹码数)",
				},
			},
			
			["j_unstb_micro_sd_card"] = {
				["name"] = "微型SD卡",
				["text"] = {
					"如果这张小丑在{C:attention}最左侧{}",
					"剥夺所有被弃掉的基础{C:attention}数字牌{}",
					"的筹码并将它们的点数变成{C:attention}0{}",
					"回合结束时有{C:green}#1#/#2#{}几率自毁",
					"几率按存储的筹码数提升",
					"{C:inactive}(当前{C:chips}+#4#{C:inactive}筹码)",
					"{C:inactive}状态：{V:1}#5#{}",
				},
			},
			
			["j_unstb_social_experiment"] = {
				["name"] = "社会实验",
				["text"] = {
					"对于每张计分的{C:attention}非人头牌{}",
					"如果它的{C:chips}额外筹码{}小于{C:attention}128{}",
					"则将它的筹码翻倍赋予下一张牌",
					"并将{C:attention}点数{}变成{C:attention}0{}",
				},
			},
			
			["j_unstb_power_of_one"] = {
				["name"] = "一的神力",
				["text"] = {
					"你的{C:attention}完整牌组{}里的",
					"每张{C:attention}1{}提供{C:mult}+#1#{}倍率",
					"{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)",
				},
			},
			
			["j_unstb_binary_number"] = {
				["name"] = "二进制数",
				["text"] = {
					"如果出牌不超过{C:attention}4{}张",
					"且仅包含{C:attention}0点{}和{C:attention}1点{}的牌",
					"创造一张{C:attention}点数{}等同于",
					"该二进制数代表的数的卡牌",
					"({C:red}例如：{} {C:attention}1001{} -> {C:attention}9{})",
					"{C:inactive}[J, Q, K, A 分别算作 11-14]{}",
				},
			},
			
			--Basegame Enhancement
			
			["j_unstb_quintuplets"] = {
				["name"] = "五胞胎",
				["text"] = {
					"如果打出的牌",
					"包含{C:attention}五条{}",
					"创造一个{C:dark_edition}负片标签{}",
				},
			},
			
			--Edition Line
			
			["j_unstb_graphic_card"] = {
				["name"] = "显卡",
				["text"] = {
					"如果本回合至少有{C:attention}#1#{}张",
					"带有{C:dark_edition}版本{}的卡牌计分",
					"回合结束创造一个{C:attention}双倍标签{}",
					"{C:inactive}(当前{C:attention}#2#{C:inactive}张牌)",
				},
			},
			
			["j_unstb_connoiseur"] = {
				["name"] = "鉴赏家",
				["text"] = {
					"重新触发所有",
					"带有{C:dark_edition}版本{}的牌",
				},
			},
			
			["j_unstb_jeweler"] = {
				["name"] = "珠宝商",
				["text"] = {
					"有{C:green}#1#/#2#{}几率降低",
					"打出的{C:attention}牌型{}等级",
					"并{C:purple}升级{}所有",
					"计分牌的{C:dark_edition}版本{}",
				},
			},
			
			--Slop
			
			["j_unstb_joker_diffusion"] = {
				["name"] = "散射小丑",
				["text"] = {
					"出牌包含{C:attention}不计分{}的卡牌时",
					"将留在手牌中的随机{C:attention}#1#{}张",
					"{C:attention}未增强{}的卡牌增强为{C:attention}摇摆牌{}",
				},
			},
			
			["j_unstb_nonfungible_joker"] = {
				["name"] = "非卖品小丑",
				["text"] = {
					"如果一次弃牌",
					"仅包含{C:attention}#1#{}张{C:attention}摇摆牌{}",
					"将其摧毁并获得最多{C:gold}$#2#",
					"{s:0.8,C:red}回合结束降低此最大值和售价",
				},
			},
			
			["j_unstb_prompt"] = {
				["name"] = "提示词",
				["text"] = {
					"计分的{C:attention}摇摆牌{}使用其他",
					"计分的{C:attention}非摇摆牌{}",
					"的{C:attention}点数{}和{C:attention}花色{}",
					"而不是随机（可能的话）",
				},
			},
			
			["j_unstb_uninterested_primate"] = {
				["name"] = "冷脸猴子",
				["text"] = {
					"每有{C:attention}#2# {C:inactive}[#6#]{}张{C:attention}摇摆牌{}计分",
					"这张小丑获得{C:chips}+#1#{}筹码",
					"回合结束有{C:green}#3#/#4#{}几率自毁",
					"{C:inactive}(当前{C:chips}+#5#{C:inactive}筹码)",
				},
			},
			
			["j_unstb_lethargic_lion"] = {
				["name"] = "萎靡狮子",
				["text"] = {
					"每有{C:attention}#2# {C:inactive}[#6#]{}张{C:attention}摇摆牌{}计分",
					"这张小丑获得{X:mult,C:white}X#1#{}倍率",
					"回合结束有{C:green}#3#/#4#{}几率自毁",
					"{C:inactive}(当前{X:mult,C:white}X#5#{C:inactive}倍率)",
				},
			},
			
			--New Enhancement Support

			["j_unstb_vintage_joker"] = {
				["name"] = "古旧小丑",
				["text"] = {
					"计分的{C:attention}古旧牌{}",
					"有{C:green}#1#/#2#{}几率重置",
					"它们的自毁概率",
				},
			},
			
			["j_unstb_rules_errata"] = {
				["name"] = "规则勘误",
				["text"] = {
					"{C:attention}松果卡{}计分时给予等同于",
					"它们{C:attention}点数一半{}的倍率",
				},
			},
			
			["j_unstb_auction_winner"] = {
				["name"] = "拍卖赢家",
				["text"] = {
					"如果一张{C:attention}宣传牌{}自毁了",
					"这张小丑获得等同于它",
					"自毁前{C:gold}面值{}的{C:gold}资金{}",
				},
			},
			
			["j_unstb_joker_island"] = {
				["name"] = "小丑岛",
				["text"] = {
					"每张{C:attention}点数{}为{C:attention}#1#{}的卡牌",
					"计分时有{C:green}#2#/#3#{}几率创造",
					"一张相同花色的{C:attention}资源牌{}",
					"{s:0.8}点数每回合结束改变",
				},
			},
			
			--Unhancement Jokers
			
			["j_unstb_kaiju"] = {
				["name"] = "怪兽",
				["text"] = {
					"{C:dark_edition}+#1#{}小丑槽位",
					"每回合第一次",
					"抽取手牌时将随机",
					"一张牌转换为{C:attention}放射牌{}",
				},
			},
			
			["j_unstb_poison_the_well"] = {
				["name"] = "井中投毒",
				["text"] = {
					"{C:red}+#1#{}弃牌次数",
					"每次弃牌将",
					"随机一张被弃",
					"的牌转换为{C:attention}放射牌{}",
				},
			},
			
			["j_unstb_petri_dish"] = {
				["name"] = "培养皿",
				["text"] = {
					"{C:blue}+#1#{}出牌次数",
					"每次出牌有{C:green}#2#/#3#{}概率",
					"将随机一张所出",
					"的牌转换为{C:attention}生化牌{}",
				},
			},
			
			--Unhancement Support
			
			["j_unstb_geiger_counter"] = {
				["name"] = "盖格计数器",
				["text"] = {
					"你的{C:attention}完整牌组{}内",
					"的每张{C:attention}放射牌{}",
					"提供{C:mult}+#1#{}倍率",
					"{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)",
				},
			},
			
			["j_unstb_strych_nine"] = {
				["name"] = "番木鳖-九",
				["text"] = {
					"你的{C:attention}完整牌组{}内",
					"的每张{C:attention}毒素牌{}",
					"提供{C:mult}+#1#{}筹码",
					"{C:inactive}(当前{C:mult}+#2#{C:inactive}筹码)",
				},
			},
			
			["j_unstb_vaccination_card"] = {
				["name"] = "疫苗接种卡",
				["text"] = {
					"消除所有{C:attention}生化牌{}的负面效果",
					"留在手牌中的每张{C:attention}生化牌{}",
					"使这张小丑获得{X:mult,C:white}X#1#{}倍率",
					"{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)",
				},
			},
			
			--Shitposts
			
			["j_unstb_joker2"] = {
				["name"] = "小丑2",
				["text"] = {
					"{C:mult}+#1#{}倍率",
					"{X:mult,C:white}X#2#{}倍率",
					"回合结束有",
					"{C:green}#3#/#4#{}几率自毁",
				},
			},
			
			["j_unstb_joker_stairs"] = {
				["name"] = "小丑台阶",
				["text"] = {
					"从商店直接购买",
					"名字中带有{C:attention}\"小丑\"{}的",
					"小丑牌时获得{C:mult}+#1#{}倍率",
					"{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率){}",
				},
			},
			
			["j_unstb_plagiarism"] = {
				["name"] = "抄袭",
				["text"] = {
					"随机复制",
					"左侧或右侧",
					"{C:attention}小丑{}的能力",
					"{s:0.8}每次出牌方向改变",
				},
			},
			
			["j_unstb_joker_throwing_card"] = {
				["name"] = "小丑飞牌",
				["text"] = {
					"{C:attention}盲注{}缩小{C:attention}#1#%{}",
					"有{C:green}#2#/#3#{}几率摧毁",
					"一张计分牌",
					"成功摧毁后",
					"百分比提升{C:attention}#4#%{}",
				},
			},
			
			--Face Card Jokers
			
			["j_unstb_jackhammer"] = {
				["name"] = "碎J钻",
				["text"] = {
					"如果{C:attention}打出的牌{}",
					"只含有一张{C:attention}J{}",
					"将其重新触发{C:attention}#1#{}次后{C:red}摧毁{}",
				},
			},
			
			["j_unstb_jack_of_all_trades"] = {
				["name"] = "万事J能",
				["text"] = {
					"打出的{C:attention}J{}给予",
					"{C:chips}+#1#{}筹码，{C:mult}+#2#{}倍率，",
					"{X:mult,C:white}X#3#{}倍率以及{C:gold}$#4#",
				},
			},
			
			["j_unstb_magic_trick_card"] = {
				["name"] = "魔术牌",
				["text"] = {
					"计分的{V:1}#1#{}",
					"转换为{V:2}#2#{}",
					"{s:0.8}弃牌时翻转此小丑",
				},
			},
			
			["j_unstb_queensland"] = {
				["name"] = "Q士兰",
				["text"] = {
					"计分的{C:attention}Q{}将",
					"添加对应花色",
					"的{C:attention}资源牌{}到牌组",
					"{C:inactive}(每回合限{C:red}#1#{C:inactive}次，剩余{C:red}#2#{C:inactive}次)",
				},
			},
			
			["j_unstb_king_of_pop"] = {
				["name"] = "流行之王",
				["text"] = {
					"有{C:green}#1#/#2#{}几率摧毁",
					"打出的{C:attention}增强K{}",
					"并创造一个{C:dark_edition}双倍标签",
				},
			},
			
			["j_unstb_prssj"] = {
				["name"] = "多彩红封钢小丑",
				["text"] = {
					"计分的{C:attention}K{}有{C:green}#1#/#2#{}几率{C:purple}升级{}版本",
					"计分的{C:attention}K{}有{C:green}#1#/#3#{}几率{C:attention}重新触发",
					"留在手牌中的{C:attention}K{}有{C:green}#1#/#4#{}几率提供{X:mult,C:white}X#5#{}倍率",
				},
			},
			
			["j_unstb_master_of_one"] = {
				["name"] = "一技之长",
				["text"] = {
					"选择{C:attention}盲注{}时添加",
					"一张{C:attention}增强的1{}到牌组",
				},
			},
			
			--Intermission
			
			["j_unstb_spectre"] = {
				["name"] = "幽魂",
				["text"] = {
					"本局中使用的每张",
					"{C:spectral}幻灵牌{}提供{X:mult,C:white}X#1#{}倍率",
					"{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率){}",
				},
			},
			
			["j_unstb_library_card"] = {
				["name"] = "读者卡",
				["text"] = {
					"每张记分牌给予其",
					"{C:attention}对应花色{}英文单词",
					"{C:attention}辅音{}个数{C:chips}#1#{}倍的筹码",
					"和{C:attention}元音{}个数{C:mult}#2#{}倍的倍率",
					"{C:inactive}(例如：黑桃={C:chips}+15{C:inactive}筹码，{C:mult}+4{C:inactive}倍率)",
				},
			},
			
			["j_unstb_collector_album"] = {
				["name"] = "典藏专辑",
				["text"] = {
					"名字中带有{C:attention}\"卡\"{}",
					"的小丑牌各",
					"给予{C:chips}+#1#{}筹码",
				},
			},
			
			["j_unstb_throwing_hands"] = {
				["name"] = "大打出手",
				["text"] = {
					"{X:mult,C:white}X#1#{}倍率",
					"打出的牌型不是{C:attention}#4#{}时",
					"有{C:green}#2#/#3#{}几率{C:red}自毁{}",
					"{s:0.8}牌型每回合结束改变",
				},
			},
			
			--Historic Cards
			
			["j_unstb_imperial_bower"] = {
				["name"] = "皇家王牌",
				["text"] = {
					"如果打出的{C:attention}顺子{}",
					"包含{C:attention}人头牌{}",
					"{X:mult,C:white}X#1#{}倍率",
				},
			},
			
			["j_unstb_the_jolly_joker"] = {
				["name"] = "\"开心小丑\"",
				["text"] = {
					"如果打出的牌包含{C:attention}对子{}",
					"获得{C:mult}+#1#{}倍率",
					"否则{C:red}重置{}",
					"{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)",
				},
			},
			
			["j_unstb_get_out_of_jail_free_card"] = {
				["name"] = "保释卡",
				["text"] = {
					"卖掉这张小丑",
					"立即打赢盲注",
					"{C:inactive}状态：{V:1}#1#{}",
				},
			},
			
			["j_unstb_tanzaku"] = {
				["name"] = "短冊",
				["text"] = {
					"重新触发带有",
					"{C:attention}蜡封{}的牌{C:attention}#1#{}次",
					"每弃掉一张带有",
					"{C:attention}蜡封{}的牌次数增加{C:attention}#3# {C:inactive}[#4#]{}",
					"{s:0.8}回合结束重置",
				},
			},
			
			--Misc Jokers
			
			["j_unstb_glass_cannon"] = {
				["name"] = "玻璃大炮",
				["text"] = {
					"重新触发所有",
					"打出的{C:attention}玻璃牌{}",
					"{C:red}玻璃牌计分后",
					"{C:red}必定被摧毁",
				},
			},
			
			["j_unstb_pity_rate_drop"] = {
				["name"] = "保底",
				["text"] = {
					"选择{C:attention}盲注{}时有{C:green}#1#/#2#{}几率",
					"创造一张{C:red}稀有{C:attention}小丑{}",
					"否则几率增加{C:green}#3#{}",
					"成功创造后重置为{C:green}#4#{}",
					"{C:inactive}(需要空间)",
				},
			},
			
			["j_unstb_salmon_run"] = {
				["name"] = "鲑鱼焗",
				["text"] = {
					"打出的{C:attention}7{}",
					"有{C:green}#1#/#2#{}几率",
					"复制一张到牌组",
				},
			},
			
			["j_unstb_cool_s"] = {
				["name"] = "酷S了",
				["text"] = {
					"计分的{C:attention}8{}获得",
					"随机{C:attention}增强{}",
				},
			},
			
			["j_unstb_memoriam_photo"] = {
				["name"] = "遗像",
				["text"] = {
					"打出的牌被{C:attention}摧毁{}时",
					"这个小丑获得其点数",
					"{C:attention}双倍{}的筹码",
					"{C:inactive}(当前{C:chips}+#1#{C:inactive}筹码)",
				},
			},
			
			["j_unstb_schrodinger_cat"] = {
				["name"] = "薛定谔的猫",
				["text"] = {
					"打出的牌被{C:attention}摧毁{}时",
					"有{C:green}#1#/#2#{}几率将其",
					"复制到牌组",
				},
			},
			
			["j_unstb_cashback_card"] = {
				["name"] = "返现卡",
				["text"] = {
					"击败{C:attention}Boss盲注{}后赚取等同于",
					"本{C:attention}底注{}内使用过的",
					"{C:attention}消耗牌{}总数的{C:gold}资金{}",
					"{C:inactive}(当前{C:gold}$#1#{C:inactive})",
				},
			},
			
			["j_unstb_raffle"] = {
				["name"] = "抽奖",
				["text"] = {
					"离开{C:attention}商店{}时",
					"有{C:green}#1#/#2#{}几率赢得{C:gold}$#3#",
					"在{C:attention}商店{}中的每次",
					"购买使几率增加{C:green}#4#{}",
					"{s:0.8, C:red}离开商店时重置",
				},
			},
			
			["j_unstb_ic_card"] = {
				["name"] = "IC卡",
				["text"] = {
					"每次出牌这张小丑",
					"获得{C:gold}$#1#{}储值",
					"消耗资金时优先消耗",
					"这张小丑中的{C:attention}储金",
					"{C:red}有效期#2#回合",
					"{C:inactive}(当前{C:gold}$#3#{C:inactive}，剩余{C:red}#4#{C:inactive}回合){}",
				},
			},
			
			["j_unstb_j2048"] = {
				["name"] = "2048",
				["text"] = {
					"如果打出的牌包含{C:attention}对子{}",
					"摧毁其中靠左的那张",
					"并将其筹码给予另一张",
					"{C:inactive}(拖动更改顺序){}",
				},
			},
			
			["j_unstb_inductor"] = {
				["name"] = "电感",
				["text"] = {
					"对于每张打出的",
					"同{C:attention}点数{}同{C:attention}花色{}的牌",
					"有{C:green}#1#/#2#{}几率复制{C:attention}增强{}",
					"有{C:green}#1#/#3#{}几率复制{C:attention}版本{}",
					"有{C:green}#1#/#4#{}几率复制{C:attention}蜡封{}",
				},
			},
			
			
			--Vanilla Joker Override
			
			["j_fibonacci_ex"] = {
				["name"] = "斐波那契",
				["text"] = {
					"打出的每一张{C:attention}0{}、{C:attention}1{}、{C:attention}Ace{}、",
					"{C:attention}2{}、{C:attention}3{}、{C:attention}5{}、{C:attention}8{}、{C:attention}13{}、{C:attention}21{}",
					"在计分时给予{C:mult}+#1#{}倍率",
				},
			},
			
			["j_odd_todd_ex"] = {
				["name"] = "奇数托德",
				["text"] = {
					"打出的点数为",
					"{C:attention}奇数{}的牌",
					"在计分时给予{C:chips}+#1#{}筹码",
					"{C:inactive}(161、21、13、11、A、9、7、5、3、1){}",
				},
			},
			
			["j_even_steven_ex"] = {
				["name"] = "偶数史蒂文",
				["text"] = {
					"打出的点数为",
					"{C:attention}偶数{}的牌",
					"在计分时给予{C:mult}+#1#{}倍率",
					"{C:inactive}(12、10、8、6、4、2、0){}",
				},
			},
			
			["j_hack_ex"] = {
				["name"] = "烂脱口秀演员",
				["text"] = {
					"重新触发",
					"所有打出的",
					"{C:attention}0{}、{C:attention}1{}、{C:attention}2{}、",
					"{C:attention}3{}、{C:attention}4{}和{C:attention}5{}",
				},
			},
		},
		
		["Mod"] = {
			["UnStable"] = {
				["name"] = "UnStable",
				["text"] = {
					"这个模组新增了许多原版风格的机制",
					"包括新的小丑，消耗牌，以及其他东西！",
					" ",
					"{C:attention}PinkMaggit{}提供{C:blue}巴西葡萄牙语{}翻译",
					"{C:attention}Ethylenediamine{}提供{C:blue}简体中文{}翻译"
				}
			}
		}
		
	},
}
