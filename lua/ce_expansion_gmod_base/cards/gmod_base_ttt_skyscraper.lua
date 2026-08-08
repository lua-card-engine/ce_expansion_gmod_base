local CARD = CARD

CARD.Name = "gmod_base_ttt_skyscraper"
CARD.Description = "gmod_base_ttt_skyscraper_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_skyscraper"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Map",
}

if (SERVER) then
	-- Reward the card when a player joins on ttt_skyscraper. Matched by prefix
	-- since the installed map's exact version suffix can vary.
	function CARD.hooks:PlayerInitialSpawn(ply)
		if (string.find(game.GetMap(), "^ttt_skyscraper")) then
			CardEngine.Collection.AddCard(ply, "gmod_base_ttt_skyscraper")
		end
	end
end
