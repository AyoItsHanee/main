workspace.FallenPartsDestroyHeight = -50000

--------- SERVICES //TEST WORKS [MAP 1]

--- ANTI AFK?
repeat wait() until game:IsLoaded()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VIM = game:GetService("VirtualInputManager")
local ReplStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Input = game:GetService("UserInputService")
local COREGUI = game:GetService("CoreGui")
local LP = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local RunS = game:GetService("RunService")
local X, Y = 0, 0
local Mouse = LP:GetMouse()
local GetLocalName = LP.Name
local request = (syn and syn.request) or (http and http.request) or http_request
local client = game:GetService("Players").LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local Data = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name]
local Tool = game:GetService("ReplicatedStorage").Tools:GetChildren()
local WebhookURL = "" 
game:GetService("Players").LocalPlayer.DisplayName = "SharkHub"

local function GetHuman()
    local h = LP.Character
    h = h and (h:FindFirstChild("Humanoid") or h:FindFirstChildWhichIsA("Humanoid"))
    return h or workspace.CurrentCamera.CameraSubject
end

local GramxProjectFloat = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
    local BV = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity")
    BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    BV.Name = GramxProjectFloat
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end


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


local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" then
    Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    elseif typeof(Endpoint) == "CFrame" then
    Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end


function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
    Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().TweenSpeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    TweenInfo:Play()
    function TweenFunc:Cancel()
    TweenInfo:Cancel()
    return false
    end
    if Distance <= 100 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Endpoint
    TweenInfo:Cancel()
    return false
    end
    return TweenFunc
end
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

local function SkillBind(bind)
    pcall(function()
        VIM:SendKeyEvent(true,bind,false,game)
        task.wait()
        VIM:SendKeyEvent(false,bind,false,game)
        wait(.2)
    end)
end
--------- SERVICES // TABLES	

local TrainersCF = {
    ["Water Trainer"] = CFrame.new(705.209229, 261.426819, -2409.51587, -0.566798735, -5.48522401e-08, -0.641887605, -7.38932258e-08, 1, 2.8182352e-09, 0.641887605, 4.95921633e-08, -0.566798735),
    ["Insect Trainer"] = CFrame.new(2873.81177, 316.95871, -3917.9397, 0.40715313, 4.81208531e-08, 0.91335988, -8.85969982e-08, 1, -1.31911939e-08, -0.91335988, -7.55501048e-08, 0.40715313),
    ["Thunder Trainer"] = CFrame.new(-322.369507, 426.857788, -2384.4021, 0.361198723, -4.49157973e-08, -0.932488859, 1.14233451e-07, 1, -3.91942434e-09, 0.932488859, -1.05105727e-07, 0.361198723),
    ["Wind Trainer"] = CFrame.new(1792.31458, 334.338989, -3521.31104, 0.862527311, -5.19402583e-08, -0.506010473, 8.30083167e-08, 1, 3.88463874e-08, 0.506010473, -7.55091492e-08, 0.862527311)
}

