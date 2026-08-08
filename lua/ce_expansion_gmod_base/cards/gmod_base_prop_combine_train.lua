local CARD = CARD

CARD.Name = "gmod_base_prop_combine_train"
CARD.Description = "gmod_base_prop_combine_train_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/prop_combine_train"
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
		if (model == "models/props_combine/combinetrain01a.mdl") then
			CardEngine.Collection.AddCard(ply, "gmod_base_prop_combine_train")
		end
	end
end
