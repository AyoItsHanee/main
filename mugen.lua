repeat
    wait()
until game:IsLoaded()
print("Roblox loaded")

if hanee then
    print("Script is aleady running")
    return
end

if formugen then
    print("Paused farming wfps")
    return
end
getgenv().hanee = true
local spawn, wait = task.spawn, task.wait
local bossrun = true
local KeepSC = true
local checkore = true
--[[
game.NetworkClient.ChildRemoved:Connect(
    function()
        if game.PlaceId == 5956785391 then
            game:GetService("TeleportService"):Teleport(9321822839)
        elseif game.PlaceId == 13883059853 then
            game:GetService("TeleportService"):Teleport(5956785391)
        elseif game.PlaceId == 9321822839 then
            game:GetService("TeleportService"):Teleport(5956785391)
        end
    end
)
    ]]--


	queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or (delta and delta.queue_on_teleport)
	local TeleportCheck = false
	game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
        if KeepSC then
		    if (not TeleportCheck) and queueteleport then
			    TeleportCheck = true
			    queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/mugen.lua'))() getgenv().hanee = false")
			end
		elseif formugen then
            if (not TeleportCheck) and queueteleport then
			    TeleportCheck = true
			    queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))() getgenv().hanee = false getgenv().formugen = false")
			end
        else
			if (not TeleportCheck) and queueteleport then	
			    TeleportCheck = true
			    queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/rah.lua'))() getgenv().hanee = false")
			end
		end
    end)

    --[[
if game.PlaceId == 9321822839 then
    game:GetService("TeleportService"):Teleport(5956785391)
end
]]--

--Wait for the LocalPlayer to be loaded
game:GetService("Players").LocalPlayer:WaitForChild("doneloadinggamepasses")
print("game loaded")

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)

print("Auto Mugen v0.0.0")
local function getLocalPlayerUsername()
    local player = game.Players.LocalPlayer
    if player then
        return player.Name
    else
        return nil
    end
end
-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame
local framsex = Instance.new("Frame")
framsex.Size = UDim2.new(0, 100, 0, 50)
framsex.Position = UDim2.new(0, 300, 0, 0)
framsex.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
framsex.BackgroundTransparency = 0.5
framsex.Parent = screenGui

-- Create a TextButton
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 0.5, 0)
button.Position = UDim2.new(0, 0, 0, 0)
button.Text = "Toggle KeepSC"
button.Parent = framsex

-- Create a TextLabel to display the state of KeepSC
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.5, 0)
label.Position = UDim2.new(0, 0, 0.5, 0)
label.Text = "KeepSC: " .. tostring(KeepSC)
label.Parent = framsex

-- Create a TextButton
local buttonr = Instance.new("TextButton")
buttonr.Size = UDim2.new(0, 100, 0, 25)
buttonr.Position = UDim2.new(0, 400, 0, 0)
buttonr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
buttonr.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonr.Text = "Toggle Rotation"
buttonr.Parent = screenGui

-- Create a TextButton
local buttonsi = Instance.new("TextButton")
buttonsi.Size = UDim2.new(0, 100, 0, 25)
buttonsi.Position = UDim2.new(0, 400, 0, 25)
buttonsi.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
buttonsi.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonsi.Text = "Sell Items"
buttonsi.Parent = screenGui

-- Create a TextButton
local buttonsw = Instance.new("TextButton")
buttonsw.Size = UDim2.new(0, 100, 0, 25)
buttonsw.Position = UDim2.new(0, 400, 0, 50)
buttonsw.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
buttonsw.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonsw.Text = "Sell Weapons"
buttonsw.Parent = screenGui

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
            Duration = 1
        }
    )
end
button.MouseButton1Click:Connect(toggleKeepSC)
-- Function to toggle KeepSC and update UI
local function togglebossrun()
    bossrun = not bossrun
    -- Send notification
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Rotation Toggle",
            Text = "Boss Rotation is now " .. tostring(bossrun),
            Duration = 1
        }
    )
end
buttonr.MouseButton1Click:Connect(togglebossrun)
-- Function to toggle KeepSC and update UI
local function sellis()
    -- Send notification
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Selling All Items..",
            Duration = 1
        }
    )
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoItsHanee/main/main/sellitems.lua"))()
end
buttonsi.MouseButton1Click:Connect(sellis)
-- Function to toggle KeepSC and update UI
local function selliw()
    -- Send notification
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Selling All Weapons..",
            Duration = 1
        }
    )
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AyoItsHanee/main/main/sellitem.lua"))()
end
buttonsw.MouseButton1Click:Connect(selliw)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local placeId = game.PlaceId
local TweenService = game:GetService("TweenService")
local Root = Players.LocalPlayer.Character.HumanoidRootPart
local Goal = {}
_G.TweenSpeed = 300


