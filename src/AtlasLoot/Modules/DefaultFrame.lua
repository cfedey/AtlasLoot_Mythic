-- $Id: DefaultFrame.lua 3697 2012-01-31 15:17:37Z lag123 $
--[[
Atlasloot Enhanced
Author Hegarol
Loot browser associating loot with instance bosses
Can be integrated with Atlas (http://www.atlasmod.com)
]]
local AtlasLoot = LibStub("AceAddon-3.0"):GetAddon("AtlasLoot")

local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");

local MODULENAME = "DefaultFrame"
local DefaultFrame = AtlasLoot:NewModule(MODULENAME)

local frameName = "AtlasLootDefaultFrame"
local imagePath = AtlasLoot.imagePath.."AtlasImages\\"
local scrollNumLines, scrollCurLines, curInstance = 24, 0, {}
local curBoss = nil
local instances = {}

--[[
	1 = Atlas
	2 = AtlasLoot old
]]--
local DEFAULTFRAME_STYLE_NUM_DUMMY = 1

local db
local dbDefaults = {
	profile = {
		DefaultFrameLocked = false,
		module = "AtlasLootWotLK",
		instance = "AhnKahet",
		point = nil,
		NEWpoint = {"CENTER"}
	},
}

local getOptions
do
	local options
	function getOptions()
		if not options then
			options = {
				type = "group",
				name = MODULENAME,
				order = 600,
				childGroups = "tab",
				args = {
					toggle = {
						type = "toggle",
						name = AL["Enable"],
						get = function()
							return AtlasLoot:GetModuleEnabled(MODULENAME)
						end,
						set = function(info, v)
							AtlasLoot:SetModuleEnabled(MODULENAME, v)
						end,
						order = 10,
					},
					nllockb = {
						type = "description",
						name = "",
						order = 20,
					},

				},
			}

		end
		return options
	end

end


function DefaultFrame:OnInitialize()
	if not AtlasLoot.db then AtlasLoot:OnLoaderLoad() end
	self.db = AtlasLoot.db:RegisterNamespace(MODULENAME, dbDefaults)
	db = self.db.profile

	self:CreateDefaultFrame()
	self:CreateInstanceTab()
	self.Frame:SetPoint(unpack(db.NEWpoint))
	tinsert(UISpecialFrames, frameName)
	--AtlasLoot:RegisterModuleOptions(MODULENAME, getOptions, MODULENAME)
	AtlasLoot:RegisterPFrame(frameName, { "TOPLEFT", frameName, "TOPLEFT", "18", "-84" })
	AtlasLoot:AddResetCommand(DefaultFrame.ResetCom, "DefaultFrame", "frames")
	--DefaultFrame:SetInstanceTable()
	DefaultFrame:DropDownRefresh()
	AtlasLoot.ShowFrame_MiniMap = DefaultFrame.MiniMap_OnClick_Replace
	AtlasLoot:DefaultFrame_RefreshScale()
end

function DefaultFrame:OnEnable()

end

function DefaultFrame:OnDisable()

end

function DefaultFrame:ResetCom()
	DefaultFrame.Frame:SetPoint("CENTER", UIParent, "CENTER")
end

-- FRAME
do

	local function onDragStart(self, arg1)
		if arg1 == "LeftButton" then
			if not db.DefaultFrameLocked then
				self:StartMoving()
			end
		end
	end

	local function onDragStop(self)
		self:StopMovingOrSizing()
		local a,b,c,d,e = self:GetPoint()
		db.NEWpoint = { a, nil, c, d, e }
	end

	local function setFrameLvl(self)
		self:SetFrameLevel( self:GetParent():GetFrameLevel() + 1 )
		--self:SetToplevel(true)
	end

	local function updateLock()
		if(db.DefaultFrameLocked) then
			DefaultFrame.Frame.LockButton.NormalTexture:SetTexture(imagePath.."LockButton-Locked-Up")
			DefaultFrame.Frame.LockButton.PushedTexture:SetTexture(imagePath.."LockButton-Locked-Down")
		else
			DefaultFrame.Frame.LockButton.NormalTexture:SetTexture(imagePath.."LockButton-Unlocked-Up")
			DefaultFrame.Frame.LockButton.PushedTexture:SetTexture(imagePath.."LockButton-Unlocked-Down")
		end
	end

	local function toggleLock()
		if(db.DefaultFrameLocked) then
			db.DefaultFrameLocked = false
			updateLock()
		else
			db.DefaultFrameLocked = true
			updateLock()
		end
	end

	local function scrollBarUpdate()
		local line, lineplusoffset
		FauxScrollFrame_Update(DefaultFrame.Frame.ScrollFrame, scrollCurLines, scrollNumLines, 15)
		for line=1,scrollNumLines do
			lineplusoffset = line + FauxScrollFrame_GetOffset(DefaultFrame.Frame.ScrollFrame)
			if ( lineplusoffset <= scrollCurLines ) then
				DefaultFrame.Frame.ScrollFrame.Buttons[line]:SetText(curInstance[lineplusoffset])
				DefaultFrame.Frame.ScrollFrame.Buttons[line]:Show()
			elseif DefaultFrame.Frame.ScrollFrame.Buttons[line] then
				DefaultFrame.Frame.ScrollFrame.Buttons[line]:Hide()
			end
		end
	end

	local function onVerticalScroll()
		FauxScrollFrame_OnVerticalScroll(self, offset, 15, scrollBarUpdate);
	end

	local function onShow()
		AtlasLoot.AtlasLootPanel:SetParent(_G[frameName])
		AtlasLoot.AtlasLootPanel:SetPoint("TOP", frameName, "BOTTOM", 0, 9)
		AtlasLoot.AtlasInfoFrame:SetParent(_G[frameName])
		AtlasLoot.AtlasInfoFrame:SetPoint("TOPLEFT", frameName, "TOPLEFT", 535, -37)
		DefaultFrame:AutoSelect()
		DefaultFrame:SetInstanceTable()

		if AtlasLoot.db.profile.HidePanel == true then
			AtlasLoot.AtlasLootPanel:Hide();
		else
			AtlasLoot.AtlasLootPanel:Show();
		end
		AtlasLoot.AtlasInfoFrame:Show()
		AtlasLootItemsFrame:Show()
	end

	local function onEnter()
		AtlasLoot:DefaultFrame_RefreshAlpha()
	end

	local function onLeave()
		AtlasLoot:DefaultFrame_RefreshAlpha(true)
	end

	local function onCompareFrameClick()
		if db.instance then
			if AtlasLoot.CompareFrame:IsShown() then AtlasLoot.CompareFrame:Hide() end
			AtlasLoot:CompareFrame_LoadInstance( db.instance )
		end
	end

		function DefaultFrame:CreateDefaultFrame()
		if self.Frame then return end
		self.Frame = CreateFrame("Frame", frameName)
	
		local Frame = self.Frame
		Frame:ClearAllPoints()
		Frame:SetParent(UIParent)
		Frame:SetPoint(unpack(db.NEWpoint))
		Frame:SetFrameStrata("HIGH")  -- Uncommented this line
		Frame:SetWidth(921)
		Frame:SetHeight(601)
		Frame:SetMovable(true)
		Frame:EnableMouse(true)
		Frame:RegisterForDrag("LeftButton")
		Frame:RegisterForDrag("LeftButton", "RightButton")
		Frame:SetScript("OnMouseDown", onDragStart)
		Frame:SetScript("OnMouseUp", onDragStop)
		Frame:SetScript("OnShow", onShow)
		--Frame:SetScript("OnEnter", onEnter)
		--Frame:SetScript("OnLeave", onLeave)
		Frame:SetToplevel(true)
		Frame:SetClampedToScreen(true)
	
		Frame.CloseButton = CreateFrame("Button", frameName.."_CloseButton", Frame, "UIPanelCloseButton")
		Frame.CloseButton:SetPoint("TOPRIGHT", Frame, "TOPRIGHT", 5, -7)
		Frame.CloseButton:SetScript("OnShow", setFrameLvl)
	
		Frame.LockButton = CreateFrame("Button", frameName.."_LockButton",Frame,"OptionsButtonTemplate")
		Frame.LockButton:SetWidth(32)
		Frame.LockButton:SetHeight(32)
		Frame.LockButton:SetPoint("RIGHT", Frame.CloseButton, "LEFT", 10, 0)
		Frame.LockButton:SetScript("OnClick", toggleLock)
	
		Frame.LockButton.NormalTexture = Frame:CreateTexture(frameName.."_NormalTexture", "ARTWORK")
		Frame.LockButton.NormalTexture:SetPoint("TOPLEFT", Frame.LockButton, "TOPLEFT")
	
		Frame.LockButton.PushedTexture = Frame:CreateTexture(frameName.."_PushedTexture", "ARTWORK")
		Frame.LockButton.PushedTexture:SetPoint("TOPLEFT", Frame.LockButton, "TOPLEFT")
	
		Frame.LockButton.HighlightTexture = Frame:CreateTexture(frameName.."_HighlightTexture", "ARTWORK")
		Frame.LockButton.HighlightTexture:SetPoint("TOPLEFT", Frame.LockButton, "TOPLEFT")
		Frame.LockButton.HighlightTexture:SetTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	
		Frame.LockButton:SetNormalTexture(Frame.LockButton.NormalTexture)
		Frame.LockButton:SetPushedTexture(Frame.LockButton.PushedTexture)
		Frame.LockButton:SetHighlightTexture(Frame.LockButton.HighlightTexture, "ADD")
		updateLock()
	
		Frame.Layers = {}
	
		-- Border textures on OVERLAY layer (above map)
		Frame.Layers[1] = Frame:CreateTexture(nil, "OVERLAY")
		Frame.Layers[1]:SetPoint("TOPLEFT", Frame, "TOPLEFT")
		Frame.Layers[1]:SetWidth(512)
		Frame.Layers[1]:SetHeight(128)
		Frame.Layers[1]:SetTexture(imagePath.."AtlasFrame-Top")
	
		Frame.Layers[2] = Frame:CreateTexture(nil, "OVERLAY")
		Frame.Layers[2]:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, -128)
		Frame.Layers[2]:SetWidth(32)
		Frame.Layers[2]:SetHeight(256)
		Frame.Layers[2]:SetTexture(imagePath.."AtlasFrame-Left")
	
		Frame.Layers[3] = Frame:CreateTexture(nil, "OVERLAY")
		Frame.Layers[3]:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, -384)
		Frame.Layers[3]:SetWidth(512)
		Frame.Layers[3]:SetHeight(256)
		Frame.Layers[3]:SetTexture(imagePath.."AtlasFrame-Bottom")
	
		Frame.Layers[4] = Frame:CreateTexture(nil, "OVERLAY")
		Frame.Layers[4]:SetPoint("TOPLEFT", Frame, "TOPLEFT", 512, -512)
		Frame.Layers[4]:SetWidth(512)
		Frame.Layers[4]:SetHeight(128)
		Frame.Layers[4]:SetTexture(imagePath.."AtlasFrame-Bottom2")
	
		Frame.Layers[5] = Frame:CreateTexture(nil, "OVERLAY")
		Frame.Layers[5]:SetPoint("TOPLEFT", Frame, "TOPLEFT", 512, 0)
		Frame.Layers[5]:SetWidth(512)
		Frame.Layers[5]:SetHeight(512)
		Frame.Layers[5]:SetTexture(imagePath.."AtlasFrame-Right")
	
		-- Black square on BACKGROUND layer
		Frame.Layers[6] = Frame:CreateTexture(nil, "BACKGROUND")
		Frame.Layers[6]:SetPoint("TOPLEFT", Frame, "TOPLEFT", 18, -84)
		Frame.Layers[6]:SetWidth(512)
		Frame.Layers[6]:SetHeight(512)
		Frame.Layers[6]:SetTexture(0.0, 0.0, 0.0, 1.0)
		
		-- Create the map texture on ARTWORK layer (above black square, below borders)
		AtlasLootMapTexture = Frame:CreateTexture("AtlasLootMapTexture", "OVERLAY")
		AtlasLootMapTexture:SetWidth(512)
		AtlasLootMapTexture:SetHeight(512)
		AtlasLootMapTexture:SetPoint("TOPLEFT", Frame, "TOPLEFT", 18, -84)
		AtlasLootMapTexture:Hide()
	
		Frame.Title = Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		Frame.Title:SetPoint("TOP", Frame, "TOP", 20, -17)
		Frame.Title:SetText(AL["AtlasLoot"])
	
		Frame.VersionNumber = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		Frame.VersionNumber:SetPoint("TOPRIGHT", Frame, "TOPRIGHT", -52, -18)
		Frame.VersionNumber:SetTextColor(0.4, 0.4, 0.4)
		Frame.VersionNumber:SetText(ATLASLOOT_VERSION_NUM.." ( FrameStyle by Atlas )")
	
		Frame.InstanceName = Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		Frame.InstanceName:SetPoint("TOPLEFT", Frame, "TOPLEFT", 544, -91) -- ʕ •ᴥ•ʔ✿ Adjusted 2px left, 6px up ✿ʕ •ᴥ•ʔ
		Frame.InstanceName:SetJustifyH("LEFT")
		Frame.InstanceName:SetWidth(351)
		Frame.InstanceName:SetHeight(30)
		Frame.InstanceName:SetText("")
	
		Frame.OverallAttuneFrame = Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		Frame.OverallAttuneFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 544, -91 - 15 * 1) -- ʕ •ᴥ•ʔ✿ Adjusted 2px left, 6px up ✿ʕ •ᴥ•ʔ
		Frame.OverallAttuneFrame:SetJustifyH("LEFT")
		Frame.OverallAttuneFrame:SetWidth(351)
		Frame.OverallAttuneFrame:SetHeight(30)
		Frame.OverallAttuneFrame:SetText("")
	
		Frame.OverallTitanForgedFrame = Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		Frame.OverallTitanForgedFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 544, -91 - 15 * 2) -- ʕ •ᴥ•ʔ✿ Adjusted 2px left, 6px up ✿ʕ •ᴥ•ʔ
		Frame.OverallTitanForgedFrame:SetJustifyH("LEFT")
		Frame.OverallTitanForgedFrame:SetWidth(351)
		Frame.OverallTitanForgedFrame:SetHeight(30)
		Frame.OverallTitanForgedFrame:SetText("")
	
		Frame.OverallWarForgedFrame = Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		Frame.OverallWarForgedFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 544, -91 - 15 * 3) -- ʕ •ᴥ•ʔ✿ Adjusted 2px left, 6px up ✿ʕ •ᴥ•ʔ
		Frame.OverallWarForgedFrame:SetJustifyH("LEFT")
		Frame.OverallWarForgedFrame:SetWidth(351)
		Frame.OverallWarForgedFrame:SetHeight(30)
		Frame.OverallWarForgedFrame:SetText("")
	
		Frame.OverallLightForgedFrame = Frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		Frame.OverallLightForgedFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 544, -91 - 15 * 4) -- ʕ •ᴥ•ʔ✿ Adjusted 2px left, 6px up ✿ʕ •ᴥ•ʔ
		Frame.OverallLightForgedFrame:SetJustifyH("LEFT")
		Frame.OverallLightForgedFrame:SetWidth(351)
		Frame.OverallLightForgedFrame:SetHeight(30)
		Frame.OverallLightForgedFrame:SetText("")
	
		Frame.ScrollFrame = CreateFrame("ScrollFrame", frameName.."_ScrollFrame", Frame, "FauxScrollFrameTemplate")
		Frame.ScrollFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 530, -186)
		Frame.ScrollFrame:SetWidth(351)
		Frame.ScrollFrame:SetHeight(367)
		Frame.ScrollFrame:SetScript("OnVerticalScroll", onVerticalScroll)
		Frame.ScrollFrame:SetScript("OnShow", scrollBarUpdate)
	
		Frame.ScrollFrame.Buttons = {}
	
		Frame.CompareFrame = CreateFrame("Button", frameName.."_CompareFrame", Frame, "UIPanelButtonTemplate2")
		Frame.CompareFrame:SetWidth(200)
		Frame.CompareFrame:SetHeight(20)
		Frame.CompareFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 545, -560)
		Frame.CompareFrame:SetText(AL["Show in Compare Frame"])
		Frame.CompareFrame:SetScript("OnClick", onCompareFrameClick)
	
		Frame.EncounterJournal = AtlasLoot:EncounterJournal_CreateButton(frameName.."_EncounterJournal", Frame)
		Frame.EncounterJournal:SetPoint("LEFT", Frame.CompareFrame, "RIGHT", 0, 0)
		Frame:Hide()
	
		Frame.ModuleSelect = CreateFrame("Frame", frameName.."_ModuleSelect", Frame, "UIDropDownMenuTemplate")
		Frame.ModuleSelect:SetPoint("TOPLEFT", Frame, "TOPLEFT", 60, -50)
		Frame.ModuleSelect.info = {}
	
		Frame.ModuleSelect.Text = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		Frame.ModuleSelect.Text:SetPoint("BOTTOMLEFT", Frame.ModuleSelect, "TOPLEFT", 21, 0)
		Frame.ModuleSelect.Text:SetText(AL["Select Module"])
	
		Frame.InstanceSelect = CreateFrame("Frame", frameName.."_InstanceSelect", Frame, "UIDropDownMenuTemplate")
		Frame.InstanceSelect:SetPoint("LEFT", Frame.ModuleSelect, "RIGHT", 0, 0)
		Frame.InstanceSelect.info = {}
	
		Frame.InstanceSelect.Text = Frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
		Frame.InstanceSelect.Text:SetPoint("BOTTOMLEFT", Frame.InstanceSelect, "TOPLEFT", 21, 0)
		Frame.InstanceSelect.Text:SetText(AL["Select Instance"])
	
		Frame:Hide()
	end