local Locations = {
    ["Zapiwara Mountain"] = CFrame.new(-365.617981, 425.857422, -2303.92285, -0.351566792, -6.70503529e-13, 0.93616277, 9.77098068e-13, 1, 1.08316502e-12, -0.93616277, 1.2955277e-12, -0.351566792),
    ["Waroru Cave"] = CFrame.new(683.164062, 261.426819, -2401.41797, 0.137014925, -3.46316149e-08, 0.990568995, 6.38769482e-09, 1, 3.4077793e-08, -0.990568995, 1.65828595e-09, 0.137014925),
    ["Slasher Demon"] = CFrame.new(-485.866608, 274.511871, -3314.98169, -0.79503566, -1.09233929e-08, -0.606562674, 1.19430055e-09, 1, -1.95740775e-08, 0.606562674, -1.62865081e-08, -0.79503566),
    ["Ushumaru Village"] = CFrame.new(-90.0373688, 354.723511, -3170.00439, 0.817297578, -1.0121405e-08, 0.576215804, 3.12666586e-08, 1, -2.6782951e-08, -0.576215804, 3.99059843e-08, 0.817297578),
    ["Ouwbayashi Home"] = CFrame.new(1593.49072, 315.983917, -4618.15088, -0.795035839, -1.09234e-08, -0.606562734, 1.19429622e-09, 1, -1.95740828e-08, 0.606562734, -1.62865081e-08, -0.795035839),
    ["Kabiwaru Village"] = CFrame.new(2037.20203, 315.908813, -2956.77539, -0.795035839, -1.09234e-08, -0.606562734, 1.19429622e-09, 1, -1.95740828e-08, 0.606562734, -1.62865081e-08, -0.795035839),
    ["Zapiwara Cave"] = CFrame.new(-8.2838707, 275.944641, -2414.72607, -0.795035779, -1.09233964e-08, -0.606562555, 1.19429289e-09, 1, -1.95740775e-08, 0.606562555, -1.62865046e-08, -0.795035779),
    ["Dangerous Woods"] = CFrame.new(4061.43677, 342.289581, -3928.90332, -0.795035839, -1.09233973e-08, -0.606562614, 1.19429444e-09, 1, -1.95740775e-08, 0.606562614, -1.62865064e-08, -0.795035839),
    ["Final Selection"] = CFrame.new(5200.76709, 365.949982, -2425.61646, -0.795035779, -1.09233964e-08, -0.606562555, 1.19429289e-09, 1, -1.95740775e-08, 0.606562555, -1.62865046e-08, -0.795035779),
    ["Kiribating Village"] = CFrame.new(-40.3280869, 282.282745, -1623.75159, -0.795035839, -1.09233991e-08, -0.606562614, 1.19429266e-09, 1, -1.95740792e-08, 0.606562614, -1.62865046e-08, -0.795035839),
    ["Butterfly Mansion"] = CFrame.new(3022.90869, 316.075623, -3928.17261, -0.795035779, -1.09233982e-08, -0.606562555, 1.19429144e-09, 1, -1.95740775e-08, 0.606562555, -1.62865046e-08, -0.795035779),
    ["Abubu Cave"] = CFrame.new(1044.44873, 276.190704, -3483.0647, -0.795035839, -1.09233991e-08, -0.606562614, 1.19429266e-09, 1, -1.95740792e-08, 0.606562614, -1.62865046e-08, -0.795035839),
    ["Testing Place"] = CFrame.new(-32, 3, 137)
}

