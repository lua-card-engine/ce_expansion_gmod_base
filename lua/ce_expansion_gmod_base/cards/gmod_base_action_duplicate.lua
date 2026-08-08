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

if (SERVER) then
	-- Reward the card when a player uses the duplicator tool
	function CARD.hooks:CanTool(ply, trace, mode)
		if (mode == "duplicator") then
			CardEngine.Collection.AddCard(ply, "gmod_base_action_duplicate")
		end
	end
end
