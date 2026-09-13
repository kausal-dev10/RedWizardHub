// Create a complete Lua script for Mount RNG UI that can be used with loadstring
const luaScript = `-- Mount RNG UI Script
-- Made for Roblox Executors

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Local Player
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- UI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MountRNGUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.5, -400, 0.5, -300)
MainFrame.Size = UDim2.new(0, 800, 0, 600)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TitleBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.Size = UDim2.new(0.8, 0, 1, 0)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "Mount RNG - Main Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.Size = UDim2.new(0, 40, 1, 0)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Parent = MainFrame
TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.Size = UDim2.new(0, 150, 1, -40)

-- Tab Buttons
local tabs = {
    {name = "Main", text = "Main Page"},
    {name = "Info", text = "Info Page"},
    {name = "Quests", text = "Quests Page"},
    {name = "Shop", text = "Shop Page"},
    {name = "Player", text = "Player Page"},
    {name = "Settings", text = "Settings Page"}
}

local tabButtons = {}
for i, tab in ipairs(tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.Name = tab.name .. "Tab"
    TabButton.Parent = TabContainer
    TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabButton.Position = UDim2.new(0, 0, 0, (i-1)*40)
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.Font = Enum.Font.SourceSans
    TabButton.Text = tab.text
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.TextSize = 16
    TabButton.TextXAlignment = Enum.TextXAlignment.Left
    TabButton.TextYAlignment = Enum.TextYAlignment.Center
    TabButton.TextWrapped = true
    
    local TabIcon = Instance.new("TextLabel")
    TabIcon.Name = "TabIcon"
    TabIcon.Parent = TabButton
    TabIcon.BackgroundTransparency = 1
    TabIcon.Position = UDim2.new(0, 10, 0, 0)
    TabIcon.Size = UDim2.new(0, 20, 1, 0)
    TabIcon.Font = Enum.Font.SourceSansBold
    TabIcon.Text = "•"
    TabIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
    TabIcon.TextSize = 20
    
    local TabText = Instance.new("TextLabel")
    TabText.Name = "TabText"
    TabText.Parent = TabButton
    TabText.BackgroundTransparency = 1
    TabText.Position = UDim2.new(0, 40, 0, 0)
    TabText.Size = UDim2.new(1, -50, 1, 0)
    TabText.Font = Enum.Font.SourceSans
    TabText.Text = tab.text
    TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabText.TextSize = 16
    TabText.TextXAlignment = Enum.TextXAlignment.Left
    TabText.TextYAlignment = Enum.TextYAlignment.Center
    TabText.TextWrapped = true
    
    table.insert(tabButtons, TabButton)
end

-- Page Container
local PageContainer = Instance.new("Frame")
PageContainer.Name = "PageContainer"
PageContainer.Parent = MainFrame
PageContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PageContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
PageContainer.Position = UDim2.new(0, 150, 0, 40)
PageContainer.Size = UDim2.new(1, -150, 1, -40)

-- Page Content
local pages = {}

-- Main Page
local MainPage = Instance.new("Frame")
MainPage.Name = "MainPage"
MainPage.Parent = PageContainer
MainPage.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainPage.Size = UDim2.new(1, 0, 1, 0)
MainPage.Visible = true

local MainTitle = Instance.new("TextLabel")
MainTitle.Name = "MainTitle"
MainTitle.Parent = MainPage
MainTitle.BackgroundTransparency = 1
MainTitle.Position = UDim2.new(0.5, 0, 0, 20)
MainTitle.Size = UDim2.new(0, 300, 0, 50)
MainTitle.AnchorPoint = Vector2.new(0.5, 0)
MainTitle.Font = Enum.Font.SourceSansBold
MainTitle.Text = "Mount RNG - Main Menu"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 24

local MainDescription = Instance.new("TextLabel")
MainDescription.Name = "MainDescription"
MainDescription.Parent = MainPage
MainDescription.BackgroundTransparency = 1
MainDescription.Position = UDim2.new(0.5, 0, 0, 80)
MainDescription.Size = UDim2.new(0, 500, 0, 100)
MainDescription.AnchorPoint = Vector2.new(0.5, 0)
MainDescription.Font = Enum.Font.SourceSans
MainDescription.Text = "Welcome to Mount RNG! Collect rare mounts, complete quests, and trade with other players. Use the tabs on the left to navigate through the menu."
MainDescription.TextColor3 = Color3.fromRGB(200, 200, 200)
MainDescription.TextSize = 16
MainDescription.TextWrapped = true
MainDescription.TextXAlignment = Enum.TextXAlignment.Center

local PlayButton = Instance.new("TextButton")
PlayButton.Name = "PlayButton"
PlayButton.Parent = MainPage
PlayButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
PlayButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayButton.Position = UDim2.new(0.5, 0, 0, 200)
PlayButton.Size = UDim2.new(0, 200, 0, 50)
PlayButton.AnchorPoint = Vector2.new(0.5, 0)
PlayButton.Font = Enum.Font.SourceSansBold
PlayButton.Text = "Start Playing"
PlayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayButton.TextSize = 20

-- Info Page
local InfoPage = Instance.new("Frame")
InfoPage.Name = "InfoPage"
InfoPage.Parent = PageContainer
InfoPage.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
InfoPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfoPage.Size = UDim2.new(1, 0, 1, 0)
InfoPage.Visible = false

local InfoTitle = Instance.new("TextLabel")
InfoTitle.Name = "InfoTitle"
InfoTitle.Parent = InfoPage
InfoTitle.BackgroundTransparency = 1
InfoTitle.Position = UDim2.new(0.5, 0, 0, 20)
InfoTitle.Size = UDim2.new(0, 300, 0, 50)
InfoTitle.AnchorPoint = Vector2.new(0.5, 0)
InfoTitle.Font = Enum.Font.SourceSansBold
InfoTitle.Text = "Game Information"
InfoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoTitle.TextSize = 24

local InfoContent = Instance.new("ScrollingFrame")
InfoContent.Name = "InfoContent"
InfoContent.Parent = InfoPage
InfoContent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
InfoContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfoContent.Position = UDim2.new(0.5, 0, 0, 80)
InfoContent.Size = UDim2.new(0, 500, 0, 400)
InfoContent.AnchorPoint = Vector2.new(0.5, 0)
InfoContent.CanvasSize = UDim2.new(0, 0, 0, 600)
InfoContent.ScrollBarThickness = 5

local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoText"
InfoText.Parent = InfoContent
InfoText.BackgroundTransparency = 1
InfoText.Position = UDim2.new(0, 20, 0, 20)
InfoText.Size = UDim2.new(1, -40, 0, 560)
InfoText.Font = Enum.Font.SourceSans
InfoText.Text = "Mount RNG is a Roblox game where you can collect rare mounts by opening crates. Each mount has a different rarity and can be used to travel faster around the map.\n\nGame Features:\n- Collect over 50 different mounts\n- Complete daily quests for rewards\n- Trade mounts with other players\n- Compete in leaderboards\n- Explore a vast open world\n\nHow to Play:\n1. Click on the 'Start Playing' button in the main menu\n2. Use the WASD keys to move your character\n3. Press E to interact with objects\n4. Open crates to get new mounts\n5. Use your mounts by pressing the M key\n\nControls:\n- WASD: Move\n- Space: Jump\
