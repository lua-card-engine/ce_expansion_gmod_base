local CARD = CARD

CARD.Name = "gmod_base_gamemode_sandbox"
CARD.Description = "gmod_base_gamemode_sandbox_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/gamemode_sandbox"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

CARD.Attributes = {
	Rarity = "Common",
	Supertype = "Gamemode",
}

-- Odds of actually receiving the card on a matching join.
-- Kept lower than the specific-map cards since most servers run
-- Sandbox or TTT, making this condition much easier to hit.
local REWARD_CHANCE = 15

if (SERVER) then
	-- Reward the card when a player joins on the Sandbox gamemode
	function CARD.hooks:PlayerInitialSpawn(ply)
		if (engine.ActiveGamemode() == "sandbox" and math.random(1, REWARD_CHANCE) == 1) then
			CardEngine.Collection.AddCard(ply, self:GetUniqueID())
		end
	end
end
