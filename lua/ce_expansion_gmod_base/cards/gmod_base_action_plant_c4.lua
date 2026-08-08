local CARD = CARD

CARD.Name = "gmod_base_action_plant_c4"
CARD.Description = "gmod_base_action_plant_c4_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/action_plant_c4"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Action",
}

-- Odds of actually receiving the card on a successful plant.
-- Higher than the spammable hooks (1 in 25) since C4 supply is
-- limited by the round, not by the player.
local REWARD_CHANCE = 25

if (SERVER) then
	-- Reward the card when a player plants a C4 (TTT). Planting spawns a
	-- "ttt_c4" entity and sets its owner just after creation, so we defer
	-- reading the owner until the following tick.
	function CARD.hooks:OnEntityCreated(entity)
		if (not IsValid(entity) or entity:GetClass() ~= "ttt_c4") then
			return
		end

		timer.Simple(0, function()
			if (not IsValid(entity)) then
				return
			end

			local owner = entity:GetOwner()

			if (IsValid(owner) and owner:IsPlayer() and math.random(1, REWARD_CHANCE) == 1) then
				CardEngine.Collection.AddCard(owner, self:GetUniqueID())
			end
		end)
	end
end
