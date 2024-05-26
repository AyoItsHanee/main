-- Check if the game is loaded
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
wait(2)
    local myUsername = "ASUS_CITY1" -- Replace with your actual username
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
        wait(1)
        game:GetService("ReplicatedStorage"):WaitForChild("queu_up"):FireServer()
    else
        print("Username not found in ReplicatedStorage.parties")
    end

elseif placeId == 11468075017 then --Ouwigahara
wait(10)

local function loopBp()
    while true do
	local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
	Handle_Initiate_S_:InvokeServer("skil_ting_asd", game.Players.LocalPlayer, "arrow_knock_back", 5)
	wait(14)
    end
end

local loopCoroutine = coroutine.create(loopBp)
coroutine.resume(loopCoroutine)

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
                wait() -- Adjust the delay time as desired
            end
			end

-- Create and start a separate coroutine for the looped function
local loopCoroutine = coroutine.create(loopFunction)
coroutine.resume(loopCoroutine)

    wait(5)
    
    local player = game.Players.LocalPlayer
    
    function teleport(position)
        if player.Character then
            player.Character:MoveTo(position)
        end
    end
    
    teleport(Vector3.new(4988, -148, 2030))
    wait(15)

local function loopOrb()
-- Function to destroy a model with a specific name if it exists
local function destroyModelIfExists(modelName)
    if _G["Destroy" .. modelName] and game:GetService("Workspace").Map:FindFirstChild(modelName) then
        for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
            if v:IsA("Model") and v.Name == modelName then
                v:Destroy()
            end
        end
    end
end

-- Connect to Heartbeat and call the function for each model you want to destroy
game:GetService("RunService").Heartbeat:Connect(function()
    destroyModelIfExists("MobCamouflage")
    destroyModelIfExists("HealthRegen")
    destroyModelIfExists("StaminaRegen")
    destroyModelIfExists("BloodMoney")
    destroyModelIfExists("DoublePoints")
    destroyModelIfExists("InstaKill")
    destroyModelIfExists("WisteriaPoisoning")
end)
wait(1)
end
local loopCoroutine = coroutine.create(loopOrb)
coroutine.resume(loopCoroutine)
    
print("Injected")
print("Loaded")
print("Press T to toggle the teleport loop")
-- Define variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local toggleTeleport = false
local tweenTime = 1 -- Change this value to adjust tween duration (in seconds)

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
local function tweenToRandomPart()
    local roomName = findRoomName()
    if roomName then
        local spawnpoints = workspace.Map:FindFirstChild(roomName):FindFirstChild("Spawnpoints")
        if spawnpoints then
            local parts = spawnpoints:GetChildren()
            if #parts > 0 then
                local randomPart = parts[math.random(1, #parts)]
                if randomPart and randomPart:IsA("BasePart") then
                    local destination = randomPart.Position + Vector3.new(0, 5, 0)
                    local tweenInfo = TweenInfo.new(tweenTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                    local tween = game.TweenService:Create(root, tweenInfo, {CFrame = CFrame.new(destination)})
                    tween:Play()
					wait(5)
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
end

local function performActions(duration)
    local startTime = tick()

    while tick() - startTime < duration do
	tweenToRandomPart()
	wait(tweenTime)
    end

    -- Actions completed after the specified duration
    print("10 Minutes has been passed")
end
performActions(99999999999) --default 610
print("Going back to lobby")
    
    wait(5)
    
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
    
    wait(10)
    game:GetService("ReplicatedStorage"):WaitForChild("TeleportToShop"):FireServer()
	wait(5)
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(9321822839)
else
    print("Place ID doesn't match")
end
