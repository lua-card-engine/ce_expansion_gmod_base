local CARD = CARD

CARD.Name = "gmod_base_prop_rifle_ammo"
CARD.Description = "gmod_base_prop_rifle_ammo_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/prop_rifle_ammo"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
CARD.HolographicStrength = Vector(1, 1, 1)
CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

CARD.Attributes = {
  Rarity = "Rare",
  Supertype = "Prop",
}

-- Odds of actually receiving the card once this prop is spawned.
-- Kept low (1 in 1000) because props can be spawned freely and
-- repeatedly from the spawn menu.
local REWARD_CHANCE = 500

if (SERVER) then
  -- Reward the card when a player spawns this prop
  function CARD.hooks:PlayerSpawnedProp(ply, model, prop)
    if (model == "models/items/combine_rifle_ammo01.mdl" and math.random(1, REWARD_CHANCE) == 1) then
      CardEngine.Collection.AddCard(ply, self:GetUniqueID())
    end
  end
end
