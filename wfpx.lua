repeat wait() until game:IsLoaded()
wait(1)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
game.NetworkClient.ChildRemoved:Connect(function()
  game:GetService("TeleportService"):Teleport(5956785391)
end)
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        game:GetService("TeleportService"):Teleport(5956785391)
    end
end)
local function master()
print("executed")
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
	local TeleportCheck = false
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
	if (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfpx.lua'))()")
	end
end)
local success, error = pcall(function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local placeId = game.PlaceId
local TeleportService = game:GetService("TeleportService")
			
if placeId == 5956785391 then
local args = {
    [1] = "join",
    [2] = "XTdhpyRr",
    [3] = 17387482786
}

game:GetService("ReplicatedStorage"):WaitForChild("handle_privateserver"):InvokeServer(unpack(args))
    
elseif placeId == 13883059853 then
game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = true
function RemoveDMG()
   local part  =  game:GetService("StarterPlayer").StarterPlayerScripts.Client_Modules.Modules.Extra.Damage_Text

   local part1 =  game:GetService("ReplicatedStorage").Assets.Extras.Damage_Text

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

local function wd()
		local args = {
    	[1] = true
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(unpack(args))
		wait(3)
end
coroutine.wrap(wd)()
-- Auto collect chest
local function collectChest()
     while task.wait() do
             for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
                 if v.Name == "Loot_Chest" and v:FindFirstChild("Drops") then
                     if #v.Drops:GetChildren() == 0 then
                         v:Destroy()
                     else
                         for _, drop in pairs(v.Drops:GetChildren()) do
                             local args = {
                                 [1] = drop.Name
                             }
 
                             v.Add_To_Inventory:InvokeServer(unpack(args))
                             if #v.Drops:GetChildren() == 0 then
                                 v:Destroy()
                             end
                         end
                     end
                 end
             end
         end
end
coroutine.wrap(collectChest)()

-- Loop to initiate a skill
local function initiateSkill()
    while task.wait() do
        local Handle_Initiate_S_ = ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
        Handle_Initiate_S_:InvokeServer("skil_ting_asd", Players.LocalPlayer, "arrow_knock_back", 5)
        wait(14)
    end
end
coroutine.wrap(initiateSkill)()

-- Loop to attack mobs
local function attackMobs()
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

task.spawn(attackMobs)

				
-- Loop to delete specific parts
local specificNames = {"Map", "InteractiveShopItems", "MugenTrain", "PrivateServerDummies", "cup game", "Bandage", "BeastTrainer", "BigLight", "Black Smith", "Board", "Boulder_To_Split", "Buy_Big_Gourd", "Buy_Gourd", "Buy_Medium_Gourd", "Chair", "Civilian", "Civilian 2", "ClashTrainer", "Conductor", "Customization data ting", "Demon Guy", "Demon Slayer", "Fishing_Rod2", "Flame Trainer", "Grandpa Wagwon's Wagon", "Green_Crystal", "Mae", "Malik", "Mark", "Mist Trainer", "Model", "Ouw0pp", "Part", "Patrick", "Policeman", "Rina", "RinaDesk", "Rock", "Snow Trainer", "Soryu Trainer", "Beast Trainer", "Sound Trainer", "Target_Training", "Tyrone", "potion_sails_man", "thing", "Meditate_Mat", "Push_Ups_Mat", "Union", "MeshPart", "Floor", "Mist"}
local isLooping = true
local function deleteSpecificParts()
    while task.wait() do
	if isLooping then
            for _, part in pairs(Workspace:GetChildren()) do
                if table.find(specificNames, part.Name) then
                    part:Destroy()
            end
        end
    end
end
end
coroutine.wrap(deleteSpecificParts)()

local function preventFall()
    while task.wait() do
        local antifall3 = Instance.new("BodyVelocity", Players.LocalPlayer.Character.HumanoidRootPart)
        antifall3.Velocity = Vector3.new(0, 0, 0)
        antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        
        wait() -- It's a good idea to yield control periodically to prevent performance issues
    end

    -- This part should be outside the while loop
    if antifall3 then
        antifall3:Destroy()
    end
end
coroutine.wrap(preventFall)()

	getgenv().TweenSpeed = 100			
local TweenService = game:GetService("TweenService")
local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
local Workspace = game:GetService("Workspace")
local Player = game.Players.LocalPlayer
local Goal = {}

-- Function to calculate the distance to the Endpoint
local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
        Endpoint = Vector3.new(Endpoint.Position.X, Root.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
        Endpoint = Vector3.new(Endpoint.Position.X, Root.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - Root.Position).Magnitude
    return Magnitude
end

-- Function to perform a tween to the specified endpoint
local function TweenTo(Endpoint)
    if typeof(Endpoint) == "Instance" then
        Endpoint = Endpoint.CFrame
    end

    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local tweenInfo = TweenInfo.new(Distance / getgenv().TweenSpeed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(Root, tweenInfo, {CFrame = Endpoint})

    tween:Play()

    function TweenFunc:Cancel()
        tween:Cancel()
        return false
    end

    if Distance <= 100 then
        Root.CFrame = Endpoint
        tween:Cancel()
        return false
    end

    return TweenFunc
end

-- List of paths to check
local pathsToCheck = {
    { name = "Sound Trainee", position = Vector3.new(1859, 670, -2801), path = Workspace.Mobs.Bosses.Sound_Trainee["Sound Trainee"], time = 10, num = 2 },
    { name = "Tengen", position = Vector3.new(1463, 493, -3118), path = Workspace.Mobs.Bosses.Tengen, time = 2, num = 3 },
    { name = "Douma", position = Vector3.new(-2, 519, -1690), path = Workspace.Mobs.Bosses.Douma, time = 5, num = 3 },
    { name = "Renpeke", position = Vector3.new(-1289, 607, -664), path = Workspace.Mobs.Bosses["Flame Trainee"], time = 5, num = 2 },
    { name = "Swampy", position = Vector3.new(-1349, 607, -205), path = Workspace.Mobs.Bosses.Swampy, time = 1, num = 2 },
    { name = "Akaza", position = Vector3.new(2008, 563, -107), path = Workspace.Mobs.Bosses.Akaza, time = 10, num = 3 },
    { name = "Inosuke", position = Vector3.new(1596, 307, -394), path = Workspace.Mobs.Bosses.Inosuke, time = 2, num = 2 },
    { name = "Enmu", position = Vector3.new(1580, 490, -667), path = Workspace.Mobs.Bosses.Enmu, time = 3, num = 2 },
    { name = "Rengoku", position = Vector3.new(3659, 680, -355), path = Workspace.Mobs.Bosses.Rengoku, time = 6, num = 3 },
    { name = "Muichiro", position = Vector3.new(4512, 680, -553), path = Workspace.Mobs.Bosses.Muichiro, time = 3, num = 2 },
}

-- Function to check and move to a specified path
local function CheckAndMove(pathName, position, pathToCheck, time, num)
    print("Going to " .. pathName)
    local tweenFunc = TweenTo(position)
    wait(time)

    local movementTimer = 0
    local prevPosition = Root.Position

    while task.wait() do
        if pathToCheck and #pathToCheck:GetChildren() == num then
            print("Moving to the next path")
            tweenFunc:Cancel()
            break
        end

        local currentPosition = Root.Position
        if currentPosition == prevPosition then
            movementTimer = movementTimer + 1
            if movementTimer > 1 then
                tweenFunc:Cancel()
                break
            end
        else
            movementTimer = 0
        end
        prevPosition = currentPosition
    end
end

-- Main function to iterate through paths and move the player
local function main()
    for _, pathInfo in ipairs(pathsToCheck) do
        CheckAndMove(pathInfo.name, pathInfo.position, pathInfo.path, pathInfo.time, pathInfo.num)
    end
    wait(1)
    main()
end
				
coroutine.wrap(main)()
				wait()
				RemoveDMG()
				wait()
				RemovePARTICLES()
--game:GetService("RunService"):Set3dRenderingEnabled(false)
wait(300)
local isLooping = false
			
wait(3600)
local TeleportService = game:GetService("TeleportService")
TeleportService:Teleport(5956785391)
		
else
    print("Wrong game")
end
	end)
if not success then
    print("An error occurred:", error)
end
end
master()
