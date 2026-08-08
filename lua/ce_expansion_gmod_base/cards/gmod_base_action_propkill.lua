local CARD = CARD

CARD.Name = "gmod_base_action_propkill"
CARD.Description = "gmod_base_action_propkill_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/action_propkill"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
CARD.ModelAngles = Angle(0, -90, 0)

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Action",
}

-- Odds of actually receiving the card on a prop kill.
-- Higher than the spammable hooks (1 in 20) since landing a prop
-- kill depends on opportunity, not just player intent.
local REWARD_CHANCE = 20

if (SERVER) then
	-- Reward the card when a player kills another player by hitting them with a prop
	function CARD.hooks:PlayerDeath(victim, inflictor, attacker)
		if (not IsValid(inflictor) or inflictor:GetClass() ~= "prop_physics") then
			return
		end

		if (IsValid(attacker) and attacker:IsPlayer() and victim ~= attacker and math.random(1, REWARD_CHANCE) == 1) then
			CardEngine.Collection.AddCard(attacker, self:GetUniqueID())
		end
	end
end
