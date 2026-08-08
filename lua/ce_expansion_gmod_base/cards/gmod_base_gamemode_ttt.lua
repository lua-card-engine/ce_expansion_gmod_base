local CARD = CARD

CARD.Name = "gmod_base_gamemode_ttt"
CARD.Description = "gmod_base_gamemode_ttt_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/gamemode_ttt"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Gamemode",
}

if (SERVER) then
	-- Reward the card when a player joins on the Trouble in Terrorist Town gamemode
	function CARD.hooks:PlayerInitialSpawn(ply)
		if (engine.ActiveGamemode() == "terrortown") then
			CardEngine.Collection.AddCard(ply, "gmod_base_gamemode_ttt")
		end
	end
end
