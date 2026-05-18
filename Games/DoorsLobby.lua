	--- Doors Lobby

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


	    local RemotesFolder
	if Services.ReplicatedStorage:FindFirstChild("RemotesFolder") then
		RemotesFolder = Services.ReplicatedStorage:FindFirstChild("RemotesFolder")
	elseif Services.ReplicatedStorage:FindFirstChild("EntityInfo") then
		RemotesFolder = Services.ReplicatedStorage:FindFirstChild("EntityInfo")
	elseif Services.ReplicatedStorage:FindFirstChild("Bricks") then
		RemotesFolder = Services.ReplicatedStorage:FindFirstChild("Bricks")
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
		Title = "BlackKing | Doors Lobby",
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
		["UI Settings"] = Window:AddTab("UI Settings"),
	}

	getgenv().Bk = true

		local infTab = Tabs.Info:AddLeftTabbox()
		local inffirsttab = infTab:AddTab('Update Log')

			inffirsttab:AddLabel("\n<DOORS>")
    inffirsttab:AddLabel("<font color='#1eff00'>+ Lobby Support</font>")

	inffirsttab:AddLabel("\n<SCRIPT>")
    inffirsttab:AddLabel("<font color='#1eff00'>+ Auto Show Ui when loaded</font>")

		local mntab = Tabs.Main:AddLeftTabbox()
		local mainft = mntab:AddTab('localplayer')
				local mntab2 = Tabs.Main:AddLeftTabbox()
		local mainrg = mntab2:AddTab('Game')

		Functions.CheckElevators = function()
    local TargetFound = false
	if not Toggles.AutoJoinElevator.Value then
		return
	end
	local TargetCharacter
	if typeof(Options.AutoJoinElevatorTarget.Value) == "Instance" then
		TargetCharacter = Options.AutoJoinElevatorTarget.Value.Character
	elseif typeof(Options.AutoJoinElevatorTarget.Value) == "string" then
		TargetCharacter = Services.Players:FindFirstChild(Options.AutoJoinElevatorTarget.Value).Character
	end

	for Index, Elevator in pairs(Services.Workspace.Lobby.LobbyElevators:GetChildren()) do
		if TargetCharacter and Elevator and TargetCharacter:GetAttribute("InGameElevator") and Elevator:GetAttribute("ID") and Elevator:GetAttribute("ID") == TargetCharacter:GetAttribute("InGameElevator") then
			TargetFound = true
			RemotesFolder.ElevatorJoin:FireServer(Elevator)
        end
    end
	if TargetFound == false then
		RemotesFolder.ElevatorExit:FireServer()
	end
end

Globals.RedeemingCodes = false
Globals.CodesList = {
    "67",
	"54",
	"41",
	"CHEDDAR BALLS",
	"XQC",
	"PENGUINZ0",
	"KREEKCRAFT",
	"ISHOWSPEED",
	"DANTDM",
	"KUBZ SCOUTS",
	"FIND THE TROLLFACES",
	"THINKNOODLES",
	"W",
	"RAGDOLL UNIVERSE",
	"RAGDOLL MAYHEM",
	"BIJUU MIKE",
	"8BITRYAN",
	"SCREECHSUCKS",
	"LORE",
	"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
	"FIND THE TROLLFACES",
	"3rd",
	"LAZYDEVS",
	"RAGDOLL COMBAT",
	"VOCAB HAVOC",
	"PATHSWAP",
	"JUMP OVER THE BRICK"
}
Globals.UnlockedBadges = {}

mainrg:AddToggle("AutoJoinElevator", {
    Text = "Auto Join Elevator",
    Default = false,
    Tooltip = "Automatically joins the selected player's elevator."
})
mainrg:AddDropdown("AutoJoinElevatorTarget", {
    Text = "Target",
    SpecialType = "Player",
    ExcludeLocalPlayer = true,
    Searchable = true
})

mainrg:AddDivider()

mainrg:AddToggle("CycleAchievements", {
    Text = "Cycle Achievements",
    Default = false,
    Tooltip = "Rapidly equips a random badge."
})

mainrg:AddSlider("CycleAchievementsDelay", {
    Text = "Cycle Delay",
    Min = 0,
    Max = 1,
    Default = 0.1,
    Rounding = 2,
    Compact = true
})

mainrg:AddDivider()

mainrg:AddButton("Redeem All Codes", function()
    if Globals.RedeemingCodes then
        return
    end

    Globals.RedeemingCodes = true
    for Index, Code in pairs(Globals.CodesList) do
        RemotesFolder.ShopCode:FireServer(Code)
        task.wait(5.1)
    end
end)

for Index, Frame in pairs(Player.PlayerGui.MainUI.LobbyFrame.Achievements.List:GetChildren()) do
	if Frame:IsA("ImageButton") and Frame.ImageTransparency == 0 then
		table.insert(Globals.UnlockedBadges, Frame.Name)
	end
end

Connections.BadgeAddedConnection = Player.PlayerGui.MainUI.LobbyFrame.Achievements.List.ChildAdded:Connect(function(Frame)
	Services.RunService.Heartbeat:Wait()
	if Frame:IsA("ImageButton") and Frame.ImageTransparency == 0 then
		table.insert(Globals.UnlockedBadges, Frame.Name)
	end
end)

Globals.LastBadgeChange = tick()
Globals.LastElevatorCheck = tick()
Connections.MainConnection = Services.RunService.Heartbeat:Connect(function()
	if tick() - Globals.LastElevatorCheck > 0.25 then
    	Functions.CheckElevators()
		Globals.LastElevatorCheck = tick()
	end

    if Toggles.CycleAchievements.Value and tick() - Globals.LastBadgeChange > Options.CycleAchievementsDelay.Value then
        local Badge = Globals.UnlockedBadges[math.random(1, #Globals.UnlockedBadges)]
        if Badge == PreviousBadge then
            while task.wait() do
				local NewBadge = Globals.UnlockedBadges[math.random(1, #Globals.UnlockedBadges)]
				if NewBadge ~= PreviousBadge then
					Badge = NewBadge
					break
				end
			end
		end
		for Index, Frame in pairs(Player.PlayerGui.MainUI.LobbyFrame.Achievements.List:GetChildren()) do
			if Frame:IsA("ImageButton") and Frame.ImageTransparency == 0 then
				Player.PlayerGui.MainUI.LobbyFrame.Achievements.List:FindFirstChild(Frame.Name).Icons.Star.Visible = false
			end
		end
		RemotesFolder:WaitForChild("FlexAchievement"):FireServer(Badge)
		PreviousBadge = Badge
		Player.PlayerGui.MainUI.LobbyFrame.Achievements.List:FindFirstChild(Badge).Icons.Star.Visible = true

        Globals.LastBadgeChange = tick()
	end
end)

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

		if WS_Enabled == true and Player.Character then
			Player.Character:WaitForChild("Humanoid").WalkSpeed = 16
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
