local CARD = CARD

CARD.Name = "gmod_base_action_spawn_explosive"
CARD.Description = "gmod_base_action_spawn_explosive_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/action_spawn_explosive"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
CARD.ModelAngles = Angle(0, -90, 0)

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Action",
}

if (SERVER) then
	-- Reward the card when a player spawns an explosive prop.
	-- Extend this list if more explosive props should count.
	local EXPLOSIVE_MODELS = {
		["models/props_c17/oildrum001_explosive.mdl"] = true,
		["models/props_junk/PropaneCanister001a.mdl"] = true,
	}

	function CARD.hooks:PlayerSpawnedProp(ply, model, prop)
		if (EXPLOSIVE_MODELS[model]) then
			CardEngine.Collection.AddCard(ply, "gmod_base_action_spawn_explosive")
		end
	end
end
