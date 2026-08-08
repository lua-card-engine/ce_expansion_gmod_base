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

if (SERVER) then
	-- Reward the card when a player joins on gm_construct
	function CARD.hooks:PlayerInitialSpawn(ply)
		if (game.GetMap() == "gm_construct") then
			CardEngine.Collection.AddCard(ply, "gmod_base_gm_construct")
		end
	end
end
