local CARD = CARD

CARD.Name = "gmod_base_prop_hula_doll"
CARD.Description = "gmod_base_prop_hula_doll_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/prop_hula_doll"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
CARD.HolographicStrength = Vector(1, 1, 1)
CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

CARD.Attributes = {
	Rarity = "Rare",
	Supertype = "Prop",
}

if (SERVER) then
	-- Reward the card when a player spawns this prop
	function CARD.hooks:PlayerSpawnedProp(ply, model, prop)
		if (model == "models/props_lab/huladoll.mdl") then
			CardEngine.Collection.AddCard(ply, "gmod_base_prop_hula_doll")
		end
	end
end