end

function DefaultFrame:DropDownRefresh()
	if type(db.module) == "table" then
		if UnitLevel("player") == 85 then
			db.module = db.module[2]
		else
			db.module = db.module[1]
		end
	end
	UIDropDownMenu_Initialize(_G[frameName.."_ModuleSelect"], DefaultFrame.ModuleSelect_Initialize)
	UIDropDownMenu_SetSelectedValue(_G[frameName.."_ModuleSelect"], db.module)
	UIDropDownMenu_SetWidth(_G[frameName.."_ModuleSelect"], 190)

	UIDropDownMenu_Initialize(_G[frameName.."_InstanceSelect"], DefaultFrame.InstanceSelect_Initialize)
	UIDropDownMenu_SetSelectedValue(_G[frameName.."_InstanceSelect"], db.instance)
	UIDropDownMenu_SetWidth(_G[frameName.."_InstanceSelect"], 190)
end

function DefaultFrame:ModuleSelect_Initialize()
	local info = self.info
	wipe(info)

	for num,module in ipairs(AtlasLoot.Modules) do
		if module[1] ~= "AtlasLootCrafting" and module[1] ~= "AtlasLootWorldEvents" and type(AtlasLoot:CheckModule(module[1])) ~= "string" then
			info.text = module[5]
			info.value = module[1]
			info.func = DefaultFrame.ModuleSelect_OnClick
			info.checked = nil
			UIDropDownMenu_AddButton(info)
		end
	end
