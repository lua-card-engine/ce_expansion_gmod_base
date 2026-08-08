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

if (SERVER) then
	-- Reward the card when a player kills another player by hitting them with a prop
	function CARD.hooks:PlayerDeath(victim, inflictor, attacker)
		if (not IsValid(inflictor) or inflictor:GetClass() ~= "prop_physics") then
			return
		end

		if (IsValid(attacker) and attacker:IsPlayer() and victim ~= attacker) then
			CardEngine.Collection.AddCard(attacker, "gmod_base_action_propkill")
		end
	end
end
