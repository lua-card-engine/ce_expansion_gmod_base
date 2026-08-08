local CARD = CARD

CARD.Name = "gmod_base_action_noclip"
CARD.Description = "gmod_base_action_noclip_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/action_noclip"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
CARD.HolographicStrength = Vector(1, 1, 1)
CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

CARD.Attributes = {
	Rarity = "Rare",
	Supertype = "Action",
}

-- Odds of actually receiving the card on enabling noclip.
-- Kept low (1 in 500) since noclip can be toggled on and off at will.
local REWARD_CHANCE = 500

if (SERVER) then
	-- Reward the card when a player enables noclip
	function CARD.hooks:PlayerNoClip(ply, desiredState)
		if (desiredState and math.random(1, REWARD_CHANCE) == 1) then
			CardEngine.Collection.AddCard(ply, self:GetUniqueID())
		end
	end
end
