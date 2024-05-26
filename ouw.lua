--loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
repeat wait() until game:IsLoaded()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
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

local orbTypes = {
    {name = "HealthRegen", enabled = true},
    {name = "StaminaRegen", enabled = true},
    {name = "BloodMoney", enabled = true},
    {name = "DoublePoints", enabled = true},
    {name = "InstaKill", enabled = true},
    {name = "WisteriaPoisoning", enabled = true},
    {name = "MobCamouflage", enabled = true}
}

local function createOrbToggler(orb)
    spawn(function()
        while task.wait() do
            if orb.enabled then
                for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                    if v:IsA("Model") and v.Name == orb.name then
                        player.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
                    end
                end
            end
        end
    end)
end

	local function orbz()
for _, orb in ipairs(orbTypes) do
    createOrbToggler(orb)
end
	end
		local function orbx()
			while task.wait() do
				orbz()
				wait()
			end
		end

	
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
local function sps()
    while true do
        local roomName = findRoomName()
        if roomName then
            local spawnpoints = workspace.Map:FindFirstChild(roomName):FindFirstChild("Spawnpoints")
            if spawnpoints then
                local parts = spawnpoints:GetChildren()
                if #parts > 0 then
                    local randomPart = parts[math.random(1, #parts)]
                    if randomPart and randomPart:IsA("BasePart") then
                        local destination = randomPart.Position + Vector3.new(0, 5, 0)
                        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out) -- Adjust tweenTime as needed
                        local tween = game.TweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(destination)})
                        tween:Play()
                        wait(3)
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
        task.wait(1) -- Add a wait to prevent the loop from running too fast
    end	
end
	
	local function wd()
		local args = {
    	[1] = true
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(unpack(args))
		wait(3)
end
coroutine.wrap(wd)()

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
    while task.wait() do
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
                        Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage", Players.LocalPlayer.Character, mob.HumanoidRootPart.CFrame, mob, 500, 500)
                        hitCounter[modelId] = hitCounter[modelId] + 1
                    end
                end
            end
        end
    end
    end

    -- Create and start a separate coroutine for the looped function
    local loopC2 = coroutine.create(loopFunction)
    coroutine.resume(loopC2)
	
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
		wait(1)
		coroutine.wrap(sps)()
			coroutine.wrap(orbx)()
--[[    wait(600)
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
]]--
end
--TeleportService:Teleport(9321822839)
else
    print("Place ID doesn't match")
end