end

function DefaultFrame:ModuleSelect_OnClick()
	if not self.value then return end
    db.module = self.value
	db.instance = ""
	curBoss = nil
	DefaultFrame:DropDownRefresh()
	DefaultFrame:SetInstanceTable()
end

function DefaultFrame:InstanceSelect_Initialize(level)
	--if not level then return end
	local info = self.info
	local first = true
	wipe(info)
	if level == 1 or not level then
		if instances[db.module] then
			for k,v in ipairs(instances[db.module]) do
				if not v[2] then
					if first and db.instance == "" then
						db.instance = v[1]
						first = false
					end
					info.text = AtlasLoot_LootTableRegister["Instances"][v[1]]["Info"][1]
					info.value = v[1]
					info.func = DefaultFrame.InstanceSelect_OnClick
					if DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
						info.hasArrow = true
					end
					info.checked = nil
					UIDropDownMenu_AddButton(info, level)
				end
			end

			info.text = ""
			info.value = nil
			info.func = nil
			info.checked = nil
			info.notCheckable = true
			info.isTitle = true
			info.justifyH = "CENTER"
			UIDropDownMenu_AddButton(info, level)

			info.text = "--- "..tostring(RAIDS or "RAIDS").." ---"
			UIDropDownMenu_AddButton(info, level)

			info.notCheckable = false
			info.isTitle = false
			info.disabled = false
			info.justifyH = nil

			for k,v in ipairs(instances[db.module]) do
				if v[2] then
					info.text = AtlasLoot_LootTableRegister["Instances"][v[1]]["Info"][1]
					info.value = v[1]
					info.func = DefaultFrame.InstanceSelect_OnClick
					if DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
						info.hasArrow = true
					end
					info.checked = nil
					UIDropDownMenu_AddButton(info, level)
				end
			end
		end
	elseif level == 2 and DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
		if AtlasLoot_LootTableRegister["Instances"][UIDROPDOWNMENU_MENU_VALUE] then
			for bossNum, bossTab in ipairs(AtlasLoot_LootTableRegister["Instances"][UIDROPDOWNMENU_MENU_VALUE]["Bosses"]) do
				info.text = AtlasLoot:GetTableInfo(bossTab[1])
				info.value = bossTab[1]
				info.func = AtlasLoot.ShowLootPage
				info.checked = nil
				UIDropDownMenu_AddButton(info, level)
			end
		end
	end
