--repeat wait() until game:IsLoaded()
local spawn, wait = task.spawn, task.wait
	local bossrun = true
	local KeepSC = true
	local checkore = true
	local webhookUrl = "https://discord.com/api/webhooks/1261222782272933920/6IJCgbb2ipizj58GgiF_mTtsN1z7KntWKrw9SZBbaFMZl72mQEXx0uIxuCpkyo7KtswE"
	local lastMessageId = nil
	game.NetworkClient.ChildRemoved:Connect(function()
		if game.PlaceId == 5956785391 then
			game:GetService("TeleportService"):Teleport(9321822839)
		elseif game.PlaceId == 13883059853 then
			game:GetService("TeleportService"):Teleport(5956785391)
		elseif game.PlaceId == 9321822839 then
			game:GetService("TeleportService"):Teleport(5956785391)
		end
	end)
	game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
		if game.PlaceId == 5956785391 then
			game:GetService("TeleportService"):Teleport(9321822839)
		elseif game.PlaceId == 13883059853 then
			game:GetService("TeleportService"):Teleport(5956785391)
		elseif game.PlaceId == 9321822839 then
			game:GetService("TeleportService"):Teleport(5956785391)
		end
	end
	end)
		queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or (delta and delta.queue_on_teleport)
		local TeleportCheck = false
		game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
			if KeepSC then
		if (not TeleportCheck) and queueteleport then
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()")
				end
			else
			if (not TeleportCheck) and queueteleport then	
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/rah.lua'))()")
				end
		end
		end)

if not game:IsLoaded() then
    game.Loaded:Wait()
end
print("Roblox loaded")
-- Wait for the LocalPlayer to be loaded
game:GetService("Players").LocalPlayer:WaitForChild("doneloadinggamepasses")
print("game loaded")

	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)

		print("Boss Rotation v0.3.5")
		print("executed true sc")
		local function getLocalPlayerUsername()
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

		-- Create a TextButton
		local buttonr = Instance.new("TextButton")
		buttonr.Size = UDim2.new(0, 100, 0, 25)
		buttonr.Position = UDim2.new(0, 400, 0, 0)
		buttonr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		buttonr.TextColor3 = Color3.fromRGB(255, 255, 255)
		buttonr.Text = "Toggle Rotation"
		buttonr.Parent = screenGui

		-- Function to toggle KeepSC and update UI
		local function toggleKeepSC()
			KeepSC = not KeepSC
			label.Text = "KeepSC: " .. tostring(KeepSC)

			-- Send notification
			game.StarterGui:SetCore("SendNotification", {
				Title = "KeepSC Toggle",
				Text = "KeepSC is now " .. tostring(KeepSC),
				Duration = 1
			})
		end
		button.MouseButton1Click:Connect(toggleKeepSC)
		-- Function to toggle KeepSC and update UI
		local function togglebossrun()
			bossrun = not bossrun
			-- Send notification
			game.StarterGui:SetCore("SendNotification", {
				Title = "Rotation Toggle",
				Text = "Boss Rotation is now " .. tostring(bossrun),
				Duration = 1
			})
		end
		buttonr.MouseButton1Click:Connect(togglebossrun)

		local Players = game:GetService("Players")
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Workspace = game:GetService("Workspace")
		local placeId = game.PlaceId
			
		if game.PlaceId == 5956785391 then
			local args = {
				[1] = "join",
				[2] = "p522eSVk",
				[3] = 17387482786
			}

			game:GetService("ReplicatedStorage"):WaitForChild("handle_privateserver"):InvokeServer(unpack(args))
				wait(30)
				game:GetService("TeleportService"):Teleport(5956785391)

		elseif game.PlaceId == 13883059853 then

			-- Create a Frame
			local frame1 = Instance.new("Frame")
			frame1.Size = UDim2.new(0, 100, 0, 25)
			frame1.Position = UDim2.new(0, 200, 0, 0)
			frame1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			frame1.BackgroundTransparency = 0.5
			frame1.Parent = screenGui

			-- Create a TextLabel to display the Ore value
			local oreLabel = Instance.new("TextLabel")
			oreLabel.Size = UDim2.new(1, 0, 1, 0)
			oreLabel.Position = UDim2.new(0, 0, 0, 0)
			oreLabel.Text = "Ore:"
			oreLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			oreLabel.BackgroundTransparency = 1
			oreLabel.Parent = frame1

				local function checkamount()
					local oream = game:GetService("ReplicatedStorage")["Player_Data"][getLocalPlayerUsername()].Inventory.Items:WaitForChild("Ore").Amount
					local oreValue = oream.Value
					return oreValue
				end

			-- Function to update the Ore value in the UI
			local function updateOreLabel()
					local upa = checkamount()
					oreLabel.Text = "Ore: " .. tostring(upa)
			end

			-- Update the Ore value every second
			spawn(function()
				while task.wait(1) do
						if checkore then
					updateOreLabel()
						end
				end
			end)

			local function sendToDiscord(content)
    local payload = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "**Ore Update**",
            ["description"] = content,
            ["type"] = "rich",
            ["color"] = tonumber(0xffffff),
            ["fields"] = {
                {
                    ["name"] = "Last Updated:",
                    ["value"] = os.date("%Y-%m-%d %H:%M:%S"),
                    ["inline"] = true
                }
            }
        }}
    }

    local headers = {
        ["Content-Type"] = "application/json"
    }

    local requestBody = game:GetService("HttpService"):JSONEncode(payload)

    local response = http_request({
        Url = webhookUrl,
        Method = "POST",
        Headers = headers,
        Body = requestBody
    })

    return game:GetService("HttpService"):JSONDecode(response).id
