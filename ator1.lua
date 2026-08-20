-- ZeldHub - Attack on Titan: Revolution (Cleaned & Refined)
local Env = getfenv()
local ZeldHub = getgenv().ZeldHub

-- // Services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Mouse = LocalPlayer:GetMouse()

-- // Remotes & Assets
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Remotes = Assets:WaitForChild("Remotes")
local GET_Remote = Remotes:WaitForChild("GET")
local POST_Remote = Remotes:WaitForChild("POST")

local TitansFolder = workspace:FindFirstChild("Titans")
local ActiveNotifications = {}

-- // Notification System
local function showKillNotification(hitCount)
    if not ZeldHub.Main.Notifications then return end

    local gui = Instance.new("ScreenGui")
    gui.Name = "TitanNotif_" .. tick()
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 190, 0, 75)
    frame.Position = UDim2.new(1, 20, 0, 10 + #ActiveNotifications * 80)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(184, 164, 101)
    frame.Parent = gui

    local titleLbl = Instance.new("TextLabel", frame)
    titleLbl.Size = UDim2.new(0.65, 0, 1, 0)
    titleLbl.Position = UDim2.new(0, 5, 0, 0)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = "Successfully\nHit:"
    titleLbl.TextColor3 = Color3.fromRGB(184, 164, 101)
    titleLbl.Font = Enum.Font.Fantasy
    titleLbl.TextScaled = true
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left

    local countLbl = Instance.new("TextLabel", frame)
    countLbl.Size = UDim2.new(0, 60, 0.5, 0)
    countLbl.Position = UDim2.new(1, -65, 0, 0)
    countLbl.BackgroundTransparency = 1
    countLbl.Text = tostring(hitCount)
    countLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    countLbl.Font = Enum.Font.Fantasy
    countLbl.TextScaled = true
    countLbl.TextXAlignment = Enum.TextXAlignment.Right
    countLbl.TextYAlignment = Enum.TextYAlignment.Bottom

    local subLbl = Instance.new("TextLabel", frame)
    subLbl.Size = UDim2.new(0.6, 0, 0.5, 0)
    subLbl.Position = UDim2.new(1, -115, 0.5, 0)
    subLbl.BackgroundTransparency = 1
    subLbl.Text = "Titans"
    subLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    subLbl.Font = Enum.Font.Fantasy
    subLbl.TextScaled = true
    subLbl.TextXAlignment = Enum.TextXAlignment.Right
    subLbl.TextYAlignment = Enum.TextYAlignment.Top

    table.insert(ActiveNotifications, gui)
    
    local tweenIn = TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -210, 0, 10 + (#ActiveNotifications - 1) * 80)
    })
    tweenIn:Play()

    task.delay(5, function()
        local tweenOut = TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, 20, frame.Position.Y.Scale, frame.Position.Y.Offset),
            BackgroundTransparency = 1
        })
        tweenOut:Play()
        task.wait(0.4)
        gui:Destroy()

        -- Remove from table and adjust positions
        for i, v in ipairs(ActiveNotifications) do
            if v == gui then
                table.remove(ActiveNotifications, i)
                break
            end
        end

        for i, v in ipairs(ActiveNotifications) do
            local activeFrame = v:FindFirstChildWhichIsA("Frame")
            if activeFrame then
                TweenService:Create(activeFrame, TweenInfo.new(0.3), {
                    Position = UDim2.new(1, -210, 0, 10 + (i - 1) * 80)
                }):Play()
            end
        end
    end)
end

-- // Utility Functions
local function getTitanNape()
    if not TitansFolder then return nil end

    local priorityTargets = {"Attack_Titan", "Female_Titan", "Armored_Titan"}
    
    for _, name in ipairs(priorityTargets) do
        local titan = TitansFolder:FindFirstChild(name)
        if titan and titan:FindFirstChild("Humanoid") and titan.Humanoid.Health > 0 then
            local hit = titan:FindFirstChild("Hitboxes") and titan.Hitboxes:FindFirstChild("Hit")
            if hit and hit:FindFirstChild("Nape") and hit.Nape:IsA("BasePart") then
                return hit.Nape
            end
        end
    end

    for _, titan in ipairs(TitansFolder:GetChildren()) do
        if not table.find(priorityTargets, titan.Name) then
            if titan:FindFirstChild("Humanoid") and titan.Humanoid.Health > 0 then
                local hit = titan:FindFirstChild("Hitboxes") and titan.Hitboxes:FindFirstChild("Hit")
                if hit and hit:FindFirstChild("Nape") and hit.Nape:IsA("BasePart") then
                    return hit.Nape
                end
            end
        end
    end
    return nil
end

local function isRefillNeeded(uiName)
    local interface = PlayerGui:FindFirstChild("Interface", true)
    local uiElement = interface and interface:FindFirstChild(uiName, true)
    
    if uiElement and uiElement:IsA("TextLabel") then
        local num = tonumber(uiElement.Text:match("^(%d+)") or "0")
        return num == 0
    end
    return false
