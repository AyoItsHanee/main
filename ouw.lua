--loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
repeat wait()
until game:IsLoaded()
local placeId = game.PlaceId
COREGUI = game:GetService("CoreGui")
local Dir = COREGUI:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
	Dir.DescendantAdded:Connect(function(Err)
		if Err.Name == "ErrorTitle" then
			Err:GetPropertyChangedSignal("Text"):Connect(function()
				if Err.Text:sub(0, 12) == "Disconnected" then
						Players.LocalPlayer:Kick("\nRejoining...")
						TeleportService:Teleport(5956785391, Players.LocalPlayer)
				end
			end)
		end
	end)

if placeId == 5956785391 then
    local TeleportService = game:GetService("TeleportService")
    wait()
    TeleportService:Teleport(9321822839)
elseif placeId == 9321822839 then
    local myUsername = "BRUHBRUH1233234" -- Replace with your actual username
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
    else
        print("Username not found in ReplicatedStorage.parties")
    end

    game:GetService("ReplicatedStorage"):WaitForChild("queu_up"):FireServer()
    wait(10)
elseif placeId == 11468075017 then
    wait(1)
    local Info = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
    local Goal = {}
    local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
    Goal.CFrame = CFrame.new(5022, -148, 2032)
    game:GetService("TweenService"):Create(Root, Info, Goal):Play()
    wait(1)
    Goal.CFrame = CFrame.new(4988, -148, 2030)
    game:GetService("TweenService"):Create(Root, Info, Goal):Play()
    wait(11)
    Goal.CFrame = CFrame.new(5022, -148, 2032)
    game:GetService("TweenService"):Create(Root, Info, Goal):Play()
    wait(11)
    local TeleportService = game:GetService("TeleportService")
    local function destroyModels(modelNames)
        for _, modelName in pairs(modelNames) do
            if game:GetService("Workspace").Map:FindFirstChild(modelName) then
                for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                    if v:IsA("Model") and v.Name == modelName then
                        v:Destroy()
                    end
                end
            end
        end
    end
    
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local toggleTeleport = false
local tweenTime = 1 -- Change this value to adjust tween duration (in seconds)

    -- Function to check if the Timer GUI is visible
    local function isTimerGuiNotVisible()
        local player = game:GetService("Players").LocalPlayer
        local timerGui = player.PlayerGui:WaitForChild("top_ui"):FindFirstChild("Timer")
        
        if timerGui and timerGui.Visible == false then
            return false
        else
            return true
        end
    end
    
    -- Coroutine function
    local function mainCoroutine()
        while isTimerGuiNotVisible() do
            wait(1) -- Adjust the delay as needed, e.g., check every second
        end
        
        -- Timer GUI is not visible, so teleport to the desired game
        TeleportService:Teleport(9321822839)
    end
    
    local timeout = 25 -- Set the timeout in seconds (change this as needed)
    -- Function to check if the Timer GUI is visible
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
        while true do
            local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
            Handle_Initiate_S_:InvokeServer("skil_ting_asd", game.Players.LocalPlayer, "arrow_knock_back", 5)
            wait(14)
        end
    end

    local loopC1 = coroutine.create(loopBp)
    coroutine.resume(loopC1)

    local function loopFunction()
        while true do
            local success, error = pcall(function()
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
                                local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
                                Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage", game.Players.LocalPlayer.Character, v.HumanoidRootPart.CFrame, v, 500, 500)
                                hitCounter[modelId] = hitCounter[modelId] + 1
                            else
                                -- The humanoid health is 0, change to another model
                                -- Replace the code below with the logic to change the model
                                print("Model with health 0:", modelId)
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
            end)

            if not success then
                print("An error occurred:", error)
            end

            -- Add a delay between iterations to prevent excessive server load
            wait(1) -- Adjust the delay time as desired
        end
    end

    -- Create and start a separate coroutine for the looped function
    local loopC2 = coroutine.create(loopFunction)
    coroutine.resume(loopC2)

        -- Create and start a separate coroutine for destroying models
        local destroyModelsCoroutine = coroutine.create(function()
            while true do
                local modelsToDestroy = {
                    "MobCamouflage",
                    "HealthRegen",
                    "StaminaRegen",
                    "BloodMoney",
                    "DoublePoints",
                    "InstaKill",
                    "WisteriaPoisoning"
                }
    
                destroyModels(modelsToDestroy)
    
                wait(1)  -- Adjust the delay (in seconds) between each loop iteration if needed
            end
        end)
    
        coroutine.resume(destroyModelsCoroutine)

    local startTime = tick() -- Record the start time
-- Wait until the Timer GUI is visible or until the timeout is reached
while not isTimerGuiVisible() do
    if tick() - startTime >= timeout then
        print("Timeout reached. Timer GUI did not become visible.")
        break -- Exit the loop if the timeout is reached
    end
    wait(1) -- Adjust the delay as needed, e.g., check every second
end
-- Check if the Timer GUI became visible or not
if isTimerGuiVisible() then
    print("Timer GUI is now visible, continuing with the script...")
    wait()
    local loopCM = coroutine.create(mainCoroutine)
    coroutine.resume(loopCM)
    wait(600)
    local p = game.Players.LocalPlayer
    local c = p.Character
    local h = c:FindFirstChild("Humanoid")

-- Check if your character and humanoid exist
if c and h then
    -- Set the humanoid's health to 0 to "kill" the character
    h.Health = 0
else
    print("Character or humanoid not found.")
end
    wait(5)
    game:GetService("ReplicatedStorage"):WaitForChild("TeleportToShop"):FireServer()
    wait(10)
    TeleportService:Teleport(9321822839)
end
TeleportService:Teleport(9321822839)
else
    print("Place ID doesn't match")
end