end

function DefaultFrame:InstanceSelect_OnClick()
	if not self.value then return end
    db.instance = self.value
	curBoss = nil
	DefaultFrame:DropDownRefresh()
	DefaultFrame:SetInstanceTable()
end

function DefaultFrame:SetInstanceTable()
	--DefaultFrame:AutoSelect()
	curInstance = AtlasLoot:GetTableRegister(db.instance)
	if not curInstance then
		--print("ERROR: DefaultFrame:SetInstanceTable() <-->"..db.instance.." <--> "..db.module)
		curInstance = AtlasLoot:GetTableRegister("EmptyPage")
		db.instance = "EmptyPage"
		db.module = "EmptyPage"
		DefaultFrame:DropDownRefresh()
	end
	local iniName = curInstance["Info"][1]
	if curInstance["Info"] and curInstance["Info"].disableCompare then
		self.Frame.CompareFrame:Hide()
	else
		self.Frame.CompareFrame:Show()
	end
	if curInstance["Info"] and curInstance["Info"].EncounterJournalID then
		self.Frame.EncounterJournal.info = { curInstance["Info"].EncounterJournalID, nil }
		AtlasLoot:EncounterJournal_ButtonsRefresh()
	else
		self.Frame.EncounterJournal.info = nil
		AtlasLoot:EncounterJournal_ButtonsRefresh()
	end
	curInstance = curInstance["Bosses"]
	if not curInstance then return end
	scrollCurLines = #curInstance

	if DEFAULTFRAME_STYLE_NUM_DUMMY == 1 then
		DefaultFrame.Frame.InstanceName:SetText(iniName)

		for i = 1,scrollCurLines do
			if not DefaultFrame.Frame.ScrollFrame.Buttons[i] then
				if i==1 then
					DefaultFrame.Frame.ScrollFrame.Buttons[i] = AtlasLoot:CreateSelectBossLineButton(DefaultFrame.Frame, {"TOPLEFT", frameName.."_ScrollFrame", "TOPLEFT", 16, -3}, frameName.."_ScrollLine"..i)
				else
					DefaultFrame.Frame.ScrollFrame.Buttons[i] = AtlasLoot:CreateSelectBossLineButton(DefaultFrame.Frame, {"TOPLEFT", frameName.."_ScrollLine"..(i-1), "BOTTOMLEFT"}, frameName.."_ScrollLine"..i)
				end
				DefaultFrame.Frame.ScrollFrame.Buttons[i]:SetScript("OnClick", DefaultFrame.Boss_OnClick)
			end
		end

		for i in ipairs(DefaultFrame.Frame.ScrollFrame.Buttons) do
			if DefaultFrame.Frame.ScrollFrame.Buttons[i] then
				DefaultFrame.Frame.ScrollFrame.Buttons[i]:Hide()
				DefaultFrame.Frame.ScrollFrame.Buttons[i].Loot:Hide()
				DefaultFrame.Frame.ScrollFrame.Buttons[i].Selected:Hide()
				DefaultFrame.Frame.ScrollFrame.Buttons[i].boss = nil
			end
		end

		local buttonNum = 1
		local bossname
		for k,v in ipairs(curInstance) do
			if AtlasLoot:FormatDataID(v[1]) and not v.hide then
				bossname = AtlasLoot:GetTableInfo(v[1])
				DefaultFrame.Frame.ScrollFrame.Buttons[buttonNum].Text:SetText(bossname)
				DefaultFrame.Frame.ScrollFrame.Buttons[buttonNum]:Show()
				DefaultFrame.Frame.ScrollFrame.Buttons[buttonNum].Loot:Show()
				DefaultFrame.Frame.ScrollFrame.Buttons[buttonNum].Selected:Hide()
				DefaultFrame.Frame.ScrollFrame.Buttons[buttonNum].boss = v[1]
				-- ʕ •ᴥ•ʔ✿ Add tooltip functionality for attune info ✿ʕ •ᴥ•ʔ
				DefaultFrame.Frame.ScrollFrame.Buttons[buttonNum]:SetScript("OnEnter", function(self)
					DefaultFrame:BossButton_OnEnter(self)
				end)
				DefaultFrame.Frame.ScrollFrame.Buttons[buttonNum]:SetScript("OnLeave", function(self)
					DefaultFrame:BossButton_OnLeave(self)
				end)
				if not curBoss then
					DefaultFrame.Frame.ScrollFrame.Buttons[buttonNum]:Click()
				end
				buttonNum = buttonNum + 1
			end
		end
	elseif DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then

	end