local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
        Endpoint = Vector3.new(Endpoint.Position.X, Root.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
        Endpoint = Vector3.new(Endpoint.Position.X, Root.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - Root.Position).Magnitude
    return Magnitude
end

function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
        Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local tweenInfo = TweenInfo.new(Distance / _G.TweenSpeed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(Root, tweenInfo, {CFrame = Endpoint})

    -- Play the tween
    tween:Play()
    -- Function to cancel the tween
    function TweenFunc:Cancel()
        tween:Cancel()
        return false
    end
    return TweenFunc
end

local function af()
    while task.wait() do
        local antifall3 = Instance.new("BodyVelocity", Players.LocalPlayer.Character.HumanoidRootPart)
        antifall3.Velocity = Vector3.new(0, 0, 0)
        antifall3.MaxForce = Vector3.new(100000, 100000, 100000)
        --antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        wait(.1)
    end

    -- This part should be outside the while loop
    if antifall3 then
        antifall3:Destroy()
    end
end

local function arrowka()
    -- Loop to initiate a skill
spawn(
    function()
        while task.wait() do
            local Handle_Initiate_S_ = ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
            Handle_Initiate_S_:InvokeServer("skil_ting_asd", Players.LocalPlayer, "arrow_knock_back", 5)
            wait(14)
        end
    end
)

-- Loop to attack mobs
spawn(
    function()
        while task.wait() do
            if KeepSC then
                local hitCounter = {}
                for _, mob in pairs(Workspace.Mobs:GetDescendants()) do
                    if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
                        local modelId = mob:GetFullName()

                        if not hitCounter[modelId] then
                            hitCounter[modelId] = 0
                        end

                        if hitCounter[modelId] < 2 then
                            local humanoid = mob:FindFirstChildOfClass("Humanoid")
                            if humanoid and humanoid.Health > 0 then
                                local Handle_Initiate_S_ = ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
                                Handle_Initiate_S_:InvokeServer(
                                    "arrow_knock_back_damage",
                                    Players.LocalPlayer.Character,
                                    mob.HumanoidRootPart.CFrame,
                                    mob,
                                    500,
                                    500
                                )
                                hitCounter[modelId] = hitCounter[modelId] + 1
                                wait(0.1)
                            end
                        end
                    end
                end
            else
                wait(0.1)
            end
            wait(0.1)
        end
    end
)
end

local function autocollect()
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
        wait(1)
    end
end

function RemoveDMG()
    local part = game:GetService("StarterPlayer").StarterPlayerScripts.Client_Modules.Modules.Extra.Damage_Text

    local part1 = game:GetService("ReplicatedStorage").Assets.Extras.Damage_Text

    local part2 = game:GetService("Players").LocalPlayer.PlayerScripts.Client_Modules.Modules.Extra.Damage_Text

    if part then
        part:Destroy()
    end

    if part1 then
        part1:Destroy()
    end

    if part2 then
        part2:Destroy()
    end
end

function RemovePARTICLES()
    local COINS = game:GetService("ReplicatedStorage").Assets.Extras.Coin

    local PARTICLES = game:GetService("ReplicatedStorage").Assets.Particles.Parts

    if COINS then
        COINS:Destroy()
    end

    if PARTICLES then
        PARTICLES:Destroy()
    end
end

local function wardrums()
    local args = {
        [1] = true
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(
        unpack(args)
    )
    wait(3)
end

local function simulateEPress()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
	task.wait(0.05) -- brief hold, adjust if needed
	game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

local function delwarning()
    local mugenTrain = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Mugen_Train", 5)
    if mugenTrain then
	    local overheadUi = mugenTrain:FindFirstChild("NPC_Over_head_ui")
	    if overheadUi then
		    overheadUi:Destroy()
		    print("NPC_Over_head_ui destroyed")
	    end
    end
end


if game.PlaceId == 5956785391 then
    local args = {
        [1] = "join",
        [2] = "YxGTB984",
        [3] = 17387482786
    }

    game:GetService("ReplicatedStorage"):WaitForChild("handle_privateserver"):InvokeServer(unpack(args))
    wait(30)
    game:GetService("TeleportService"):Teleport(5956785391)
elseif game.PlaceId == 13883059853 then
    --game:GetService("RunService"):Set3dRenderingEnabled(false)
    spawn(
        function()
            while task.wait() do
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        v.CanCollide = false
                    end
                end
                wait(0.1)
            end
        end
    )

    -- Create a Frame
    local frame1 = Instance.new("Frame")
    frame1.Size = UDim2.new(0, 100, 0, 25)
    frame1.Position = UDim2.new(0, 200, 0, 0)
    frame1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame1.BackgroundTransparency = 0.5
    frame1.Parent = screenGui

    -- Create a TextLabel to display the Ore value
    local oreLabel = Instance.new("TextLabel")
    oreLabel.Size = UDim2.new(1, 0, 1, 0)
    oreLabel.Position = UDim2.new(0, 0, 0, 0)
    oreLabel.Text = "Ore:"
    oreLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    oreLabel.BackgroundTransparency = 1
    oreLabel.Parent = frame1

    local function checkamount()
        local oream =
            game:GetService("ReplicatedStorage")["Player_Data"][getLocalPlayerUsername()].Inventory.Items:WaitForChild(
            "Ore"
        ).Amount
        local oreValue = oream.Value
        return oreValue
    end

    -- Function to update the Ore value in the UI
    local function updateOreLabel()
        local upa = checkamount()
        oreLabel.Text = "Ore: " .. tostring(upa)
    end

    -- Update the Ore value every second
    spawn(
        function()
            while task.wait() do
                if checkore then
                    updateOreLabel()
                end
                wait(1)
            end
        end
    )

    game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = true

    spawn(wardrums)

    spawn(autocollect)

    spawn(arrowka)

    spawn(af)

    print("Going to Mugen Train")
    local tween = Tween(CFrame.new(728, 501, 1098))
    while (Root.Position - Vector3.new(728, 501, 1098)).Magnitude > 1 do
        wait(0.1) -- Check every 0.1 seconds
    end
    print("hi")


    RemoveDMG()
    RemovePARTICLES()
elseif game.PlaceId == 9321822839 then
    game:GetService("TeleportService"):Teleport(5956785391)
elseif game.PlaceId == 11468034852 then
    wait(70)
    spawn(delwarning)
    print("Going to skip dialog")
    local tween = Tween(CFrame.new(5523, -53, 2181))
    while (Root.Position - Vector3.new(5523, -53, 2181)).Magnitude > 1 do
        wait(0.1) -- Check every 0.1 seconds
    end
    wait(1)
    simulateEPress()

    wait(15)

    local tween = Tween(CFrame.new(2022, 24, -62))
    while (Root.Position - Vector3.new(2022, 24, -62)).Magnitude > 1 do
        wait(0.1) -- Check every 0.1 seconds
    end

    local tween = Tween(CFrame.new(2376, 24, -82))
    while (Root.Position - Vector3.new(2376, 24, -82)).Magnitude > 1 do
        wait(0.1) -- Check every 0.1 seconds
    end

    spawn(wardrums)
    spawn(autocollect)
    spawn(arrowka)

    local value = tonumber(someEnumItem)

    print("Waiting Clash...")
    local clashUi = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	    :WaitForChild("universal_client_scripts")
	    :WaitForChild("Clashing2")
	    :WaitForChild("Clash_Ui2")

    -- Wait until Enabled becomes true
    if not clashUi.Enabled then
	    clashUi:GetPropertyChangedSignal("Enabled"):Wait()
    end

    -- Script continues here once Clash_Ui2 is Enabled
    print("Clash_Ui2 is now enabled, continuing...")
    wait(7)
    local VIM = game:GetService("VirtualInputManager")
    local function pressKey(key)
        VIM:SendKeyEvent(true, key, false, game)
        wait()
        VIM:SendKeyEvent(false, key, false, game)
    end
    spawn(function()
        while task.wait() do
            pressKey(Enum.KeyCode[game.Players.LocalPlayer.PlayerGui["universal_client_scripts"].Clashing2["Clash_Ui2"].Holder:WaitForChild('Front').Text])
        end
    end)

    local akaza = workspace
	    :WaitForChild("Mobs")
	    :WaitForChild("Npc_Configuration")
	    :WaitForChild("Akaza")

    print("Akaza now exists, continuing...")
    wait(60)
    game:GetService("TeleportService"):Teleport(5956785391)
else
    print("Wrong game")
end
