repeat wait() until game:IsLoaded()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local placeId = game.PlaceId
local TeleportService = game:GetService("TeleportService")
COREGUI = game:GetService("CoreGui")
local Dir = COREGUI:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
	Dir.DescendantAdded:Connect(function(Err)
		if Err.Name == "ErrorTitle" then
			Err:GetPropertyChangedSignal("Text"):Connect(function()
				if Err.Text:sub(0, 12) == "Disconnected" then
						Players.LocalPlayer:Kick("\nRejoining...")
						wait()
						TeleportService:Teleport(5956785391, Players.LocalPlayer)
				end
			end)
		end
	end)

if placeId == 5956785391 then
local args= {
    [1] = "join",
    [2] = "smQpwZit",
    [3] = 13881804983
}
game:GetService("ReplicatedStorage").handle_privateserver:InvokeServer(unpack(args))
    
elseif placeId == 13883059853 then
-- Auto collect chest
local AutoCollectChest = true
local function collectChest()
    while wait() do
        if AutoCollectChest then
            for _, chest in pairs(Workspace.Debree:GetChildren()) do
                if chest.Name == "Loot_Chest" then
                    for _, drop in pairs(chest:FindFirstChild("Drops"):GetChildren()) do
                        chest.Add_To_Inventory:InvokeServer(drop.Name)
                        wait(0.1)
                        drop:Destroy()
                    end
                end
            end
        end
    end
end

coroutine.wrap(collectChest)()

-- Loop to initiate a skill
local function initiateSkill()
    while true do
        local Handle_Initiate_S_ = ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
        Handle_Initiate_S_:InvokeServer("skil_ting_asd", Players.LocalPlayer, "arrow_knock_back", 5)
        wait(14)
    end
end

coroutine.wrap(initiateSkill)()

-- Loop to attack mobs
local function attackMobs()
    while true do
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

        wait()
    end
end

coroutine.wrap(attackMobs)()

-- Loop to prevent falling
local function preventFall()
    while true do
        local antifall3 = Instance.new("BodyVelocity", Players.LocalPlayer.Character.HumanoidRootPart)
        antifall3.Velocity = Vector3.new(0, 0, 0)
        antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        wait()
    end
end

coroutine.wrap(preventFall)()

-- Loop to delete specific parts
local specificNames = {"Map", "InteractiveShopItems", "MugenTrain", "PrivateServerDummies", "cup game", "Bandage", "BeastTrainer", "BigLight", "Black Smith", "Board", "Boulder_To_Split", "Buy_Big_Gourd", "Buy_Gourd", "Buy_Medium_Gourd", "Chair", "Civilian", "Civilian 2", "ClashTrainer", "Conductor", "Customization data ting", "Demon Guy", "Demon Slayer", "Fishing_Rod2", "Flame Trainer", "Grandpa Wagwon's Wagon", "Green_Crystal", "Mae", "Malik", "Mark", "Mist Trainer", "Model", "Ouw0pp", "Part", "Patrick", "Policeman", "Rina", "RinaDesk", "Rock", "Snow Trainer", "Soryu Trainer", "Beast Trainer", "Sound Trainer", "Target_Training", "Tyrone", "potion_sails_man", "thing", "Meditate_Mat", "Push_Ups_Mat", "Union", "MeshPart", "Floor", "Mist"}

local isLooping = true

local function deleteSpecificParts()
    while wait() do
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

local TweenService = game:GetService("TweenService")
local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
local Goal = {}
-- Function to teleport to specific paths
local pathsToCheck = {
    {
        name = "Sound Trainee",
        position = Vector3.new(1859, 670, -2801),
        path = Workspace.Mobs.Bosses.Sound_Trainee["Sound Trainee"],
		time = 10,
		num = 2
    },
    {
        name = "Tengen",
        position = Vector3.new(1463, 493, -3118),
        path = Workspace.Mobs.Bosses.Tengen,
		time = 2,
		num = 3
    },
        {
        name = "Douma",
        position = Vector3.new(-2, 519, -1690),
        path = Workspace.Mobs.Bosses.Douma,
		time = 5,
		num = 3
    },
        {
        name = "Renpeke",
        position = Vector3.new(-1289, 607, -664),
        path = Workspace.Mobs.Bosses["Flame Trainee"],
		time = 5,
		num = 2
    },
        {
        name = "Swampy",
        position = Vector3.new(-1349, 607, -205),
        path = Workspace.Mobs.Bosses.Swampy,
		time = 1,
		num = 2
    },
        {
        name = "Akaza",
        position = Vector3.new(2008, 563, -107),
        path = Workspace.Mobs.Bosses.Akaza,
		time = 10,
		num = 3
    },
        {
        name = "Inosuke",
        position = Vector3.new(1596, 307, -394),
        path = Workspace.Mobs.Bosses.Inosuke,
		time = 2,
		num = 2
    },
        {
        name = "Enmu",
        position = Vector3.new(1580, 490, -667),
        path = Workspace.Mobs.Bosses.Enmu,
		time = 2,
		num = 2
    },
        {
        name = "Rengoku",
        position = Vector3.new(3659, 680, -355),
        path = Workspace.Mobs.Bosses.Rengoku,
		time = 5,
		num = 3
    },
        {
        name = "Muichiro",
        position = Vector3.new(4512, 680, -553),
        path = Workspace.Mobs.Bosses.Muichiro,
		time = 2,
		num = 2
    },
    -- Add other paths here similarly
}

local movementTimer = 0
local prevPosition = Root.Position
local function CheckAndMove(pathName, position, pathToCheck, Time, Num)
    print("Going to " .. pathName)
    Goal.CFrame = CFrame.new(position)
    local tween = TweenService:Create(Root, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), Goal)
    tween:Play()
    wait(Time + 2)
    local movementTimer = 0
    local prevPosition = Root.Position

    while wait() do
        wait(1)
        
        if pathToCheck and #pathToCheck:GetChildren() <= Num then
            print("Moving to the next path")
            break
        end
        
        local currentPosition = Root.Position
        if currentPosition == prevPosition then
            movementTimer = movementTimer + 1
            if movementTimer > 1 then
                print("Character isn't moving, stopping the tween")
                tween:Cancel() -- Stop the tween
                break
            end
        else
            movementTimer = 0
        end
        prevPosition = currentPosition
    end
end

local function main()
    for _, pathInfo in ipairs(pathsToCheck) do
        CheckAndMove(pathInfo.name, pathInfo.position, pathInfo.path, pathInfo.time, pathInfo.num)
        wait(1)
    end
    wait(10)
    main()
end

coroutine.wrap(main)()
game:GetService("RunService"):Set3dRenderingEnabled(false)
else
    print("Wrong game")
end
