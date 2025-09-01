repeat
    wait()
until game:IsLoaded()
--loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
local spsn = true
local KeepSC = true
wait(1)
print("SCRIPT MADE BY realhanif")
local spawn, wait = task.spawn, task.wait
local vu = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")

game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)
 --

--[[
	game.NetworkClient.ChildRemoved:Connect(function()
	game:GetService("TeleportService"):Teleport(9321822839)
	end)
]] game:GetService(
    "CoreGui"
).RobloxPromptGui.promptOverlay.ChildAdded:Connect(
    function(child)
        if
            child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and
                child.MessageArea:FindFirstChild("ErrorFrame")
         then
            game:GetService("TeleportService"):Teleport(9321822839)
        end
    end
)

queueteleport =
    (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or
    (delta and delta.queue_on_teleport)
local TeleportCheck = false
game:GetService("Players").LocalPlayer.OnTeleport:Connect(
    function(State)
        if KeepSC then
            if (not TeleportCheck) and queueteleport then
                TeleportCheck = true
                queueteleport(
                    "loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/ouwcp.lua'))()"
                )
            end
        else
            if (not TeleportCheck) and queueteleport then
                TeleportCheck = true
                queueteleport(
                    "loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/rah.lua'))()"
                )
            end
        end
    end
)

print("Roblox loaded")
-- Wait for the LocalPlayer to be loaded
game:GetService("Players").LocalPlayer:WaitForChild("doneloadinggamepasses")
print("game loaded")
local placeId = game.PlaceId
local Workspace = game:GetService("Workspace")
-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 100, 0, 50)
frame.Position = UDim2.new(0, 300, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Create a TextButton
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 0.5, 0)
button.Position = UDim2.new(0, 0, 0, 0)
button.Text = "Toggle KeepSC"
button.Parent = frame

-- Create a TextLabel to display the state of KeepSC
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.5, 0)
label.Position = UDim2.new(0, 0, 0.5, 0)
label.Text = "KeepSC: " .. tostring(KeepSC)
label.Parent = frame

-- Create a TextButton
local buttonr = Instance.new("TextButton")
buttonr.Size = UDim2.new(0, 100, 0, 25)
buttonr.Position = UDim2.new(0, 400, 0, 0)
buttonr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
buttonr.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonr.Text = "Toggle Rotation"
buttonr.Parent = screenGui

-- Function to toggle KeepSC and update UI
local function toggleKeepSC()
    KeepSC = not KeepSC
    label.Text = "KeepSC: " .. tostring(KeepSC)

    -- Send notification
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "KeepSC Toggle",
            Text = "KeepSC is now " .. tostring(KeepSC),
            Duration = 3
        }
    )
end
button.MouseButton1Click:Connect(toggleKeepSC)

local function togglebossrun()
    spsn = not spsn
    -- Send notification
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Tweens Toggle",
            Text = "Tweens is now " .. tostring(spsn),
            Duration = 1
        }
    )
end
buttonr.MouseButton1Click:Connect(togglebossrun)

local function getLocalPlayerUsername()
    if game.Players.LocalPlayer then
        return game.Players.LocalPlayer.Name
    else
        return nil
    end
end

if placeId == 5956785391 then
    wait()
    TeleportService:Teleport(9321822839)
