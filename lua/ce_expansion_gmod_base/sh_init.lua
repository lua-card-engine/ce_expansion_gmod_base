CardEngine = CardEngine or {}
CardEngine.ExpansionSets = CardEngine.ExpansionSets or {}
CardEngine.ExpansionSets.GmodBaseSet = CardEngine.ExpansionSets.GmodBaseSet or {}

hook.Add(
	"CardEngineInitializeExpansionPacks",
	"CardEngine.GmodBaseSet.InitializeExpansionPack",
	function()
		if (not CardEngine) then
			ErrorNoHalt("Card Engine not found! Expansion pack 'ce_expansion_gmod_base' will not load.\n")
			return
		end

		local EXPANSION_SET_ID = "gmod_base"

		-- Register the expansion set with its metadata and filterable attributes
		CardEngine.ExpansionSet.Register({
			UniqueID = EXPANSION_SET_ID,
			Name = "expansion_set_gmod_base",
			Image = "card_engine/ce_expansion_gmod_base/set_logo",

			-- Define which attributes should appear as filters in the collection menu
			FilterableAttributes = {
				-- E.g: Map, Action, Prop
				Supertype = {
					Name = "collection_filter_supertype",
					AttributeName = "Supertype",
					IsArray = false,
				},
				Rarity = {
					Name = "collection_filter_rarity",
					AttributeName = "Rarity",
					IsArray = false,
				},
			},
		})

		CardEngine.Collection.IncludeDirectory(
			CardEngine.PathCombine("ce_expansion_gmod_base", "cards/"),
			nil,
			-- Automatically inject the ExpansionSet property into all cards loaded from this expansion pack
			function(fileName, cardFilePath)
				CARD.ExpansionSet = EXPANSION_SET_ID
			end
		)

		CardEngine.Language.IncludeDirectory(CardEngine.PathCombine("ce_expansion_gmod_base", "languages/"))
	end
)

if (SERVER) then
	return
end

-- Tool to render props for use in cards
local PANEL = {}

function PANEL:Init()
	self:SetSize(600, 400)
	self:Center()
	self:SetTitle("High Quality Spawnicon Batch Renderer")
	self:MakePopup()

	-- Model paths input (multiline)
	local modelLabel = vgui.Create("DLabel", self)
	modelLabel:SetPos(10, 30)
	modelLabel:SetSize(580, 20)
	modelLabel:SetText("Model Paths (one per line, optional skin: path;skinindex):")

	self.modelEntry = vgui.Create("DTextEntry", self)
	self.modelEntry:SetPos(10, 50)
	self.modelEntry:SetSize(580, 250)
	self.modelEntry:SetMultiline(true)

	-- Load persisted value or use default
	local defaultText =
	"models/props_c17/oildrum001.mdl\nmodels/props_junk/watermelon01.mdl\nmodels/player/kleiner.mdl;2"
	self.modelEntry:SetText(CardEngine.ExpansionSets.GmodBaseSet.SpawniconRendererText or defaultText)

	-- Persist the value when it changes
	self.modelEntry.OnChange = function(entry)
		CardEngine.ExpansionSets.GmodBaseSet.SpawniconRendererText = entry:GetValue()
	end

	-- Render button
	self.renderBtn = vgui.Create("DButton", self)
	self.renderBtn:SetPos(10, 310)
	self.renderBtn:SetSize(580, 30)
	self.renderBtn:SetText("Render All & Save PNGs")
	self.renderBtn.DoClick = function()
		self:BatchRenderAndSave()
	end

	-- Status label
	self.statusLabel = vgui.Create("DLabel", self)
	self.statusLabel:SetPos(10, 350)
	self.statusLabel:SetSize(580, 40)
	self.statusLabel:SetText("Enter model paths (one per line) and click 'Render All & Save PNGs'")
	self.statusLabel:SetTextColor(Color(150, 150, 150))
	self.statusLabel:SetWrap(true)

	-- Hidden model panel for rendering
	self.modelPanel = vgui.Create("DModelPanel", self)
	self.modelPanel:SetPos(-512, -512)
	self.modelPanel:SetSize(512, 512)
	self.modelPanel:SetFOV(45)
	self.modelPanel:SetVisible(false)

	function self.modelPanel:LayoutEntity(ent)
		return
	end
end

