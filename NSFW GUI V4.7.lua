--[[ 

Name: NSFW GUI V4.7
Description: Time To Fuck!
By: Kanujinho

]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")
local Root = Character:WaitForChild("HumanoidRootPart")
local Head = Character:WaitForChild("Head")

Player.CharacterAdded:Connect(function(char)
	Character = char
	Humanoid = char:WaitForChild("Humanoid")
	Root = char:WaitForChild("HumanoidRootPart")
	Head = char:WaitForChild("Head")
end)

local request = syn and syn.request or http_request or request
local res1 = request({Url = "https://github.com/paravid/RBMX-SCRIPTS/raw/refs/heads/main/UPATE.rbxm", Method = "GET"})
assert(res1 and res1.Body)
writefile("UPATE.rbxm", res1.Body)

local AnimPack = game:GetObjects(getcustomasset("UPATE.rbxm"))[1]
local AnimSaves = AnimPack:WaitForChild("AnimSaves")

local dances = {
	{Name = "Jerking", Anim = AnimSaves:WaitForChild("Masturbate"), Speed = 0},
	{Name = "Hustle", Anim = AnimSaves:WaitForChild("Hustle"), Speed = 0},
	{Name = "Poly Dance", Anim = AnimSaves:WaitForChild("Polydance"), Speed = 0},
	{Name = "Pose", Anim = AnimSaves:WaitForChild("Pose"), Speed = 0},
	{Name = "Show Anal", Anim = AnimSaves:WaitForChild("ShowAnal"), Speed = 0},
	{Name = "Wiggle", Anim = AnimSaves:WaitForChild("Wiggle"), Speed = 0},
	{Name = "Dog", Anim = AnimSaves:WaitForChild("Dog"), Speed = 0},
	{Name = "Kneel", Anim = AnimSaves:WaitForChild("Kneel"), Speed = 0},
	{Name = "Grind", Anim = AnimSaves:WaitForChild("(les) grind"), Speed = 0},
	{Name = "Arch Shots", Anim = AnimSaves:WaitForChild("Arch shots "), Speed = 0},
	{Name = "AssEat", Anim = AnimSaves:WaitForChild("AssEat2 "), Speed = 0},
	{Name = "Bored sit", Anim = AnimSaves:WaitForChild("Bored sit "), Speed = 0},
        {Name = "Bored sit V2", Anim = AnimSaves:WaitForChild("Bored sit2 "), Speed = 0},
	{Name = "Showing The Ass", Anim = AnimSaves:WaitForChild("Stroke69 "), Speed = 0},
	{Name = "CakeFace ", Anim = AnimSaves:WaitForChild("CakeFace "), Speed = 0},
	{Name = "Shake Ass V1", Anim = AnimSaves:WaitForChild("Chromakopia "), Speed = 0},
	{Name = "SuperIntimate", Anim = AnimSaves:WaitForChild("SuperIntimate "), Speed = 0},
	{Name = "AssEat", Anim = AnimSaves:WaitForChild("AssEat2 "), Speed = 0},
	{Name = "Shake Ass V2", Anim = AnimSaves:WaitForChild("IsAButt2 "), Speed = 0},
	{Name = "CakeFace", Anim = AnimSaves:WaitForChild("CakeFace "), Speed = 0},
	{Name = "Corruption", Anim = AnimSaves:WaitForChild("Corruption "), Speed = 0},
	{Name = "SuperIntimate", Anim = AnimSaves:WaitForChild("SuperIntimate "), Speed = 0},
	{Name = "bun slapper", Anim = AnimSaves:WaitForChild("bun slapper "), Speed = 0},
	{Name = "Tied Yoga", Anim = AnimSaves:WaitForChild("TiedYoga "), Speed = 0},
	{Name = "Tease Dance", Anim = AnimSaves:WaitForChild("Tease Dance "), Speed = 0},
	--{Name = "Jerking In The Ground", Anim = AnimSaves:WaitForChild("Self jerk "), Speed = 0},
	{Name = "MomsLap", Anim = AnimSaves:WaitForChild("MomsLap "), Speed = 0},
	{Name = "Jerking V2", Anim = AnimSaves:WaitForChild("Master "), Speed = 0},
        {Name = "Head Pats", Anim = AnimSaves:WaitForChild("Head pats "), Speed = 0},
        {Name = "Jerking V3", Anim = AnimSaves:WaitForChild("Cock Worship "), Speed = 0},
        {Name = "Sitting", Anim = AnimSaves:WaitForChild("NipplePull "), Speed = 0},
}

local currentDance = nil
local currentButton = nil
local currentAnim = nil
local currentMoveSpeed = 0
local changingSpeed = false
local animSpeed = 1
local darkMode = true
local minimized = false
local favorites = {}
local recentDances = {}
local cameraConnection

local gui = Instance.new("ScreenGui")
gui.Name = "NSFWGuiV3"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,260,0,500)
frame.Position = UDim2.new(0,20,0.5,-250)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = "NSFW GUI V3"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1,1,1)
title.Parent = frame

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0,22,0,22)
minimizeBtn.Position = UDim2.new(1,-28,0,6)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 14
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.Parent = frame