end

-- Function to update the Discord message
local function updateDiscordMessage(content)
    if lastMessageId then
        local payload = {
            ["content"] = "",
            ["embeds"] = {{
                ["title"] = "**Ore Update**",
                ["description"] = content,
                ["type"] = "rich",
                ["color"] = tonumber(0xffffff),
                ["fields"] = {
                    {
                        ["name"] = "Last Updated:",
                        ["value"] = os.date("%Y-%m-%d %H:%M:%S"),
                        ["inline"] = true
                    }
                }
            }}
        }

        local headers = {
            ["Content-Type"] = "application/json"
        }

        local requestBody = HttpService:JSONEncode(payload)

        local response = http_request({
            Url = webhookUrl .. "/messages/" .. lastMessageId,
            Method = "PATCH",
            Headers = headers,
            Body = requestBody
        })

        if response.StatusCode ~= 200 then
            lastMessageId = nil
        end
    else
        lastMessageId = sendToDiscord(content)
    end
end

-- Function to update the Ore value and send to Discord
local function updateAndSendOre()
local upb = checkamount()
    local content = "Username: " .. getLocalPlayerUsername() .. "\n" ..
			"Ore: " .. tostring(upb) .. "\n" ..
			"Items: " .. game.Players.LocalPlayer.PlayerGui.MainGuis.Items.Categories.All.Text
    updateDiscordMessage(content)
	
end

