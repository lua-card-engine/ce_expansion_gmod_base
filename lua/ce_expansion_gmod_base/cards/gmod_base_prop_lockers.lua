local CARD = CARD

CARD.Name = "gmod_base_prop_lockers"
CARD.Description = "gmod_base_prop_lockers_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/prop_lockers"
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
		if (model == "models/props_c17/lockers001a.mdl") then
			CardEngine.Collection.AddCard(ply, "gmod_base_prop_lockers")
		end
	end
end
