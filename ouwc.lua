--loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
repeat wait() until game:IsLoaded()
	wait(1)
	print("SCRIPT MADE BY realhanif")
	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
	game.NetworkClient.ChildRemoved:Connect(function()
	game:GetService("TeleportService"):Teleport(9321822839)
	end)
	game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
	if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
		game:GetService("TeleportService"):Teleport(9321822839)
	end
	end)
	local placeId = game.PlaceId
	local Workspace = game:GetService("Workspace")
	queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
	local TeleportCheck = false
	game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
	if (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/ouwc.lua'))()")
	end
	end)
	if placeId == 5956785391 then


		local TeleportService = game:GetService("TeleportService")
		wait()
		TeleportService:Teleport(9321822839)


	elseif placeId == 9321822839 then

		local function getLocalPlayerUsername()
			local player = game.Players.LocalPlayer
			if player then
				return player.Name
			else
				return nil
			end
		end

		local myUsername = getLocalPlayerUsername()
		local function findUsername(folder, username)
			for _, child in pairs(folder:GetChildren()) do
				local playerFolder = child:FindFirstChild(username)
				if playerFolder then
					return child -- Return the folder containing the username
				else
					local foundFolder = findUsername(child, username)
					if foundFolder then
						return foundFolder -- If found in a subfolder, return the folder
					end
				end
			end
			return nil -- Username not found
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
			game:GetService("ReplicatedStorage"):WaitForChild("queu_up"):FireServer()
		else
			print("Username not found in ReplicatedStorage.parties")
		end
		wait(10)


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

		
			

			-- Function to check if the Timer GUI is visible
			local function isTimerGuiNotVisible()
				local player = game:GetService("Players").LocalPlayer
				local timerGui = player.PlayerGui:WaitForChild("top_ui"):FindFirstChild("Timer")

				if timerGui and timerGui.Visible == false then
					return false
				else
					return true
				end
			end

			-- Coroutine function
			local function mainCoroutine()
				while isTimerGuiNotVisible() do
					wait(1) -- Adjust the delay as needed, e.g., check every second
				end

				-- Timer GUI is not visible, so teleport to the desired game
				TeleportService:Teleport(9321822839)
			end

			local timeout = 25 -- Set the timeout in seconds (change this as needed)
			-- Function to check if the Timer GUI is visible
			local function isTimerGuiVisible()
				local player = game:GetService("Players").LocalPlayer
				local timerGui = player.PlayerGui:FindFirstChild("top_ui"):FindFirstChild("Timer")

				if timerGui and timerGui.Visible == true then
					return true
				else
					return false
				end
			end
			print("Farming Ouw for 10 Minutes..")

			local startTime = tick() -- Record the start time
			-- Wait until the Timer GUI is visible or until the timeout is reached
			while not isTimerGuiVisible() do
				if tick() - startTime >= timeout then
					print("Timeout reached. Timer GUI did not become visible.")
					break -- Exit the loop if the timeout is reached
				end
				wait(1) -- Adjust the delay as needed, e.g., check every second
			end

			-- Check if the Timer GUI became visible or not
			if isTimerGuiVisible() then
				print("Timer GUI is now visible, continuing with the script...")
				wait()
				local loopCM = coroutine.create(mainCoroutine)
				coroutine.resume(loopCM)
				wait(1)
				--coroutine.wrap(loopFunction)()
				--Options
local Method = "Fist" --Fist/Claws/Sword
_G.Enabled = true
--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
print()
--Instances
local Map = workspace.Map
local Mobs = workspace.Mobs
local Remotes = ReplicatedStorage.Remotes
local Client = Players.LocalPlayer

--#region Functions
local spawn, wait = task.spawn, task.wait

local FireServer = Instance.new("RemoteEvent").FireServer
local InvokeServer = Instance.new("RemoteFunction").InvokeServer

function Call(self, ...) --Caching the FireServer and InvokeServer functions for optimization
    local Method = self.ClassName == ("RemoteEvent") and FireServer or self.ClassName == ("RemoteFunction") and InvokeServer

    return spawn(Method, self, ...)
end

function Teleport(Position, Offset, Speed)
    local Distance = Client:DistanceFromCharacter(Position + (Offset or Vector3.zero))
    
    if Distance < 2500 then
        local Tween = TweenService:Create(
            Client.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = CFrame.new(Position + (Offset or Vector3.zero)
        )})

        Tween:Play()

        return Tween.Completed:Wait()
    else
        Client.Character.HumanoidRootPart.CFrame = Position + (Offset or Vector3.zero)
        
        return wait()
    end
end

local Initiate_S = Remotes.To_Server.Handle_Initiate_S_

local AttackMethods = {
    Fist = "fist_combat",
    Sword = "Sword_Combat_Slash",
    Claws = "claw_Combat_Slash"
}

function Attack()
    local Method = AttackMethods[Method]

    for Cycle=1, 5 do
        Call(
            Initiate_S,
            Method,
            Client,
            Client.Character,
            Client.Character.HumanoidRootPart,
            Client.Character.Humanoid,
             Cycle ~= 5 and Cycle or Cycle == 5 and 919
        )
    end