local BossessTable = {"Sabito", "Susamaru", "Zanegutsu Kuuchie", "Yahaba", "Bandit Kaden", "Bandit Zoku", "Shiron", "Nezuko", "Slasher", "Giyu", "Sanemi"}
local bosCFTable = {
    ["Susamaru"] = CFrame.new(1415.65686, 315.908813, -4571.56445, 0.546769679, 9.56999102e-08, -0.837283075, -3.89699188e-08, 1, 8.88496885e-08, 0.837283075, -1.59514606e-08, 0.546769679),
    ["Sabito"] = CFrame.new(1257.60046, 275.351685, -2834.26611, -0.999906898, 0, 0.0136531433, 0, 1, 0, -0.0136531433, 0, -0.999906898),
    ["Zanegutsu Kuuchie"] = CFrame.new(-336.3461, 425.857422, -2271.75513, -0.698250651, 1.51218398e-08, 0.715853333, -2.08847464e-08, 1, -4.1495408e-08, -0.715853333, -4.39246115e-08, -0.698250651),
    ["Yahaba"] = CFrame.new(1415.65686, 315.908813, -4571.56445, 0.546769679, 9.56999102e-08, -0.837283075, -3.89699188e-08, 1, 8.88496885e-08, 0.837283075, -1.59514606e-08, 0.546769679),
    ["Bandit Kaden"] = CFrame.new(-569.584351, 304.46698, -2827.55371, 0.480675608, -1.73434103e-08, 0.876898468, 1.14556499e-07, 1, -4.30165024e-08, -0.876898468, 1.21131407e-07, 0.480675608),
    ["Shiron"] = CFrame.new(3203.10229, 370.884155, -3953.36035, 0.839348018, 3.06273158e-08, -0.54359442, -9.09106301e-09, 1, 4.23049826e-08, 0.54359442, -3.05667527e-08, 0.839348018),
    ["Nezuko"] = CFrame.new(3549.86816, 342.214478, -4595.73145, 0.869256139, 6.38721716e-08, -0.494362026, -6.77404373e-08, 1, 1.00905426e-08, 0.494362026, 2.47170338e-08, 0.869256139),
    ["Bandit Zoku"] = CFrame.new(174.656708, 283.257355, -1969.98572, -0.814278841, -6.32300328e-08, 0.5804739, -9.84254598e-08, 1, -2.91412618e-08, -0.5804739, -8.08625273e-08, -0.814278841),
    ["Slasher"] =  CFrame.new(4355.59082, 342.214478, -4386.90527, -0.943093359, 9.45450722e-08, -0.332528085, 7.62970487e-08, 1, 6.79336054e-08, 0.332528085, 3.86968253e-08, -0.943093359),
    ["Giyu"] = CFrame.new(3013.30884, 316.95871, -2916.32202, 0.76092875, 3.55993954e-08, 0.648835421, -1.75982926e-08, 1, -3.4228016e-08, -0.648835421, 1.46266848e-08, 0.76092875),
    ["Sanemi"] = CFrame.new(1619.91357, 348.461884, -3717.00464, 0.995524168, -1.20393835e-07, 0.0945073739, 1.19773844e-07, 1, 1.22327712e-08, -0.0945073739, -8.58508931e-10, 0.995524168)
}

--------- SERVICES // KA

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

local attackMethods = {
    ["Combat"] = 'fist_combat',
    ["Sword"] = 'Sword_Combat_Slash',
    ["Scythe"] = 'Scythe_Combat_Slash',
    ["Claw"] = 'claw_Combat_Slash',
    ["Fans"] = 'fans_combat_slash'
}

if game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping") then 
    game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping").OnClientInvoke = function() 
        task.wait(5)
        return true 
    end 
end 

-- // FARM METHOD
spawn(function()
   while wait() do
       pcall(function()
           SkillActive = AutoUseSkills and (FarmBoss and NearestMobs) or AutoUseSkills and (FarmQuest and NearestMobs) or AutoUseSkills and (FarmMob and NearestMobs) or AutoUseSkills and (AllBosses and NearestMobs)
           if FarmMethod == "Above" then
               FarmModes = CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
           elseif FarmMethod == "Below" then
               FarmModes = CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(90),0,0)
           elseif FarmMethod == "Behind" then
               FarmModes = CFrame.new(0,0,getgenv().Distance)
           elseif FarmMethod == "Front" then
               FarmModes = CFrame.new(0,0,-getgenv().Distance)
           end
           for i,v in pairs(LP.PlayerGui.MainGuis.Items.Scroll:GetChildren()) do
               Insert = true
               if v.ClassName == "Frame" and v.Name ~= "Health Elixir" and v.Name ~= "Health Regen Elixir" and v.Name ~= "Stamina Elixir" and v.Name ~= "Bandage" then
                   for i,v2 in pairs(invTable) do if v2 == v.Name then Insert = false end end
                   if Insert == true then table.insert(invTable, v.Name) end
               end
           end
       end)
   end
  end)

-- // NO CLIP

spawn(function()
   game:GetService("RunService").Stepped:Connect(function()
       if getgenv().AllBosses or TPtoLocation or TPtoTrainer or getgenv().TPtoMuzan or FarmBoss then
           for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then
                   v.CanCollide = false    
               end
               if v:IsA("Humanoid") then
                   v:ChangeState(11)
               end
           end
       end
   end)
end)


