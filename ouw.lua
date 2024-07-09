--loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
repeat wait() until game:IsLoaded()
spsn = true
local KeepSC = true
wait(1)
print("SCRIPT MADE BY realhanif")
local spawn, wait = task.spawn, task.wait
local vu = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")

game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

game.NetworkClient.ChildRemoved:Connect(function()
	TeleportService:Teleport(9321822839)
end)

game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
		TeleportService:Teleport(9321822839)
	end
end)

local placeId = game.PlaceId
local Workspace = game:GetService("Workspace")

-- Create UI Elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 100, 0, 50)
frame.Position = UDim2.new(0, 300, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 0.5, 0)
button.Position = UDim2.new(0, 0, 0, 0)
button.Text = "Toggle KeepSC"
button.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.5, 0)
label.Position = UDim2.new(0, 0, 0.5, 0)
label.Text = "KeepSC: " .. tostring(KeepSC)
label.Parent = frame

local function toggleKeepSC()
	KeepSC = not KeepSC
	label.Text = "KeepSC: " .. tostring(KeepSC)

	game.StarterGui:SetCore("SendNotification", {
		Title = "KeepSC Toggle",
		Text = "KeepSC is now " .. tostring(KeepSC),
		Duration = 3
	})
end
button.MouseButton1Click:Connect(toggleKeepSC)

queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local TeleportCheck = false

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
	if KeepSC and (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/ouw.lua'))()")
	end
end)

local function getLocalPlayerUsername()
	if game.Players.LocalPlayer then
		return game.Players.LocalPlayer.Name
	else
		return nil
	end
end

if placeId == 5956785391 then
	wait()
	TeleportService:Teleport(9321822839)
elseif placeId == 9321822839 then
	local myUsername = getLocalPlayerUsername()
	local function findUsername(folder, username)
		for _, child in pairs(folder:GetChildren()) do
			local playerFolder = child:FindFirstChild(username)
			if playerFolder then
				return child
			else
				local foundFolder = findUsername(child, username)
				if foundFolder then
					return foundFolder
				end
			end
		end
		return nil
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
		wait()
		replicatedStorage:WaitForChild("queu_up"):FireServer()
	else
		print("Username not found in ReplicatedStorage.parties")
	end
	wait(20)
	TeleportService:Teleport(9321822839)
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

	local function noclip()
		for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
			if v:IsA("Humanoid") then
				v:ChangeState(11)
			end
		end
	end
	noclip()

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

	local function destroyModels(modelNames)
		for _, modelName in pairs(modelNames) do
			if Workspace.Map:FindFirstChild(modelName) then
				for _, v in pairs(Workspace.Map:GetChildren()) do
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
	local tweenTime = 1

	local orbTypes = {
		{name = "HealthRegen", enabled = true},
		{name = "StaminaRegen", enabled = false},
		{name = "BloodMoney", enabled = false},
		{name = "DoublePoints", enabled = true},
		{name = "InstaKill", enabled = true},
		{name = "WisteriaPoisoning", enabled = true},
		{name = "MobCamouflage", enabled = true}
	}

	local rooth = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
	local function orbv2()
		for _, orb in ipairs(orbTypes) do
			if orb.enabled then
				for _, v in pairs(Workspace.Map:GetChildren()) do
					if v:IsA("Model") and v.Name == orb.name then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
					end
				end
			end
		end
	end

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

		local room = findRoomName()
		print("Room Name: " .. tostring(room))

		local function kill()
			for _, child in pairs(Workspace.Mobs:GetChildren()) do
				if child:IsA("Model") and child:FindFirstChild("HumanoidRootPart") then
					if (child.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 25 then
						repeat
							task.wait(0.1)
							spawn(function()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = child.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
								game.Players.LocalPlayer.Character:FindFirstChild("Main"):FindFirstChild("M1"):FireServer(child)
							end)
						until not child.Parent or child.Humanoid.Health <= 0
					end
				end
			end
		end

		local function mainLoop()
			while true do
				task.wait(1)
				orbv2()
				kill()
			end
		end
		spawn(mainLoop)
	end
end
