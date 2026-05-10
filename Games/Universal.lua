	--- universal BLACKKING

	if not getgenv().Bk then

	repeat task.wait() until game:IsLoaded()

	local repo = "https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/"

	local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
	local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
	local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

	local FlyModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/GeorgeRoblox/LINDOR/refs/heads/main/addonsfolder/Fly.lua"))()

		local Environments = loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Components/Environment.luau"))()

		local Functions = {}
		local Connections = {}
		local Globals = {}

		local Services = setmetatable({}, {
		__index = function(self, Key)
			return game:GetService(Key)
		end
	})

	local Player = Services.Players.LocalPlayer

	local Character = Player.Character
	while Character == nil do
		task.wait()
		Character = Player.Character
	end

local VERSION_URL = "https://raw.githubusercontent.com/GeorgeRoblox/version/refs/heads/main/.luau"
local EXPECTED_VERSION = "v.2.0.0"
local FILE_NAME = "DONT_DELEATE_BLACKKING"

if not isfile(FILE_NAME) then
    writefile(FILE_NAME, "VersionCheck Initialized")
end

local success, onlineVersion = pcall(function()
    return game:HttpGet(VERSION_URL)
end)

if not success then
    warn("Version check failed: Could not fetch version")
    return
end

onlineVersion = tostring(onlineVersion):gsub("%s+", "")

if onlineVersion ~= EXPECTED_VERSION then
    local lp = game:GetService("Players").LocalPlayer
    lp:Kick("Your Playing With The Wrong version of blackking... Current Version: ".. EXPECTED_VERSION)
    return
end

	local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/ESPLibrary/refs/heads/main/Library.lua"))()
	ESPLibrary:SetRainbow(false)
	ESPLibrary:SetShowDistance(false)
	ESPLibrary:SetFillTransparency(0.75)
	ESPLibrary:SetOutlineTransparency(0)
	ESPLibrary:SetFadeTime(0.25)
	ESPLibrary:SetTextSize(18)
	ESPLibrary:SetFont(Enum.Font.RobotoCondensed)
	ESPLibrary:SetTracers(false)
	ESPLibrary:SetTracerSize(0.75)
	ESPLibrary:SetTracerOrigin("Bottom")
	ESPLibrary:SetArrows(false)
	ESPLibrary:SetArrowRadius(250)
	ESPLibrary:SetDistanceSizeRatio(0.8)
	
	local Options = Library.Options
	local Toggles = Library.Toggles

	local Window = Library:CreateWindow({
		Title = "BlackKing | Universal",
		Center = true,
		AutoShow = true,
		Resizable = true,
		ShowCustomCursor = true,
		UnlockMouseWhileOpen = true,
		NotifySide = "Right",
		TabPadding = 8,
		MenuFadeTime = 0.2
	})

	local Tabs = {
		Info = Window:AddTab("Info"),
		Main = Window:AddTab("General"),
		Visual = Window:AddTab("Visuals"),
		["UI Settings"] = Window:AddTab("UI Settings"),
	}

	getgenv().Bk = true

		local infTab = Tabs.Info:AddLeftTabbox()
		local inffirsttab = infTab:AddTab('Update Log')
inffirsttab:AddLabel("<DOORS>")

    inffirsttab:AddLabel("<font color='#1eff00'>+ Fixed big issues</font>")

	inffirsttab:AddLabel("\n<UNIVERSAL>")
    inffirsttab:AddLabel("<font color='#1eff00'>+ Universal script</font>")

    inffirsttab:AddLabel("<font color='#1eff00'>+ Linoria Lib (Main)</font>")

