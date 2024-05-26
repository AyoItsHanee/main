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
            wait(.1) -- Adjust the delay time as desired
        end
    end