elseif placeId == 9321822839 then
    wait(3)
    local myUsername = getLocalPlayerUsername()
    local function findUsername(folder, username)
        for _, child in pairs(folder:GetChildren()) do
            local playerFolder = child:FindFirstChild(username)
            if playerFolder then
                return child -- Return the folder containing the username
            else
                local foundFolder = findUsername(child, username)
                if foundFolder then
                    return foundFolder -- If found in a subfolder, return the folder
                end
            end
        end
        return nil -- Username not found
    end

    local replicatedStorage = game:GetService("ReplicatedStorage")
    local parties = replicatedStorage:WaitForChild("parties")
    local folderContainingUsername = findUsername(parties, myUsername)

    if folderContainingUsername then
        local parentName = folderContainingUsername.Parent.Name
        print("Parent name of 'players' folder:", parentName)

        local args = {
            [1] = parties:WaitForChild(parentName):WaitForChild("gamemodeequiped"),
            [2] = "Ouwigahara"
        }

        replicatedStorage:WaitForChild("change_game_mode"):FireServer(unpack(args))
        print("Going to Ouwigahara")
        wait()
        game:GetService("ReplicatedStorage"):WaitForChild("queu_up"):FireServer()
    else
        print("Username not found in ReplicatedStorage.parties")
    end
    wait(20)
    TeleportService:Teleport(9321822839)