inffirsttab:AddLabel("<font color='#ff0000'>- Removed Obsidian Lib</font>")

		local mntab = Tabs.Main:AddLeftTabbox()
		local mainft = mntab:AddTab('localplayer')

	WSConnection = {}
	CurrentWS = 16
	WS_Enabled = false

	local function ApplyWalkSpeed()
		if not Character or not Humanoid then return end
		Humanoid.WalkSpeed = WS_Enabled and CurrentWS or 16
	end

	local function HookCharacter(char)
		Character = char
		Humanoid = char:WaitForChild("Humanoid")
		ApplyWalkSpeed()
	end

	if Player.Character then
		HookCharacter(Player.Character)
	end

	Player.CharacterAdded:Connect(HookCharacter)

	mainft:AddSlider("WSSLIDER", {
		Text = "Walk Speed",
		Default = 16,
		Min = 16,
		Max = 85,
		Rounding = 0,
		Compact = true,
		Callback = function(v)
			CurrentWS = v
			ApplyWalkSpeed()
		end
	})

	mainft:AddToggle("EnableWS", {
		Text = "Enable Walk Speed",
		Default = false,
		Callback = function(state)
			WS_Enabled = state
			ApplyWalkSpeed()
		end
	})


		local Visualtab = Tabs.Visual:AddLeftTabbox()
		local vslt = Visualtab:AddTab('Aimbot')
			local Visualtab2 = Tabs.Visual:AddRightTabbox()
		local vsrt = Visualtab2:AddTab('Esp')

	vsrt:AddToggle("PlayerEsp", {
		Text = "Players",
		Default = false,
	})

	vsrt:AddDivider()

	vsrt:AddSlider('SetFadeTime', {
		Text = 'FadeTime ',
		Default = 0.5,
		Min = 0,
		Max = 2,
		Rounding = 1,
		Compact = true,
		Callback = function(Value)
			ESPLibrary:SetFadeTime(Value) 
		end
	})

	vsrt:AddSlider('TracerSizer', {
		Text = 'Tracer Size ',
		Default = 1,
		Min = 1,
		Max = 3,
		Rounding = 1,
		Compact = true,
		Callback = function(Value)
			ESPLibrary:SetTracerSize(Value)
		end
	})

    	vsrt:AddSlider('FillTransparency', {
		Text = 'Fill Transparency',
		Default = 0.75,
		Min = 0,
		Max = 1,
		Rounding = 2,
		Compact = true,
		Callback = function(Value)
			ESPLibrary:SetFillTransparency(Value)
		end
	})

    	vsrt:AddSlider('TextSizer', {
		Text = 'Text Size ',
		Default = 18,
		Min = 12,
		Max = 24,
		Rounding = 0,
		Compact = true,
		Callback = function(Value)
			ESPLibrary:SetTextSize(Value)
		end
	})

	vsrt:AddDivider()

	vsrt:AddToggle("DistancesEsp", {
		Text = "Distances",
		Default = false,
		Tooltip = nil,
		Callback = function(Value)
			ESPLibrary:SetShowDistance(Value)
		end,
	})

	vsrt:AddToggle("TracersEsp", {
		Text = "Tracers",
		Default = false,
		Tooltip = nil,
		Callback = function(Value)
			ESPLibrary:SetTracers(Value)
		end,
	})

	vsrt:AddToggle("ArrowsEsp", {
		Text = "Arrows",
		Default = false,
		Tooltip = nil,
		Callback = function(Value)
			ESPLibrary:SetArrows(Value)
		end,
	})

	vsrt:AddToggle("RainbowEsp", {
		Text = "Rainbow Esp",
		Default = false,
		Tooltip = nil,
		Callback = function(Value)
			ESPLibrary:SetRainbow(Value)
		end,
	})

	vsrt:AddDivider()

	vsrt:AddDropdown("ESPTextFont", {
    Text = "Text Font",
    Values = {
        "Legacy",
        "Arial",
        "ArialBold",
        "SourceSans",
        "SourceSansBold",
        "SourceSansLight",
        "SourceSansItalic",
        "Bodoni",
        "Garamond",
        "Cartoon",
        "Code",
        "Highway",
        "SciFi",
        "Arcade",
        "Fantasy",
        "Antique",
        "SourceSansSemibold",
        "Gotham",
        "GothamMedium",
        "GothamBold",
        "GothamBlack",
        "AmaticSC",
        "Bangers",
        "Creepster",
        "DenkOne",
        "Fondamento",
        "FredokaOne",
        "GrenzeGotisch",
        "IndieFlower",
        "JosefinSans",
        "Jura",
        "Kalam",
        "LuckiestGuy",
        "Merriweather",
        "Michroma",
        "Nunito",
        "Oswald",
        "PatrickHand",
        "PermanentMarker",
        "Roboto",
        "RobotoCondensed",
        "RobotoMono",
        "Sarpanch",
        "SpecialElite",
        "TitilliumWeb",
        "Ubuntu",
        "BuilderSans",
        "BuilderSansMedium",
        "BuilderSansBold",
        "BuilderSansExtraBold",
        "Arimo",
        "ArimoBold",
        },
    Default = 41
})

	local PlayerESPObjects = {}

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	local function ClearPlayerESP()
		for plr, espObj in pairs(PlayerESPObjects) do
			if espObj then
				ESPLibrary:RemoveESP(espObj)
			end
		end
		table.clear(PlayerESPObjects)
	end

	local function GetPlayerColor(plr)
		if plr.Team ~= nil then
			return plr.TeamColor.Color
		end
		return Color3.fromRGB(255, 255, 255)
	end

	local function CreatePlayerESP(plr)
		if not Toggles.PlayerEsp.Value then return end
		if plr == LocalPlayer then return end
		if PlayerESPObjects[plr] then return end

		local char = plr.Character
		if not char then return end

		local color = GetPlayerColor(plr)

		ESPLibrary:AddESP({
			Object = char,
			Text   = plr.Name,
			Color  = color
		})

		PlayerESPObjects[plr] = char
	end

	local function HookCharacter(plr)
		plr.CharacterAdded:Connect(function(char)
			task.wait(0.1)
			CreatePlayerESP(plr)
		end)
	end

	local function HookTeamChange(plr)
		if plr:GetAttribute("TeamColor") then return end

		plr:GetPropertyChangedSignal("Team"):Connect(function()
			if PlayerESPObjects[plr] then
				local newColor = GetPlayerColor(plr)
				ESPLibrary:UpdateObjectColor(PlayerESPObjects[plr], newColor)
			end
		end)
	end

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			HookCharacter(plr)
			HookTeamChange(plr)
			if plr.Character then
				CreatePlayerESP(plr)
			end
		end
	end

	Players.PlayerAdded:Connect(function(plr)
		HookCharacter(plr)
		HookTeamChange(plr)
		task.wait(0.1)
		CreatePlayerESP(plr)
	end)

	Players.PlayerRemoving:Connect(function(plr)
		if PlayerESPObjects[plr] then
			ESPLibrary:RemoveESP(PlayerESPObjects[plr])
			PlayerESPObjects[plr] = nil
		end
	end)

	Toggles.PlayerEsp:OnChanged(function(v)
		if not v then
			ClearPlayerESP()
		else
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= LocalPlayer then
					CreatePlayerESP(plr)
				end
			end
		end
	end)

	vslt:AddSlider("FOVSIRCLE", {
		Text = "Circle",
		Default = 30,
		Min = 30,
		Max = 100,
		Rounding = 0,
		Compact = true,
	})

	vslt:AddToggle("EnableCircle", {
		Text = "Enable Circle",
		Default = false,
	})

	vslt:AddToggle("EnableCAB", {
		Text = "Enable Aimbot",
		Default = false,
	})

	vslt:AddToggle("EnableTeamCheck", {
		Text = "Enable Team Check",
		Default = false,
	})

	vslt:AddToggle("RainbowCircle", {
		Text = "Rainbow Circle",
		Default = false,
	})

	Aimbot = {
		Enabled = false,
		CircleEnabled = false,
		TeamCheck = false,
		Rainbow = false,
		FOV = 30,
	}

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Camera = workspace.CurrentCamera
	local UIS = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")

	local Circle = Drawing.new("Circle")
	Circle.Color = Color3.fromRGB(255, 255, 255)
	Circle.Thickness = 1
	Circle.Filled = false
	Circle.NumSides = 64
	Circle.Visible = false
	Circle.Radius = Aimbot.FOV

	local function UpdateFOV(v)
		Aimbot.FOV = v
		Circle.Radius = v
	end

	local function UpdateCircle(v)
		Aimbot.CircleEnabled = v
		Circle.Visible = v
	end

	local function UpdateAimbot(v)
		Aimbot.Enabled = v
	end

	local function UpdateTeamCheck(v)
		Aimbot.TeamCheck = v
	end

	local function UpdateRainbow(v)
		Aimbot.Rainbow = v
	end

	Options.FOVSIRCLE:OnChanged(UpdateFOV)
	Toggles.EnableCircle:OnChanged(UpdateCircle)
	Toggles.EnableCAB:OnChanged(UpdateAimbot)
	Toggles.EnableTeamCheck:OnChanged(UpdateTeamCheck)
	Toggles.RainbowCircle:OnChanged(UpdateRainbow)

	UpdateFOV(Options.FOVSIRCLE.Value)
	UpdateCircle(Toggles.EnableCircle.Value)
	UpdateAimbot(Toggles.EnableCAB.Value)
	UpdateTeamCheck(Toggles.EnableTeamCheck.Value)
	UpdateRainbow(Toggles.RainbowCircle.Value)

	local function IsValidTarget(plr)
		if plr == LocalPlayer then return false end
		if not plr.Character then return false end

		local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
		local hum = plr.Character:FindFirstChild("Humanoid")
		if not hrp or not hum or hum.Health <= 0 then return false end

		if Aimbot.TeamCheck and plr.Team == LocalPlayer.Team then
			return false
		end

		return true
	end

	local function GetClosest()
		local closestPart = nil
		local closestDist = Aimbot.FOV

		for _, plr in ipairs(Players:GetPlayers()) do
			if IsValidTarget(plr) then
				local hrp = plr.Character.HumanoidRootPart
				local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

				if onScreen then
					local mousePos = UIS:GetMouseLocation()
					local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude

					if dist <= closestDist then
						closestDist = dist
						closestPart = hrp
					end
				end
			end
		end

		return closestPart
	end

	local function AimAt(part)
		if not part then return end
		Camera.CFrame = CFrame.new(Camera.CFrame.Position, part.Position)
	end

	local hue = 0
	local rainbowDelay = 0.02 
	local lastTick = tick()

	RunService.RenderStepped:Connect(function()
		if Aimbot.CircleEnabled then
			local pos = UIS:GetMouseLocation()
			Circle.Position = Vector2.new(pos.X, pos.Y)

			if Aimbot.Rainbow then
				if tick() - lastTick >= rainbowDelay then
					hue = hue + 0.01
					if hue >= 1 then hue = 0 end
					Circle.Color = Color3.fromHSV(hue, 1, 1)
					lastTick = tick()
				end
			else
				Circle.Color = Color3.fromRGB(255, 255, 255)
			end
		end
	end)

	task.spawn(function()
		while task.wait() do
			if Aimbot.Enabled and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
				local target = GetClosest()
				if target then
					AimAt(target)
				end
			end
		end
	end)

	local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

		Library.KeybindFrame.Visible = true;

		_G.ShowKeybind = false
		_G.ShowCustomCursor = true

		MenuGroup:AddToggle('ShowKeybind', { 
			Text = 'Show Keybind',
			Default = true,
			Callback = function(ShowKbs)
				_G.ShowKeybind = ShowKbs

				if _G.ShowKeybind == false then
					Library.KeybindFrame.Visible = false
				elseif _G.ShowKeybind == true then
					Library.KeybindFrame.Visible = true
				end
			end
		})

		MenuGroup:AddToggle('ShowCustomCursor', { 
			Text = 'Show CustomCursor',
			Default = _G.ShowCustomCursor,
			Callback = function(ShowCustomCursors)
				_G.ShowCustomCursor = ShowCustomCursors

				if _G.ShowCustomCursor == false then
					Library.ShowCustomCursor = false
				elseif _G.ShowCustomCursor == true then
					Library.ShowCustomCursor = true
				end
			end
		})

		MenuGroup:AddDivider()

		MenuGroup:AddButton('Copy Discord Server Link', function()
			setclipboard("https://discord.gg/HjqzMPJveZ")
			Library:Notify("<b>[BlackKing]</b>\nCopy Discord Server Link: Done!")
			sound()
		end)

		MenuGroup:AddDivider()


	MenuGroup:AddButton("Unload", function()

		if Circle then
			Circle.Visible = false
			Circle:Remove()
		end

		Aimbot.Enabled = false
		Aimbot.CircleEnabled = false
		Aimbot.TeamCheck = false
		Aimbot.Rainbow = false

		if WS_Enabled == true and LocalPlayer.Character then
			LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 16
		end

		ESPLibrary:Unload()
		Library:Unload()
		getgenv().Bk = nil
	end)

		MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = true, Text = 'Menu keybind' })

		Library.ToggleKeybind = Options.MenuKeybind

		local AboutGroup = Tabs['UI Settings']:AddRightGroupbox('Contributors')

		AboutGroup:AddLabel("<font color='#15ff00'>bocaj11104</font> - Esp Library")
		ThemeManager:SetLibrary(Library)
		SaveManager:SetLibrary(Library)
		SaveManager:IgnoreThemeSettings()
		SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
		ThemeManager:SetFolder('BlackKing')
		SaveManager:SetFolder('BlackKing/Hub/Doors')
		SaveManager:BuildConfigSection(Tabs['UI Settings'])
		ThemeManager:ApplyToTab(Tabs['UI Settings'])
	end

-- v.2.0.1