function PANEL:BatchRenderAndSave()
	local text = self.modelEntry:GetValue()

	if (text == "") then
		self.statusLabel:SetText("Error: Please enter at least one model path")
		self.statusLabel:SetTextColor(Color(255, 100, 100))
		return
	end

	-- Parse model paths (one per line), with optional skin: path;skinindex
	local modelEntries = {}
	for line in string.gmatch(text, "[^\r\n]+") do
		line = string.Trim(line)
		if (line ~= "") then
			local modelPath, skinStr = string.match(line, "^(.+);(%d+)$")
			if (modelPath) then
				table.insert(modelEntries, { path = modelPath, skin = tonumber(skinStr) })
			else
				table.insert(modelEntries, { path = line, skin = 0 })
			end
		end
	end

	if (#modelEntries == 0) then
		self.statusLabel:SetText("Error: No valid model paths found")
		self.statusLabel:SetTextColor(Color(255, 100, 100))
		return
	end

	-- Create output directory
	if (not file.Exists("card_engine_spawnicons", "DATA")) then
		file.CreateDir("card_engine_spawnicons")
	end

	local successCount = 0
	local failCount = 0
	local failedModels = {}

	self.statusLabel:SetText("Processing " .. #modelEntries .. " models...")
	self.statusLabel:SetTextColor(Color(255, 255, 100))

	-- Process each model with a delay to allow rendering
	local index = 1
	local function ProcessNextModel()
		if (index > #modelEntries) then
			-- All done
			local statusText = "Complete! " .. successCount .. " rendered, " .. failCount .. " failed."
			if (failCount > 0) then
				statusText = statusText .. " Failed: " .. table.concat(failedModels, ", ")
			end
			self.statusLabel:SetText(statusText)
			self.statusLabel:SetTextColor(successCount > 0 and Color(100, 255, 100) or Color(255, 100, 100))
			self.renderBtn:SetEnabled(true)
			return
		end

		local entry = modelEntries[index]
		local modelPath = entry.path
		local skin = entry.skin
		self.statusLabel:SetText("Processing " ..
			index .. "/" .. #modelEntries .. ": " .. modelPath .. (skin > 0 and " (skin " .. skin .. ")" or ""))

		-- Check if model exists
		if (not file.Exists(modelPath, "GAME")) then
			failCount = failCount + 1
			table.insert(failedModels, string.GetFileFromFilename(modelPath))
			index = index + 1
			timer.Simple(0, ProcessNextModel)
			return
		end

		-- Load the model and apply skin
		self.modelPanel:SetModel(modelPath)
		local ent = self.modelPanel:GetEntity()
		if (IsValid(ent)) then
			ent:SetSkin(skin)
		end

		-- Wait a frame for the model to load, then render
		timer.Simple(0.1, function()
			if (not IsValid(self)) then return end

			local success = self:RenderModel(modelPath, skin)
			if (success) then
				successCount = successCount + 1
			else
				failCount = failCount + 1
				table.insert(failedModels, string.GetFileFromFilename(modelPath))
			end

			index = index + 1
			timer.Simple(0, ProcessNextModel)
		end)
	end

	self.renderBtn:SetEnabled(false)
	ProcessNextModel()
end

function PANEL:RenderModel(modelPath, skin)
	local ent = self.modelPanel:GetEntity()
	if (not IsValid(ent)) then
		return false
	end

	-- Ensure skin is applied before rendering
	ent:SetSkin(skin or 0)

	-- Use GMod's standard spawnicon positioning
	local pos = ent:GetPos()
	local tab = PositionSpawnIcon(ent, pos, true)

	if (not tab) then
		return false
	end

	local camPos = tab.origin
	local lookAng = tab.angles
	local fov = tab.fov

	-- Create render target
	local rt = GetRenderTarget("SpawnIconRT_512", 512, 512)

	-- Store old render target
	local oldRT = render.GetRenderTarget()

	-- Start rendering to our render target
	render.PushRenderTarget(rt)
	render.SetViewPort(0, 0, 512, 512)

	-- Clear with transparency
	render.Clear(0, 0, 0, 0, true, true)

	-- Setup 3D rendering
	cam.Start3D(camPos, lookAng, fov, 0, 0, 512, 512)

	-- Enable lighting for the model
	render.SuppressEngineLighting(true)
	render.SetLightingOrigin(camPos)
	-- Ambient light (0.3, 0.3, 0.3) - matching icon editor
	render.ResetModelLighting(0.3, 0.3, 0.3)
	render.SetColorModulation(1, 1, 1)
	render.SetBlend(1)

	-- Setup directional lights (matching GMod's icon editor defaults exactly)
	render.SetModelLighting(BOX_FRONT, 1.3, 1.3, 1.3)
	render.SetModelLighting(BOX_BACK, 0.2, 0.2, 0.2)
	render.SetModelLighting(BOX_RIGHT, 0.2, 0.2, 0.2)
	render.SetModelLighting(BOX_LEFT, 0.2, 0.2, 0.2)
	render.SetModelLighting(BOX_TOP, 2.3, 2.3, 2.3)
	render.SetModelLighting(BOX_BOTTOM, 0.1, 0.1, 0.1)

	-- Draw the model
	ent:DrawModel()

	render.SuppressEngineLighting(false)

	cam.End3D()

	-- Capture the render target to file
	local data = render.Capture({
		format = "png",
		x = 0,
		y = 0,
		w = 512,
		h = 512,
		alpha = true
	})

	render.PopRenderTarget()
	render.SetViewPort(0, 0, ScrW(), ScrH())

	-- Generate filename from model path (include skin in filename if not 0)
	local cleanName = string.gsub(modelPath, "[/\\]", "_")
	cleanName = string.gsub(cleanName, "%.mdl$", "")
	local skinSuffix = (skin and skin > 0) and ("_skin" .. skin) or ""
	local fileName = "spawnicon_" .. cleanName .. skinSuffix .. ".png"

	file.Write("card_engine_spawnicons/" .. fileName, data)

	-- Restore render target
	render.SetRenderTarget(oldRT)

	return true
end

vgui.Register("CardEngine.GmodBaseSet.SpawniconRenderer", PANEL, "DFrame")

concommand.Add("card_engine_gmod_prop_renderer", function()
	if (not LocalPlayer():IsAdmin()) then
		return
	end

	if (IsValid(SpawniconRendererFrame)) then
		SpawniconRendererFrame:Remove()
	end

	SpawniconRendererFrame = vgui.Create("CardEngine.GmodBaseSet.SpawniconRenderer")
	SpawniconRendererFrame:MakePopup()
end)
