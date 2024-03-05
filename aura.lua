local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local placeId = game.PlaceId
local TeleportService = game:GetService("TeleportService")
local function collectChest()
    while task.wait() do
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