local themeBtn = Instance.new("TextButton")
themeBtn.Size = UDim2.new(0,22,0,22)
themeBtn.Position = UDim2.new(1,-55,0,6)
themeBtn.Text = "☀"
themeBtn.Font = Enum.Font.GothamBold
themeBtn.TextSize = 11
themeBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
themeBtn.TextColor3 = Color3.new(1,1,1)
themeBtn.Parent = frame

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1,-10,0,30)
searchBox.Position = UDim2.new(0,5,0,40)
searchBox.PlaceholderText = "Search Dance..."
searchBox.Text = ""
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 14
searchBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.Parent = frame

local searchCorner = Instance.new("UICorner", searchBox)
searchCorner.CornerRadius = UDim.new(0,8)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1,0,0,25)
speedLabel.Position = UDim2.new(0,0,0,75)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Animation Speed: 1x"
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 14
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Parent = frame

local speedPlus = Instance.new("TextButton")
speedPlus.Size = UDim2.new(0.26,0,0,25)
speedPlus.Position = UDim2.new(0.05,0,0,100)
speedPlus.Text = "+"
speedPlus.Parent = frame

local speedMinus = Instance.new("TextButton")
speedMinus.Size = UDim2.new(0.26,0,0,25)
speedMinus.Position = UDim2.new(0.37,0,0,100)
speedMinus.Text = "-"
speedMinus.Parent = frame

local speedReset = Instance.new("TextButton")
speedReset.Size = UDim2.new(0.22,0,0,25)
speedReset.Position = UDim2.new(0.70,0,0,100)
speedReset.Text = "Reset"
speedReset.Parent = frame

for _,v in pairs({speedPlus,speedMinus,speedReset}) do
	v.BackgroundColor3 = Color3.fromRGB(35,35,35)
	v.TextColor3 = Color3.new(1,1,1)
	v.Font = Enum.Font.GothamBold
	v.TextSize = 14

	local c = Instance.new("UICorner",v)
	c.CornerRadius = UDim.new(0,8)
end

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,-10,1,-140)
scroll.Position = UDim2.new(0,5,0,135)
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1
scroll.Parent = frame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,5)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = scroll

local function savePosition()
	if writefile then
		writefile("DanceGuiPosition.json",HttpService:JSONEncode({X = frame.Position.X.Offset,Y = frame.Position.Y.Offset}))
	end
end

pcall(function()
	if readfile and isfile and isfile("DanceGuiPosition.json") then
		local data = HttpService:JSONDecode(readfile("DanceGuiPosition.json"))
		frame.Position = UDim2.new(0,data.X,0,data.Y)
	end
end)

local function stopCamera()
	if cameraConnection then
		cameraConnection:Disconnect()
		cameraConnection = nil
	end
	Humanoid.CameraOffset = Vector3.zero
end

local function startCamera()
	stopCamera()
	cameraConnection = RunService.RenderStepped:Connect(function(dt)
		local alpha = math.clamp(0.15 * dt * 60,0,1)
		Humanoid.CameraOffset = Humanoid.CameraOffset:Lerp((Root.CFrame * CFrame.new(0,1.5,0)):PointToObjectSpace(Head.Position),alpha)
	end)
end

local function stopDance()
	currentDance = nil
	stopCamera()
	getgenv().Animator6DStop()
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50

	if currentButton then
		currentButton.BackgroundColor3 = Color3.fromRGB(35,35,35)
		currentButton.Text = currentButton.Name
	end
	currentButton = nil
end

