local CARD = CARD

CARD.Name = "gmod_base_ttt_lost_temple"
CARD.Description = "gmod_base_ttt_lost_temple_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_lost_temple"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Map",
}

if (SERVER) then
	-- Reward the card when a player joins on ttt_lost_temple. Matched by prefix
	-- since the installed map's exact version suffix can vary.
	function CARD.hooks:PlayerInitialSpawn(ply)
		if (string.find(game.GetMap(), "^ttt_lost_temple")) then
			CardEngine.Collection.AddCard(ply, "gmod_base_ttt_lost_temple")
		end
	end
end
