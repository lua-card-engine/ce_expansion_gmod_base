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

-- Common rarity, but still kept low (1 in 150) since explosive props
-- can be spawned repeatedly from the spawn menu just like other props.
local REWARD_CHANCE = 150

if (SERVER) then
	-- Reward the card when a player spawns an explosive prop.
	-- Extend this list if more explosive props should count.
	local EXPLOSIVE_MODELS = {
		["models/props_c17/oildrum001_explosive.mdl"] = true,
		["models/props_junk/PropaneCanister001a.mdl"] = true,
	}

	function CARD.hooks:PlayerSpawnedProp(ply, model, prop)
		if (EXPLOSIVE_MODELS[model] and math.random(1, REWARD_CHANCE) == 1) then
			CardEngine.Collection.AddCard(ply, self:GetUniqueID())
		end
	end
end
