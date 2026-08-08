local ALL_CARDS = {}

do
	local CARD = {}
	CARD.FileName = "gmod_base_action_duplicate.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_duplicate.lua"

	CARD.Name = "gmod_base_action_duplicate"
	CARD.Description = "gmod_base_action_duplicate_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/action_duplicate"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
		Rarity = "common",
		Supertype = "Action",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_action_noclip.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_noclip.lua"

	CARD.Name = "gmod_base_action_noclip"
	CARD.Description = "gmod_base_action_noclip_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/action_noclip"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Action",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_action_plant_c4.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_plant_c4.lua"

	CARD.Name = "gmod_base_action_plant_c4"
	CARD.Description = "gmod_base_action_plant_c4_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/action_plant_c4"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Action",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_action_propkill.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_propkill.lua"

	CARD.Name = "gmod_base_action_propkill"
	CARD.Description = "gmod_base_action_propkill_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/action_propkill"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Action",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_action_spawn_explosive.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_spawn_explosive.lua"

	CARD.Name = "gmod_base_action_spawn_explosive"
	CARD.Description = "gmod_base_action_spawn_explosive_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/action_spawn_explosive"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Action",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_gamemode_sandbox.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_gamemode_sandbox.lua"

	CARD.Name = "gmod_base_gamemode_sandbox"
	CARD.Description = "gmod_base_gamemode_sandbox_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/gamemode_sandbox"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Gamemode",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_gamemode_ttt.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_gamemode_ttt.lua"

	CARD.Name = "gmod_base_gamemode_ttt"
	CARD.Description = "gmod_base_gamemode_ttt_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/gamemode_ttt"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Gamemode",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_gm_construct.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_gm_construct.lua"

	CARD.Name = "gmod_base_gm_construct"
	CARD.Description = "gmod_base_gm_construct_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/gm_construct"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Map",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_gm_flatgrass.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_gm_flatgrass.lua"

	CARD.Name = "gmod_base_gm_flatgrass"
	CARD.Description = "gmod_base_gm_flatgrass_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/gm_flatgrass"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Map",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_bathtub.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_bathtub.lua"

	CARD.Name = "gmod_base_prop_bathtub"
	CARD.Description = "gmod_base_prop_bathtub_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_bathtub"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_blastdoor.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_blastdoor.lua"

	CARD.Name = "gmod_base_prop_blastdoor"
	CARD.Description = "gmod_base_prop_blastdoor_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_blastdoor"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_blue_barrel.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_blue_barrel.lua"

	CARD.Name = "gmod_base_prop_blue_barrel"
	CARD.Description = "gmod_base_prop_blue_barrel_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_blue_barrel"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_boat.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_boat.lua"

	CARD.Name = "gmod_base_prop_boat"
	CARD.Description = "gmod_base_prop_boat_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_boat"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_combine_apc.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_combine_apc.lua"

	CARD.Name = "gmod_base_prop_combine_apc"
	CARD.Description = "gmod_base_prop_combine_apc_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_combine_apc"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_combine_train.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_combine_train.lua"

	CARD.Name = "gmod_base_prop_combine_train"
	CARD.Description = "gmod_base_prop_combine_train_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_combine_train"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_doll.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_doll.lua"

	CARD.Name = "gmod_base_prop_doll"
	CARD.Description = "gmod_base_prop_doll_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_doll"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_explosive_oildrum.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_explosive_oildrum.lua"

	CARD.Name = "gmod_base_prop_explosive_oildrum"
	CARD.Description = "gmod_base_prop_explosive_oildrum_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_explosive_oildrum"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_file_cabinet.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_file_cabinet.lua"

	CARD.Name = "gmod_base_prop_file_cabinet"
	CARD.Description = "gmod_base_prop_file_cabinet_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_file_cabinet"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_health_kit.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_health_kit.lua"

	CARD.Name = "gmod_base_prop_health_kit"
	CARD.Description = "gmod_base_prop_health_kit_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_health_kit"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_hula_doll.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_hula_doll.lua"

	CARD.Name = "gmod_base_prop_hula_doll"
	CARD.Description = "gmod_base_prop_hula_doll_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_hula_doll"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_item_crate.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_item_crate.lua"

	CARD.Name = "gmod_base_prop_item_crate"
	CARD.Description = "gmod_base_prop_item_crate_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_item_crate"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_laundry_cart.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_laundry_cart.lua"

	CARD.Name = "gmod_base_prop_laundry_cart"
	CARD.Description = "gmod_base_prop_laundry_cart_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_laundry_cart"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_lockers.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_lockers.lua"

	CARD.Name = "gmod_base_prop_lockers"
	CARD.Description = "gmod_base_prop_lockers_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_lockers"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_oildrum.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_oildrum.lua"

	CARD.Name = "gmod_base_prop_oildrum"
	CARD.Description = "gmod_base_prop_oildrum_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_oildrum"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_pop_can.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_pop_can.lua"

	CARD.Name = "gmod_base_prop_pop_can"
	CARD.Description = "gmod_base_prop_pop_can_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_pop_can"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_rifle_ammo.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_rifle_ammo.lua"

	CARD.Name = "gmod_base_prop_rifle_ammo"
	CARD.Description = "gmod_base_prop_rifle_ammo_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_rifle_ammo"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_rocket_ammo_crate.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_rocket_ammo_crate.lua"

	CARD.Name = "gmod_base_prop_rocket_ammo_crate"
	CARD.Description = "gmod_base_prop_rocket_ammo_crate_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_rocket_ammo_crate"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_suitcase.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_suitcase.lua"

	CARD.Name = "gmod_base_prop_suitcase"
	CARD.Description = "gmod_base_prop_suitcase_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_suitcase"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_takeout_carton.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_takeout_carton.lua"

	CARD.Name = "gmod_base_prop_takeout_carton"
	CARD.Description = "gmod_base_prop_takeout_carton_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_takeout_carton"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_trabbi.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_trabbi.lua"

	CARD.Name = "gmod_base_prop_trabbi"
	CARD.Description = "gmod_base_prop_trabbi_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_trabbi"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_traffic_cone.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_traffic_cone.lua"

	CARD.Name = "gmod_base_prop_traffic_cone"
	CARD.Description = "gmod_base_prop_traffic_cone_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_traffic_cone"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_vending_machine.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_vending_machine.lua"

	CARD.Name = "gmod_base_prop_vending_machine"
	CARD.Description = "gmod_base_prop_vending_machine_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_vending_machine"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_prop_watermelon.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_prop_watermelon.lua"

	CARD.Name = "gmod_base_prop_watermelon"
	CARD.Description = "gmod_base_prop_watermelon_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/prop_watermelon"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Prop",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_ttt_67thway.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_67thway.lua"

	CARD.Name = "gmod_base_ttt_67thway"
	CARD.Description = "gmod_base_ttt_67thway_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_67thway"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Map",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_ttt_airbus.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_airbus.lua"

	CARD.Name = "gmod_base_ttt_airbus"
	CARD.Description = "gmod_base_ttt_airbus_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_airbus"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Map",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_ttt_lost_temple.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_lost_temple.lua"

	CARD.Name = "gmod_base_ttt_lost_temple"
	CARD.Description = "gmod_base_ttt_lost_temple_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_lost_temple"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Map",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_ttt_rooftops.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_rooftops.lua"

	CARD.Name = "gmod_base_ttt_rooftops"
	CARD.Description = "gmod_base_ttt_rooftops_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_rooftops"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Map",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_ttt_skyscraper.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_skyscraper.lua"

	CARD.Name = "gmod_base_ttt_skyscraper"
	CARD.Description = "gmod_base_ttt_skyscraper_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_skyscraper"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Map",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_ttt_vessel.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_vessel.lua"

	CARD.Name = "gmod_base_ttt_vessel"
	CARD.Description = "gmod_base_ttt_vessel_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_vessel"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

	CARD.Attributes = {
	  Rarity = "common",
	  Supertype = "Map",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_357_magnum.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_357_magnum.lua"

	CARD.Name = "gmod_base_weapon_357_magnum"
	CARD.Description = "gmod_base_weapon_357_magnum_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_357_magnum"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_9mm_pistol.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_9mm_pistol.lua"

	CARD.Name = "gmod_base_weapon_9mm_pistol"
	CARD.Description = "gmod_base_weapon_9mm_pistol_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_9mm_pistol"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_alyx_gun.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_alyx_gun.lua"

	CARD.Name = "gmod_base_weapon_alyx_gun"
	CARD.Description = "gmod_base_weapon_alyx_gun_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_alyx_gun"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_annabelle.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_annabelle.lua"

	CARD.Name = "gmod_base_weapon_annabelle"
	CARD.Description = "gmod_base_weapon_annabelle_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_annabelle"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_bugbait.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_bugbait.lua"

	CARD.Name = "gmod_base_weapon_bugbait"
	CARD.Description = "gmod_base_weapon_bugbait_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_bugbait"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_crossbow.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_crossbow.lua"

	CARD.Name = "gmod_base_weapon_crossbow"
	CARD.Description = "gmod_base_weapon_crossbow_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_crossbow"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_crowbar.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_crowbar.lua"

	CARD.Name = "gmod_base_weapon_crowbar"
	CARD.Description = "gmod_base_weapon_crowbar_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_crowbar"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_gravity_gun.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_gravity_gun.lua"

	CARD.Name = "gmod_base_weapon_gravity_gun"
	CARD.Description = "gmod_base_weapon_gravity_gun_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_gravity_gun"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_grenade.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_grenade.lua"

	CARD.Name = "gmod_base_weapon_grenade"
	CARD.Description = "gmod_base_weapon_grenade_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_grenade"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_physics_gun.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_physics_gun.lua"

	CARD.Name = "gmod_base_weapon_physics_gun"
	CARD.Description = "gmod_base_weapon_physics_gun_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_physics_gun"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_pulse_rifle.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_pulse_rifle.lua"

	CARD.Name = "gmod_base_weapon_pulse_rifle"
	CARD.Description = "gmod_base_weapon_pulse_rifle_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_pulse_rifle"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_rpg_launcher.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_rpg_launcher.lua"

	CARD.Name = "gmod_base_weapon_rpg_launcher"
	CARD.Description = "gmod_base_weapon_rpg_launcher_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_rpg_launcher"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_shotgun.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_shotgun.lua"

	CARD.Name = "gmod_base_weapon_shotgun"
	CARD.Description = "gmod_base_weapon_shotgun_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_shotgun"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_slam.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_slam.lua"

	CARD.Name = "gmod_base_weapon_slam"
	CARD.Description = "gmod_base_weapon_slam_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_slam"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_smg.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_smg.lua"

	CARD.Name = "gmod_base_weapon_smg"
	CARD.Description = "gmod_base_weapon_smg_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_smg"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

do
	local CARD = {}
	CARD.FileName = "gmod_base_weapon_stunstick.lua"
	CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_weapon_stunstick.lua"

	CARD.Name = "gmod_base_weapon_stunstick"
	CARD.Description = "gmod_base_weapon_stunstick_description"
	CARD.Texture = "card_engine/expansions/gmod_base_set/weapon_stunstick"
	CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
	CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
	CARD.HolographicStrength = Vector(1, 1, 1)
	CARD.HolographicTexture = "card_engine/holo_rainbow_strong"
	CARD.ModelAngles = Angle(0, -90, 0)

	CARD.Attributes = {
	  Rarity = "rare",
	  Supertype = "Weapon",
	}
	table.insert(ALL_CARDS, CARD)
end

return ALL_CARDS
