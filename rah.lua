repeat wait() until game:IsLoaded()
	wait(5)
	local KeepSc = false
	local wfps = false
	local df = false
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
		print("executed false sc")
		-- Create a ScreenGui
		local screenGui = Instance.new("ScreenGui")
		screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

		-- Create a Frame
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 100, 0, 50)
		frame.Position = UDim2.new(0, 500, 0, 0)
		frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		frame.BackgroundTransparency = 0.5
		frame.Parent = screenGui

		-- Create a TextLabel to display the state of KeepSC
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 0.5, 0)
		label.Position = UDim2.new(0, 0, 0.5, 0)
		label.Text = "KeepSC: " .. tostring(KeepSC)
		label.Parent = frame

		-- Create a TextButton
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1, 0, 0.5, 0)
		button.Position = UDim2.new(0, 0, 0, 0)
		button.Text = "Toggle KeepSC"
		button.Parent = frame

		-- Create a TextButton
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1, 0, 0.5, 0)
		button.Position = UDim2.new(0, 0, 0, 0)
		button.Text = "Toggle wfps"
		button.Parent = frame

		-- Create a TextButton
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1, 0, 0.5, 0)
		button.Position = UDim2.new(0, 0, 0, 0)
		button.Text = "Toggle df"
		button.Parent = frame

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

		local function togglewfps()
			wfps = not wfps

			-- Send notification
			game.StarterGui:SetCore("SendNotification", {
				Title = "PJS Rotation Toggle",
			if wfps then
				local wfpsntf = "Executing PJS Rotation in next game"
			elseif not wfps then
				local wfpsntf = "Canceled PJS Rotation in next game"
			end
				Text = wfpsntf,
				Duration = 3
			})
		end
		button.MouseButton1Click:Connect(togglewfps)

		local function togglewfps()
			df = not df

			-- Send notification
			if df then
				local dfntf = "Executing DF Trinkets in next game"
			elseif not df then
				local dfntf = "Canceled DF Trinkets in next game"
			end
			game.StarterGui:SetCore("SendNotification", {
				Title = "DF Trinkets Toggle",
				Text = dfntf,
				Duration = 3
			})
		end
		button.MouseButton1Click:Connect(toggledf)

		queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
		local TeleportCheck = false
		game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
			if KeepSC and wfps then
		if (not TeleportCheck) and queueteleport then
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()")
				end
		elseif KeepSC and df then
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
  
