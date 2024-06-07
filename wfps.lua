repeat wait() until game:IsLoaded()
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local function master()
    print("executed")
    local success, error = pcall(function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")
        local placeId = game.PlaceId
        local TeleportService = game:GetService("TeleportService")

        local function setupRejoinHandler()
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
        end

        local function autoCollectChest()
            while task.wait(5) do  -- Reduced frequency to lower load
                for _, chest in pairs(Workspace.Debree:GetChildren()) do
                    if chest.Name == "Loot_Chest" then
                        for _, drop in pairs(chest:FindFirstChild("Drops"):GetChildren()) do
                            chest.Add_To_Inventory:InvokeServer(drop.Name)
                            drop:Destroy()
                        end
                    end
                end
            end
        end

        local function initiateSkill()
            while task.wait(20) do  -- Increased delay to lower server load
                local Handle_Initiate_S_ = ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
                Handle_Initiate_S_:InvokeServer("skil_ting_asd", Players.LocalPlayer, "arrow_knock_back", 5)
            end
        end

        local function attackMobs()
            while true do
                local success, error = pcall(function()
                    local hitCounter = {}  -- Counter for each model
                    for _, mob in pairs(workspace.Mobs:GetDescendants()) do
                        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
                            local modelId = mob:GetFullName()
                            if not hitCounter[modelId] then
                                hitCounter[modelId] = 0
                            end
                            if hitCounter[modelId] < 2 then
                                local humanoid = mob:FindFirstChildOfClass("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
                                    Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage", game.Players.LocalPlayer.Character, mob.HumanoidRootPart.CFrame, mob, 500, 500)
                                    hitCounter[modelId] = hitCounter[modelId] + 1
                                end
                            end
                            if hitCounter[modelId] >= 2 then
                                break  -- Stop after hitting two mobs/models
                            end
                        end
                    end
                end)
                if not success then
                    print("An error occurred:", error)
                end
                wait(0.5)  -- Added delay to reduce server load
            end
        end

        local specificNames = {
            "Map", "InteractiveShopItems", "MugenTrain", "PrivateServerDummies", "cup game", "Bandage", 
            "BeastTrainer", "BigLight", "Black Smith", "Board", "Boulder_To_Split", "Buy_Big_Gourd", 
            "Buy_Gourd", "Buy_Medium_Gourd", "Chair", "Civilian", "Civilian 2", "ClashTrainer", 
            "Conductor", "Customization data ting", "Demon Guy", "Demon Slayer", "Fishing_Rod2", 
            "Flame Trainer", "Grandpa Wagwon's Wagon", "Green_Crystal", "Mae", "Malik", "Mark", 
            "Mist Trainer", "Model", "Ouw0pp", "Part", "Patrick", "Policeman", "Rina", "RinaDesk", 
            "Rock", "Snow Trainer", "Soryu Trainer", "Beast Trainer", "Sound Trainer", "Target_Training", 
            "Tyrone", "potion_sails_man", "thing", "Meditate_Mat", "Push_Ups_Mat", "Union", "MeshPart", 
            "Floor", "Mist"
        }

        local function deleteSpecificParts()
            while task.wait(10) do  -- Increased delay to reduce frequency
                for _, part in pairs(Workspace:GetChildren()) do
                    if table.find(specificNames, part.Name) then
                        part:Destroy()
                    end
                end
            end
        end

        local function preventFall()
            while task.wait(1) do  -- Increased delay to reduce frequency
                local antifall = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Instance.new("BodyVelocity", Players.LocalPlayer.Character.HumanoidRootPart)
                if antifall then
                    antifall.Velocity = Vector3.new(0, 0, 0)
                    antifall.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    antifall:Destroy()  -- Destroy immediately after setting values
                end
            end
        end

        local TweenService = game:GetService("TweenService")
        local Root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local Goal = {}

        local pathsToCheck = {
            { name = "Sound Trainee", position = Vector3.new(1859, 670, -2801), path = Workspace.Mobs.Bosses.Sound_Trainee["Sound Trainee"], time = 10, num = 2 },
            { name = "Tengen", position = Vector3.new(1463, 493, -3118), path = Workspace.Mobs.Bosses.Tengen, time = 2, num = 3 },
            { name = "Douma", position = Vector3.new(-2, 519, -1690), path = Workspace.Mobs.Bosses.Douma, time = 5, num = 3 },
            { name = "Renpeke", position = Vector3.new(-1289, 607, -664), path = Workspace.Mobs.Bosses["Flame Trainee"], time = 5, num = 2 },
            { name = "Swampy", position = Vector3.new(-1349, 607, -205), path = Workspace.Mobs.Bosses.Swampy, time = 1, num = 2 },
            { name = "Akaza", position = Vector3.new(2008, 563, -107), path = Workspace.Mobs.Bosses.Akaza, time = 10, num = 3 },
            { name = "Inosuke", position = Vector3.new(1596, 307, -394), path = Workspace.Mobs.Bosses.Inosuke, time = 2, num = 2 },
            { name = "Enmu", position = Vector3.new(1580, 490, -667), path = Workspace.Mobs.Bosses.Enmu, time = 2, num = 2 },
            { name = "Rengoku", position = Vector3.new(3659, 680, -355), path = Workspace.Mobs.Bosses.Rengoku, time = 5, num = 3 },
            { name = "Muichiro", position = Vector3.new(4512, 680, -553), path = Workspace.Mobs.Bosses.Muichiro, time = 2, num = 2 }
        }

        local function CheckAndMove(pathName, position, pathToCheck, Time, Num)
            repeat wait() until Root
            print("Going to " .. pathName)
            Goal.CFrame = CFrame.new(position)
            local tween = TweenService:Create(Root, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), Goal)
            tween:Play()
            wait(Time)
            tween:Cancel()
            local movementTimer = 0
            local prevPosition = Root.Position
            while task.wait() do
                local pathInWorkspace = Workspace.Mobs:FindFirstChild(pathName)
                if pathToCheck and #pathToCheck:GetChildren() == Num then
                    print("Moving to the next path")
                    break
                end
                local currentPosition = Root.Position
                if currentPosition == prevPosition then
                    movementTimer = movementTimer + 1
                    if movementTimer > 1 then
                        print("Character isn't moving, stopping the tween")
                        tween:Cancel()
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
            end
            wait(10)  -- Added a delay to prevent immediate looping
            main()
        end

        if placeId == 5956785391 then
            setupRejoinHandler()
            local args = { [1] = "join", [2] = "Tc939gfy", [3] = 17387482786 }
            game:GetService("ReplicatedStorage").handle_privateserver:InvokeServer(unpack(args))
        elseif placeId == 13883059853 then
            setupRejoinHandler()
            Players.LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = true
            coroutine.wrap(autoCollectChest)()
            coroutine.wrap(initiateSkill)()
            task.spawn(attackMobs)
            coroutine.wrap(deleteSpecificParts)()
            coroutine.wrap(preventFall)()
            coroutine.wrap(main)()
        else
            print("Wrong game")
        end

        wait(300)
        coroutine.yield(deleteSpecificParts)()

        --wait(3600)
        --TeleportService:Teleport(5956785391)
    end)

    if not success then
        print("An error occurred:", error)
    end
end

master()
