repeat wait() until game:IsLoaded()
print("Roblox loaded")
local spawn, wait = task.spawn, task.wait
	local client = game:GetService("Players").LocalPlayer
	getgenv().KillAura = true
	local bossrun = true
	local KeepSC = true
	local checkore = true
	local webhookUrl = "https://discord.com/api/webhooks/1261222782272933920/6IJCgbb2ipizj58GgiF_mTtsN1z7KntWKrw9SZBbaFMZl72mQEXx0uIxuCpkyo7KtswE"
	local lastMessageId = nil
	game.NetworkClient.ChildRemoved:Connect(function()
		if game.PlaceId == 5956785391 then
			game:GetService("TeleportService"):Teleport(9321822839)
		elseif game.PlaceId == 13883279773 then
			game:GetService("TeleportService"):Teleport(5956785391)
		elseif game.PlaceId == 9321822839 then
			game:GetService("TeleportService"):Teleport(5956785391)
		end
	end)
--[[
	game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
		if game.PlaceId == 5956785391 then
			game:GetService("TeleportService"):Teleport(9321822839)
		elseif game.PlaceId == 13883279773 then
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
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps1.lua'))()")
				end
			else
			if (not TeleportCheck) and queueteleport then	
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/rah.lua'))()")
				end
		end
		end)
]]--
--[[
if not game:IsLoaded() then
    game.Loaded:Wait()
end
]]--
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

        -- Create a TextButton
		local buttonsi = Instance.new("TextButton")
		buttonsi.Size = UDim2.new(0, 100, 0, 25)
		buttonsi.Position = UDim2.new(0, 400, 0, 25)
		buttonsi.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		buttonsi.TextColor3 = Color3.fromRGB(255, 255, 255)
		buttonsi.Text = "Sell Items"
		buttonsi.Parent = screenGui

        -- Create a TextButton
		local buttonsw = Instance.new("TextButton")
		buttonsw.Size = UDim2.new(0, 100, 0, 25)
		buttonsw.Position = UDim2.new(0, 400, 0, 50)
		buttonsw.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		buttonsw.TextColor3 = Color3.fromRGB(255, 255, 255)
		buttonsw.Text = "Sell Weapons"
		buttonsw.Parent = screenGui

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
        -- Function to toggle KeepSC and update UI
		local function sellis()
			-- Send notification
			game.StarterGui:SetCore("SendNotification", {
				Title = "Selling All Items..",
				Duration = 1
			})
            loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/sellitems.lua'))()
		end
		buttonsi.MouseButton1Click:Connect(sellis)
        -- Function to toggle KeepSC and update UI
		local function selliw()
			-- Send notification
			game.StarterGui:SetCore("SendNotification", {
				Title = "Selling All Weapons..",
				Duration = 1
			})
            loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/sellitem.lua'))()
		end
		buttonsw.MouseButton1Click:Connect(selliw)

		local Players = game:GetService("Players")
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local Workspace = game:GetService("Workspace")
		local placeId = game.PlaceId
			
		if game.PlaceId == 5956785391 then
			local args = {
				[1] = "join",
				[2] = "1UPARKiu",
				[3] = 17387475546
			}

			game:GetService("ReplicatedStorage"):WaitForChild("handle_privateserver"):InvokeServer(unpack(args))
				wait(30)
				game:GetService("TeleportService"):Teleport(5956785391)

		elseif game.PlaceId == 13883279773 then
			spawn(function()
			while task.wait() do
				for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
               				if v:IsA("BasePart") and v.CanCollide then
                   				v.CanCollide = false 
					end
               			end
				wait(0.1)
			end
			end)

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
				while task.wait() do
						if checkore then
					updateOreLabel()
						end
				wait(1)
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
    while task.wait() do
        if checkore then
            updateAndSendOre()
        end
	wait(960)
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
				while task.wait() do
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
				wait(1)
				end
			end)

			if game:GetService("ReplicatedStorage")["Player_Data"][getLocalPlayerUsername()].Demon_Art.Value == Arrow then
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
									wait(0.1)
								end
							end
						end
					end
						wait(0.1)
				end
			end)
			else
				local function attack(method) 

    wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
wait()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")

end

local killAuraWait = 1.25  -- Initial value for Kill Aura wait time

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().KillAura then
                attack('fist_combat')
                task.wait(killAuraWait)  -- Use the updated Kill Aura wait time
                repeat
                    wait()
                until game.Players.LocalPlayer:WaitForChild("combotangasd123").Value == 0
            end
        end)
    end
