local function print(message)
    sendDebugMessage('[Unstable_Suit] - '..(tostring(message) or '???'))
end

local suit_group = {} --Store each suit group, and store a map of suits inside
local suit_group_map = {} -- A map pointing from suit name (key) directly to suit group name

suit_group.suit_black = {}
suit_group.suit_red = {}
suit_group.no_smear = {}

function register_suit_group(type, suit)

	print('Registering suit: '..suit..' with the type '..type)

    local suit_table = suit_group[type] or {}
    
    suit_table[suit] = true
    
    suit_group_map[suit] = type
end

function get_suit_group(suit)
    return suit_group_map[suit] or "no_smear"
end

register_suit_group("suit_black", "Spades")
register_suit_group("suit_black", "Clubs")
register_suit_group("suit_red", "Hearts")
register_suit_group("suit_red", "Diamonds")

--print(inspectDepth(suit_group))

--Modded Suits Code in UnStableEX
--register_suit_group("no_smear", "Inks_Inks")
--register_suit_group("no_smear", "Inks_Color")

local card_issuit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc, bypass_seal) --Adds one more argument: bypass_seal. true if the calculation bypass the seal on the card
	--Modified from SMODS-patched version of is_suit, completely re-implemented to supports the new smear system
	if flush_calc then
	
		--Has seal, is modded seal, and has suit_seal property
		if not bypass_seal and self.seal and SMODS.Seals[self.seal] and SMODS.Seals[self.seal].suit_seal and not self.debuff then
			--returns true immediately if the suit is equal
			if SMODS.Seals[self.seal].suit_seal == suit then
				return true
			end
		end
	
        if self.ability.effect == 'Stone Card' or self.config.center.no_suit then
            return false
        end
        if (self.ability.name == 'Wild Card' or self.config.center.any_suit) and not self.debuff then
            return true
        end
		
		--If the suit is equal, returns immediately
		if self.base.suit == suit then
			return true
		end
		
		--If smeared joker exists, and is not in no_smear group
        if next(SMODS.find_card('j_smeared')) and not suit_group.no_smear[suit] then	
			--Has seal, is modded seal, and has suit_seal property
			if not bypass_seal and self.seal and SMODS.Seals[self.seal] and SMODS.Seals[self.seal].suit_seal and not self.debuff then
				local targetGroup = get_suit_group(SMODS.Seals[self.seal].suit_seal)

				--returns true immediately if the suit is in the same suit group
				if suit_group[targetGroup][suit] then
					return true
				end
			end
			
			local targetGroup = get_suit_group(self.base.suit)
			
			--returns true if the suit is in the same suit group
			if suit_group[targetGroup][suit] then
				return true
			end
        end
		
		--fallback - go back to the main reference, in case other mood hook it as well
		local fallback_res = card_issuit_ref(self, suit, bypass_debuff, flush_calc)
		return fallback_res
    else
        if self.debuff and not bypass_debuff then return end
		
		--Has seal, is modded seal, and has suit_seal property
		if not bypass_seal and self.seal and SMODS.Seals[self.seal] and SMODS.Seals[self.seal].suit_seal then
			--returns true immediately if the suit is equal
			if SMODS.Seals[self.seal].suit_seal == suit then
				return true
			end
		end
		
        if self.ability.effect == 'Stone Card' or self.config.center.no_suit then
            return false
        end
        if self.ability.name == 'Wild Card' or self.config.center.any_suit then
            return true
        end
		
		--If the suit is equal, returns immediately
		if self.base.suit == suit then
			return true
		end
		
		--If smeared joker exists, and is not in no_smear group
        if next(SMODS.find_card('j_smeared')) and not suit_group.no_smear[suit] then
            --Has seal, is modded seal, and has suit_seal property
			if not bypass_seal and self.seal and SMODS.Seals[self.seal] and SMODS.Seals[self.seal].suit_seal then
				local targetGroup = get_suit_group(SMODS.Seals[self.seal].suit_seal)
				--returns true immediately if the suit is in the same suit group
				if suit_group[targetGroup][suit] then
					return true
				end
			end
			
			local targetGroup = get_suit_group(self.base.suit)

			--returns true if the suit is in the same suit group
			if suit_group[targetGroup][suit] then
				return true
			end
        end
		
        --fallback - go back to the main reference, in case other mood hook it as well
		return card_issuit_ref(self, suit, bypass_debuff, flush_calc)
    end
end