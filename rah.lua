if not game:IsLoaded() then
    game.Loaded:Wait()
end
print("Roblox loaded")
repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
print("Game loaded")

local KeepSc = false
local wfps = true
local wfps1 = true
local wfps2 = true
local df = true
local vu = game:GetService("VirtualUser")

game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

game.NetworkClient.ChildRemoved:Connect(function()
    game:GetService("TeleportService"):Teleport(5956785391)
end)

game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        game:GetService("TeleportService"):Teleport(5956785391)
    end
end)

print("executed false sc")

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

-- Create a TextLabel to display the state of KeepSC
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.2, 0)
label.Position = UDim2.new(0, 0, 0.2, 0)
label.Text = "KeepSC: " .. tostring(KeepSc)
label.Parent = frame

-- Create a TextButton for KeepSC
local buttonKeepSC = Instance.new("TextButton")
buttonKeepSC.Size = UDim2.new(1, 0, 0.2, 0)
buttonKeepSC.Position = UDim2.new(0, 0, 0, 0)
buttonKeepSC.Text = "Toggle KeepSC"
buttonKeepSC.Parent = frame

-- Create a TextButton for wfps
local buttonWfps = Instance.new("TextButton")
buttonWfps.Size = UDim2.new(1, 0, 0.2, 0)
buttonWfps.Position = UDim2.new(0, 0, 0.4, 0)
buttonWfps.Text = "Toggle wfps"
buttonWfps.Parent = frame

-- Create a TextButton for wfps
local buttonWfps1 = Instance.new("TextButton")
buttonWfps1.Size = UDim2.new(1, 0, 0.2, 0)
buttonWfps1.Position = UDim2.new(0, 0, 0.6, 0)
buttonWfps1.Text = "Toggle wfps1"
buttonWfps1.Parent = frame

-- Create a TextButton for wfps
local buttonWfps2 = Instance.new("TextButton")
buttonWfps2.Size = UDim2.new(1, 0, 0.2, 0)
buttonWfps2.Position = UDim2.new(0, 0, 0.8, 0)
buttonWfps2.Text = "Toggle wfps2"
buttonWfps2.Parent = frame

-- Create a TextButton for df
local buttonDf = Instance.new("TextButton")
buttonDf.Size = UDim2.new(1, 0, 0.2, 0)
buttonDf.Position = UDim2.new(0, 0, 1, 0)
buttonDf.Text = "Toggle df"
buttonDf.Parent = frame

-- Create a Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
titleBar.Parent = frame

-- Create a Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -30, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "My Draggable UI"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Parent = titleBar

-- Create a Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 1, 0)
minimizeButton.Position = UDim2.new(1, -30, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeButton.Parent = titleBar

-- Function to make the frame draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

titleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Minimize functionality
local isMinimized = false
local originalSize = frame.Size

minimizeButton.MouseButton1Click:Connect(function()
	if isMinimized then
		frame.Size = originalSize
	else
		frame.Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 30)
	end
	isMinimized = not isMinimized
end)

-- Function to toggle KeepSC and update UI
local function toggleKeepSC()
    KeepSc = not KeepSc
    label.Text = "KeepSC: " .. tostring(KeepSc)

    -- Send notification
    game.StarterGui:SetCore("SendNotification", {
        Title = "KeepSC Toggle",
        Text = "KeepSC is now " .. tostring(KeepSc),
        Duration = 3
    })
end
buttonKeepSC.MouseButton1Click:Connect(toggleKeepSC)

-- Function to toggle wfps and update UI
local function toggleWfps()
    wfps = not wfps

    -- Send notification
    local wfpsntf = wfps and "Canceled PJS Rotation in next game" or "Executing PJS Rotation in next game"
    game.StarterGui:SetCore("SendNotification", {
        Title = "PJS Rotation Toggle",
        Text = wfpsntf,
        Duration = 3
    })
end
buttonWfps.MouseButton1Click:Connect(toggleWfps)

-- Function to toggle wfps and update UI
local function toggleWfps1()
    wfps1 = not wfps1

    -- Send notification
    local wfpsntf1 = wfps1 and "Canceled PJS Rotation in next game" or "Executing PJS Rotation in next game"
    game.StarterGui:SetCore("SendNotification", {
        Title = "PJS Rotation Toggle",
        Text = wfpsntf1,
        Duration = 3
    })
end
buttonWfps1.MouseButton1Click:Connect(toggleWfps1)

-- Function to toggle wfps and update UI
local function toggleWfps2()
    wfps2 = not wfps2

    -- Send notification
    local wfpsntf2 = wfps2 and "Canceled PJS Rotation in next game" or "Executing PJS Rotation in next game"
    game.StarterGui:SetCore("SendNotification", {
        Title = "PJS Rotation Toggle",
        Text = wfpsntf2,
        Duration = 3
    })
end
buttonWfps2.MouseButton1Click:Connect(toggleWfps2)

-- Function to toggle df and update UI
local function toggleDf()
    df = not df

    -- Send notification
    local dfntf = df and "Canceled DF Trinkets in next game" or "Executing DF Trinkets in next game"
    game.StarterGui:SetCore("SendNotification", {
        Title = "DF Trinkets Toggle",
        Text = dfntf,
        Duration = 3
    })
end
buttonDf.MouseButton1Click:Connect(toggleDf)

local queueteleport = (delta and delta.queue_on_teleport) or (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local TeleportCheck = false
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if KeepSc and (not wfps) then
        if (not TeleportCheck) and queueteleport then
            TeleportCheck = true
            queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()")
        end
    elseif KeepSc and (not wfps1) then
        if (not TeleportCheck) and queueteleport then	
            TeleportCheck = true
            queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps1.lua'))()")
        end
    elseif KeepSc and (not wfps2) then
        if (not TeleportCheck) and queueteleport then	
            TeleportCheck = true
            queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps2.lua'))()")
        end
    elseif KeepSc and (not df) then
        if (not TeleportCheck) and queueteleport then	
            TeleportCheck = true
            queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/df.lua'))()")
        end
    else
        if (not TeleportCheck) and queueteleport then	
            TeleportCheck = true
            queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/rah.lua'))()")
        end
    end
end)