end

local function getRefillBox()
    local unclimbable = workspace:FindFirstChild("Unclimbable")
    local reloads = unclimbable and unclimbable:FindFirstChild("Reloads")
    if reloads then
        for _, box in ipairs(reloads:GetChildren()) do
            if box:FindFirstChild("Refill") then
                return box.Refill
            end
        end
    end
    return nil
end

-- // Auto Reload
local characters = workspace:WaitForChild("Characters")
local character = characters:WaitForChild(game:GetService("Players").LocalPlayer.Name)
local rig = character:WaitForChild("Rig_" .. game:GetService("Players").LocalPlayer.Name)
local leftHand = rig:WaitForChild("LeftHand")
local blade1 = leftHand:WaitForChild("Blade_1")
task.spawn(
    function()
        while task.wait(.1) do
            -- Get the new value of the attribute
            local isBroken = blade1:GetAttribute("Broken")

            -- Only run the code inside this block if the attribute is exactly true
            if isBroken == true then
                local Event = game:GetService("ReplicatedStorage").Assets.Remotes.GET
                Event:InvokeServer("Blades", "Reload")
            end
        end
    end
)



-- // Auto Refill
task.spawn(function()
    while task.wait(0.3) do
        if ZeldHub.General.AutoRefill then
            local refillBox = getRefillBox()
            if refillBox then
                if isRefillNeeded("Sets") or isRefillNeeded("Spears") then
                    POST_Remote:FireServer("Attacks", "Reload", refillBox)
                end
            end
        end
    end
end)

-- // Main Titan Farm
if ZeldHub.Main.Farm then
    task.spawn(function()
        task.delay(ZeldHub.Main.FarmDelay, function()
            RunService.Heartbeat:Connect(function()
                if not ZeldHub.Main.Farm or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
                
                local nape = getTitanNape()
                if not nape then return end

                local rootPart = LocalPlayer.Character.HumanoidRootPart
                local targetPos = nape.Position + Vector3.new(0, ZeldHub.Main.FloatHeight, 0)

                if ZeldHub.Main.MovementMode == "Gliding" then
                    rootPart.AssemblyLinearVelocity = (targetPos - rootPart.Position).Unit * ZeldHub.Main.GlidingSpeed
                else
                    rootPart.CFrame = CFrame.new(targetPos)
                end

                if (rootPart.Position - nape.Position).Magnitude <= 1500 then
                    coroutine.wrap(function()
                        local debugId = tostring(nape:GetDebugId())
                        POST_Remote:FireServer("Hitboxes", "Register", nape, nape.Position, nape.Size)
                        POST_Remote:FireServer("Attacks", "Slash", true)

                        if math.abs((nape.Position - targetPos).Magnitude - ZeldHub.Main.FloatHeight) <= 5 and ZeldHub.Main.Notifications then
                            showKillNotification(1) 
                        end
                        task.wait(0.25)
                    end)()
                end
            end)
        end)
    end)
end

-- // Auto Mission Setup
if ZeldHub.Mission.Mission then
    task.spawn(function()
        local missionsFolder = ReplicatedStorage:FindFirstChild("Missions")
        if not missionsFolder then warn("Missions folder not found!"); return end

        GET_Remote:InvokeServer("Missions", "Open")
        task.wait(1.5)

        POST_Remote:FireServer("S_Missions", "Create", {
            Name = ZeldHub.Mission.Map,
            Difficulty = ZeldHub.Mission.Difficulty,
            Type = "Missions",
            Objective = ZeldHub.Mission.Objective
        })

        local isLeader = false
        while true do
            for _, mission in pairs(missionsFolder:GetChildren()) do
                local leader = mission:FindFirstChild("Leader")
                if leader and leader.Value == LocalPlayer.Name then
                    isLeader = true
                    break
                end
            end
            if isLeader then break end
            task.wait(1)
        end

        if isLeader then
            POST_Remote:FireServer("S_Missions", "Start")
        else
            warn("Could not become mission leader or find mission.")
        end
        ZeldHub.Mission.Mission = false
    end)
end

