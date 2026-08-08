local CARD = CARD

CARD.Name = "gmod_base_ttt_67thway"
CARD.Description = "gmod_base_ttt_67thway_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_67thway"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Map",
}

if (SERVER) then
	-- Reward the card when a player joins on ttt_67thway. Matched by prefix
	-- since the installed map's exact version suffix (e.g. "_v3") can vary.
	function CARD.hooks:PlayerInitialSpawn(ply)
		if (string.find(game.GetMap(), "^ttt_67thway")) then
			CardEngine.Collection.AddCard(ply, "gmod_base_ttt_67thway")
		end
	end
end
