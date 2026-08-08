local CARD = CARD

CARD.Name = "gmod_base_weapon_357_magnum"
CARD.Description = "gmod_base_weapon_357_magnum_description"
CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_357_magnum"
CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
CARD.HolographicStrength = Vector(1, 1, 1)
CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
CARD.ModelAngles = Angle(0, -90, 0)

CARD.Attributes = {
	Rarity = "Rare",
	Supertype = "Weapon",
}

if (SERVER) then
	-- Reward the card when a player equips this weapon
	function CARD.hooks:PlayerSwitchWeapon(ply, oldWeapon, newWeapon)
		if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_357") then
			CardEngine.Collection.AddCard(ply, "gmod_base_weapon_357_magnum")
		end
	end
end
