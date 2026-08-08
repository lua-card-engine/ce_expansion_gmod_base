local CARD = CARD

CARD.Name = "gmod_base_gm_flatgrass"
CARD.Description = "gmod_base_gm_flatgrass_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/gm_flatgrass"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Map",
}

if (SERVER) then
	-- Reward the card when a player joins on gm_flatgrass
	function CARD.hooks:PlayerInitialSpawn(ply)
		if (game.GetMap() == "gm_flatgrass") then
			CardEngine.Collection.AddCard(ply, "gmod_base_gm_flatgrass")
		end
	end
end
