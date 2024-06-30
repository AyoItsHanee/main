repeat wait() until game:IsLoaded()
	wait(5)
	local KeepSC = true
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
		print("executed")
		local function getname()
			local player = game.Players.LocalPlayer
			if player then
				return player.Name
			else
				return nil
			end
		end
		-- Create a ScreenGui
		local screenGui = Instance.new("ScreenGui")
		screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

		-- Create a Frame
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 100, 0, 50)
		frame.Position = UDim2.new(0, 300, 0, 0)
		frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		frame.BackgroundTransparency = 0.5
		frame.Parent = screenGui

		-- Create a TextButton
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1, 0, 0.5, 0)
		button.Position = UDim2.new(0, 0, 0, 0)
		button.Text = "Toggle KeepSC"
		button.Parent = frame

		-- Create a TextLabel to display the state of KeepSC
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 0.5, 0)
		label.Position = UDim2.new(0, 0, 0.5, 0)
		label.Text = "KeepSC: " .. tostring(KeepSC)
		label.Parent = frame

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

		queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
		local TeleportCheck = false
		game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
		if KeepSC and (not TeleportCheck) and queueteleport then
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/one.lua'))()")
		end
		end)

local placeId = game.PlaceId
if placeId == 5956785391 then
local args = {
    [1] = "join",
    [2] = "uvWjzOBZ",
    [3] = 17387475546
}

game:GetService("ReplicatedStorage"):WaitForChild("handle_privateserver"):InvokeServer(unpack(args))
end