--------- SERVICES // ANTI AFK

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

-- // KILL AURA - FARM
	
local killAuraWait = 1.25  -- Initial value for Kill Aura wait time

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().KillAura then
                attack(attackMethods[Method])
                task.wait(killAuraWait)  -- Use the updated Kill Aura wait time
                repeat
                    wait()
                until game.Players.LocalPlayer:WaitForChild("combotangasd123").Value == 0
            end
        end)
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
       pcall(function()
           if getgenv().AllBosses then

               if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                   antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                   antifall3.Velocity = Vector3.new(0, 0, 0)
                   antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
               elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                   local v = GetNearestBoss()

                               repeat task.wait()                                      
                                   if GetDistance(v:GetModelCFrame() * FarmModes) < 25 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                                       if TweenFa then
                                       TweenFa:Cancel()
                                       wait(.1)
                                       end
                                       LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                                   else
                                       TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                                   end
                                   if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                                       NearestMobs = true
                                   elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                                       NearestMobs = false
                                   end
                               until not getgenv().AllBosses or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                               NearestMobs = false
                       
                   
               end
           else
               antifall3:Destroy()
           end
           if getgenv().AllBosses == false then
               TweenFa:Cancel()
           end
       end)
   end
end)

-- // AUTO COLLECT CHESTS - FARM
	
