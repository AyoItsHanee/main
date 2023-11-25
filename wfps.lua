game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

wait(1)

AutoCollectChest = true
local function a()
while task.wait() do
    if AutoCollectChest then
       for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
          if v.Name == "Loot_Chest" then
             for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do
                v["Add_To_Inventory"]:InvokeServer(c.Name)
                delay(0.1, function()
                   c:Destroy()
                end)
             end
       end
    end
 end
 end
end
local loopC0 = coroutine.create(a)
coroutine.resume(loopC0)

wait(1)

local function loopBp()
    while true do
        local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
        Handle_Initiate_S_:InvokeServer("skil_ting_asd", game.Players.LocalPlayer, "arrow_knock_back", 5)
        wait(14)
    end
end
local loopC1 = coroutine.create(loopBp)
coroutine.resume(loopC1)

wait(1)

local function b()
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
local loopC2 = coroutine.create(b)
coroutine.resume(loopC2)

wait(1)

local LP = game:GetService("Players").LocalPlayer
local function c()
while true do 
    antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
    antifall3.Velocity = Vector3.new(0, 0, 0)
    antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    wait()
end
end
local loopC3 = coroutine.create(c)
coroutine.resume(loopC3)

wait(1)

-- Define the list of specific names you want to delete
local specificNames = {"Map", "InteractiveShopItems", "MugenTrain", "PrivateServerDummies", "cup game", "Bandage", "BeastTrainer", "BigLight", "Black Smith", "Board", "Boulder_To_Split", "Buy_Big_Gourd", "Buy_Gourd", "Buy_Medium_Gourd", "Chair", "Civilian", "Civilian 2", "ClashTrainer", "Conductor", "Customization data ting", "Demon Guy", "Demon Slayer", "Fishing_Rod2", "Flame Trainer", "Grandpa Wagwon's Wagon", "Green_Crystal", "Mae", "Malik", "Mark", "Mist Trainer", "Model", "Ouw0pp", "Part", "Patrick", "Policeman", "Rina", "RinaDesk", "Rock", "Snow Trainer", "Soryu Trainer", "Beast Trainer", "Sound Trainer", "Target_Training", "Tyrone", "potion_sails_man", "thing", "Meditate_Mat", "Push_Ups_Mat", "Union", "MeshPart", "Floor", "Mist"} -- Add the names you want to delete
local isLooping = true -- Variable to control the loop
-- Function to delete parts with specific names
local function deleteSpecificParts()
    local workspaceParts = Workspace:GetChildren()

    for _, part in pairs(workspaceParts) do
        if table.find(specificNames, part.Name) then
            part:Destroy()
        end
    end
end
-- Function to start or stop the loop
local function toggleLoop()
    if isLooping then
        isLooping = false
        print("Loop stopped.")
    else
        isLooping = true
        print("Loop started.")
    end
end
-- Toggle loop when a key is pressed (change to your preferred key)
game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
    if not isProcessed and input.KeyCode == Enum.KeyCode.P then
        toggleLoop()
    end
end)
-- Main loop
local function d()
while task.wait() do
    if isLooping then
        deleteSpecificParts()
    end
    wait() -- Wait for 100ms
end
end
local loopC4 = coroutine.create(d)
coroutine.resume(loopC4)

local TweenService = game:GetService("TweenService")
local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
local Goal = {}
local player = game.Players.LocalPlayer
function teleport(position)
    if player.Character then
        player.Character:MoveTo(position)
    end
end
local pathsToCheck = {
    {
        name = "Sound Trainee",
        position = Vector3.new(1859, 670, -2801),
        path = workspace.Mobs.Bosses.Sound_Trainee["Sound Trainee"],
		time = 10,
		num = 2
    },
    {
        name = "Tengen",
        position = Vector3.new(1463, 493, -3118),
        path = workspace.Mobs.Bosses.Tengen,
		time = 2,
		num = 3
    },
        {
        name = "Douma",
        position = Vector3.new(-2, 519, -1690),
        path = workspace.Mobs.Bosses.Douma,
		time = 5,
		num = 3
    },
        {
        name = "Renpeke",
        position = Vector3.new(-1289, 607, -664),
        path = workspace.Mobs.Bosses["Flame Trainee"],
		time = 5,
		num = 2
    },
        {
        name = "Swampy",
        position = Vector3.new(-1349, 607, -205),
        path = workspace.Mobs.Bosses.Swampy,
		time = 1,
		num = 2
    },
        {
        name = "Akaza",
        position = Vector3.new(2008, 563, -107),
        path = workspace.Mobs.Bosses.Akaza,
		time = 10,
		num = 3
    },
        {
        name = "Inosuke",
        position = Vector3.new(1596, 307, -394),
        path = workspace.Mobs.Bosses.Inosuke,
		time = 2,
		num = 2
    },
        {
        name = "Enmu",
        position = Vector3.new(1580, 490, -667),
        path = workspace.Mobs.Bosses.Enmu,
		time = 2,
		num = 2
    },
        {
        name = "Rengoku",
        position = Vector3.new(3659, 680, -355),
        path = workspace.Mobs.Bosses.Rengoku,
		time = 5,
		num = 3
    },
        {
        name = "Muichiro",
        position = Vector3.new(4512, 680, -553),
        path = workspace.Mobs.Bosses.Muichiro,
		time = 2,
		num = 2
    },
    -- Add other paths here similarly
}
local function CheckAndMove(pathName, position, pathToCheck, Time, Num)
    print("Going to " .. pathName)
    Goal.CFrame = CFrame.new(position)
    local tween = TweenService:Create(Root, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), Goal)
    tween:Play()
    wait(Time + 2)
    local movementTimer = 0
    local prevPosition = Root.Position

    while true do
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
function Main()
    for _, pathInfo in ipairs(pathsToCheck) do
        CheckAndMove(pathInfo.name, pathInfo.position, pathInfo.path, pathInfo.time, pathInfo.num)
        wait(1)  -- Wait before checking the next path
    end
    wait(10)
    Main()
end
local loopC5 = coroutine.create(Main)
coroutine.resume(loopC5)