end

local Orbs = {
    "InstaKill",
    "HealthRegen",
    "StaminaRegen",
    "BloodMoney",
    "DoublePoints",
}

function ClaimOrbs()
    for i, Orb in next, Map:GetChildren() do
        if table.find(Orbs, Orb.Name) then
            pcall(Teleport, Orb:FindFirstChildOfClass("MeshPart").CFrame.Position, nil, 256)
        end
    end
end

function CreateInstance(Class, Properties)
    local Instance = Instance.new(Class)

    for Property, Value in Properties do
        Instance[Property] = Value
    end

    return Instance
end

-- Function to find the correct room name
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

-- Function to tween the character to a random part within "Spawnpoints"
local function sps()
    local roomName = findRoomName()
    if roomName then
        local spawnpoints = workspace.Map:FindFirstChild(roomName):FindFirstChild("Spawnpoints")
        if spawnpoints then
            local parts = spawnpoints:GetChildren()
            if #parts > 0 then
                local randomPart = parts[math.random(1, #parts)]
                if randomPart and randomPart:IsA("BasePart") then
                    local destination = randomPart.Position + Vector3.new(0, 5, 0)
                    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out) -- Adjust tweenTime as needed
                    local tween = game.TweenService:Create(Client.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(destination)})
                    tween:Play()
                    wait(3)
                end
            else
                warn("No parts found in Spawnpoints of room: " .. roomName)
            end
        else
            warn("No 'Spawnpoints' found in room: " .. roomName)
        end
    else
        warn("No room with parts found in workspace.Map.")
    end
end
--#endregion

--Main
local BodyVelocity = CreateInstance("BodyVelocity", {MaxForce = Vector3.new(1/0, 1/0, 1/0), Velocity = Vector3.zero, Name = "BV"})
local BodyAngularVelocity = CreateInstance("BodyAngularVelocity", {MaxTorque = Vector3.new(1/0, 1/0, 1/0), AngularVelocity = Vector3.zero, Name = "BAV"})

spawn(function()
    while _G.Enabled do
        local orbPresent = false
        for i, Orb in next, Map:GetChildren() do
            if table.find(Orbs, Orb.Name) then
                orbPresent = true
                break
            end
        end

        if orbPresent then
            ClaimOrbs()
        elseif #Mobs:GetChildren() == 0 then
            sps()
        else
            for i, Mob in next, Mobs:GetChildren() do
                Mob = Mob:FindFirstChildOfClass("Model")

                pcall(function()
                    BodyVelocity:Clone().Parent = Client.Character.LowerTorso
                    BodyAngularVelocity:Clone().Parent = Client.Character.LowerTorso

                    Teleport(Mob.HumanoidRootPart.CFrame.Position, Vector3.new(0, 50, 0), 128)
                end)        
                
                repeat
                    local Status = pcall(function()
                        if #Mobs:GetChildren() == 0 then
                            spawn(ClaimOrbs)
                        end

                        Client.Character.HumanoidRootPart.CFrame = Mob.HumanoidRootPart.CFrame
                        wait(0.25)
                        Attack()
                        Teleport(Mob.HumanoidRootPart.CFrame.Position, Vector3.new(0, 50, 0), 256)
                        repeat wait() until Client:WaitForChild("combotangasd123", 9e9).Value == 0 and wait(0.25)
                    end)
                    if not Status or not _G.Enabled then
                        break
                    end

                until wait() and not _G.Enabled

                pcall(function()
                    Client.Character.LowerTorso:FindFirstChildOfClass("BodyVelocity"):Destroy()
                    Client.Character.LowerTorso:FindFirstChildOfClass("BodyAngularVelocity"):Destroy()    
                end)
            end
        end
        wait()
    end
end)

spawn(function()
    while _G.Enabled do
        local Chest = game:GetService("Workspace").Debree:FindFirstChild("Loot_Chest")
        
        if Chest and #Chest:WaitForChild("Drops"):GetChildren() > 0 then
            local Remote = Chest:WaitForChild("Add_To_Inventory")
        
            for _,Drop in next, Chest:WaitForChild("Drops"):GetChildren() do
                Call(Remote, Drop.Name)
            end
        end
        wait(3)
    end
end)
				--[[
				wait(600)
				local p = game.Players.LocalPlayer
				local c = p.Character
				local h = c:FindFirstChild("Humanoid")
				-- Check if your character and humanoid exist
				if c and h then
					-- Set the humanoid's health to 0 to "kill" the character
					h.Health = 0
				else
					print("Character or humanoid not found.")
				end
				wait(5)
				game:GetService("ReplicatedStorage"):WaitForChild("TeleportToShop"):FireServer()
				wait(30)
				TeleportService:Teleport(9321822839)
				]]--
			end
			TeleportService:Teleport(9321822839)
		else
			print("Place ID doesn't match")
		end