end)
			end

			-- Loop to delete specific parts
			--local specificNames = {"Map", "InteractiveShopItems", "MugenTrain", "PrivateServerDummies", "cup game", "Bandage", "BeastTrainer", "BigLight", "Black Smith", "Board", "Boulder_To_Split", "Buy_Big_Gourd", "Buy_Gourd", "Buy_Medium_Gourd", "Chair", "Civilian", "Civilian 2", "ClashTrainer", "Conductor", "Customization data ting", "Demon Guy", "Demon Slayer", "Fishing_Rod2", "Flame Trainer", "Grandpa Wagwon's Wagon", "Green_Crystal", "Mae", "Malik", "Mark", "Mist Trainer", "Model", "Ouw0pp", "Part", "Patrick", "Policeman", "Rina", "RinaDesk", "Rock", "Snow Trainer", "Soryu Trainer", "Beast Trainer", "Sound Trainer", "Target_Training", "Tyrone", "potion_sails_man", "thing", "Meditate_Mat", "Push_Ups_Mat", "Union", "MeshPart", "Floor", "Mist"}
			local isLooping = true
			spawn(function()
				while isLooping do
						for i,v in pairs(game.Workspace.Map:GetChildren()) do
           				 		v:Destroy()
        					end
				wait()
				end
			end)

			spawn(function()
				while task.wait() do
					local antifall3 = Instance.new("BodyVelocity", Players.LocalPlayer.Character.HumanoidRootPart)
					antifall3.Velocity = Vector3.new(0, 0, 0)
					antifall3.MaxForce = Vector3.new(100000, 100000, 100000)
					--antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
					wait(.1)
				end

				-- This part should be outside the while loop
				if antifall3 then
					antifall3:Destroy()
				end
			end)

			local TweenService = game:GetService("TweenService")
			local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
			local Goal = {}

local BossesFolder = Workspace.Mobs.Bosses
local function findBossPath(bossName)
	for _, folder in pairs(BossesFolder:GetDescendants()) do
		if folder:IsA("Model") or folder:IsA("Folder") then
			if folder.Name == bossName or folder.Name:find(bossName) then
				return folder
			end
		end
	end
	return nil -- Not found
end

