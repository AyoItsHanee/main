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
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0, 300, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
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
