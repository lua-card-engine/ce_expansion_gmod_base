local CARD = CARD

CARD.Name = "gmod_base_prop_traffic_cone"
CARD.Description = "gmod_base_prop_traffic_cone_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/prop_traffic_cone"
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
		if (model == "models/props_junk/trafficcone001a.mdl") then
			CardEngine.Collection.AddCard(ply, "gmod_base_prop_traffic_cone")
		end
	end
end
