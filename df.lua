repeat wait() until game:IsLoaded()
	local KeepSC = true
	local checkore = true
	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
	game.NetworkClient.ChildRemoved:Connect(function()
	game:GetService("TeleportService"):Teleport(5094651510)
	end)
	game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
		game:GetService("TeleportService"):Teleport(5094651510)
	end
	end)

	local function master()
		print("executed true sc")
		-- Create a ScreenGui
		local screenGui = Instance.new("ScreenGui")
		screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

		-- Create a Frame
		local framsex = Instance.new("Frame")
		framsex.Size = UDim2.new(0, 100, 0, 50)
		framsex.Position = UDim2.new(0, 300, 0, 0)
		framsex.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		framsex.BackgroundTransparency = 0.5
		framsex.Parent = screenGui

		-- Create a TextButton
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1, 0, 0.5, 0)
		button.Position = UDim2.new(0, 0, 0, 0)
		button.Text = "Toggle KeepSC"
		button.Parent = framsex

		-- Create a TextLabel to display the state of KeepSC
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 0.5, 0)
		label.Position = UDim2.new(0, 0, 0.5, 0)
		label.Text = "KeepSC: " .. tostring(KeepSC)
		label.Parent = framsex

		-- Function to toggle KeepSC and update UI
		local function toggleKeepSC()
			KeepSC = not KeepSC
			label.Text = "KeepSC: " .. tostring(KeepSC)

			-- Send notification
			game.StarterGui:SetCore("SendNotification", {
				Title = "KeepSC Toggle",
				Text = "KeepSC is now " .. tostring(KeepSC),
				Duration = 3
			})
		end
		button.MouseButton1Click:Connect(toggleKeepSC)

		queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or (vega_x and vega_x.queue_on_teleport)
		local TeleportCheck = false
		game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
			if KeepSC then
		if (not TeleportCheck) and queueteleport then
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/df.lua'))()")
				end
			else
			if (not TeleportCheck) and queueteleport then	
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/rah.lua'))()")
				end
		end
		end)
end
--loadstring(game:HttpGet("https://raw.githubusercontent.com/caydenthekile/scriptsv2/main/demonfall"))()
-- Ensure the character is fully loaded
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local spawn, wait = task.spawn, task.wait

-- List of positions to teleport to
local positions = {
    Vector3.new(-3181.9921875, 719.7786865234375, -833.1934204101562),
    Vector3.new(-3679.50439453125, 763.4779052734375, -1707.2308349609375),
    Vector3.new(1407.1964111328125, 1153.375244140625, -1569.9490966796875),
    Vector3.new(1757.43310546875, 1205.2265625, -1588.705078125),
    Vector3.new(1828.996337890625, 1205.1748046875, -1569.9490966796875),
    Vector3.new(1102.83203125, 1013.330078125, -1153.6756591796875),
    Vector3.new(1102.83203125, 879.5115966796875, -1100.5462646484375),
    Vector3.new(24.433820724487305, 730.15087890625, -209.9245147705078),
    Vector3.new(-614.9308471679688, 863.2931518554688, 506.6538391113281),
    Vector3.new(-1502.2615966796875, 741.9617309570312, -764.554931640625),
    Vector3.new(-1549.6671142578125, 988.677978515625, -1704.548583984375),
    Vector3.new(-1753.6898193359375, 799.9909057617188, -1344.7529296875),
    Vector3.new(-1741.842041015625, 898.89453125, -1344.669189453125),
    Vector3.new(-2187.38525390625, 1174.2281494140625, -1552.30859375),
    Vector3.new(-1565.643310546875, 1098.566650390625, -2096.865966796875),
    Vector3.new(-2880.853515625, 777.2279052734375, -2248.69384765625),
    Vector3.new(-2249.911865234375, 867.1924438476562, -3378.99560546875),
    Vector3.new(-2240.8955078125, 1174.93310546875, -2992.6015625),
    Vector3.new(-2241.30419921875, 1174.93310546875, -2990.830810546875),
    Vector3.new(-2036.680419921875, 831.1228637695312, -3997.378173828125),
    Vector3.new(-3933.758056640625, 1015.6776733398438, -2932.150634765625),
    Vector3.new(-4530.0400390625, 906.32861328125, -2421.986572265625),
    Vector3.new(-4447.720703125, 763.3286743164062, -2256.327880859375),
    Vector3.new(-4618.3349609375, 757.7781982421875, -4256.40673828125),
    Vector3.new(-4059.830078125, 733.9397583007812, -4757.0751953125),
    Vector3.new(-3806.052001953125, 819.8452758789062, -4554.109375),
    Vector3.new(-3740.7412109375, 724.8564453125, -5556.56982421875),
    Vector3.new(-3469.767333984375, 768.748046875, -5670.22607421875),
    Vector3.new(-2709.328857421875, 736.989013671875, -6468.93115234375),
    Vector3.new(-2855.572998046875, 719.0909423828125, -7044.72900390625),
    Vector3.new(-2249.2158203125, 924.9036865234375, -7072.6435546875),
    Vector3.new(-2121.954833984375, 868.7786865234375, -6549.93408203125),
    Vector3.new(-561.465087890625, 945.3720092773438, -6468.05322265625)
}

-- Function to check if "RareSpawn" and "EpicSpawn" exist
local function getExistingTrinket()
    local trinkets = game:GetService("Workspace"):FindFirstChild("Trinkets")
    if trinkets then
        local rareSpawn = trinkets:FindFirstChild("RareSpawn")
        local epicSpawn = trinkets:FindFirstChild("EpicSpawn")
        if rareSpawn then
            return rareSpawn
        elseif epicSpawn then
            return epicSpawn
        end
    end
    return nil
end

-- Function to check if there are no children for the existing trinket at the given position
local function noChildrenAtPosition(trinket, position)
    if trinket.Position == position and #trinket:GetChildren() == 0 then
        return true
    end
    return false
end

local function pressE()
    local VirtualInputManager = game:GetService('VirtualInputManager')
    
    VirtualInputManager:SendKeyEvent(true, "E", false, game)
    wait(0.1) -- Simulate key press duration
    VirtualInputManager:SendKeyEvent(false, "E", false, game)
end

-- Offset from the character to the camera
local cameraOffset = Vector3.new(0, 10, 0)

-- Function to update camera position
local function updateCamera()
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        game.Workspace.CurrentCamera.CFrame = CFrame.new(rootPart.Position + cameraOffset, rootPart.Position)
    end
end

-- Connect the function to RenderStepped to update the camera every frame
game:GetService("RunService").RenderStepped:Connect(updateCamera)

-- Function to teleport to each position with a check
local function teleportToPositions(positions)
    for _, pos in ipairs(positions) do
        -- Teleport the character to the target position
        rootPart.CFrame = CFrame.new(pos)
        print("Teleported to position:", pos)
		wait(1)
		pressE()
		wait()
    end
game:GetService("TeleportService"):Teleport(5094651510)
end

-- Start teleporting
teleportToPositions(positions)
