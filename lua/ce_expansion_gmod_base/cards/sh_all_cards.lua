local ALL_CARDS = {}

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_action_duplicate.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_duplicate.lua"

  CARD.Name = "gmod_base_action_duplicate"
  CARD.Description = "gmod_base_action_duplicate_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/action_duplicate"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON
  CARD.ModelAngles = Angle(0, -90, 0)

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Action",
  }

  -- Odds of actually receiving the card on a duplicator use.
  -- Kept low (1 in 150) since pasting a duplication can be repeated
  -- almost as freely as spawning a prop.
  local REWARD_CHANCE = 150

  if (SERVER) then
    -- Reward the card when a player uses the duplicator tool
    function CARD.hooks:CanTool(ply, trace, mode)
      if (mode == "duplicator" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
    Rarity = "Rare",
    Supertype = "Action",
  }

  -- Odds of actually receiving the card on enabling noclip.
  -- Kept low (1 in 500) since noclip can be toggled on and off at will.
  local REWARD_CHANCE = 500

  if (SERVER) then
    -- Reward the card when a player enables noclip
    function CARD.hooks:PlayerNoClip(ply, desiredState)
      if (desiredState and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_action_plant_c4.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_plant_c4.lua"

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
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_action_propkill.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_propkill.lua"

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
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_action_spawn_explosive.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_action_spawn_explosive.lua"

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
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_gamemode_sandbox.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_gamemode_sandbox.lua"

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
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_gamemode_ttt.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_gamemode_ttt.lua"

  CARD.Name = "gmod_base_gamemode_ttt"
  CARD.Description = "gmod_base_gamemode_ttt_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/gamemode_ttt"
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
    -- Reward the card when a player joins on the Trouble in Terrorist Town gamemode
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (engine.ActiveGamemode() == "terrortown" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_gm_construct.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_gm_construct.lua"

  CARD.Name = "gmod_base_gm_construct"
  CARD.Description = "gmod_base_gm_construct_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/gm_construct"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Map",
  }

  -- Odds of actually receiving the card on a matching join.
  -- Joining while this one specific map (out of many) is active is
  -- already a naturally rare event, so the odds can stay higher.
  local REWARD_CHANCE = 10

  if (SERVER) then
    -- Reward the card when a player joins on gm_construct
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (game.GetMap() == "gm_construct" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_gm_flatgrass.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_gm_flatgrass.lua"

  CARD.Name = "gmod_base_gm_flatgrass"
  CARD.Description = "gmod_base_gm_flatgrass_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/gm_flatgrass"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Map",
  }

  -- Odds of actually receiving the card on a matching join.
  -- Joining while this one specific map (out of many) is active is
  -- already a naturally rare event, so the odds can stay higher.
  local REWARD_CHANCE = 10

  if (SERVER) then
    -- Reward the card when a player joins on gm_flatgrass
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (game.GetMap() == "gm_flatgrass" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_interiors/bathtub01a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_lab/blastdoor001a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_borealis/bluebarrel001.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_canal/boat002b.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/combine_apc.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_combine/combinetrain01a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_c17/doll01.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_c17/oildrum001_explosive.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_wasteland/controlroom_filecabinet001a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/items/healthkit.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_lab/huladoll.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/items/item_item_crate.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_wasteland/laundry_cart002.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_c17/lockers001a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_c17/oildrum001.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_junk/popcan01a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/items/ammocrate_rockets.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_c17/suitcase001a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_junk/garbage_takeoutcarton001a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_vehicles/car002a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_junk/trafficcone001a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_interiors/vendingmachinesoda01a.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (model == "models/props_junk/watermelon01.mdl" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_ttt_67thway.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_67thway.lua"

  CARD.Name = "gmod_base_ttt_67thway"
  CARD.Description = "gmod_base_ttt_67thway_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_67thway"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Map",
  }

  -- Odds of actually receiving the card on a matching join.
  -- Joining while this one specific map (out of many) is active is
  -- already a naturally rare event, so the odds can stay higher.
  local REWARD_CHANCE = 10

  if (SERVER) then
    -- Reward the card when a player joins on ttt_67thway. Matched by prefix
    -- since the installed map's exact version suffix (e.g. "_v3") can vary.
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (string.find(game.GetMap(), "^ttt_67thway") and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_ttt_airbus.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_airbus.lua"

  CARD.Name = "gmod_base_ttt_airbus"
  CARD.Description = "gmod_base_ttt_airbus_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_airbus"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Map",
  }

  -- Odds of actually receiving the card on a matching join.
  -- Joining while this one specific map (out of many) is active is
  -- already a naturally rare event, so the odds can stay higher.
  local REWARD_CHANCE = 10

  if (SERVER) then
    -- Reward the card when a player joins on ttt_airbus. Matched by prefix
    -- since the installed map's exact version suffix (e.g. "_v2") can vary.
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (string.find(game.GetMap(), "^ttt_airbus") and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_ttt_lost_temple.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_lost_temple.lua"

  CARD.Name = "gmod_base_ttt_lost_temple"
  CARD.Description = "gmod_base_ttt_lost_temple_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_lost_temple"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Map",
  }

  -- Odds of actually receiving the card on a matching join.
  -- Joining while this one specific map (out of many) is active is
  -- already a naturally rare event, so the odds can stay higher.
  local REWARD_CHANCE = 10

  if (SERVER) then
    -- Reward the card when a player joins on ttt_lost_temple. Matched by prefix
    -- since the installed map's exact version suffix can vary.
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (string.find(game.GetMap(), "^ttt_lost_temple") and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_ttt_rooftops.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_rooftops.lua"

  CARD.Name = "gmod_base_ttt_rooftops"
  CARD.Description = "gmod_base_ttt_rooftops_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_rooftops"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Map",
  }

  -- Odds of actually receiving the card on a matching join.
  -- Joining while this one specific map (out of many) is active is
  -- already a naturally rare event, so the odds can stay higher.
  local REWARD_CHANCE = 10

  if (SERVER) then
    -- Reward the card when a player joins on ttt_rooftops. Matched by prefix
    -- since the installed map's exact version suffix can vary.
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (string.find(game.GetMap(), "^ttt_rooftops") and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_ttt_skyscraper.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_skyscraper.lua"

  CARD.Name = "gmod_base_ttt_skyscraper"
  CARD.Description = "gmod_base_ttt_skyscraper_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_skyscraper"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Map",
  }

  -- Odds of actually receiving the card on a matching join.
  -- Joining while this one specific map (out of many) is active is
  -- already a naturally rare event, so the odds can stay higher.
  local REWARD_CHANCE = 10

  if (SERVER) then
    -- Reward the card when a player joins on ttt_skyscraper. Matched by prefix
    -- since the installed map's exact version suffix can vary.
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (string.find(game.GetMap(), "^ttt_skyscraper") and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
  CARD.FileName = "gmod_base_ttt_vessel.lua"
  CARD.FilePath = "ce_expansion_gmod_base/cards/gmod_base_ttt_vessel.lua"

  CARD.Name = "gmod_base_ttt_vessel"
  CARD.Description = "gmod_base_ttt_vessel_description"
  CARD.Texture = "card_engine/expansions/gmod_base_set/ttt_vessel"
  CARD.RearTexture = "card_engine/expansions/gmod_base_set/back"
  CARD.CardSize = CardEngine.DEFAULT_CARD_MODELS.COMMON

  CARD.Attributes = {
    Rarity = "Common",
    Supertype = "Map",
  }

  -- Odds of actually receiving the card on a matching join.
  -- Joining while this one specific map (out of many) is active is
  -- already a naturally rare event, so the odds can stay higher.
  local REWARD_CHANCE = 10

  if (SERVER) then
    -- Reward the card when a player joins on ttt_vessel. Matched by prefix
    -- since the installed map's exact version suffix can vary.
    function CARD.hooks:PlayerInitialSpawn(ply)
      if (string.find(game.GetMap(), "^ttt_vessel") and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_357" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_alyxgun" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_annabelle" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_bugbait" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_crossbow" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_crowbar" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_physcannon" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_frag" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_physgun" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_ar2" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_rpg" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_shotgun" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_slam" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_smg1" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

do
  local CARD = {}
  CARD.hooks = setmetatable({}, { __index = CARD })
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
      if (IsValid(newWeapon) and newWeapon:GetClass() == "weapon_stunstick" and math.random(1, REWARD_CHANCE) == 1) then
        CardEngine.Collection.AddCard(ply, self:GetUniqueID())
      end
    end
  end
  table.insert(ALL_CARDS, CARD)
end

return ALL_CARDS