end

function DefaultFrame:Boss_OnClick()
	local self = self
	for k,v in ipairs(DefaultFrame.Frame.ScrollFrame.Buttons) do
		v.Loot:Show()
		v.Selected:Hide()
	end
	self.Loot:Hide()
	self.Selected:Show()

	AtlasLoot:ShowLootPage(self.boss)

	curBoss = self.boss
end

function DefaultFrame:SetBoss(boss)
	if not boss then return end
	for k,v in ipairs(DefaultFrame.Frame.ScrollFrame.Buttons) do
		if v.boss == boss then
			DefaultFrame.Boss_OnClick(v)
			return
		end
	end
end

-- ʕ •ᴥ•ʔ✿ Calculate attune info for tooltip without changing display ✿ʕ •ᴥ•ʔ
function DefaultFrame:CalculateBossAttuneInfo(dataID)
	local lootTable = AtlasLoot:GetLootPageFromDataID(dataID)
	if not lootTable then return 0, 0, 0, 0, 0, 0, 0, 0 end
	
	local attunable, attuned, titanForgeable, titanForged, warForgeable, warForged, lightForgeable, lightForged = 0, 0, 0, 0, 0, 0, 0, 0
	
	-- Calculate attune info for this boss's items without affecting display
	for k,v in ipairs(lootTable) do
		if v and type(v) == "table" then
			local itemId = v[2]
			if itemId ~= nil and itemId ~= 0 and type(itemId) == 'number' then
				if CanAttuneItemHelper and CanAttuneItemHelper(itemId) > 0 then
					attunable = attunable + 1
					titanForgeable = titanForgeable + 1
					warForgeable = warForgeable + 1
					lightForgeable = lightForgeable + 1
					if GetItemAttuneProgress and GetItemAttuneProgress(itemId, nil, nil) >= 100 then
						attuned = attuned + 1
						if GetItemAttuneForge then
							local forgeLevel = GetItemAttuneForge(itemId)
							if forgeLevel == 1 then
								titanForged = titanForged + 1
							elseif forgeLevel == 2 then
								warForged = warForged + 1
							elseif forgeLevel == 3 then
								lightForged = lightForged + 1
							end
						end
					end
				end
			end
		end
	end
	
	return attunable, attuned, titanForgeable, titanForged, warForgeable, warForged, lightForgeable, lightForged
end

-- ʕ •ᴥ•ʔ✿ Tooltip functions for boss buttons ✿ʕ •ᴥ•ʔ
function DefaultFrame:BossButton_OnEnter(button)
	if not button or not button.boss then return end
	
	local dataID = button.boss
	-- ʕ •ᴥ•ʔ✿ Get boss-specific attune info WITHOUT changing display ✿ʕ •ᴥ•ʔ
	local attunable, attuned, titanForgeable, titanForged, warForgeable, warForged, lightForgeable, lightForged = self:CalculateBossAttuneInfo(dataID)
	
	-- Only show tooltip if there's attune information
	if (attunable and attunable > 0) or (titanForged and titanForged > 0) or (warForged and warForged > 0) or (lightForged and lightForged > 0) then
		GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
		GameTooltip:SetText(button.Text:GetText(), 1, 1, 1)
		
		if attunable and attunable > 0 then
			GameTooltip:AddLine("Attuned: " .. (attuned or 0) .. "/" .. attunable, 0.65, 1, 0.5)
		end
		
		if titanForged and titanForged > 0 then
			GameTooltip:AddLine("Titanforged: " .. titanForged, 0.5, 0.5, 1)
		end
		
		if warForged and warForged > 0 then
			GameTooltip:AddLine("Warforged: " .. warForged, 1, 0.65, 0.5)
		end
		
		if lightForged and lightForged > 0 then
			GameTooltip:AddLine("Lightforged: " .. lightForged, 1, 1, 0.65)
		end
		
		GameTooltip:Show()
	end
