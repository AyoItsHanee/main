local rootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

spawn(
    function()
        while task.wait() do
            local antifall3 = Instance.new("BodyVelocity", rootPart)
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
)

wait(0.5)

rootPart.CFrame = CFrame.new(Vector3.new(-4362, 10, 310))

wait(0.5)

local Part = Instance.new("Part", workspace)
_G.PlatformS = true

Part.Anchored = true
Part.Size = Vector3.new(10, 1, 10)
Part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.2, 0)


local args = {
    [1] = 1
}

game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_net@0.2.0").net:FindFirstChild("RE/EquipToolFromHotbar"):FireServer(unpack(args))

wait(0.5)

spawn(
    function()
        while task.wait(0.1) do
            game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_net@0.2.0").net:FindFirstChild("RE/FishingCompleted"):FireServer()
        end
    end
)
