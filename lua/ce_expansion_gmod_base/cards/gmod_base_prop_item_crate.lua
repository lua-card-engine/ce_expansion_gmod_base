local CARD = CARD

CARD.Name = "gmod_base_prop_item_crate"
CARD.Description = "gmod_base_prop_item_crate_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/prop_item_crate"
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
		if (model == "models/items/item_item_crate.mdl") then
			CardEngine.Collection.AddCard(ply, "gmod_base_prop_item_crate")
		end
	end
end
