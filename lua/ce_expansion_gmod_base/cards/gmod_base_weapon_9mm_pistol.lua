local CARD = CARD

CARD.Name = "gmod_base_weapon_9mm_pistol"
CARD.Description = "gmod_base_weapon_9mm_pistol_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_9mm_pistol"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
CARD.HolographicStrength = Vector(1, 1, 1)
CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
CARD.ModelAngles = Angle(0, -90, 0)

CARD.Attributes = {
  Rarity = "Rare",
  Supertype = "Weapon",
}

-- Odds of actually receiving the card once this weapon is equipped.
-- Kept low (1 in 1000) because switching to an already-owned weapon
-- can be repeated instantly and indefinitely.
local REWARD_CHANCE = 500

if (SERVER) then
  -- Reward the card when a player equips this weapon
  function CARD.hooks:PlayerSwitchWeapon(ply, oldWeapon, newWeapon)
    if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_pistol" and math.random(1, REWARD_CHANCE) == 1) then
      CardEngine.Collection.AddCard(ply, self:GetUniqueID())
    end
  end
end
