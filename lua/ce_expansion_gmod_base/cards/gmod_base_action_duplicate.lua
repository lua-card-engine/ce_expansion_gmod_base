local CARD = CARD

CARD.Name = "gmod_base_action_duplicate"
CARD.Description = "gmod_base_action_duplicate_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/action_duplicate"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
CARD.ModelAngles = Angle(0, -90, 0)

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Action",
}

-- Odds of actually receiving the card on a duplicator use.
-- Kept low (1 in 150) since pasting a duplication can be repeated
-- almost as freely as spawning a prop.
local REWARD_CHANCE = 150

if (SERVER) then
	-- Reward the card when a player uses the duplicator tool
	function CARD.hooks:CanTool(ply, trace, mode)
		if (mode == "duplicator" and math.random(1, REWARD_CHANCE) == 1) then
			CardEngine.Collection.AddCard(ply, self:GetUniqueID())
		end
	end
end