local function playDance(data,button)
	if currentDance == data.Name then
		stopDance()
		return
	end

	stopDance()
	currentDance = data.Name
	currentButton = button
	currentAnim = data.Anim
	currentMoveSpeed = data.Speed
	button.BackgroundColor3 = Color3.fromRGB(0,170,255)
	button.Text = data.Name .. " [ON]"

	getgenv().Animator6D(data.Anim,animSpeed,true)
	Humanoid.WalkSpeed = data.Speed
	Humanoid.JumpPower = 0
	startCamera()
	table.insert(recentDances,1,data.Name)

	if #recentDances > 5 then
		table.remove(recentDances,#recentDances)
	end
end

local buttons = {}

for _,data in ipairs(dances) do
	local holder = Instance.new("Frame")
	holder.Size = UDim2.new(1,-5,0,30)
	holder.BackgroundTransparency = 1
	holder.Parent = scroll

	local favoriteBtn = Instance.new("TextButton")
	favoriteBtn.Size = UDim2.new(0,30,1,0)
	favoriteBtn.Text = "☆"
	favoriteBtn.Font = Enum.Font.GothamBold
	favoriteBtn.TextSize = 18
	favoriteBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	favoriteBtn.TextColor3 = Color3.new(1,1,1)
	favoriteBtn.Parent = holder

	local btn = Instance.new("TextButton")
	btn.Name = data.Name
	btn.Size = UDim2.new(1,-35,1,0)
	btn.Position = UDim2.new(0,35,0,0)
	btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.Text = data.Name
	btn.AutoButtonColor = false
	btn.Parent = holder

	local c1 = Instance.new("UICorner",btn)
	c1.CornerRadius = UDim.new(0,8)

	local c2 = Instance.new("UICorner",favoriteBtn)
	c2.CornerRadius = UDim.new(0,8)

	btn.MouseButton1Click:Connect(function()
		playDance(data,btn)
	end)

	favoriteBtn.MouseButton1Click:Connect(function()
		favorites[data.Name] = not favorites[data.Name]

		if favorites[data.Name] then
			favoriteBtn.Text = "★"
		else
			favoriteBtn.Text = "☆"
		end
	end)

	table.insert(buttons,{Button = btn,Data = data,Holder = holder})
end

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 10)
end)

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local text = string.lower(searchBox.Text)

	for _,info in ipairs(buttons) do
		local visible = string.find(string.lower(info.Data.Name),text)
		info.Holder.Visible = visible ~= nil
	end
end)

local function updateAnimSpeed()
	speedLabel.Text = "Animation Speed: "..math.floor(animSpeed * 10)/10 .."x"

	if currentAnim and currentDance and not changingSpeed then
		changingSpeed = true
		local oldDance = currentDance
		local oldButton = currentButton
		getgenv().Animator6DStop()
		task.wait()
		getgenv().Animator6D(currentAnim,animSpeed,true)
		currentDance = oldDance
		currentButton = oldButton
		changingSpeed = false
	end
end

speedPlus.MouseButton1Click:Connect(function()
	animSpeed += 0.2
	updateAnimSpeed()
end)

speedMinus.MouseButton1Click:Connect(function()
	animSpeed = math.max(0.2,animSpeed - 0.2)
	updateAnimSpeed()
end)

speedReset.MouseButton1Click:Connect(function()
	animSpeed = 1
	updateAnimSpeed()
end)

themeBtn.MouseButton1Click:Connect(function()
	darkMode = not darkMode
	if darkMode then
		frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
		searchBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
		searchBox.TextColor3 = Color3.new(1,1,1)
		title.TextColor3 = Color3.new(1,1,1)
		speedLabel.TextColor3 = Color3.new(1,1,1)
	else
		frame.BackgroundColor3 = Color3.fromRGB(220,220,220)
		searchBox.BackgroundColor3 = Color3.fromRGB(240,240,240)
		searchBox.TextColor3 = Color3.new(0,0,0)
		title.TextColor3 = Color3.new(0,0,0)
		speedLabel.TextColor3 = Color3.new(0,0,0)
	end
end)

minimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		TweenService:Create(frame,TweenInfo.new(0.25),{Size = UDim2.new(0,260,0,40)}):Play()
		scroll.Visible = false
		searchBox.Visible = false
		speedLabel.Visible = false
		speedPlus.Visible = false
		speedMinus.Visible = false
		speedReset.Visible = false
		minimizeBtn.Text = "+"
	else
		TweenService:Create(frame,TweenInfo.new(0.25),{Size = UDim2.new(0,260,0,500)}):Play()
		scroll.Visible = true
		searchBox.Visible = true
		speedLabel.Visible = true
		speedPlus.Visible = true
		speedMinus.Visible = true
		speedReset.Visible = true
		minimizeBtn.Text = "-"
	end
end)

local dragging = false
local dragInput
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
				savePosition()
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset + delta.X,startPos.Y.Scale,startPos.Y.Offset + delta.Y)
	end
end)