-- // Map Adjustments (DeleteMap & NapeExtend)
task.spawn(function()
    if ZeldHub.General.DeleteMap then
        local deleteFolder = workspace:FindFirstChild("aristo_deletemap") or Instance.new("Folder", workspace)
        deleteFolder.Name = "aristo_deletemap"
        
        local climbable = workspace:FindFirstChild("Climbable")
        if climbable then climbable.Parent = deleteFolder end
        
        local unclimbable = workspace:FindFirstChild("Unclimbable")
        if unclimbable then
            for _, child in ipairs(unclimbable:GetChildren()) do
                if child.Name == "Reloads" then
                    child.Parent = workspace
                elseif child.Name == "Cutscene" or child.Name == "Objective" then
                    child.Parent = deleteFolder
                end
            end
            
            local objective = unclimbable:FindFirstChild("Objective")
            if objective and objective:FindFirstChild("Guard") and objective.Guard:FindFirstChild("Collider") then
                local collider = objective.Guard.Collider
                if collider:IsA("BasePart") then
                    collider.CanTouch = false
                    collider.CanCollide = false
                    collider.Transparency = 1
                end
            end
        end
        deleteFolder:Destroy()
    end

    if ZeldHub.General.NapeExtend then
        local newSize = Vector3.new(1500, 1500, 1500)
        local function resizeNape(nape)
            if nape:IsA("BasePart") and nape.Name == "Nape" then
                nape.Size = newSize
            end
        end

        for _, descendant in pairs(workspace:GetDescendants()) do resizeNape(descendant) end
        workspace.DescendantAdded:Connect(function(descendant)
            task.wait(0.1)
            resizeNape(descendant)
        end)
    end
end)

-- // Failsafe & Anti-Injuries
task.spawn(function()
    if ZeldHub.General.FailSafe then
        task.delay(ZeldHub.General.FailSafeDelaySeconds, function()
            pcall(function() POST_Remote:InvokeServer("Functions", "Retry", "Add") end)
        end)
    end

    if ZeldHub.General.AntiInjuries then
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local injuries = character:WaitForChild("Injuries", 10)
        
        if injuries then
            for _, injury in pairs(injuries:GetChildren()) do injury:Destroy() end
            injuries.ChildAdded:Connect(function(child)
                task.wait()
                child:Destroy()
            end)
        end
    end
end)

-- // ESP
task.spawn(function()
    if ZeldHub.ESP.Esp then
        local function attachESP(nape)
            if not nape:FindFirstChild("NapeESP") then
                local adorn = Instance.new("BoxHandleAdornment")
                adorn.Name = "NapeESP"
                adorn.Adornee = nape
                adorn.AlwaysOnTop = true
                adorn.ZIndex = 5
                adorn.Size = ZeldHub.ESP.Size
                adorn.Transparency = 0.5
                adorn.Color3 = Color3.fromRGB(ZeldHub.ESP.Color.R, ZeldHub.ESP.Color.G, ZeldHub.ESP.Color.B)
                adorn.Parent = nape
            end
        end

        workspace.DescendantAdded:Connect(function(desc)
            task.wait(0.5)
            if desc.Name == "Nape" and desc:IsA("BasePart") then
                attachESP(desc)
            end
        end)
    end
end)

-- // Auto Chests
task.spawn(function()
    local chestsUI = PlayerGui:WaitForChild("Interface"):WaitForChild("Chests")
    
    task.spawn(function()
        while task.wait(1) do
            if ZeldHub.Raids.AutoFreeChest and chestsUI:FindFirstChild("Free") then
                -- Add click simulation logic here
            end
        end
    end)
    
    task.spawn(function()
        while task.wait(1) do
            if ZeldHub.Raids.AutoPremiumChest and chestsUI:FindFirstChild("Premium") then
                -- Add click simulation logic here
            end
        end
    end)
end)

-- // Discord Webhook
task.spawn(function()
    local function getText(path)
        local current = PlayerGui
        for _, name in ipairs(string.split(path, ".")) do
            if current then current = current:FindFirstChild(name) end
        end
        return current and current.Text or "0"
    end

    while task.wait(1) do
        if ZeldHub.Webhook.Enabled and ZeldHub.Webhook.URL ~= "" then
            local timeTaken = getText("Interface.Rewards.Main.Info.Main.Stats.Time_Taken.Amount")
            
            if timeTaken ~= "0" then
                local dmgDealt = getText("Interface.Rewards.Main.Info.Main.Stats.Damage_Dealt.Amount")
                local payload = {
                    username = ZeldHub.Webhook.DisplayUsername and (LocalPlayer.Name .. " (ZeldHub)") or "ZeldHub",
                    embeds = {{
                        title = "AOT:R Rewards",
                        color = 12104036,
                        fields = {
                            {name = "**Stats:**", value = string.format("%s Time Taken\n%s Damage Dealt", timeTaken, dmgDealt), inline = true}
                        },
                        footer = {text = "Sent at: " .. os.date("%d-%b-%Y %I:%M %p")}
                    }}
                }

                pcall(function()
                    HttpService:RequestAsync({
                        Url = ZeldHub.Webhook.URL,
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = HttpService:JSONEncode(payload)
                    })
                end)
            end
        end
    end
end)

-- // Titan Ripper (Skill Spam)
task.spawn(function()
    local lastUsed = 0
    while task.wait(0.1) do
        if ZeldHub.General.TitanRipper then
            -- Replace "14" with actual skill ID depending on user class/logic
            if tick() - lastUsed >= 0.4 then
                local success = pcall(function()
                    POST_Remote:InvokeServer("S_Skills", "Usage", "14", false)
                end)
                if success then lastUsed = tick() end
            end
        end
    end
end)