-- Update the Ore value every minute
spawn(function()
    while task.wait(960) do
        if checkore then
            updateAndSendOre()
        end
    end
end)

			game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = true
			function RemoveDMG()
				local part  =  game:GetService("StarterPlayer").StarterPlayerScripts.Client_Modules.Modules.Extra.Damage_Text

				local part1 =  game:GetService("ReplicatedStorage").Assets.Extras.Damage_Text

				local part2 = game:GetService("Players").LocalPlayer.PlayerScripts.Client_Modules.Modules.Extra.Damage_Text

				if part then
					part:Destroy()
				end

				if part1 then
					part1:Destroy()
				end

				if part2 then
					part2:Destroy()
				end
			end



			function RemovePARTICLES()
				local COINS = game:GetService("ReplicatedStorage").Assets.Extras.Coin

				local PARTICLES = game:GetService("ReplicatedStorage").Assets.Particles.Parts

				if COINS then
					COINS:Destroy()
				end

				if PARTICLES then
					PARTICLES:Destroy()
				end
			end

			spawn(function()
				local args = {
					[1] = true
				}

				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(unpack(args))
				wait(3)
			end)
			-- Auto collect chest
			spawn(function()
				while task.wait(1) do
					for _, chest in pairs(Workspace.Debree:GetChildren()) do
						if chest.Name == "Loot_Chest" then
							for _, drop in pairs(chest:FindFirstChild("Drops"):GetChildren()) do
								chest.Add_To_Inventory:InvokeServer(drop.Name)
								drop:Destroy()
								if #chest.Drops:GetChildren() == 0 then
									chest:Destroy()
								end
							end
						end
					end
				end
			end)

			-- Loop to initiate a skill
			spawn(function()
				while task.wait() do
					local Handle_Initiate_S_ = ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
					Handle_Initiate_S_:InvokeServer("skil_ting_asd", Players.LocalPlayer, "arrow_knock_back", 5)
					wait(14)
				end
			end)

			-- Loop to attack mobs
			spawn(function()
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
						wait(.1)
				end
			end)

			-- Loop to delete specific parts
			--local specificNames = {"Map", "InteractiveShopItems", "MugenTrain", "PrivateServerDummies", "cup game", "Bandage", "BeastTrainer", "BigLight", "Black Smith", "Board", "Boulder_To_Split", "Buy_Big_Gourd", "Buy_Gourd", "Buy_Medium_Gourd", "Chair", "Civilian", "Civilian 2", "ClashTrainer", "Conductor", "Customization data ting", "Demon Guy", "Demon Slayer", "Fishing_Rod2", "Flame Trainer", "Grandpa Wagwon's Wagon", "Green_Crystal", "Mae", "Malik", "Mark", "Mist Trainer", "Model", "Ouw0pp", "Part", "Patrick", "Policeman", "Rina", "RinaDesk", "Rock", "Snow Trainer", "Soryu Trainer", "Beast Trainer", "Sound Trainer", "Target_Training", "Tyrone", "potion_sails_man", "thing", "Meditate_Mat", "Push_Ups_Mat", "Union", "MeshPart", "Floor", "Mist"}
			local isLooping = true
			spawn(function()
				while isLooping do
					--if isLooping then
						for i,v in pairs(game.Workspace.Map:GetChildren()) do
           				 		v:Destroy()
        					end
					--end
				wait(1)
				end
			end)

			spawn(function()
				while task.wait() do
					local antifall3 = Instance.new("BodyVelocity", Players.LocalPlayer.Character.HumanoidRootPart)
					antifall3.Velocity = Vector3.new(0, 0, 0)
					antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)

					wait() -- It's a good idea to yield control periodically to prevent performance issues
				end

				-- This part should be outside the while loop
				if antifall3 then
					antifall3:Destroy()
				end
			end)

			local TweenService = game:GetService("TweenService")
			local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
			local Goal = {}

			-- Function to teleport to specific paths
			local pathsToCheck = {
				{
					name = "Sound Trainee",
					position = Vector3.new(1859, 670, -2801),
					path = Workspace.Mobs.Bosses.Sound_Trainee["Sound Trainee"],
					time = 12,
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
					time = 7,
					num = 3
				},
				{
					name = "Renpeke",
					position = Vector3.new(-1289, 607, -664),
					path = Workspace.Mobs.Bosses["Flame Trainee"],
					time = 7,
					num = 2
				},
				{
					name = "Swampy",
					position = Vector3.new(-1349, 607, -205),
					path = Workspace.Mobs.Bosses.Swampy,
					time = 2,
					num = 2
				},
				{
					name = "Akaza",
					position = Vector3.new(2008, 563, -107),
					path = Workspace.Mobs.Bosses.Akaza,
					time = 12,
					num = 3
				},
				{
					name = "Inosuke",
					position = Vector3.new(1596, 307, -394),
					path = Workspace.Mobs.Bosses.Inosuke,
					time = 3,
					num = 2
				},
				{
					name = "Enmu",
					position = Vector3.new(1580, 490, -667),
					path = Workspace.Mobs.Bosses.Enmu,
					time = 3,
					num = 2
				},
				{
					name = "Rengoku",
					position = Vector3.new(3659, 680, -355),
					path = Workspace.Mobs.Bosses.Rengoku,
					time = 7,
					num = 3
				},
				{
					name = "Muichiro",
					position = Vector3.new(4512, 680, -553),
					path = Workspace.Mobs.Bosses.Muichiro,
					time = 3,
					num = 2
				},
				-- Add other paths here similarly
			}

			local function CheckAndMove(pathName, position, pathToCheck, Time, Num)
				print("Going to " .. pathName)
				Goal.CFrame = CFrame.new(position)
				local tween = TweenService:Create(Root, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), Goal)
				tween:Play()
				wait(Time)
				local movementTimer = 0
				local prevPosition = Root.Position
				while wait() do
						if bossrun then
					local pathInWorkspace = Workspace.Mobs:FindFirstChild(pathName)
					if pathToCheck and #pathToCheck:GetChildren() == Num then
						print("Moving to the next path")
								break
							end
					end

					local currentPosition = Root.Position
					if currentPosition == prevPosition then
						movementTimer = movementTimer + 1
						if movementTimer > 1 then
								local bossrun = false
							--print("Character isn't moving, stopping the tween")
							--tween:Cancel() -- Stop the tween
						end
					else
						movementTimer = 0
					end
					prevPosition = currentPosition
				end
			end

			spawn(function()
					while bossrun do
				for _, pathInfo in ipairs(pathsToCheck) do
					CheckAndMove(pathInfo.name, pathInfo.position, pathInfo.path, pathInfo.time, pathInfo.num)
				end
						wait()
					end
			end)

			wait()
			RemoveDMG()
			wait()
			RemovePARTICLES()
			--game:GetService("RunService"):Set3dRenderingEnabled(false)
			wait(300)
			local isLooping = false
			wait(3600)
			game:GetService("TeleportService"):Teleport(5956785391, game.Players.LocalPlayer)

		elseif game.PlaceId == 9321822839 then
			game:GetService("TeleportService"):Teleport(5956785391)
		else
			print("Wrong game")
		end
