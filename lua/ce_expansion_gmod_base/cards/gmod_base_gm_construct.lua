local CARD = CARD

CARD.Name = "gmod_base_gm_construct"
CARD.Description = "gmod_base_gm_construct_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/gm_construct"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Map",
}

-- Odds of actually receiving the card on a matching join.
-- Joining while this one specific map (out of many) is active is
-- already a naturally rare event, so the odds can stay higher.
local REWARD_CHANCE = 10

if (SERVER) then
	-- Reward the card when a player joins on gm_construct
	function CARD.hooks:PlayerInitialSpawn(ply)
		if (game.GetMap() == "gm_construct" and math.random(1, REWARD_CHANCE) == 1) then
			CardEngine.Collection.AddCard(ply, self:GetUniqueID())
		end
	end
end