elseif placeId == 11468075017 then
    --TeleportService:Teleport(9321822839)
    wait(1)

    local function preventFall()
        while task.wait() do
            if spsn then
                local antifall3 = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
                antifall3.Velocity = Vector3.new(0, 0, 0)
                antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            end
        end

        -- This part should be outside the while loop
        if antifall3 then
            antifall3:Destroy()
        end
    end

    local Info = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
    local Goal = {}
    local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
    Goal.CFrame = CFrame.new(5250, -148, 2030)
    game:GetService("TweenService"):Create(Root, Info, Goal):Play()
    wait(1)
    Goal.CFrame = CFrame.new(5277, -148, 2030)
    game:GetService("TweenService"):Create(Root, Info, Goal):Play()
    wait(11)

    local function noclip()
        while task.wait() do
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end

    local function collectChest()
        while task.wait() do
            for _, chest in pairs(Workspace.Debree:GetChildren()) do
                if chest.Name == "Loot_Chest" then
                    for _, drop in pairs(chest:FindFirstChild("Drops"):GetChildren()) do
                        chest.Add_To_Inventory:InvokeServer(drop.Name)
                        drop:Destroy()
                        if #chest.Drops:GetChildren() == 0 then
                            chest:Destroy()
                        end
                    end
                end
            end
            wait()
        end
    end
    spawn(collectChest)

    local function destroyModels(modelNames)
        for _, modelName in pairs(modelNames) do
            if Workspace.Map:FindFirstChild(modelName) then
                for _, v in pairs(Workspace.Map:GetChildren()) do
                    if v:IsA("Model") and v.Name == modelName then
                        v:Destroy()
                    end
                end
            end
        end
    end

    local function cdorb()
        local hellyes = true
        wait(10)
        local hellyes = false
    end

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")
    local toggleTeleport = false
    local tweenTime = 1 -- Change this value to adjust tween duration (in seconds)

    local orbTypes = {
        {name = "HealthRegen", enabled = true},
        {name = "StaminaRegen", enabled = false},
        {name = "BloodMoney", enabled = false},
        {name = "DoublePoints", enabled = true},
        {name = "InstaKill", enabled = true},
        {name = "WisteriaPoisoning", enabled = true},
        {name = "MobCamouflage", enabled = true}
    }

    local rooth = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")

    -- Function to find the correct room name
    local function findRoomName()
        for _, room in pairs(workspace.Map:GetChildren()) do
            local spawnpoints = room:FindFirstChild("Spawnpoints")
            if spawnpoints then
                local part = spawnpoints:FindFirstChildWhichIsA("BasePart")
                if part then
                    return room.Name
                end
            end
        end
        return nil
    end

    -- Function to tween the character to a random part within "Spawnpoints"

    local function wd()
        while task.wait(3) do
            local args = {
                [1] = true
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(
                unpack(args)
            )
        end
    end
    coroutine.wrap(wd)()

    -- Coroutine function
    local function mainCoroutine()
        while isTimerGuiNotVisible() do
            wait(1) -- Adjust the delay as needed, e.g., check every second
        end

        -- Timer GUI is not visible, so teleport to the desired game
        TeleportService:Teleport(9321822839)
    end

    local timeout = 60 -- Set the timeout in seconds (change this as needed)
    -- Function to check if the Timer GUI is visible
    local player = game:GetService("Players").LocalPlayer
    local timerGui = player.PlayerGui:WaitForChild("top_ui"):FindFirstChild("Timer")
    local function isTimerGuiNotVisible()

        if timerGui and timerGui.Visible == false then
            return false
        else
            return true
        end
    end
    local function isTimerGuiVisible()
        local player = game:GetService("Players").LocalPlayer
        local timerGui = player.PlayerGui:FindFirstChild("top_ui"):FindFirstChild("Timer")

        if timerGui and timerGui.Visible == true then
            return true
        else
            return false
        end
    end
    print("Farming Ouw for 10 Minutes..")

    -- Execute SH V2
    local function loopBp()
        while task.wait() do
            local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
            Handle_Initiate_S_:InvokeServer("skil_ting_asd", game.Players.LocalPlayer, "arrow_knock_back", 5)
            wait(14)
        end
    end

    local loopC1 = coroutine.create(loopBp)
    coroutine.resume(loopC1)

    local function loopFunction()
        while task.wait() do
            local success, error =
                pcall(
                function()
                    local hitCounter = {} -- Counter for each model
                    for i, v in next, workspace.Mobs:GetDescendants() do
                        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                            local modelId = v:GetFullName()
                            -- Check if the model has a counter and initialize it if not present
                            if not hitCounter[modelId] then
                                hitCounter[modelId] = 0
                            end
                            -- Check if the model has been hit less than 2 times
                            if hitCounter[modelId] < 2 then
                                local humanoid = v:FindFirstChildOfClass("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    local Handle_Initiate_S_ =
                                        game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
                                    Handle_Initiate_S_:InvokeServer(
                                        "arrow_knock_back_damage",
                                        game.Players.LocalPlayer.Character,
                                        v.HumanoidRootPart.CFrame,
                                        v,
                                        500,
                                        500
                                    )
                                    hitCounter[modelId] = hitCounter[modelId] + 1
                                else
                                    -- The humanoid health is 0, change to another model
                                    -- Replace the code below with the logic to change the model
                                    --print("Model with health 0:", modelId)
                                end
                            end
                            -- Check if we hit two mobs/models
                            local hitCount = 0
                            for _, count in pairs(hitCounter) do
                                hitCount = hitCount + count
                            end
                            if hitCount >= 2 then
                                break -- Exit the loop if we hit two mobs/models
                            end
                        end
                    end
                end
            )
            if not success then
                print("An error occurred:", error)
            end
            -- Add a delay between iterations to prevent excessive server load
            wait(.1) -- Adjust the delay time as desired
        end
    end

    local startTime = tick() -- Record the start time
    -- Wait until the Timer GUI is visible or until the timeout is reached
    while not isTimerGuiVisible() do
        if tick() - startTime >= timeout then
            print("Timeout reached. Timer GUI did not become visible.")
            break -- Exit the loop if the timeout is reached
        end
        wait(1) -- Adjust the delay as needed, e.g., check every second
    end

    _G.TweenSpeed = 300

    local function GetDistance(Endpoint)
        if typeof(Endpoint) == "Instance" then
            Endpoint =
                Vector3.new(
                Endpoint.Position.X,
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,
                Endpoint.Position.Z
            )
        elseif typeof(Endpoint) == "CFrame" then
            Endpoint =
                Vector3.new(
                Endpoint.Position.X,
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,
                Endpoint.Position.Z
            )
        end
        local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        return Magnitude
    end

    function Tween(Endpoint)
        if typeof(Endpoint) == "Instance" then
            Endpoint = Endpoint.CFrame
        end
        local TweenFunc = {}
        local Distance = GetDistance(Endpoint)
        local TweenInfo =
            game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / _G.TweenSpeed, Enum.EasingStyle.Linear),
            {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1, 0, 0), math.rad(0))}
        )
        if spsn then
            TweenInfo:Play()
            wait(Distance / _G.TweenSpeed)
            function TweenFunc:Cancel()
                TweenInfo:Cancel()
                return false
            end
        end
        return TweenFunc
    end

    -- Check if the Timer GUI became visible or not
    if isTimerGuiVisible() then
        print("Timer GUI is now visible, continuing with the script...")
        wait(30)
        coroutine.wrap(preventFall)()
        local loopCM = coroutine.create(mainCoroutine)
        coroutine.resume(loopCM)
        spawn(noclip)
        wait(1)
        coroutine.wrap(loopFunction)()
        spawn(
            function()
                while task.wait() do
                    if rooth.Health > 0 then
                        local roomName = findRoomName()
                        if roomName and spsn then
                            local spawnpoints = workspace.Map:FindFirstChild(roomName):FindFirstChild("Spawnpoints")
                            if spawnpoints and spsn then
                                local parts = spawnpoints:GetChildren()
                                if #parts > 0 and spsn then
                                    local randomPart = parts[math.random(1, #parts)]
                                    if randomPart and randomPart:IsA("BasePart") then
                                        if #workspace.Mobs:GetChildren() > 10 and spsn then
                                            --game.TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance(randomPart.Position + Vector3.new(0, 200, 0)) / _G.TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = CFrame.new(randomPart.Position + Vector3.new(0, 200, 0))}):Play()
                                            local endpointCFrame =
                                                CFrame.new(randomPart.Position + Vector3.new(0, 200, 0))
                                            local tween = Tween(endpointCFrame)
                                        elseif #workspace.Mobs:GetChildren() <= 10 and spsn then
                                            local endpointCFrame =
                                                CFrame.new(randomPart.Position + Vector3.new(0, 75, 0))
                                            local tween = Tween(endpointCFrame)
                                        --game.TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance(randomPart.Position + Vector3.new(0, 75, 0)) / _G.TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = CFrame.new(randomPart.Position + Vector3.new(0, 75, 0))}):Play()
                                        end
                                    end
                                else
                                    warn("No parts found in Spawnpoints of room: " .. roomName)
                                end
                            else
                                warn("No 'Spawnpoints' found in room: " .. roomName)
                            end
                        else
                            warn("No room with parts found in workspace.Map.")
                        end
                    else
                        local spsn = false
                        print("UR DEAD")
                        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = -1
                        wait()
                        --game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):Destroy()
                        repeat
                            wait()
                        until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
                        game:GetService("ReplicatedStorage"):WaitForChild("TeleportToShop"):FireServer()
                        break
                    end
                end
            end
        )

        spawn(
            function()
                while task.wait() do
                    for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                        if
                            (v:IsA("Model") and v.Name == "DoublePoints") or
                                (v:IsA("Model") and v.Name == "HealthRegen") or
                                (v:IsA("Model") and v.Name == "BloodMoney") or
                                (v:IsA("Model") and v.Name == "StaminaRegen") or
                                (v:IsA("Model") and v.Name == "InstaKill") or
                                (v:IsA("Model") and v.Name == "WisteriaPoisoning")
                                (v:IsA("Model") and v.Name == "MobCamouflage")
                         then
                            spsn = not spsn
                            if not spsn then
                                while v:IsDescendantOf(workspace) do
                                    Root.CFrame = v:GetModelCFrame()
                                    wait(.1)
                                end
                                spsn = not spsn
                            end
                        end
                    end
                end
            end
        )

        repeat wait() until timerGui.Visible = false
        wait(30)
        TeleportService:Teleport(5956785391)
    --[[
        wait(900)
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = -1 -- Set the humanoid's health to 0 to "kill" the character
        else
            print("Character or humanoid not found.")
        end
        wait(10)
        game:GetService("ReplicatedStorage"):WaitForChild("TeleportToShop"):FireServer()
        wait(10)
        TeleportService:Teleport(5956785391)
		]]
     --
    end
else
    print("Place ID doesn't match")
end