spawn(function()
   while task.wait() do
      if AutoCollectChest then
         for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
            if v.Name == "Loot_Chest" then
               for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do
                  v["Add_To_Inventory"]:InvokeServer(c.Name)
                  delay(0.1, function()
                     c:Destroy()
                  end)
               end
         end
      end
   end
   end
end)

 spawn(function()
     while task.wait() do
         if AutoCollectChestv2 then
             for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
                 if v.Name == "Loot_Chest" and v:FindFirstChild("Drops") then
                     if #v.Drops:GetChildren() == 0 then
                         v:Destroy()
                     else
                         for _, drop in pairs(v.Drops:GetChildren()) do
                             local args = {
                                 [1] = drop.Name
                             }
 
                             v.Add_To_Inventory:InvokeServer(unpack(args))
                             if #v.Drops:GetChildren() == 0 then
                                 v:Destroy()
                             end
                         end
                     end
                 end
             end
         end
     end
 end)    

 local function sendWebhook(itemName)
   local payload = {
       ["content"] = "",
       ["embeds"] = {{
           ["title"] = "**Item Obtained!**",
           ["description"] = game.Players.LocalPlayer.DisplayName .. " obtained the item: " .. itemName,
           ["type"] = "rich",
           ["color"] = tonumber(0xffffff),
           ["fields"] = {
               {
                   ["name"] = "Hardware ID:",
                   ["value"] = "Unknown", -- Replace with the hardware ID retrieval method suitable for Fluxus
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
       Url = WebhookURL,
       Method = "POST",
       Headers = headers,
       Body = requestBody
   })
end

spawn(function()
   while true do
       if AutoCollectChestv3 then
           for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
               if v.Name == "Loot_Chest" and v:FindFirstChild("Drops") then
                   if #v.Drops:GetChildren() == 0 then
                       v:Destroy()
                   else
                       for _, drop in pairs(v.Drops:GetChildren()) do
                           local args = {
                               [1] = drop.Name
                           }

                           v.Add_To_Inventory:InvokeServer(unpack(args))
                           if #v.Drops:GetChildren() == 0 then
                               v:Destroy()
                           end

                           sendWebhook(drop.Name)
                       end
                   end
               end
           end
       end
       wait()
   end
end)



-- // AUTO EAT SOULS - FARM

spawn(function()
   while task.wait() do
      if AutoEatSouls then
         for i,v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
            if v.Name == "Soul" then
               pcall(function()
                  workspace.Debree.Soul.Handle.Eatthedamnsoul:FireServer()
               end)
            end
         end
      end
   end
end)

            getgenv().speed = 270
            getgenv().AutoRejoin = true -- Automatically rejoins when you're kicked
            getgenv().delay = 1

            game.Players.PlayerRemoving:Connect(function(player)
                if player.Name == game.Players.LocalPlayer.Name and getgenv().AutoRejoin then
                    local ts = game:GetService("TeleportService")
                    ts:Teleport(game.PlaceId)
                    autoload()
                end
            end)

            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local chr = Player.Character
            local root = chr.HumanoidRootPart

            local TeleportSpeed = getgenv().speed or 250
            local NextFrame = RunService.Heartbeat

            local function fireproximityprompt(ProximityPrompt, Amount, Skip)
                assert(ProximityPrompt, "Argument #1 Missing or nil")
                assert(
                    typeof(ProximityPrompt) == "Instance" and ProximityPrompt:IsA("ProximityPrompt"),
                    "Attempted to fire a Value that is not a ProximityPrompt"
                )
                local HoldDuration = ProximityPrompt.HoldDuration
                if Skip then
                    ProximityPrompt.HoldDuration = 0
                end
                for i = 1, Amount or 1 do
                    ProximityPrompt:InputHoldBegin()
                    if Skip then
                        local RunService = game:GetService("RunService")
                        local Start = tick()
                        repeat
                            RunService.Heartbeat:Wait(0.1)
                        until tick() - Start > HoldDuration
                    end
                    ProximityPrompt:InputHoldEnd()
                end
                ProximityPrompt.HoldDuration = HoldDuration
            end

            local function ImprovedTeleport(Target)
                if typeof(Target) == "Instance" and Target:IsA("BasePart") then
                    Target = Target.Position
                end
                if typeof(Target) == "CFrame" then
                    Target = Target.p
                end
                local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if not HRP then
                    return
                end
                local StartingPosition = HRP.Position
                local PositionDelta = Target - StartingPosition -- Calculating the difference between the start and end positions.
                local StartTime = tick()
                local TotalDuration = (StartingPosition - Target).magnitude / TeleportSpeed
                repeat
                    NextFrame:Wait()
                    local Delta = tick() - StartTime
                    local Progress = math.min(Delta / TotalDuration, 1) -- Getting the percentage of completion of the teleport (between 0-1, not 0-100)
                    -- We also use math.min to maximize it at 1 in case the player gets an FPS drop, so it doesn't go past the target.
                    local MappedPosition = StartingPosition + (PositionDelta * Progress)
                    HRP.Velocity = Vector3.new() -- Resetting the effect of gravity so it doesn't get too much and drag the player below the ground.
                    HRP.CFrame = CFrame.new(MappedPosition)
                until (HRP.Position - Target).magnitude <= TeleportSpeed / 2
                HRP.Anchored = false
                HRP.CFrame = CFrame.new(Target)
            end

            local flowers = game:GetService("Workspace").Demon_Flowers_Spawn

            local function getFlower()
                local dist, flower = math.huge
                for i, v in next, flowers:GetChildren() do
                    if v:IsA("Model") then
                        local mag = (root.Position - v.WorldPivot.Position).magnitude
                        if mag < dist then
                            dist = mag
                            flower = v
                        end
                    end
                end
                return flower
            end

            oldasdqw = coroutine.wrap(function()
                while TP do
                    task.wait()
                    ImprovedTeleport(getFlower().WorldPivot.Position)
                    task.wait(getgenv().delay)
                    for i, v in next, getFlower():GetDescendants() do
                        if v:IsA("ProximityPrompt") then
                            local try = 0
                            repeat
                                wait(0.01)
                                try += 1
                                fireproximityprompt(v, 1, true)
                                if not getFlower() or not TP then
                                    oldasdqw()
                                    break
                                end
                            until try == 10
                            getFlower():Destroy()
                        end
                    end
                end
            end)

            oldasdqw()
        else
            TP = false
            if oldasdqw then
                oldasdqw()
            end
oldasdqw()