local pathsToCheck = {
	{
		name = "Sabito",
		position = Vector3.new(1257.60046, 275.351685, -2834.26611),
		path = findBossPath("Sabito"),
		time = 3,
		num = 2
	},
	{
		name = "Susamaru",
		position = Vector3.new(1415.65686, 315.908813, -4571.56445),
		path = findBossPath("Susamaru"),
		time = 3,
		num = 2
	},
	{
		name = "Zanegutsu Kuuchie",
		position = Vector3.new(-336.3461, 425.857422, -2271.75513),
		path = findBossPath("Zanegutsu Kuuchie"),
		time = 3,
		num = 2
	},
	{
		name = "Yahaba",
		position = Vector3.new(1415.65686, 315.908813, -4571.56445),
		path = findBossPath("Yahaba"),
		time = 3,
		num = 2
	},
	{
		name = "Bandit Kaden",
		position = Vector3.new(-569.584351, 304.46698, -2827.55371),
		path = findBossPath("Bandit Kaden"),
		time = 3,
		num = 2
	},
	{
		name = "Bandit Zoku",
		position = Vector3.new(174.656708, 283.257355, -1969.98572),
		path = findBossPath("Bandit Zoku"),
		time = 3,
		num = 2
	},
	{
		name = "Shiron",
		position = Vector3.new(3203.10229, 370.884155, -3953.36035),
		path = findBossPath("Shiron"),
		time = 3,
		num = 2
	},
	{
		name = "Nezuko",
		position = Vector3.new(3549.86816, 342.214478, -4595.73145),
		path = findBossPath("Nezuko"),
		time = 3,
		num = 2
	},
	{
		name = "Slasher",
		position = Vector3.new(4355.59082, 342.214478, -4386.90527),
		path = findBossPath("Slasher"),
		time = 3,
		num = 2
	},
	{
		name = "Giyu",
		position = Vector3.new(3013.30884, 316.95871, -2916.32202),
		path = findBossPath("Giyu"),
		time = 3,
		num = 2
	},
	{
		name = "Sanemi",
		position = Vector3.new(1619.91357, 348.461884, -3717.00464),
		path = findBossPath("Sanemi"),
		time = 3,
		num = 2
	}
}

			local FarmModes = CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
            _G.TweenSpeed = 300            
            local function GetDistance(Endpoint)
                if typeof(Endpoint) == "Instance" then
                    Endpoint = Vector3.new(Endpoint.Position.X, Root.Position.Y, Endpoint.Position.Z)
                elseif typeof(Endpoint) == "CFrame" then
                    Endpoint = Vector3.new(Endpoint.Position.X, Root.Position.Y, Endpoint.Position.Z)
                end
                local Magnitude = (Endpoint - Root.Position).Magnitude
                return Magnitude
            end
            
            function Tween(Endpoint)
                if typeof(Endpoint) == "Instance" then
                    Endpoint = Endpoint.CFrame
                end
                local TweenFunc = {}
                local Distance = GetDistance(Endpoint)
                local tweenInfo = TweenInfo.new(Distance / _G.TweenSpeed, Enum.EasingStyle.Linear)
                local tween = TweenService:Create(Root, tweenInfo, {CFrame = Endpoint})
            
                -- Play the tween
                tween:Play()
                -- Function to cancel the tween
                function TweenFunc:Cancel()
                    tween:Cancel()
                    return false
                end
                return TweenFunc
            end
            
            local function CheckAndMove(pathName, position, pathToCheck, Time, Num)
                print("Going to " .. pathName)
                local endpointCFrame = CFrame.new(position)
                local tween = Tween(endpointCFrame)
            
                -- Wait until the player reaches the position
                while (Root.Position - position).Magnitude > 1 do
                    wait(0.1) -- Check every 0.1 seconds
                end
            
                while task.wait() do
                    if bossrun then
                        local pathInWorkspace = Workspace.Mobs:FindFirstChild(pathName)
                        if (pathToCheck and #(pathToCheck:GetChildren()) <= Num) then
                            print("Moving to the next path")
                            break
                        end
                    end
                    wait()
                end
            end
            
            spawn(function()
                while task.wait() do
                    if bossrun then
                        for _, pathInfo in ipairs(pathsToCheck) do
                            CheckAndMove(pathInfo.name, pathInfo.position, pathInfo.path, pathInfo.time, pathInfo.num)
                        end
                    end
                    wait()
                end
            end)

local function GetNearestBoss()

   local Bosses = game:GetService("Workspace").Mobs:GetDescendants()
   local BossesTable = {}

   for i,v in pairs(Bosses) do
       if table.find(BossessTable, v.Name) and v:IsA("Model") and v:FindFirstChild("Humanoid") then
           if v.Humanoid.Health > 0 then
               table.insert(BossesTable, v)
           end
       end
   end

   local NearestBoss = nil
   local NearestBossDistance = math.huge

   for i,v in pairs(BossesTable) do
       local Distance = GetDistance(v:GetModelCFrame() * FarmModes)
       if Distance < NearestBossDistance then
           NearestBoss = v
           NearestBossDistance = Distance
       end
   end

   return NearestBoss
end

-- // AUTO ALL BOSSES - FARM

spawn(function()
   while task.wait() do
                   local v = GetNearestBoss()
                               repeat task.wait()                                      
                                   if GetDistance(v:GetModelCFrame() * FarmModes) < 25 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                       Root.CFrame = v:GetModelCFrame() * FarmModes
                                   end
                               until not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
               end
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
	--[[
game:GetService("Players").LocalPlayer.PlayerGui.MainGuis.Settings2.Visible = true
wait()
-- Wait for the game services to load
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Get the local player and their PlayerGui
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Get the specific ImageButton
local screenGui = playerGui:WaitForChild("MainGuis")
local Settings = screenGui:WaitForChild("Settings2")
local button = Settings:WaitForChild("TextButton")

-- Function to simulate a click on the button
local function simulateButtonClick()
    -- Get the button's position and size
    local buttonPosition = button.AbsolutePosition
    local buttonSize = button.AbsoluteSize

    -- Calculate the center position of the button
    local clickPosition = Vector2.new(
        buttonPosition.X + buttonSize.X / 2,
        buttonPosition.Y + buttonSize.Y / 2
    )

    -- Simulate the button click
    VirtualInputManager:SendMouseButtonEvent(clickPosition.X, clickPosition.Y + 25, 0, true, game, 0)
    wait(0.1)
    VirtualInputManager:SendMouseButtonEvent(clickPosition.X, clickPosition.Y + 25, 0, false, game, 0)
end

-- Call the function to simulate the button click
simulateButtonClick()
	]]--
			game:GetService("TeleportService"):Teleport(5956785391)

		elseif game.PlaceId == 9321822839 then
			game:GetService("TeleportService"):Teleport(5956785391)
		else
			print("Wrong game")
		end