end

function DefaultFrame:BossButton_OnLeave(button)
	GameTooltip:Hide()
end

-- instance table creator
do
	local function SortTable(t, f)
		local a = {}
		local a2 = {}
		for k,v in pairs(t) do
			if v["Info"] and v["Info"][1] then
				a[#a + 1] = v["Info"][1]
				a2[v["Info"][1]] = k
			end
		end
		
		-- Use default alphabetical sorting
		table.sort(a, f)
		
		local i = 0
		return function()
			i = i + 1
			return a2[ a[i] ], t[ a2[ a[i] ] ]
		end
	end

	--- Creates the instance table for the dropdowns
	-- @usage DefaultFrame:CreateInstanceTab()
	function DefaultFrame:CreateInstanceTab()
		for _,module in ipairs(AtlasLoot.Modules) do
			if module ~= "AtlasLootCrafting" and module ~= "AtlasLootWorldEvents" then
				instances[ module[1] ] = {}
			end
		end
		for ini,iniTab in SortTable(AtlasLoot_LootTableRegister["Instances"]) do
			if iniTab["Info"] and iniTab["Info"][2] and type(iniTab["Info"][2]) == "table" then
				for k,v in ipairs(iniTab["Info"][2]) do
					instances[ v ][#instances[ v ] + 1] = {ini, iniTab["Info"].raid}
				end
			elseif iniTab["Info"] and instances[ iniTab["Info"][2] ] then
				instances[ iniTab["Info"][2] ][#instances[ iniTab["Info"][2] ] + 1] = {ini, iniTab["Info"].raid}
			end
		end
		
		-- Now apply custom sorting to each module's instance list
		local completeOrder = {
			["AtlasLootClassicWoW"] = {
				-- Dungeons first
				"[15] Ragefire Chasm",
				"[19] The Deadmines",
				"[19] Wailing Caverns",
				"[20] Shadowfang Keep",
				"[23] Blackfathom Deeps",
				"[24] The Stockade",
				"[26] Razorfen Kraul",
				"[27] Gnomeregan",
				"[36] Razorfen Downs",
				"[39] Scarlet Monastery: Graveyard",
				"[39] Scarlet Monastery: Cathedral",
				"[39] Scarlet Monastery: Armory",
				"[39] Scarlet Monastery: Library",
				"[39] Uldaman",
				"[44] Zul'Farrak",
				"[47] Maraudon",
				"[49] Sunken Temple",
				"[55] Blackrock Depths",
				"[60] Dire Maul (East)",
				"[60] Dire Maul (North)",
				"[60] Dire Maul (West)",
				"[60] Scholomance",
				"[60] Stratholme - Crusader's Square",
				"[60] Stratholme - The Gauntlet",
				"[60] Lower Blackrock Spire",
				"[60] Upper Blackrock Spire",
				-- Raids
				"[60] Zul'Gurub",
				"[60] Molten Core",
				"[60] Blackwing Lair",
				"[60] Ruins of Ahn'Qiraj",
				"[60] Temple of Ahn'Qiraj",
				"World Bosses Azeroth",
			},
			["AtlasLootBurningCrusade"] = {
				-- Dungeons (alphabetical)
				"[70] Auchenai Crypts",
				"[70] Mana-Tombs",
				"[70] Sethekk Halls",
				"[70] Shadow Labyrinth",
				"[70] Old Hillsbrad Foothills",
				"[70] The Black Morass",
				"[70] The Slave Pens",
				"[70] The Steamvault",
				"[70] The Underbog",
				"[70] Hellfire Ramparts",
				"[70] The Blood Furnace",
				"[70] The Shattered Halls",
				"[70] The Arcatraz",
				"[70] The Botanica",
				"[70] The Mechanar",
				"[70] Magisters' Terrace",
				-- Raids
				"[70] Karazhan",
				"[70] Gruul's Lair",
				"[70] Magtheridon's Lair",
				"[70] Serpentshrine Cavern",
				"[70] The Eye",
				"[70] Hyjal Summit",
				"[70] Black Temple",
				"[70] Zul'Aman",
				"[70] Sunwell Plateau",
				"World Bosses Outland",
			},
			["AtlasLootMythicBC"] = {
				-- Dungeons (alphabetical)
				"Auchenai Crypts+",
				"Mana-Tombs+",
				"Sethekk Halls+",
				"Shadow Labyrinth+",
				"Old Hillsbrad Foothills+",
				"The Black Morass+",
				"The Slave Pens+",
				"The Steamvault+",
				"The Underbog+",
				"Hellfire Ramparts+",
				"The Blood Furnace+",
				"The Shattered Halls+",
				"The Arcatraz+",
				"The Botanica+",
				"The Mechanar+",
				"Magisters' Terrace+",
				-- Raids
				"Karazhan+",
				"Gruul's Lair+",
				"Magtheridon's Lair+",
				"Serpentshrine Cavern+",
				"The Eye+",
				"Hyjal+",
				"Black Temple+",
				"Zul'Aman+",
				"Sunwell Plateau+",
			},
			["AtlasLootWotLK"] = {
				-- Dungeons (alphabetical)
				"Ahn'kahet: The Old Kingdom",
				"Azjol-Nerub",
				"Drak'Tharon Keep",
				"Gundrak",
				"Halls of Lightning",		
				"Halls of Stone",
				"The Culling of Stratholme",
				"The Nexus",
				"The Oculus",
				"The Violet Hold",
				"Trial of the Champion",
				"Utgarde Keep",
				"Utgarde Pinnacle",
				"The Forge of Souls",
				"Pit of Saron",
				"Halls of Reflection",
				-- Raids
				"Naxxramas",
				"The Obsidian Sanctum",
				"The Eye of Eternity",
				"Ulduar",
				"Trial of the Crusader",
				"Onyxia's Lair",
				"Icecrown Citadel",
				"The Ruby Sanctum",
				"Vault of Archavon",
			},
			["AtlasLootMythicWotLK"] = {
				-- Dungeons
				"Ahn'kahet: The Old Kingdom+",
				"Azjol-Nerub+",
				"Drak'Tharon Keep+",
				"Gundrak+",
				"Halls of Lightning+",
				"Halls of Reflection+",
				"Halls of Stone+",
				"Pit of Saron+",
				"The Culling of Stratholme+",
				"The Forge of Souls+",
				"The Nexus+",
				"The Oculus+",
				"The Violet Hold+",
				"Trial of the Champion+",
				"Utgarde Keep+",
				"Utgarde Pinnacle+",
				-- Raids
				"Naxxramas+",
				"The Obsidian Sanctum+",
				"The Eye of Eternity+",
				"Ulduar+",
				"Trial of the Crusader+",
				"Onyxia's Lair+",
				"Icecrown Citadel+",
				"The Ruby Sanctum+",
				"Vault of Archavon+",
			},
		}
		
		-- Apply custom sorting to each module
		for moduleName, moduleInstances in pairs(instances) do
			if completeOrder[moduleName] then
				table.sort(moduleInstances, function(a, b)
					local name1 = AtlasLoot_LootTableRegister["Instances"][a[1]]["Info"][1]
					local name2 = AtlasLoot_LootTableRegister["Instances"][b[1]]["Info"][1]
					
					local order = completeOrder[moduleName]
					local pos1, pos2
					
					for i, instanceName in ipairs(order) do
						if name1 == instanceName then
							pos1 = i
						end
						if name2 == instanceName then
							pos2 = i
						end
					end
					
					if pos1 and pos2 then
						return pos1 < pos2
					elseif pos1 then
						return true
					elseif pos2 then
						return false
					end
					
					-- Fall back to alphabetical sorting
					return name1 < name2
				end)
			end
		end
	end
end

function DefaultFrame:ModuleSelect_OnClick()
	if not self.value then return end
    db.module = self.value
	db.instance = ""
	curBoss = nil
	DefaultFrame:CreateInstanceTab() -- Rebuild the instance table with new sorting
	DefaultFrame:DropDownRefresh()
	DefaultFrame:SetInstanceTable()
end

function DefaultFrame:InstanceSelect_Initialize(level)
	--if not level then return end
	local info = self.info
	local first = true
	wipe(info)
	if level == 1 or not level then
		if instances[db.module] then
			for k,v in ipairs(instances[db.module]) do
				if not v[2] then
					if first and db.instance == "" then
						db.instance = v[1]
						first = false
					end
					info.text = AtlasLoot_LootTableRegister["Instances"][v[1]]["Info"][1]
					info.value = v[1]
					info.func = DefaultFrame.InstanceSelect_OnClick
					if DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
						info.hasArrow = true
					end
					info.checked = nil
					UIDropDownMenu_AddButton(info, level)
				end
			end

			info.text = ""
			info.value = nil
			info.func = nil
			info.checked = nil
			info.notCheckable = true
			info.isTitle = true
			info.justifyH = "CENTER"
			UIDropDownMenu_AddButton(info, level)

			info.text = "--- "..tostring(RAIDS or "RAIDS").." ---"
			UIDropDownMenu_AddButton(info, level)

			info.notCheckable = false
			info.isTitle = false
			info.disabled = false
			info.justifyH = nil

			for k,v in ipairs(instances[db.module]) do
				if v[2] then
					info.text = AtlasLoot_LootTableRegister["Instances"][v[1]]["Info"][1]
					info.value = v[1]
					info.func = DefaultFrame.InstanceSelect_OnClick
					if DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
						info.hasArrow = true
					end
					info.checked = nil
					UIDropDownMenu_AddButton(info, level)
				end
			end
		end
	elseif level == 2 and DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
		if AtlasLoot_LootTableRegister["Instances"][UIDROPDOWNMENU_MENU_VALUE] then
			for bossNum, bossTab in ipairs(AtlasLoot_LootTableRegister["Instances"][UIDROPDOWNMENU_MENU_VALUE]["Bosses"]) do
				info.text = AtlasLoot:GetTableInfo(bossTab[1])
				info.value = bossTab[1]
				info.func = AtlasLoot.ShowLootPage
				info.checked = nil
				UIDropDownMenu_AddButton(info, level)
			end
		end
	end
end

function DefaultFrame:ModuleSelect_OnClick()
	if not self.value then return end
    db.module = self.value
	db.instance = ""
	curBoss = nil
	DefaultFrame:CreateInstanceTab() -- Rebuild the instance table with new sorting
	DefaultFrame:DropDownRefresh()
	DefaultFrame:SetInstanceTable()
end

function DefaultFrame:InstanceSelect_Initialize(level)
	--if not level then return end
	local info = self.info
	local first = true
	wipe(info)
	if level == 1 or not level then
		if instances[db.module] then
			for k,v in ipairs(instances[db.module]) do
				if not v[2] then
					if first and db.instance == "" then
						db.instance = v[1]
						first = false
					end
					info.text = AtlasLoot_LootTableRegister["Instances"][v[1]]["Info"][1]
					info.value = v[1]
					info.func = DefaultFrame.InstanceSelect_OnClick
					if DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
						info.hasArrow = true
					end
					info.checked = nil
					UIDropDownMenu_AddButton(info, level)
				end
			end

			info.text = ""
			info.value = nil
			info.func = nil
			info.checked = nil
			info.notCheckable = true
			info.isTitle = true
			info.justifyH = "CENTER"
			UIDropDownMenu_AddButton(info, level)

			info.text = "--- "..tostring(RAIDS or "RAIDS").." ---"
			UIDropDownMenu_AddButton(info, level)

			info.notCheckable = false
			info.isTitle = false
			info.disabled = false
			info.justifyH = nil

			for k,v in ipairs(instances[db.module]) do
				if v[2] then
					info.text = AtlasLoot_LootTableRegister["Instances"][v[1]]["Info"][1]
					info.value = v[1]
					info.func = DefaultFrame.InstanceSelect_OnClick
					if DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
						info.hasArrow = true
					end
					info.checked = nil
					UIDropDownMenu_AddButton(info, level)
				end
			end
		end
	elseif level == 2 and DEFAULTFRAME_STYLE_NUM_DUMMY == 2 then
		if AtlasLoot_LootTableRegister["Instances"][UIDROPDOWNMENU_MENU_VALUE] then
			for bossNum, bossTab in ipairs(AtlasLoot_LootTableRegister["Instances"][UIDROPDOWNMENU_MENU_VALUE]["Bosses"]) do
				info.text = AtlasLoot:GetTableInfo(bossTab[1])
				info.value = bossTab[1]
				info.func = AtlasLoot.ShowLootPage
				info.checked = nil
				UIDropDownMenu_AddButton(info, level)
			end
		end
	end
end

function DefaultFrame:MiniMap_OnClick_Replace()
	if AtlasLootDefaultFrame:IsVisible() then
		AtlasLootDefaultFrame:Hide()
	else
		AtlasLootDefaultFrame:Show()
	end
end

-- autoselect :)
-- /run print("mapname = \""..GetMapInfo().."\"")
do
	local mapRegister

	local function createMapRegister()
		mapRegister = {}
		for instance,iniTab in pairs(AtlasLoot_LootTableRegister["Instances"]) do
			if iniTab["Info"] and iniTab["Info"].mapname then
				if iniTab["Info"][2] then
					mapRegister[iniTab["Info"].mapname] = {
						instance,
						iniTab["Info"][2],
					}
				end
			end
		end
	end

	function DefaultFrame:AutoSelect()
		if not mapRegister then createMapRegister() end
		local mapname = GetMapInfo()
		if not mapname or not mapRegister[mapname] then return end

		if type(mapRegister[mapname][2]) == "table" then
			if UnitLevel("player") == 85 then
				db.module = mapRegister[mapname][2][2]
			else
				db.module = mapRegister[mapname][2][1]
			end
		else
			db.module = mapRegister[mapname][2]
		end
		db.instance = mapRegister[mapname][1]

		DefaultFrame:DropDownRefresh()
		--[[ sub Zone support
		local level = GetCurrentMapDungeonLevel()
		if level == 0 then level = 1 end

		for i = level, 1, -1 do
			if mapRegister[mapname][i] then
				db.module = mapRegister[mapname][i][2]
				db.instance = mapRegister[mapname][i][1]
				break
			end
		end
		]]--
	end
end

-- Scale
function AtlasLoot:DefaultFrame_RefreshScale()
	AtlasLootDefaultFrame:SetScale( AtlasLoot.db.profile.LootBrowserScale )
	AtlasLootTooltipTEMP:SetScale( AtlasLoot.db.profile.LootBrowserScale )
end

-- Alpha
function AtlasLoot:DefaultFrame_RefreshAlpha(frameLeave)
	if not AtlasLoot.db.profile.LootBrowserAlphaOnLeave then
		AtlasLootDefaultFrame:SetAlpha( AtlasLoot.db.profile.LootBrowserAlpha )
	else
		if frameLeave then
			AtlasLootDefaultFrame:SetAlpha( AtlasLoot.db.profile.LootBrowserAlpha )
		else
			AtlasLootDefaultFrame:SetAlpha( 1.0 )
		end
	end
end


-- Set cur instance
function AtlasLoot:DefaultFrame_SetInstance(module, instance, iniBoss)
	if module and instance then
		db.module = module
		db.instance = instance
		DefaultFrame.InstanceSelect_OnClick({value = instance})
	end

	if iniBoss then
		DefaultFrame:SetBoss(iniBoss)
	end
end

-- Set attune info
function AtlasLoot:DefaultFrame_SetAttuneInfo(attunableOverall, attunedOverall, titanForgeableOverall, titanForgedOverall, warForgeableOverall, warForgedOverall, lightForgeableOverall, lightForgedOverall)
  local attuneText = ""
 	if attunableOverall ~= nil and attunedOverall ~= nil then
 		attuneText = "Attuned: " .. attunedOverall .. "/" .. attunableOverall
 	end

  local titanForgeText = "N/A"
  if titanForgedOverall ~= nil then
 		titanForgeText = "Titanforged: " .. titanForgedOverall
 	end

  local warForgeText = "N/A"
  if warForgedOverall ~= nil then
 		warForgeText = "Warforged: " .. warForgedOverall
 	end

  local lightForgeText = "N/A"
  if lightForgedOverall ~= nil then
 		lightForgeText = "Lightforged: " .. lightForgedOverall
 	end

  DefaultFrame.Frame.OverallAttuneFrame:SetText(attuneText)
  DefaultFrame.Frame.OverallAttuneFrame:SetVertexColor(0.65, 1, 0.5)

  DefaultFrame.Frame.OverallTitanForgedFrame:SetText(titanForgeText)
  DefaultFrame.Frame.OverallTitanForgedFrame:SetVertexColor(0.5, 0.5, 1)

  DefaultFrame.Frame.OverallWarForgedFrame:SetText(warForgeText)
  DefaultFrame.Frame.OverallWarForgedFrame:SetVertexColor(1, 0.65, 0.5)

  DefaultFrame.Frame.OverallLightForgedFrame:SetText(lightForgeText)
  DefaultFrame.Frame.OverallLightForgedFrame:SetVertexColor(1, 1, 0.65)

end
