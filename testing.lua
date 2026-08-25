-- this was processed by Luaxom at https://discord.gg/Sps39CydcZ
-- Obfuscated by Kairsh Studio
local function _isGenuine(fn)
    if type(fn) ~= "function" then return false end
    local ok, isC = pcall(function() return iscclosure and iscclosure(fn) end)
    if ok and isC ~= nil then return isC end
    local ok2, what = pcall(function()
        if debug and debug.info then
            return debug.info(fn, "s")
        elseif debug and debug.getinfo then
            local info = debug.getinfo(fn)
            return info and info.what
        end
    end)
    if ok2 and what ~= nil then return what == "[C]" or what == "C" end
    return true
end
local function _loadstringGenuine()
    if not _isGenuine(loadstring) then return false end
    local a, b = math.random(100, 999), math.random(100, 999)
    local ok, chunk = pcall(loadstring, "return " .. a .. " + " .. b)
    if not ok or type(chunk) ~= "function" then return false end
    local ok2, result = pcall(chunk)
    return ok2 and result == (a + b)
end
if not _loadstringGenuine() then return end
local _K={229,203,167,121,11,195,76,19,66,76,15,20,156,148,34,75}
local function _D(s)
    local o={}
    local n=#s
    local ki=1
    local idx=1
    while idx<=n do
        local b=tonumber(s:sub(idx,idx+1),16)
        b=bit32.bxor(b,_K[ki])
        o[#o+1]=string.char(b)
        ki=ki%#_K+1
        idx=idx+2
    end
    return table.concat(o)
end
print(_D("be80c61079b0243311387a70f5fb7f6ba0b3c21a7eb7257d256c5c77eefd523fdfebc6167f9c3e7634296173f9ba4e3e84"))
getgenv().KeyUsed = _D("")
 
 
 
if game:IsLoaded() then
    print(_D("a6a4c90d62ad397a2c2b"))
else
    game.Loaded:Wait()
end

 
local Workspace           = game:GetService(_D("b2a4d51278b32d7027"))
local Players             = game:GetService(_D("b5a7c6006eb13f"))
local ReplicatedStorage   = game:GetService(_D("b7aed71562a02d6727285c60f3e6432c80"))
local HttpService         = game:GetService(_D("adbfd30958a63e652b2f6a"))
local TeleportService     = game:GetService(_D("b1aecb1c7bac3e6711297d62f5f747"))
local TweenService        = game:GetService(_D("b1bcc21c6590296134256c71"))
local CollectionService   = game:GetService(_D("a6a4cb156ea0387a2d225c71eee24b2880"))
local RunService          = game:GetService(_D("b7bec92a6eb13a7a2129"))
local Lighting            = game:GetService(_D("a9a2c0117faa2274"))
local UserInputService    = game:GetService(_D("b0b8c20b42ad3c66361f6a66eafd412e"))
local VirtualInputManager = game:GetService(_D("b3a2d50d7ea2205a2c3c7a60d1f54c2a82aed5"))
local LocalPlayer         = Players.LocalPlayer

 
 
 
local SESSION = tick()
getgenv().__AoTHubSession = SESSION
local function sessionAlive()
    return getgenv().__AoTHubSession == SESSION
end

local serverStartTick = tick()
local getAllTargets, getUntouchedTarget

 
local State = {
    player = LocalPlayer,
    playerName = LocalPlayer.Name,
    multiHitCount = 1,
    napeVisible = true, 
    espEnabled = false, 
    bladeEnabled = true, 
    injuryEnabled = false, 
    escapeEnabled = false,
    gasEnabled = false,
    firstpress = true,
    ripperEnabled = false,
    autofarmEnabled = true,
    oldfarmEnabled = false,
    GrabKeyCode = nil, 
    grabtimer = nil, 
    grabgui = nil, 
    attacktitan = nil, 
    marker = nil, 
    erenExtend = false, 
    leftleg = nil, 
    rightleg = nil, 
    leftarm = nil, 
    rightarm = nil, 
    eyes = nil, 
    nape = nil, 
    passed = false, 
    cooldownT = nil, 
    cooldownS = nil, 
    cooldownR = nil, 
    hovering = false,
    autoSpinEnabled = false,
    targetSpinMode = _D("a9aec01c65a72d613b6c6066bcd6473f91aed5"),
    targetSpecificFamily = _D("bcaec61e6eb1"),
    autoRejoinEnabled = true,
    autoModifiersEnabled = true,
    killAuraEnabled = false,
    fixCameraEnabled = false,
    farmMethod = _D("b6a0de"),
    delayMissionComplete = false,
    delayMissionTime = 30,
    untouchedTarget = nil,
    lobbyTeleportEnabled = true,
    maxGames = 10,
    gamesPlayed = 0,
    reloadingBlade = false,
    autoJoinBoostedEnabled = true,
    autoJoinBoostedDelay = 5,
    autoJoinBoostedDifficulty = _D("a4bed31666a2387a21"),
    farmMode = _D("aa9b"),
    autoUpgradeGearEnabled = true,
    autoUnlockSkillsEnabled = false,
    skillPathLeft = _D("b7aec01c65"),
    skillPathMiddle = _D("a6b9ce0d62a02d7f"),
    skillPathRight = _D("adaec6157fab"),
    optimizePerformanceEnabled = false,
    disable3DRenderingEnabled = false,
    fpsCapValue = 60,
    waitBeforeKillingEnabled = false,
    waitBeforeKillingTime = 5,
    waitingToKill = false,
    napeExtendEnabled = false,
    napeMultiplier = 10,
    dieAfterStreakEnabled = true,
    streakThreshold = 10000
}

 
 
 
 
local cachedRefills = nil
local lastRefillScan = 0

local function getFallbackRefills()
    if not cachedRefills or (#cachedRefills == 0 and os.clock() - lastRefillScan > 10) then
        lastRefillScan = os.clock()
        cachedRefills = {}
        for _, child in ipairs(Workspace:GetDescendants()) do
            if child.Name == _D("b7aec11067af") and child:IsA(_D("a7aad41c5ba23e67")) then
                table.insert(cachedRefills, child)
            end
        end
    end
    return cachedRefills
end

Workspace:GetAttributeChangedSignal(_D("b1b2d71c")):Connect(function()
    cachedRefills = nil
end)

 
 
 
local strippedNapes = setmetatable({}, { __mode = _D("8e") })
local titanHands = setmetatable({}, { __mode = _D("8e") })

local function stripNapeJoints(nape)
    if strippedNapes[nape] then return end
    for _, joint in ipairs(nape:GetJoints()) do
        joint:Destroy()
    end
    strippedNapes[nape] = true
end

 
 
local function stripAndDragPart(part, pos)
    stripNapeJoints(part)
    part.Anchored = true
    part.CFrame = CFrame.new(pos)
end

local function getHandParts(titan)
    local hands = titanHands[titan]
    if not hands then
        hands = {}
        for _, part in ipairs(titan:GetDescendants()) do
            if part:IsA(_D("a7aad41c5ba23e67")) and part.Name:lower():find(_D("8daac91d")) then
                table.insert(hands, part)
            end
        end
        titanHands[titan] = hands
    end
    return hands
end

setmetatable(State, {
    __index = function(tbl, key)
        local char = tbl.player.Character
        if key == _D("86a3c60b6aa0387630") then
            return char
        elseif key == _D("97a4c80d") then
            return char and char:FindFirstChild(_D("adbeca1865ac257710236060ccf5503f"))
        elseif key == _D("8dbeca1865ac2577") then
            return char and char:FindFirstChildOfClass(_D("adbeca1865ac2577"))
        elseif key == _D("87a7c61d6e") then
            local rig = char and char:FindFirstChild(_D("b7a2c026") .. tbl.playerName)
            local leftHand = rig and rig:FindFirstChild(_D("a9aec10d43a22277"))
            return leftHand and leftHand:FindFirstChild(_D("a7a7c61d6e9c7d"))
        elseif key == _D("87a7c61d6ea1236b") then
            return char and char:FindFirstChild(_D("a8aace17"))
        elseif key == _D("8ca5cd0c79ba0a7c2e286a66") then
            return char and char:FindFirstChild(_D("aca5cd0c79aa2960"))
        elseif key == _D("87bed30d64ad3f552d206b71ee") then
            local playerGui = tbl.player:FindFirstChild(_D("b5a7c6006eb10b662b"))
            local interface = playerGui and playerGui:FindFirstChild(_D("aca5d31c79a52d7027"))
            return interface and interface:FindFirstChild(_D("a7bed30d64ad3f"))
        elseif key == _D("8da4d31b6ab1") then
            local playerGui = tbl.player:FindFirstChild(_D("b5a7c6006eb10b662b"))
            local interface = playerGui and playerGui:FindFirstChild(_D("aca5d31c79a52d7027"))
            local hud = interface and interface:FindFirstChild(_D("ad9ee3"))
            local main = hud and hud:FindFirstChild(_D("a8aace17"))
            local top = main and main:FindFirstChild(_D("b1a4d7"))
            return top and top:FindFirstChild(_D("ada4d31b6ab1"))
        elseif key == _D("96bfc21c6784397a") then
            return tbl.hotbar and tbl.hotbar:FindFirstChild(_D("b6a0ce15679c7e"))
        elseif key == _D("91a3d50c78b70b662b") then
            return tbl.hotbar and tbl.hotbar:FindFirstChild(_D("b6a0ce15679c7d"))
        elseif key == _D("91a2d31865b0") then
            return Workspace:FindFirstChild(_D("b1a2d31865b0"))
        elseif key == _D("97aec11067af") then
            local root = tbl.root
            if not root then return nil end
            local closest = nil
            local minDist = math.huge

             
            pcall(function()
                local unclimbable = Workspace:FindFirstChild(_D("b0a5c41562ae2e7220206a"))
                local reloads = unclimbable and unclimbable:FindFirstChild(_D("b7aecb166aa73f"))
                if reloads then
                    for _, container in ipairs(reloads:GetChildren()) do
                        local r = container:FindFirstChild(_D("b7aec11067af"))
                        if r and r:IsA(_D("a7aad41c5ba23e67")) then
                            local dist = (r.Position - root.Position).Magnitude
                            if dist < minDist then
                                minDist = dist
                                closest = r
                            end
                        end
                    end
                end
            end)

            if closest then return closest end

             
            pcall(function()
                for _, part in ipairs(getFallbackRefills()) do
                    if part:IsDescendantOf(Workspace) then
                        local dist = (part.Position - root.Position).Magnitude
                        if dist < minDist then
                            minDist = dist
                            closest = part
                        end
                    end
                end
            end)

            return closest
        elseif key == _D("97aeca167fa61c7c3138") then
            local assets = ReplicatedStorage:FindFirstChild(_D("a4b8d41c7fb0"))
            local remotes = assets and assets:FindFirstChild(_D("b7aeca167fa63f"))
            return remotes and remotes:FindFirstChild(_D("b584f42d"))
        elseif key == _D("97aeca167fa60b7636") then
            local assets = ReplicatedStorage:FindFirstChild(_D("a4b8d41c7fb0"))
            local remotes = assets and assets:FindFirstChild(_D("b7aeca167fa63f"))
            return remotes and remotes:FindFirstChild(_D("a28ef3"))
        elseif key == _D("b082f7") then
            return UserInputService
        elseif key == _D("b382ea") then
            return VirtualInputManager
        elseif key == _D("a8a4d20a6e") then
            return tbl.player:GetMouse()
        elseif key == _D("84bfca1678b324763029") then
            return Lighting:FindFirstChildOfClass(_D("a4bfca1678b324763029"))
        elseif key == _D("82aaca1c5fba3c76") then
             
            return Workspace:GetAttribute(_D("b1b2d71c"))
        elseif key == _D("8ca5ea1078b0257c2c") then
            return Workspace:GetAttribute(_D("b1b2d71c")) == _D("a8a2d40a62ac2260")
        elseif key == _D("8ca5f51862a7") then
            return Workspace:GetAttribute(_D("b1b2d71c")) == _D("b7aace1d78")
        elseif key == _D("8ca5e01866a6") then
            return Workspace:GetAttribute(_D("b1b2d71c")) ~= nil
        end
        return rawget(tbl, key)
    end
})

State.passed = true

 
local function saveConfig(folder, configData)
    local filePath = folder .. _D("cab8c60f6ea71a7230256e76f0f1516591b3d3")
    if not writefile then
        return
    end
    local encodedData = HttpService:JSONEncode(configData)
    writefile(filePath, encodedData)
end

local function loadConfig(folder)
    local filePath = folder .. _D("cab8c60f6ea71a7230256e76f0f1516591b3d3")
    if not isfile then
        return {}
    elseif isfile(filePath) then
        if not readfile then
            return {}
        end
        local fileData = readfile(filePath)
        local ok, decoded = pcall(function()
            return HttpService:JSONDecode(fileData)
        end)
        if not ok then
            saveConfig(folder, {})
            return {}
        end
        return decoded
    end
    return {}
end

local saveFolder = _D("92a4d51278b32d7027")
if not isfolder(saveFolder) then
    if makefolder then
        makefolder(saveFolder)
    end
end

print(_D("a9a4c61d62ad2b33342d7d7dfdf64e2e96e58957"))
local loadedData = loadConfig(saveFolder)
print(_D("b3aad5106aa12076316c637bfdf0472fc5b8d21a68a63f6024396378e5"))

State.espEnabled = loadedData.espEnabled ~= nil and loadedData.espEnabled or State.espEnabled
State.escapeEnabled = loadedData.escapeEnabled ~= nil and loadedData.escapeEnabled or State.escapeEnabled
State.bladeEnabled = loadedData.bladeEnabled ~= nil and loadedData.bladeEnabled or State.bladeEnabled
State.napeVisible = loadedData.napeVisible ~= nil and loadedData.napeVisible or State.napeVisible
State.erenExtend = loadedData.erenExtend ~= nil and loadedData.erenExtend or State.erenExtend
State.injuryEnabled = loadedData.injuryEnabled ~= nil and loadedData.injuryEnabled or State.injuryEnabled
State.ripperEnabled = loadedData.ripperEnabled ~= nil and loadedData.ripperEnabled or State.ripperEnabled
State.autofarmEnabled = loadedData.autofarmEnabled ~= nil and loadedData.autofarmEnabled or true
State.oldfarmEnabled = loadedData.oldfarmEnabled ~= nil and loadedData.oldfarmEnabled or State.oldfarmEnabled
State.gasEnabled = loadedData.gasEnabled ~= nil and loadedData.gasEnabled or State.gasEnabled
State.targetSpinMode = loadedData.targetSpinMode ~= nil and loadedData.targetSpinMode or  _D("a9aec01c65a72d613b6c6066bcd6473f91aed5")
State.targetSpecificFamily = loadedData.targetSpecificFamily ~= nil and loadedData.targetSpecificFamily or  _D("bcaec61e6eb1")
State.autoRejoinEnabled = loadedData.autoRejoinEnabled ~= nil and loadedData.autoRejoinEnabled or true
State.autoModifiersEnabled = loadedData.autoModifiersEnabled ~= nil and loadedData.autoModifiersEnabled or State.autoModifiersEnabled
State.killAuraEnabled = loadedData.killAuraEnabled ~= nil and loadedData.killAuraEnabled or State.killAuraEnabled
State.fixCameraEnabled = loadedData.fixCameraEnabled ~= nil and loadedData.fixCameraEnabled or State.fixCameraEnabled
State.farmMethod = loadedData.farmMethod ~= nil and loadedData.farmMethod or State.farmMethod
State.multiHitCount = loadedData.multiHitCount ~= nil and loadedData.multiHitCount or State.multiHitCount
State.delayMissionComplete = loadedData.delayMissionComplete ~= nil and loadedData.delayMissionComplete or false
State.delayMissionTime = loadedData.delayMissionTime ~= nil and loadedData.delayMissionTime or 30
State.lobbyTeleportEnabled = loadedData.lobbyTeleportEnabled ~= nil and loadedData.lobbyTeleportEnabled or true
State.maxGames = loadedData.maxGames ~= nil and loadedData.maxGames or 10
State.gamesPlayed = loadedData.gamesPlayed ~= nil and loadedData.gamesPlayed or 0
State.autoJoinBoostedEnabled = loadedData.autoJoinBoostedEnabled ~= nil and loadedData.autoJoinBoostedEnabled or true
State.autoJoinBoostedDelay = loadedData.autoJoinBoostedDelay ~= nil and loadedData.autoJoinBoostedDelay or 10
State.autoJoinBoostedDifficulty = loadedData.autoJoinBoostedDifficulty ~= nil and loadedData.autoJoinBoostedDifficulty or  _D("a4bed31666a2387a21")
State.farmMode = loadedData.farmMode ~= nil and loadedData.farmMode or  _D("aa9b")
State.autoUpgradeGearEnabled = loadedData.autoUpgradeGearEnabled ~= nil and loadedData.autoUpgradeGearEnabled or true
State.autoUnlockSkillsEnabled = loadedData.autoUnlockSkillsEnabled ~= nil and loadedData.autoUnlockSkillsEnabled or false
State.skillPathLeft = loadedData.skillPathLeft ~= nil and loadedData.skillPathLeft or  _D("b7aec01c65")
State.skillPathMiddle = loadedData.skillPathMiddle ~= nil and loadedData.skillPathMiddle or  _D("a6b9ce0d62a02d7f")
State.skillPathRight = loadedData.skillPathRight ~= nil and loadedData.skillPathRight or  _D("adaec6157fab")
State.optimizePerformanceEnabled = loadedData.optimizePerformanceEnabled ~= nil and loadedData.optimizePerformanceEnabled or false
State.disable3DRenderingEnabled = loadedData.disable3DRenderingEnabled ~= nil and loadedData.disable3DRenderingEnabled or false
State.fpsCapValue = loadedData.fpsCapValue ~= nil and loadedData.fpsCapValue or 60
State.waitBeforeKillingEnabled = loadedData.waitBeforeKillingEnabled ~= nil and loadedData.waitBeforeKillingEnabled or false
State.waitBeforeKillingTime = loadedData.waitBeforeKillingTime ~= nil and loadedData.waitBeforeKillingTime or 5
State.napeExtendEnabled = loadedData.napeExtendEnabled ~= nil and loadedData.napeExtendEnabled or false
State.napeMultiplier = loadedData.napeMultiplier ~= nil and loadedData.napeMultiplier or 10
State.dieAfterStreakEnabled = loadedData.dieAfterStreakEnabled ~= nil and loadedData.dieAfterStreakEnabled or true
State.streakThreshold = loadedData.streakThreshold ~= nil and loadedData.streakThreshold or 10000


 
 
if State.autofarmEnabled and State.oldfarmEnabled then
    if State.farmMode == _D("aa9b") then
        State.oldfarmEnabled = false
    else
        State.autofarmEnabled = false
    end
end

local function saveCurrentState()
    local configToSave = {
        espEnabled = State.espEnabled, 
        escapeEnabled = State.escapeEnabled, 
        bladeEnabled = State.bladeEnabled, 
        napeVisible = State.napeVisible, 
        injuryEnabled = State.injuryEnabled, 
        erenExtend = State.erenExtend, 
        ripperEnabled = State.ripperEnabled, 
        autofarmEnabled = State.autofarmEnabled, 
        oldfarmEnabled = State.oldfarmEnabled,
        gasEnabled = State.gasEnabled,
        targetSpinMode = State.targetSpinMode,
        targetSpecificFamily = State.targetSpecificFamily,
        autoRejoinEnabled = State.autoRejoinEnabled,
        autoModifiersEnabled = State.autoModifiersEnabled,
        killAuraEnabled = State.killAuraEnabled,
        fixCameraEnabled = State.fixCameraEnabled,
        farmMethod = State.farmMethod,
        multiHitCount = State.multiHitCount,
        delayMissionComplete = State.delayMissionComplete,
        delayMissionTime = State.delayMissionTime,
        lobbyTeleportEnabled = State.lobbyTeleportEnabled,
        maxGames = State.maxGames,
        gamesPlayed = State.gamesPlayed,
        autoJoinBoostedEnabled = State.autoJoinBoostedEnabled,
        autoJoinBoostedDelay = State.autoJoinBoostedDelay,
        autoJoinBoostedDifficulty = State.autoJoinBoostedDifficulty,
        farmMode = State.farmMode,
        autoUpgradeGearEnabled = State.autoUpgradeGearEnabled,
        autoUnlockSkillsEnabled = State.autoUnlockSkillsEnabled,
        skillPathLeft = State.skillPathLeft,
        skillPathMiddle = State.skillPathMiddle,
        skillPathRight = State.skillPathRight,
        optimizePerformanceEnabled = State.optimizePerformanceEnabled,
        disable3DRenderingEnabled = State.disable3DRenderingEnabled,
        fpsCapValue = State.fpsCapValue,
        waitBeforeKillingEnabled = State.waitBeforeKillingEnabled,
        waitBeforeKillingTime = State.waitBeforeKillingTime,
        napeExtendEnabled = State.napeExtendEnabled,
        napeMultiplier = State.napeMultiplier,
        dieAfterStreakEnabled = State.dieAfterStreakEnabled,
        streakThreshold = State.streakThreshold
    }
    saveConfig(saveFolder, configToSave)
end

--[[
Players.PlayerRemoving:Connect(function(player)
    if player == LocalPlayer then
        saveCurrentState()
    end
end)
]]--
 
local WindUI                  
local runAutofarmAttackCycle
local autofarmFlyLoop
local autofarmCombatLoop
local resetErenHitboxes
local updateErenHitboxes
local updateNapeHitboxes
local updateEsp
local setupErenTitan
local _opfarmActive = false   
local autoSpinToggle
local applyAllModifiers
local retryLoop
local _retryLoopActive = false
local runKillAura
local autoJoinBoostedLoop
local _autoJoinBoostedLoopActive = false

 
 
local function showNotification(title, text)
    if WindUI then
        WindUI:Notify({ Title = title, Content = text, Duration = 4 })
    end
end

local MAP_NAMES = {
    [13379208636] = _D("a8aec90c"), [14916516914] = _D("b1a4d0172b80297d363e6e78"), [13379349730] = _D("b6a3ce1e6aad3f7b2b226e"),
    [14012874501] = _D("b1b9c80a7f"), [14638336319] = _D("a3a4d51c78b7"), [13904207646] = _D("aabed30a60aa3e6731"),
    [15220308770] = _D("b0bfc01879a7"), [17688739434] = _D("a1a4c41278"), [15824912319] = _D("b6bfc8116eb03f"),
    [14932214603] = _D("b1b9c61d6ee30f762c387d75f0"), [112374853034490] = _D("b1b9c61065aa2274"), [126678335159530] = _D("a6a3c6096eaf"),
    [15393224326] = _D("a8aec90c"), [15393230099] = _D("b1a4d0172b80297d363e6e78"), [17373821193] = _D("b6a3ce1e6aad3f7b2b226e"),
    [15393230324] = _D("b1b9c80a7f"), [17373828240] = _D("a3a4d51c78b7"), [17373824844] = _D("aabed30a60aa3e6731"),
    [18182863694] = _D("b0bfc01879a7"), [110415968652032] = _D("a1a4c41278"), [139092911630535] = _D("b6bfc8116eb03f"),
    [108309021405580] = _D("b1b9c61d6ee30f762c387d75f0"), [85939958627504] = _D("b1b9c61065aa2274"), [133979984250876] = _D("a6a3c6096eaf"),
}

local function fmtTime(sec)
    sec = tonumber(sec) or 0
    return string.format(_D("c0fb951d31e67c2126"), math.floor(sec / 60), sec % 60)
end

 
 
local function doLogProgression()
    if tick() - serverStartTick < 10 then return end
    local HS = game:GetService(_D("adbfd30958a63e652b2f6a"))

    local isLobby = (game.PlaceId == 14916516914 or MAP_NAMES[game.PlaceId] == _D("b1a4d0172b80297d363e6e78") or MAP_NAMES[game.PlaceId] == _D("a8aec90c"))
    local blacklisted = tostring(LocalPlayer:GetAttribute(_D("a7a7c61a60af256036296b")) == true)
    local gamesPlayed = tostring(State.gamesPlayed or 0)
    local maxGames    = tostring(State.maxGames or 0)

     
    local damage, kills, crits, timeTaken = _D("d5"), _D("d5"), _D("d5"), _D("d5fb9d493b")
    if not isLobby then
        local lastCheckStr = _D("")
        for _ = 1, 16 do
            local cDmg, cKills, cCrits, cTime = _D("d5"), _D("d5"), _D("d5"), _D("d5fb9d493b")
            pcall(function()
                local pGui = State.player:FindFirstChild(_D("b5a7c6006eb10b662b"))
                local iface = pGui and pGui:FindFirstChild(_D("aca5d31c79a52d7027"))
                local rWds  = iface and iface:FindFirstChild(_D("b7aed01879a73f"))
                local m     = rWds  and rWds:FindFirstChild(_D("a8aace17"))
                local inf   = m     and m:FindFirstChild(_D("aca5c116"))
                local iMain = inf   and inf:FindFirstChild(_D("a8aace17"))
                local stats = iMain and iMain:FindFirstChild(_D("b6bfc60d78"))
                if stats then
                    local function amt(n)
                        local o = stats:FindFirstChild(n)
                        local a = o and o:FindFirstChild(_D("a4a6c80c65b7"))
                        return a and a:IsA(_D("b1aedf0d47a22e762e")) and a.Text or nil
                    end
                    local t = amt(_D("b1a2ca1c54972d782722")); if t and t ~= _D("abe4e6") then cTime = t end
                    cDmg   = amt(_D("a1aaca186ca6")) or cDmg
                    cKills = amt(_D("aea2cb1578"))  or cKills
                    cCrits = amt(_D("a6b9ce0d78"))  or cCrits
                end
            end)
            local chk = cDmg .. _D("99") .. cKills .. _D("99") .. cCrits .. _D("99") .. cTime
            if cTime ~= _D("d5fb9d493b") and cDmg ~= _D("d5") and chk == lastCheckStr then
                damage, kills, crits, timeTaken = cDmg, cKills, cCrits, cTime
                break
            end
            lastCheckStr = chk
            damage, kills, crits, timeTaken = cDmg, cKills, cCrits, cTime
            task.wait(0.25)
        end
    end

     
    local pGui2 = State.player:FindFirstChild(_D("b5a7c6006eb10b662b"))
    local iface2 = pGui2 and pGui2:FindFirstChild(_D("aca5d31c79a52d7027"))
    local rWds2  = iface2 and iface2:FindFirstChild(_D("b7aed01879a73f"))
    local main2  = rWds2  and rWds2:FindFirstChild(_D("a8aace17"))
    local info2  = main2  and main2:FindFirstChild(_D("aca5c116"))

    local mapName    = MAP_NAMES[game.PlaceId]
                       or Workspace:GetAttribute(_D("a2aaca1c45a22176"))
                       or Workspace:GetAttribute(_D("a8aad7376aae29"))
                       or Workspace:GetAttribute(_D("a8aad7")) or  _D("b0a5cc1764b422330f2d7f")
    local difficulty = Workspace:GetAttribute(_D("a1a2c11f62a0397f3635")) or  _D("aba4d5146aaf")
    local mode       = Workspace:GetAttribute(_D("b1b2d71c")) or  _D("a8a2d40a62ac2260")
    local objective  = Workspace:GetAttribute(_D("aaa9cd1c68b7256527")) or  _D("")
    local boosted    = Workspace:GetAttribute(_D("a7a4c80a7fa628")) == true
    local modifiers  = Workspace:GetAttribute(_D("a8a4c3106daa296131")) or  _D("")

    local win = true
    if not isLobby then
        pcall(function()
            local stateObj = info2 and info2:FindFirstChild(_D("b6bfc60d6e"))
            if stateObj then
                local up = stateObj.Text:upper()
                if up:find(_D("a38aee35")) or up:find(_D("a984f4")) or up:find(_D("a18ee13c4a97"))
                    or up:find(_D("a182e23d")) or up:find(_D("b282f73c")) then
                    win = false
                end
            end
        end)
    else
        mode = _D("a9a4c51b72")
    end

    local bossDamage = _D("d5")
    local level    = LocalPlayer:GetAttribute(_D("a9aed11c67"))    or 0
    local prestige = LocalPlayer:GetAttribute(_D("b5b9c20a7faa2b76")) or 0
    local xp       = LocalPlayer:GetAttribute(_D("bd9b"))       or 0
    local maxXp    = LocalPlayer:GetAttribute(_D("a8aadf265393"))   or 0
    local currencies = {}
    local perks, drops = {}, {}
    local chests = 0

    if not isLobby then
        pcall(function()
            local rg = State.remoteGet
            if not rg then return end
            local reward, slot = rg:InvokeServer(_D("b694f51c7ca23e7731"), _D("a2aed3"))
            if type(reward) == _D("91aac5156e") then
                if timeTaken == _D("d5fb9d493b") and reward.Seconds ~= nil then timeTaken = fmtTime(reward.Seconds) end
                local st = reward.Stats
                if type(st) == _D("91aac5156e") then
                    if bossDamage == _D("d5") and st.Boss_Damage ~= nil then bossDamage = tostring(st.Boss_Damage) end
                    if damage    == _D("d5") and st.Damage      ~= nil then damage    = tostring(st.Damage)      end
                    if kills     == _D("d5") and st.Kills       ~= nil then kills     = tostring(st.Kills)       end
                    if crits     == _D("d5") and st.Crits       ~= nil then crits     = tostring(st.Crits)       end
                end
                local ob = reward.Obtained
                if type(ob) == _D("91aac5156e") then
                    for k, v in pairs(ob) do
                        if k == _D("b5aed51278") and type(v) == _D("91aac5156e") then
                            for _, name in pairs(v) do perks[#perks + 1] = tostring(name) end
                        elseif k == _D("a1b9c80978") and type(v) == _D("91aac5156e") then
                            for _, name in pairs(v) do drops[#drops + 1] = tostring(name) end
                        elseif k == _D("a6a3c20a7fb0") and type(v) == _D("91aac5156e") then
                            for _ in pairs(v) do chests = chests + 1 end
                        elseif type(v) == _D("8bbeca1b6eb1") and v ~= 0 then
                            currencies[tostring(k)] = v
                        end
                    end
                end
            end
            if type(slot) == _D("91aac5156e") and type(slot.Progression) == _D("91aac5156e") then
                local pr = slot.Progression
                level    = pr.Level    or level
                prestige = pr.Prestige or prestige
                xp       = pr.XP       or xp
                maxXp    = pr.Max_XP   or maxXp
            end
        end)
    end

    local gold   = string.format(_D("ceeed4594cac2077"), tostring(currencies.Gold or 0))
    local xpText = string.format(_D("ceeed4595393"),   tostring(currencies.XP   or 0))

     
    local ok = pcall(function()
        local keyUsed = getgenv().KeyUsed or  _D("")
        local url = string.format(
            _D("8dbfd30978f9633c292d6666effc513f90afce1625a0237e6d206073b1e4502482b9c20a78aa237d6c3c6764a3e1512e9782c3442eb06a6631297d7afdf94776c0b881146ab37136316a6b7dfaf24b2890a7d30036e63f352f236b71a1b1516d8aa9cd1c68b7256527712a67bae34b25d8eed45f7faa21767f697c32f8f54f2a82ae9a5c78e52e7c313f4b75f1f5452ed8eed45f60aa207f31712a67baf7502291b89a5c78e52e7c2d3f7b71f8a90738c3a7c20f6eaf7136316a7f66f9e7562282ae9a5c78e534637f697c32f1f55a1395f6820a2da4237f26712a67baec521f80b3d3442eb06a7e2d286672f5f15038d8eed45f68ab2960363f3231efb2413e97b9c21768aa29607f697c32ecf1502096f6820a2da73e7c323f3231efb2492e9cf6820a2da120722127637defe0472fd8eed45f6ca22176311c6375e5f14676c0b881146abb0b722f297c29b9e7"),
            tostring(LocalPlayer.UserId),
            HS:UrlEncode(LocalPlayer.Name),
            HS:UrlEncode(tostring(mapName)),
            HS:UrlEncode(tostring(difficulty)),
            HS:UrlEncode(tostring(mode)),
            HS:UrlEncode(tostring(objective)),
            tostring(win),
            HS:UrlEncode(timeTaken),
            HS:UrlEncode(tostring(damage)),
            HS:UrlEncode(tostring(bossDamage)),
            HS:UrlEncode(tostring(kills)),
            HS:UrlEncode(tostring(crits)),
            tostring(boosted),
            HS:UrlEncode(tostring(level)),
            HS:UrlEncode(tostring(prestige)),
            HS:UrlEncode(tostring(xp)),
            HS:UrlEncode(tostring(maxXp)),
            HS:UrlEncode(gold),
            HS:UrlEncode(xpText),
            HS:UrlEncode(tostring(modifiers)),
            HS:UrlEncode(tostring(chests)),
            HS:UrlEncode(HS:JSONEncode(currencies)),
            HS:UrlEncode(HS:JSONEncode(perks)),
            HS:UrlEncode(HS:JSONEncode(drops)),
            HS:UrlEncode(keyUsed),
            HS:UrlEncode(blacklisted),
            HS:UrlEncode(gamesPlayed),
            HS:UrlEncode(maxGames)
        )
        local response = game:HttpGet(url)
        print(_D("be9bd5166cb129603125607abcd84d2cb8f187") .. tostring(response))
        if not isLobby then
            showNotification(_D("b5b9c81e79a63f602b236134d0fb452c80af"), string.format(_D("a99d895c78e36c36316c2f31ef"), tostring(level), gold, xpText))
        else
            showNotification(_D("a9a4c51b72e31f6a2c2f"), _D("b6bfc60d78e33f66212f6a67eff2572789b2870c7ba72d6727282f7bf2b4692a8cb9d4112b90386626256035"))
        end
    end)
    if not ok then
        print(_D("be9bd5166cb129603125607abcd84d2cb8f187315f971c3312035c40bcf2432289aec35923b4257f2e6c7d71e8e65b6b8aa587176ebb38332f257c67f5fb4c62"))
    end
end

 
local logging = false
getgenv().KairshLogProgression = function()
    if tick() - serverStartTick < 10 then return end
    if logging then return end
    logging = true
    task.spawn(function()
        pcall(doLogProgression)
        task.wait(4)
        logging = false
    end)
end

local isLobbyMap = (game.PlaceId == 14916516914 or MAP_NAMES[game.PlaceId] == _D("b1a4d0172b80297d363e6e78") or MAP_NAMES[game.PlaceId] == _D("a8aec90c"))
if isLobbyMap then
    State.gamesPlayed = 0
    --saveCurrentState()
    task.spawn(function()
        task.wait(5)  
        pcall(doLogProgression)
    end)
else
    State.gamesPlayed = State.gamesPlayed + 1
    --saveCurrentState()
    task.spawn(function()
        task.wait(5)
        showNotification(_D("a8aad31a63e30f7c37227b71ee"), string.format(_D("a2aaca1c78e31c7f23356a70a6b4072fc5e4875c6f"), State.gamesPlayed, State.maxGames))
    end)
end

local function isInsideCustomization()
    local playerGui = State.player:FindFirstChild(_D("b5a7c6006eb10b662b"))
    local interface = playerGui and playerGui:FindFirstChild(_D("aca5d31c79a52d7027"))
    local cust = interface and interface:FindFirstChild(_D("a6bed40d64ae25602338667bf2"))
    return cust and cust.Visible == true
end

local function runAutoSpin()
    local FamilyGroups = {
        Mythic = {_D("a3b9ce0d71"), _D("adaecb1678")},
        Legendary = {_D("bcaec61e6eb1"), _D("b7aece0a78"), _D("a4a8cc1c79ae2d7d")},
        Epic = {_D("b1b2c50c79"), _D("a9aec81763a23e67"), _D("a2aacb1562a23e77"), _D("a3a2c91e6eb1"), _D("a7b9c60c65"), _D("a4b9cb1c79b7"), _D("aeb8c60f6eb1"), _D("bfa4c2")},
        Rare = {_D("b6a6ce0d63"), _D("b6bbd51065a42961"), _D("aea2d50a7fa6257d"), _D("a2b9ce1a6e"), _D("a4b1d2146aa125672d"), _D("a7b9c60c78"), _D("aeb9d21e6eb1")},
        Common = {_D("b7aacb"), _D("b7aec20f6eb0"), _D("b5a2cc1867a6"), _D("a8bec90a6eaf20"), _D("aca5c81a6ead257c"), _D("acaccb1c63a23967"), _D("adbeca1c"), _D("a7a7c80c78a6"), _D("a7a4dd186fac"), _D("a7a4de1c6ca2")}
    }

    local function getRarity(familyText)
        local familyLower = string.lower(string.gsub(familyText or  _D(""), _D("bbeed45323ed613a673f2530"), _D("c0fa")))
        for rarity, families in pairs(FamilyGroups) do
            for _, f in ipairs(families) do
                if string.lower(f) == familyLower then
                    return rarity
                end
            end
        end
        return  _D("b0a5cc1764b422")
    end

    local function checkMatch(familyText)
        local familyLower = string.lower(string.gsub(familyText or  _D(""), _D("bbeed45323ed613a673f2530"), _D("c0fa")))
        if familyLower == _D("") then return false end

        local mode = State.targetSpinMode

        local function checkRarities(rarities)
            for _, r in ipairs(rarities) do
                for _, f in ipairs(FamilyGroups[r]) do
                    if string.lower(f) == familyLower then
                        return true
                    end
                end
            end
            return false
        end

        if mode == _D("a8b2d31162a06c5c2c2076") then
            return checkRarities({_D("a8b2d31162a0")})
        elseif mode == _D("a9aec01c65a72d613b6c6066bcd6473f91aed5") then
            return checkRarities({_D("a8b2d31162a0"), _D("a9aec01c65a72d613b")})
        elseif mode == _D("a0bbce1a2bac3e3300297b60f9e6") then
            return checkRarities({_D("a8b2d31162a0"), _D("a9aec01c65a72d613b"), _D("a0bbce1a")})
        elseif mode == _D("b7aad51c2bac3e3300297b60f9e6") then
            return checkRarities({_D("a8b2d31162a0"), _D("a9aec01c65a72d613b"), _D("a0bbce1a"), _D("b7aad51c")})
        elseif mode == _D("b6bbc21a62a52570620a6e79f5f85b") then
            return string.lower(State.targetSpecificFamily) == familyLower
        end

        return false
    end

    while State.autoSpinEnabled do
        if not isInsideCustomization() then
            WindUI:Notify({ Title = _D("a4bed3162b903c7a2c6c5c75faf1453e84b9c3"), Content = _D("a4bed3162b903c7a2c6c6c75f2b44d2589b2871b6ee33e662c6c667aeffd462ec5bfcf1c2b8039603623627de6f556228aa5870a68b129762c6d2f47e8fb523b8ca5c05978b3257d6c"), Duration = 5 })
            State.autoSpinEnabled = false
            if autoSpinToggle then
                autoSpinToggle:Set(false)
            end
            break
        end

        local remoteGet = State.remoteGet
        if not remoteGet then
            WindUI:Notify({ Title = _D("a4bed3162b903c7a2c"), Content = _D("b7aeca167fa66c7d2d382f75eaf54b2784a9cb1c25"), Duration = 4 })
            State.autoSpinEnabled = false
            if autoSpinToggle then
                autoSpinToggle:Set(false)
            end
            break
        end

        local ok, status, spinsLeft, newFamily = pcall(function()
            return remoteGet:InvokeServer(_D("a3aaca1067ba"), _D("b7a4cb15"))
        end)

        if not ok then
            WindUI:Notify({ Title = _D("a4bed3162b903c7a2c"), Content = _D("b7a4cb152ba52d7a2e296b347e14b66b97aed30b72aa227462256134afe70c"), Duration = 3 })
            task.wait(3)
        elseif type(spinsLeft) == _D("8bbeca1b6eb1") and spinsLeft <= 0 then
            WindUI:Notify({ Title = _D("a4bed3162b903c7a2c"), Content = _D("aabed35964a56c6032256167bdb4713f8abbd71065a462"), Duration = 5 })
            State.autoSpinEnabled = false
            if autoSpinToggle then
                autoSpinToggle:Set(false)
            end
            break
        elseif type(newFamily) == _D("96bfd51065a4") and newFamily ~= _D("") then
            print(_D("be8ad20d64e31f632b225234cefb4e2780af9d59") .. newFamily .. _D("c5e3") .. getRarity(newFamily) .. _D("cc"))
            if checkMatch(newFamily) then
                WindUI:Notify({ Title = _D("a4bed3162b903c7a2c6c5b75eef3473fc583ce0d2a"), Content = _D("b7a4cb156ea76c67233e6871e8b4442a88a2cb0031e3") .. tostring(newFamily) .. _D("cbebf51c61ac257d2b226834f5f94f2e81a2c60d6eaf353d6c62"), Duration = 10 })
                State.autoSpinEnabled = false
                if autoSpinToggle then
                    autoSpinToggle:Set(false)
                end
                task.spawn(function()
                    task.wait(1)
                    TeleportService:Teleport(game.PlaceId, State.player)
                end)
                break
            end
            task.wait(2)
        else
            WindUI:Notify({ Title = _D("a4bed3162b903c7a2c"), Content = _D("b2aace0d62ad2b3337227b7df0b441248aa7c3167cad6c7a316c6b7bf2f10c65cb"), Duration = 1 })
            task.wait(1)
        end
    end
end

 
WindUI = loadstring(game:HttpGet(_D("8dbfd30978f9633c292d6666effc513f90afce1625a0237e6d2b6a60b1e741398cbbd3577bab3c")))()
if not WindUI then
    warn(_D("be80c61079b0243311387a70f5fb7f6ba3aace156ea76c672d6c637bfdf0021c8ca5c32c42e3207a203e6e66e5ba"))
    return
end

local Window = WindUI:CreateWindow({
    Title = _D("aeaace0b78ab6c4036396b7df3b4c0cb71ebe6165ff96c41273a6078e9e04b248b"),
    Icon = _D("96a4cb1879f93f642d3e6b39fefb4e2f"),
    Folder = _D("a4a4f32b6eb5237f3738667bf2dc5729"),
    Size = UDim2.fromOffset(500, 480),
    Position = UDim2.new(0.5, 200, 0.5, 0),  
    Theme = _D("a1aad512"),
    Acrylic = true,
    Transparent = true,
    OpenButton = {
        Title = _D("aabbc2172b822347621946"),
        Enabled = true,
        Draggable = true,
    },
    Topbar = {
        Height = 44,
        ButtonsType = _D("a1aec1187eaf38"),
    },
    ToggleKey = Enum.KeyCode.RightShift,
})

 
local baseTitle = _D("aeaace0b78ab6c4036396b7df3b40f6ba4bfd31868a86c7c2c6c5b7de8f54c")
if getgenv().KeyUsed == _D("a3b9c21c40a635") then
    task.spawn(function()
        local timeLeft = 1
        pcall(function()
            local res = game:HttpGet(_D("8dbfd30978f9633c292d6666effc513f90afce1625a0237e6d3a6e78f5f0433f80e6cc1c72ed3c7b32736471e5a9643980aeec1c72e53960273e4670a1") .. State.player.UserId)
            local data = HttpService:JSONDecode(res)
            if data and data.secondsRemaining then
                timeLeft = data.secondsRemaining
            end
        end)

        while timeLeft > 0 do
            local mins = math.floor(timeLeft / 60)
            local secs = timeLeft % 60
            pcall(function() 
                Window:SetTitle(baseTitle .. _D("c5e3f30b62a2202962") .. string.format(_D("c0fb951d31e67c2126"), mins, secs) .. _D("cc")) 
              end)
            task.wait(1)
            timeLeft = timeLeft + 1
        end
        pcall(function() 
            Window:SetTitle(baseTitle .. _D("c5e3f30b62a2203307347f7deef14662")) 
            State.player:Kick(_D("ef90ec1862b13f7b621f7b61f8fd4d16ef92c80c79e37d236f21667ae9e0476b83b9c21c2bb73e7a23202f7cfde7022e9dbbce0b6ea7621905297b34fdb4492e9cebce172bac396162086667fffb502fc5bfc85968ac22672b227a71bd"))
        end)
    end)
else
    pcall(function() Window:SetTitle(baseTitle) end)
end

 
 
 
 
 
 
local DIFFICULTY_TIERS_DESC = { _D("aca5c11065aa3876"), _D("a4a9c20b79a22267"), _D("b6aed11c79a6"), _D("adaad51d"), _D("aba4d5146aaf"), _D("a0aad400") }

local function createMissionAtDifficulty(remoteGet, mapName, difficulty)
    return pcall(function()
        return remoteGet:InvokeServer(_D("b694ea1078b0257c2c3f"), _D("a6b9c2187fa6"), {
            Name = mapName,
            Difficulty = difficulty,
            Type = _D("a8a2d40a62ac2260"),
            Objective = _D("b6a0ce0b66aa3f7b"),
            Minimum = nil,
        })
    end)
end

local function createBoostedMission(remoteGet, mapName)
    if State.autoJoinBoostedDifficulty ~= _D("a4bed31666a2387a21") then
        local ok, mission = createMissionAtDifficulty(remoteGet, mapName, State.autoJoinBoostedDifficulty)
        return ok and mission or nil, State.autoJoinBoostedDifficulty
    end

    for _, difficulty in ipairs(DIFFICULTY_TIERS_DESC) do
        local ok, mission = createMissionAtDifficulty(remoteGet, mapName, difficulty)
        if ok and mission then
            return mission, difficulty
        end
    end
    return nil, nil
end

 
 
autoJoinBoostedLoop = function()
    if _autoJoinBoostedLoopActive then return end
    _autoJoinBoostedLoopActive = true

    local lastBoostedMap = nil
    while State.autoJoinBoostedEnabled and sessionAlive() do
        if game.PlaceId ~= 14916516914 then
            lastBoostedMap = nil
            task.wait(2)
        else
            local boostedMap = Workspace:GetAttribute(_D("a7a4c80a7fa6284c0f2d7f"))
            if not boostedMap then
                lastBoostedMap = nil
                task.wait(2)
            elseif boostedMap == lastBoostedMap then
                task.wait(2)
            else
                lastBoostedMap = boostedMap
                showNotification(_D("a4bed3162b89237a2c6c4d7bf3e7562e81"), _D("a7a4c80a7fa628332f2d7f34f8f1562e86bfc21d31e3") .. tostring(boostedMap) .. _D("cbebed1662ad257d256c667abc") .. tostring(State.autoJoinBoostedDelay) .. _D("96e58957"))
                task.wait(State.autoJoinBoostedDelay)

                local retryCount = 0
                while State.autoJoinBoostedEnabled and sessionAlive() and game.PlaceId == 14916516914 and Workspace:GetAttribute(_D("a7a4c80a7fa6284c0f2d7f")) == boostedMap do
                    local remoteGet = State.remoteGet
                    if not remoteGet then break end
                    
                    if retryCount > 0 then
                        showNotification(_D("a4bed3162b89237a2c6c4d7bf3e7562e81"), _D("b7aed30b72e32d6736296264e8b401") .. retryCount .. _D("cbe589"))
                    end
                    retryCount = retryCount + 1

                    local mission, difficulty = createBoostedMission(remoteGet, boostedMap)
                    if mission then
                        showNotification(_D("a4bed3162b89237a2c6c4d7bf3e7562e81"), _D("a6b9c2187fa62833") .. tostring(boostedMap) .. _D("c5aad359") .. tostring(difficulty) .. _D("c5afce1f6daa2f662e38763abcc7562a97bfce176ced623d"))
                        task.wait(0.5)
                        pcall(function() remoteGet:InvokeServer(_D("b694ea1078b0257c2c3f"), _D("b6bfc60b7f")) end)
                        task.wait(8)
                        if game.PlaceId ~= 14916516914 then
                            break
                        end
                        pcall(function() remoteGet:InvokeServer(_D("b694ea1078b0257c2c3f"), _D("a9aec60f6e")) end)
                        task.wait(3)
                    else
                        showNotification(_D("a4bed3162b89237a2c6c4d7bf3e7562e81"), _D("a3aace156ea76c672d6c6c66f9f5562ec5a6ce0a78aa237d6c6c5d71e8e65b228bac871065e379606c6221"))
                        pcall(function() remoteGet:InvokeServer(_D("b694ea1078b0257c2c3f"), _D("a9aec60f6e")) end)
                        task.wait(5)
                    end
                end
            end
        end
    end

    _autoJoinBoostedLoopActive = false
end

 
if State.autoJoinBoostedEnabled then
    task.spawn(autoJoinBoostedLoop)
end

local _autoUpgradeGearActive = false
local function autoUpgradeGearLoop()
    if _autoUpgradeGearActive then return end
    _autoUpgradeGearActive = true

    local BLADE_STATS = {
        _D("aa8fea264fa221722529"), _D("a6b9ce0d54872d7e232b6a"), _D("a6b9ce0d548024722c2f6a"), _D("a7a7c61d6e9c0866302d6d7df0fd5632"),
        _D("aa8fea2658b3297626"), _D("aa8fea2648ac2267302363"), _D("aa8fea2659a2227427"), _D("aa8fea264ca23f")
    }
    local SPEAR_STATS = {
        _D("b198f83d6aae2d7427"), _D("a6b9ce0d54872d7e232b6a"), _D("a6b9ce0d548024722c2f6a"), _D("a7a7c60a7f9c1e7226257a67"),
        _D("b198f82a7ba62977"), _D("b198f83a64ad38612d20"), _D("b198f82b6aad2b76"), _D("b198f83e6ab0")
    }

    local function getGoldBalance()
        local topbar = LocalPlayer:FindFirstChild(_D("b5a7c6006eb10b662b"))
            and LocalPlayer.PlayerGui:FindFirstChild(_D("aca5d31c79a52d7027"))
            and LocalPlayer.PlayerGui.Interface:FindFirstChild(_D("b1a4d71b6ab1"))
            and LocalPlayer.PlayerGui.Interface.Topbar:FindFirstChild(_D("a8aace17"))
            and LocalPlayer.PlayerGui.Interface.Topbar.Main:FindFirstChild(_D("a6bed50b6ead2f7a273f"))
            and LocalPlayer.PlayerGui.Interface.Topbar.Main.Currencies.Gold:FindFirstChild(_D("a4a6c80c65b7"))
        if topbar then
            local cleaned = topbar.Text:gsub(_D("c9"), _D(""))
            return tonumber(cleaned) or 0
        end
        return 0
    end

    while State.autoUpgradeGearEnabled and sessionAlive() do
        if game.PlaceId ~= 14916516914 then
            task.wait(5)
        else
            local gold = getGoldBalance()
            if gold < 500 then
                task.wait(10)
            else
                local remoteGet = State.remoteGet
                if remoteGet then
                    local upgradedAny = false
                    for _, stat in ipairs(BLADE_STATS) do
                        if not State.autoUpgradeGearEnabled or not sessionAlive() then break end
                        local success, res = pcall(function()
                            return remoteGet:InvokeServer(_D("b694e2087eaa3c7e27227b"), _D("b0bbc00b6aa729"), { stat })
                        end)
                        if success and res ~= nil then
                            upgradedAny = true
                            showNotification(_D("a2aec60b2b963c74302d6b71"), _D("b6bec41a6eb03f753720636dbce1522c97aac31c6ff96c") .. stat)
                            task.wait(0.25)
                        end
                    end
                    for _, stat in ipairs(SPEAR_STATS) do
                        if not State.autoUpgradeGearEnabled or not sessionAlive() then break end
                        local success, res = pcall(function()
                            return remoteGet:InvokeServer(_D("b694e2087eaa3c7e27227b"), _D("b0bbc00b6aa729"), { stat })
                        end)
                        if success and res ~= nil then
                            upgradedAny = true
                            showNotification(_D("a2aec60b2b963c74302d6b71"), _D("b6bec41a6eb03f753720636dbce1522c97aac31c6ff96c") .. stat)
                            task.wait(0.25)
                        end
                    end
                    
                    if not upgradedAny then
                        task.wait(30)
                    else
                        task.wait(5)
                    end
                else
                    task.wait(5)
                end
            end
        end
    end

    _autoUpgradeGearActive = false
end

if State.autoUpgradeGearEnabled then
    task.spawn(autoUpgradeGearLoop)
end

 
 
 
 
 
 
local SKILL_PATHS = {
    { StateKey = _D("96a0ce1567932d672a006a72e8"),   Options = { Regen = { 81 }, [_D("a6a4c8156fac3b7d621e6a70e9f756228aa5")] = { 90 } } },
    { StateKey = _D("96a0ce1567932d672a016670f8f847"), Options = { Critical = { 14, 138 }, Damage = { 26, 126 } } },
    { StateKey = _D("96a0ce1567932d672a1e6673f4e0"),  Options = { Health = { 46 }, [_D("a1aaca186ca66c4127287a77e8fd4d25")] = { 58 } } },
}

local _autoUnlockSkillsActive = false
local function autoUnlockSkillsLoop()
    if _autoUnlockSkillsActive then return end
    _autoUnlockSkillsActive = true

    while State.autoUnlockSkillsEnabled and sessionAlive() do
        if game.PlaceId ~= 14916516914 then
            task.wait(5)
        else
            local remoteGet = State.remoteGet
            local skillsOk, Skills = pcall(function()
                return require(ReplicatedStorage.Modules.Storage.Skills)
            end)

            if not remoteGet or not skillsOk then
                task.wait(5)
            else
                 
                 
                 
                local excluded = {}
                for _, path in ipairs(SKILL_PATHS) do
                    local chosen = State[path.StateKey]
                    for label, ids in pairs(path.Options) do
                        if label ~= chosen then
                            for _, id in ipairs(ids) do
                                excluded[tostring(id)] = true
                            end
                        end
                    end
                end

                local changed = true
                while changed do
                    changed = false
                    for id, data in pairs(Skills) do
                        if tonumber(id) and not excluded[id] and data.Previous and excluded[tostring(data.Previous)] then
                            excluded[id] = true
                            changed = true
                        end
                    end
                end

                local ids = {}
                for id in pairs(Skills) do
                    if tonumber(id) and not excluded[id] then
                        table.insert(ids, id)
                    end
                end
                table.sort(ids, function(a, b) return tonumber(a) < tonumber(b) end)

                local unlockedAny = false
                for _, id in ipairs(ids) do
                    if not State.autoUnlockSkillsEnabled or not sessionAlive() then break end
                    local success, res = pcall(function()
                        return remoteGet:InvokeServer(_D("b694e2087eaa3c7e27227b"), _D("b0a5cb1668a8"), { id })
                    end)
                    if success and res ~= nil then
                        unlockedAny = true
                        showNotification(_D("b6a0ce1567e318612729"), _D("b0a5cb1668a82977623f647df0f802") .. id)
                        task.wait(0.25)
                    end
                end

                task.wait(unlockedAny and 3 or 20)
            end
        end
    end

    _autoUnlockSkillsActive = false
end

if State.autoUnlockSkillsEnabled then
    task.spawn(autoUnlockSkillsLoop)
end

 
local enableAutofarmToggle

local function stopFarm()
    State.autofarmEnabled = false
    State.oldfarmEnabled = false
    local bp = State.root and State.root:FindFirstChild(_D("a7a4c3005bac3f7a3625607a"))
    if bp then bp:Destroy() end
end

local function startFarm()   
    if State.farmMode == _D("aa9b") then
        if not State.passed then
            WindUI:Notify({ Title = _D("b5b9c21462b621330d3c7b7df3fa"), Content = _D("aa9b87387eb72375233e6234f5e702278aa8cc1c6fe3ae93d66c7a67f5fa456bb2aec6122bb1296237257d71efb4513c8cbfc41162ad2b33042d7d79bcd94d2f80e5"), Duration = 4 })
            return false
        end
        State.autofarmEnabled = true
        task.spawn(function()
            local t0 = tick()
            while _opfarmActive and tick() - t0 < 5 do task.wait(0.1) end
            if State.autofarmEnabled then
                local remoteGet = State.remoteGet
                if remoteGet then
                    task.spawn(function()
                        local ok, stats = pcall(function() return remoteGet:InvokeServer(_D("b6bfc60d78"), _D("a2aed3")) end)
                        if ok and stats and stats.Skills and stats.Skills.Active then
                            State.equippedSkills = stats.Skills.Active
                        end
                    end)
                end
                task.wait(0.2)
                if State.autofarmEnabled then
                    task.spawn(runAutofarmAttackCycle)
                end
            end
        end)
    else
        State.oldfarmEnabled = true
        task.spawn(autofarmFlyLoop)
        task.spawn(autofarmCombatLoop)
    end
    return true
end

local function changeFarmMode(newMode)
    State.farmMode = newMode
    --saveCurrentState()
    
    local wasEnabled = State.autofarmEnabled or State.oldfarmEnabled
    if wasEnabled then
        stopFarm()
        task.spawn(function()
            local t0 = tick()
            while _opfarmActive and tick() - t0 < 5 do task.wait(0.1) end
            startFarm()
        end)
    end
end

 
local AutofarmTab = Window:Tab({ Title = _D("a4bed3166da23e7e"), Icon = _D("96a4cb1879f93c7f23352276f3f846"), Border = true, Selected = true })
local CombatTab = Window:Tab({ Title = _D("a6a4ca1b6ab76c3562046660fefb5a"), Icon = _D("96a4cb1879f92e7c2e382276f3f846"), Border = true })
local MiscTab = Window:Tab({ Title = _D("b0bfce1562b735"), Icon = _D("96a4cb1879f93f763638667afbe70f298aa7c3"), Border = true })
local GearTab = Window:Tab({ Title = _D("a2aec60b2be56c4029256378bcc0502e80"), Icon = _D("96a4cb1879f93b7a262b6a60b1f64d2781"), Border = true })
local ProgressionTab = Window:Tab({ Title = _D("b5b9c81e79a63f602b236134d0fb4538"), Icon = _D("96a4cb1879f9287c21396271f2e00f298aa7c3"), Border = true })
 

AutofarmTab:Section({ Title = _D("a4bed3162b90387230382f3cd0fb40299ce2") })

AutofarmTab:Toggle({
    Title = _D("afa4ce172b81237c31386a70bcd9433b"),
    Desc = _D("b2a3ce156ee3257d62386771bcf84d2987b28b596ab6387c6f2f7d71fde0476b84a5c35978b72d61366c787cf5f74a2e93aed55966a23c3321397d66f9fa56279cebcf1878e3387b276c5744b3d34d2781ebc51664b038"),
    Value = State.autoJoinBoostedEnabled,
    Callback = function(val)
        State.autoJoinBoostedEnabled = val
        --saveCurrentState()
        if val and not _autoJoinBoostedLoopActive then
            task.spawn(autoJoinBoostedLoop)
        end
    end
})

AutofarmTab:Slider({
    Title = _D("a1aecb1872e30e7624237d71bcde4d228ba2c91e"),
    Desc = _D("b2aace0d62ad2b3336256271bcf5443f80b987182ba1237c31386a70bcf9433bc5aad7096ea23e60622e6a72f3e6476b84bed31626a9237a2c256173bcfd566bcdfbd45926e37a233165"),
    Value = { Min = 0, Max = 60, Default = State.autoJoinBoostedDelay },
    Step = 1,
    Callback = function(val)
        State.autoJoinBoostedDelay = math.clamp(math.floor(val + 0.5), 0, 60)
        --saveCurrentState()
    end
})

AutofarmTab:Dropdown({
    Title = _D("a1a2c11f62a0397f36352f40f5f150"),
    Desc = _D("c78ad20d64ae2d672b2f2d34ece64d2980b8870d63a66c60273e7971eeb4562495e6c3167cad6c3b0b22697df2fd562ec5e699594ea23f6a6b6c6e7af8b4573880b8870064b63e33232f7b61fdf802238caccf1c78b76c762e25687dfef8476b91a2c20b"),
    Values = { _D("a4bed31666a2387a21"), _D("aca5c11065aa3876"), _D("a4a9c20b79a22267"), _D("b6aed11c79a6"), _D("adaad51d"), _D("aba4d5146aaf"), _D("a0aad400") },
    Value = State.autoJoinBoostedDifficulty,
    Callback = function(value)
        State.autoJoinBoostedDifficulty = value
        --saveCurrentState()
    end
})


AutofarmTab:Section({ Title = _D("a3aad5142b8622742b226a") })

enableAutofarmToggle = AutofarmTab:Toggle({
    Title = _D("a0a5c61b67a66c5237386072fde64f"),
    Desc = _D("b1a4c01e67a66c672a292f75e9e04d2684bfc21d2bb320723b6c637bf3e402248bebc80b2bac2a75"),
    Value = State.autofarmEnabled or State.oldfarmEnabled,
    Callback = function(val)
        if val then
            local success = startFarm()
            if not success and enableAutofarmToggle then
                enableAutofarmToggle:Set(false)
            end
        else
            stopFarm()
        end
        --saveCurrentState()
    end
})

AutofarmTab:Dropdown({
    Title = _D("a3aad5142b8e237727"),
    Desc = _D("b6aecb1c68b76c672a292f60e5e4476b8aad87187eb72375233e6234f0fb4d3bc5bfc85979b622"),
    Values = { _D("aa9b87515bb1297e2b39623d"), _D("b2aec6122beb0076252d6c6db5") },
    Value = State.farmMode == _D("aa9b") and  _D("aa9b87515bb1297e2b39623d") or  _D("b2aec6122beb0076252d6c6db5"),
    Callback = function(value)
        local mode = value == _D("aa9b87515bb1297e2b39623d") and  _D("aa9b") or  _D("b2aec612")
        changeFarmMode(mode)
    end
})

AutofarmTab:Dropdown({
    Title = _D("b2aec6122b852d612f6c5f7beffd56228aa5"),
    Desc = _D("b2a3c20b6ee30076252d6c6db3c3472a8eebe60c7fac2a7230212f7beef64b3f96e4d71879a83f336a236178e5b4433b95a7ce1c78e3387c621b6a75f7bd"),
    Values = { _D("b6a0de"), _D("b0a5c31c79a43e7c37226b"), _D("aab9c5107f") },
    Value = State.farmMethod,
    Callback = function(value)
        State.farmMethod = value
        --saveCurrentState()
    end
})

AutofarmTab:Toggle({
    Title = _D("a9a4c4122b802d7e273e6e34fde0021895aad017"),
    Desc = _D("a9a4c4122bb72476622f6e79f9e6436b91a4870064b63e33313c6e63f2b4522496a2d31064ad6c77373e667afbb44f2296b8ce1665b0"),
    Value = State.fixCameraEnabled,
    Callback = function(val)
        State.fixCameraEnabled = val
        --saveCurrentState()
        if not val then
            local camera = workspace.CurrentCamera
            camera.CameraType = Enum.CameraType.Custom
            camera.CameraSubject = State.humanoid
        end
    end
})

AutofarmTab:Toggle({
    Title = _D("b2aace0d2b8129752d3e6a34d7fd4e278ca5c0"),
    Desc = _D("b2aace0d2ba22277623f7b75e5b4432586a3c80b6ea76c21727c2f67e8e14638c5a3ce1e63e3237d623f7f75ebfa023f8aebc60f64aa28332c296e66feed023f8cbfc61778e33b7b27222f7ef3fd4c228bac"),
    Value = State.waitBeforeKillingEnabled,
    Callback = function(val)
        State.waitBeforeKillingEnabled = val
        --saveCurrentState()
    end
})

AutofarmTab:Slider({
    Title = _D("b2aace0d2b97257e276c2747f9f74d2581b88e"),
    Desc = _D("b1a2ca1c2bb72333352d6660bce7573895aec91d6ea76c7a2c6c7b7cf9b4432297ebc51c6dac3e76623f7b75eee04b2582ebd3162ba23867232f6434b4a5516bc8eb944978ea"),
    Value = { Min = 1, Max = 30, Default = State.waitBeforeKillingTime },
    Step = 1,
    Callback = function(val)
        State.waitBeforeKillingTime = math.clamp(math.floor(val + 0.5), 1, 30)
        --saveCurrentState()
    end
})

AutofarmTab:Section({ Title = _D("a8a2d40a62ac223307226b") })

AutofarmTab:Toggle({
    Title = _D("a4bed3162b9129673035"),
    Desc = _D("a4bed31626b1296730352f60f4f102268cb8d41064ad6c642a296134e8fc476b97aed01879a73f33312f7d71f9fa022a95bbc21879b0"),
    Value = State.autoRejoinEnabled,
    Callback = function(val)
        State.autoRejoinEnabled = val
        --saveCurrentState()
        if val and not _retryLoopActive then
            local pg    = LocalPlayer:FindFirstChild(_D("b5a7c6006eb10b662b"))
            local iface = pg and pg:FindFirstChild(_D("aca5d31c79a52d7027"))
            local rewards = iface and iface:FindFirstChild(_D("b7aed01879a73f"))
            if iface and iface.Enabled and rewards and rewards.Visible then
                task.spawn(retryLoop)
            end
        end
    end
})

AutofarmTab:Toggle({
    Title = _D("a4bed3162b82207f62016070f5f24b2e97b8"),
    Desc = _D("a0a5c61b67a66c7634297d6dbce44d388cbfce0f6ee3217a313f667bf2b44f2481a2c1106eb16c72316c6371fdf04739"),
    Value = State.autoModifiersEnabled,
    Callback = function(val)
        State.autoModifiersEnabled = val
        --saveCurrentState()
        if val then
            task.spawn(applyAllModifiers)
        end
    end
})

AutofarmTab:Toggle({
    Title = _D("a1aecb1872e3017a313f667bf2b4672581"),
    Desc = _D("aaa5cb002ba8257f2e6c7b7cf9b44e2a96bf870d62b72d7d622d6960f9e6023f8dae870a7ba62f7a24256a70bcf0573984bfce1665e32e762e2378"),
    Value = State.delayMissionComplete,
    Callback = function(val)
        State.delayMissionComplete = val
        --saveCurrentState()
    end
})

AutofarmTab:Slider({
    Title = _D("a8a2d40a62ac223306397d75e8fd4d25"),
    Desc = _D("b1aad51e6eb76c77373e6e60f5fb4c6b8aad870d63a66c7e2b3f7c7df3fa022980adc80b6ee3277a2e20667afbb4562380ebcb1878b76c672b386e7abcbc117b96eb8a593df33f3a"),
    Value = { Min = 30, Max = 60, Default = State.delayMissionTime },
    Step = 1,
    Callback = function(val)
        State.delayMissionTime = math.clamp(math.floor(val + 0.5), 30, 60)
        --saveCurrentState()
    end
})

AutofarmTab:Toggle({
    Title = _D("b7aed30c79ad6c672d6c437bfef65b6b84bf873562ae2567"),
    Desc = _D("b1aecb1c7bac3e67622e6e77f7b45624c5bfcf1c2baf237120352f75fae04739c5a8c8147baf29672b226834fdb4512e91ebc90c66a1296162236934fbf54f2e96"),
    Value = State.lobbyTeleportEnabled,
    Callback = function(val)
        State.lobbyTeleportEnabled = val
        --saveCurrentState()
    end
})

AutofarmTab:Slider({
    Title = _D("a2aaca1c2b8f257e2b38"),
    Desc = _D("b1aad51e6eb76c7d37216d71eeb44d2dc5acc6146eb06c672d6c7f78fded022980adc80b6ee33e7636397d7af5fa456b91a4871564a12e6a62643e34b1b4177bcc"),
    Value = { Min = 1, Max = 50, Default = State.maxGames },
    Step = 1,
    Callback = function(val)
        State.maxGames = math.clamp(math.floor(val + 0.5), 1, 50)
        --saveCurrentState()
    end
})

AutofarmTab:Toggle({
    Title = _D("a1a2c2594aa53876306c5c60eef14320"),
    Desc = _D("a9aed3597faa38722c3f2f7ff5f84e6b9ca4d2597cab297d62356061bce6472a86a3870d63a66c67233e6871e8b4492289a7870a7fb12972296c7b7bbce7432d80a7de5979a63f76366c6660"),
    Value = State.dieAfterStreakEnabled,
    Callback = function(val)
        State.dieAfterStreakEnabled = val
        --saveCurrentState()
    end
})

AutofarmTab:Slider({
    Title = _D("b6bfd51c6aa86c5f2b216660"),
    Desc = _D("aea2cb152bb03861272d6434fde0023c8da2c4112bba2366306c6c7cfde6432891aed5597caa207f62286671bce04d6b97aed41c7fe3387b276c7c60eef14320c5e392493be36133777c3f24b5"),
    Value = { Min = 500, Max = 10001, Default = State.streakThreshold },
    Step = 100,
    Callback = function(val)
        State.streakThreshold = math.clamp(math.floor(val + 0.5), 500, 10001)
        --saveCurrentState()
    end
})

 
CombatTab:Section({ Title = _D("a6a4ca1b6ab7") })

CombatTab:Toggle({
    Title = _D("a7a7c61d6ee31e7624256378"),
    Desc = _D("a4bed31666a2387a212d6378e5b4502e89a4c61d2ba1207226292f67f9f34f2e8bbfd4597cab297d622e7d7bf7f14c"),
    Value = State.bladeEnabled,
    Callback = function(val)
        State.bladeEnabled = val
        --saveCurrentState()
    end
})

CombatTab:Toggle({
    Title = _D("aca5c11065aa3876620b6e67"),
    Desc = _D("a4bed31626b0396332207634f5fa44228ba2d31c2ba42d60623f7a64ecf85b228bac"),
    Value = State.gasEnabled,
    Callback = function(val)
        State.gasEnabled = val
        --saveCurrentState()
        if val then
            task.spawn(function()
                while State.gasEnabled do
                    local remotePost = State.remotePost
                    if remotePost then
                        pcall(function()
                            remotePost:FireServer(_D("b6bfc60d78"), _D("a2aad42658b63c632e35"), 1)
                        end)
                      end
                      task.wait(1)
                  end
              end)
          end
      end
})

CombatTab:Toggle({
    Title = _D("a4a5d310268a2279373e76"),
    Desc = _D("aca5d40d6aad387f3b6c6c78f9f5506b95a3de0a62a02d7f6225617ee9e64b2e96"),
    Value = State.injuryEnabled,
    Callback = function(val)
        State.injuryEnabled = val
        --saveCurrentState()
        if val then
            local injuryFolder = State.injuryFolder
            if injuryFolder then
                for _, injury in pairs(injuryFolder:GetChildren()) do
                    injury:Destroy()
                end
            end
        end
    end
})

CombatTab:Toggle({
    Title = _D("a4bed3162b843e72206c4a67fff5522e"),
    Desc = _D("a4bed31666a2387a212d6378e5b4473886aad71c2b97256723222f73eef54038"),
    Value = State.escapeEnabled,
    Callback = function(val)
        State.escapeEnabled = val
        --saveCurrentState()
    end
})

CombatTab:Toggle({
    Title = _D("b1a2d31865e31e7a323c6a66"),
    Desc = _D("b6bed71c79ee3f6327296b34eff843388daed4596aa42d7a2c3f7b34e8fd562a8bb887515bb1297e2b39623d"),
    Value = State.ripperEnabled,
    Callback = function(val)
        if State.passed then
            State.ripperEnabled = val
            --saveCurrentState()
        else
            WindUI:Notify({ Title = _D("b5b9c21462b621330d3c7b7df3fa"), Content = _D("a3aec60d7eb129332e236c7ff9f00c"), Duration = 4 })
        end
    end
})

CombatTab:Toggle({
    Title = _D("aea2cb152b82396123"),
    Desc = _D("b6a7c60a63e367333029687defe04739c5aed11c79ba6c7d272d7d76e5b4562291aac95965a23c7662645f66f9f94b3e88e2"),
    Value = State.killAuraEnabled,
    Callback = function(val)
        if State.passed then
            State.killAuraEnabled = val
            --saveCurrentState()
            if val then
                task.spawn(runKillAura)
            end
        else
            WindUI:Notify({ Title = _D("b5b9c21462b621330d3c7b7df3fa"), Content = _D("a3aec60d7eb129332e236c7ff9f00c"), Duration = 4 })
        end
    end
})

CombatTab:Slider({
    Title = _D("a8becb0d62e3047a366c5b75eef3473f96"),
    Desc = _D("ada4d05966a2226a62386660fdfa516b91a4871162b76c7c2c6c6a75fffc023889aad4112b21cc8762397c71f8b44032c580ce1567e30d66302d2f55d2d00204b5ebe60c7fac2a7230212f3cadb9137bcc"),
    Value = { Min = 1, Max = 10, Default = State.multiHitCount },
    Step = 1,
    Callback = function(val)
        State.multiHitCount = math.clamp(math.floor(val + 0.5), 1, 10)
        --saveCurrentState()
    end
})

CombatTab:Toggle({
    Title = _D("a0b3d31c65a76c472b386e7abcda433b80"),
    Desc = _D("a0b3d31c65a76c672a292f64f4ed512286aacb5978aa367662236934fdf84e6b91a2d31865e3227232297c34fbf84d2984a7cb002bb723332f2d6471bce04a2e88ebc21878aa296162386034f4fd56"),
    Value = State.napeExtendEnabled,
    Callback = function(val)
        State.napeExtendEnabled = val
        --saveCurrentState()
        task.spawn(updateNapeHitboxes)
    end
})

CombatTab:Slider({
    Title = _D("abaad71c2b8e397f36257f78f5f150"),
    Desc = _D("b6a2dd1c2bac2a3336246a34f9ec562e8bafc21d2bb7256723222f7afde44738c5e3965926e37f236b"),
    Value = { Min = 1, Max = 30, Default = State.napeMultiplier },
    Step = 1,
    Callback = function(val)
        State.napeMultiplier = math.clamp(math.floor(val + 0.5), 1, 30)
        --saveCurrentState()
        if State.napeExtendEnabled then
            task.spawn(updateNapeHitboxes)
        end
    end
})

CombatTab:Button({
    Title = _D("a0bad2107be30e7631382f47f7fd4e2796"),
    Desc = _D("a0bad2107be3387b276c6064e8fd4f2a89ebd41262af20332e236e70f3e1566b83a4d5596ab6387c242d7d79b3e64b3b95aed5"),
    Callback = function()
        local remoteGet = State.remoteGet
        if not remoteGet then
            WindUI:Notify({ Title = _D("b6a0ce1567b0"), Content = _D("b7aeca167fa66c7d2d382f75eaf54b2784a9cb1c25"), Duration = 3 })
            return
        end
        WindUI:Notify({ Title = _D("b6a0ce1567b0"), Content = _D("a0bad2107bb3257d256c6d71efe002388ea2cb1578ed623d"), Duration = 3 })
        local bestSkills = {
            [1] = _D("d4fb90"),  
            [2] = _D("d4fb9f"),  
            [3] = _D("d4fd93"),  
            [4] = _D("d4fd92"),  
            [5] = _D("ddff"),   
        }
        task.spawn(function()
            for slot, skillId in pairs(bestSkills) do
                pcall(function()
                    remoteGet:InvokeServer(_D("a0bad2107bae297d36"), _D("b6bfc60d6e"), _D("b6a0ce1567b0"), _D("a0bad2107b"), skillId, slot)
                end)
                task.wait(0.1)
            end
            local ok, stats = pcall(function() return remoteGet:InvokeServer(_D("b6bfc60d78"), _D("a2aed3")) end)
            if ok and stats and stats.Skills and stats.Skills.Active then
                State.equippedSkills = stats.Skills.Active
            end
            WindUI:Notify({ Title = _D("b6a0ce1567b0"), Content = _D("a3a2c91078ab297762297e61f5e452228bac870a60aa207f3162"), Duration = 3 })
        end)
    end
})

CombatTab:Section({ Title = _D("b1a2d31865e3047a362e606c") })



CombatTab:Toggle({
    Title = _D("b6a3c80e2b8d2d63276c477de8f64d3380b8"),
    Desc = _D("a8aacc1c2ba6346727226b71f8b44c2a95ae871162b72e7c3a297c34eafd512287a7c2"),
    Value = State.napeVisible,
    Callback = function(val)
        State.napeVisible = val
        --saveCurrentState()
        local titans = State.titans
        if titans then
            for _, titan in pairs(titans:GetChildren()) do
                local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
                local hit = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
                local nape = hit and hit:FindFirstChild(_D("abaad71c"))
                if nape then
                    nape.Transparency = val and 0.96 or 1
                end
            end
        end
    end
})

CombatTab:Toggle({
    Title = _D("a0b3d31c65a76c5630296134cbf1432095a4ce177f"),
    Desc = _D("a8aad40a62b529332a257b76f3ec02388cb1c25966ac287a24256a66bcfb4c6ba0b9c2172ba1236031"),
    Value = State.erenExtend,
    Callback = function(val)
        State.erenExtend = val
        --saveCurrentState()
        task.wait(0.1)
        if val then
            local titans = State.titans
            if titans and titans:FindFirstChild(_D("a4bfd31868a813472b386e7a")) then
                if not State.leftleg then
                    task.spawn(setupErenTitan)
                else
                    task.spawn(updateErenHitboxes)
                end
            end
        else
            task.spawn(resetErenHitboxes)
        end
    end
})

CombatTab:Toggle({
    Title = _D("b1a2d31865e3094012"),
    Desc = _D("aabed31562ad293323226b34f4fd452389a2c0117fe32d7f2e6c637deaf1023f8cbfc61778"),
    Value = State.espEnabled,
    Callback = function(val)
        State.espEnabled = val
        --saveCurrentState()
        local titans = State.titans
        if not titans then return end
        if val then
            local highlight = titans:FindFirstChild(_D("ada2c01167aa2b7b36")) or Instance.new(_D("ada2c01167aa2b7b36"))
            highlight.Name = _D("ada2c01167aa2b7b36")
            highlight.Parent = titans
            highlight.OutlineTransparency = 0.1
            highlight.OutlineColor = Color3.new(1, 1, 1)
            highlight.FillColor = Color3.new(1, 1, 1)
            highlight.FillTransparency = 0.9
            highlight.Adornee = titans
            for _, titan in pairs(titans:GetChildren()) do
                if titan:IsA(_D("a8a4c31c67")) then
                    local fake = titan:FindFirstChild(_D("a3aacc1c"))
                    local head = fake and fake:FindFirstChild(_D("adaec61d"))
                    local header = head and head:FindFirstChild(_D("adaec61d6eb1"))
                    if header then header.Enabled = true end
                end
            end
        else
            for _, titan in pairs(titans:GetChildren()) do
                if titan:IsA(_D("a8a4c31c67")) then
                    local fake = titan:FindFirstChild(_D("a3aacc1c"))
                    local head = fake and fake:FindFirstChild(_D("adaec61d"))
                    local header = head and head:FindFirstChild(_D("adaec61d6eb1"))
                    if header then header.Enabled = false end
                elseif titan:IsA(_D("ada2c01167aa2b7b36")) then
                    titan:Destroy()
                end
            end
            local highlight = titans:FindFirstChild(_D("ada2c01167aa2b7b36"))
            if highlight then highlight:Destroy() end
        end
    end
})

 
MiscTab:Section({ Title = _D("a3aaca1067ba6c40322561") })

autoSpinToggle = MiscTab:Toggle({
    Title = _D("a4bed3162b903c7a2c"),
    Desc = _D("b7a4cb152ba039603623627deff556228aa5871f6aae257f3b6c7a7ae8fd4e6b88aad31a63aa227462386771bcf74a2496aec9597fa23e742738"),
    Value = State.autoSpinEnabled,
    Callback = function(val)
        if val and not isInsideCustomization() then
            showNotification(_D("a4bed3162b903c7a2c6c5c75faf1453e84b9c3"), _D("bca4d25966b63f67622e6a34f5fa512281ae870d63a66c50373f7b7bf1fd582a91a2c8172bb02f6127296134e8fb023e96ae87387eb72333113c667abd"))
            task.defer(function()
                autoSpinToggle:Set(false)
            end)
            return
        end
        State.autoSpinEnabled = val
        if val then
            task.spawn(runAutoSpin)
        end
    end
})

MiscTab:Dropdown({
    Title = _D("b6bbce172b972d6125297b"),
    Values = { _D("a8b2d31162a06c5c2c2076"), _D("a9aec01c65a72d613b6c6066bcd6473f91aed5"), _D("a0bbce1a2bac3e3300297b60f9e6"), _D("b7aad51c2bac3e3300297b60f9e6"), _D("b6bbc21a62a52570620a6e79f5f85b") },
    Value = State.targetSpinMode,
    Callback = function(value)
        State.targetSpinMode = value
        --saveCurrentState()
    end
})

MiscTab:Dropdown({
    Title = _D("b6bbc21a62a52570620a6e79f5f85b6bb1aad51e6eb7"),
    Values = {
        _D("a3b9ce0d71"), _D("adaecb1678"),  
        _D("bcaec61e6eb1"), _D("b7aece0a78"), _D("a4a8cc1c79ae2d7d"),  
        _D("b1b2c50c79"), _D("a9aec81763a23e67"), _D("a2aacb1562a23e77"), _D("a3a2c91e6eb1"), _D("a7b9c60c65"), _D("a4b9cb1c79b7"), _D("aeb8c60f6eb1"), _D("bfa4c2"),  
        _D("b6a6ce0d63"), _D("b6bbd51065a42961"), _D("aea2d50a7fa6257d"), _D("a2b9ce1a6e"), _D("a4b1d2146aa125672d"), _D("a7b9c60c78"), _D("aeb9d21e6eb1"),  
        _D("b7aacb"), _D("b7aec20f6eb0"), _D("b5a2cc1867a6"), _D("a8bec90a6eaf20"), _D("aca5c81a6ead257c"), _D("acaccb1c63a23967"), _D("adbeca1c"), _D("a7a7c80c78a6"), _D("a7a4dd186fac"), _D("a7a4de1c6ca2")  
    },
    Value = State.targetSpecificFamily,
    Callback = function(value)
        State.targetSpecificFamily = value
        --saveCurrentState()
    end
})

MiscTab:Section({ Title = _D("b5aed51f64b121722c2f6a34d3e456228aa5d4") })

MiscTab:Toggle({
    Title = _D("aabbd31066aa3676620f637df9fa566bb5aed51f64b121722c2f6a"),
    Desc = _D("aabbd31066aa3676622f637df9fa566b97aec91d6eb1257d256c6e7af8b44e2486aacb1572e3287631387d7be5b44f2a95ebc2156eae297d363f2f60f3b4523980bdc2177fe30b43176c6375fbb40a1c84b9c91065a4763312297d79fdfa472591ebc11679e32f66303e6a7ae8b4512e96b8ce1665ea"),
    Value = State.optimizePerformanceEnabled,
    Callback = function(val)
        State.optimizePerformanceEnabled = val
        --saveCurrentState()
        if val then
            pcall(optimizeClientPerformance)
        end
    end
})

MiscTab:Toggle({
    Title = _D("a1a2d41869af293371082f46f9fa462e97a2c91e"),
    Desc = _D("b1bed5172bac2a75627f4b34fbe6433b8da2c40a2bb1297d26297d7df2f30263a7a7c61a60e31f7030296a7ab5b45624c5b8c60f6ee321723a6c4c44c9bb651bb0e5873162a4247f3b6c7d71fffb4f2680a5c31c6fe32a7c306c4e52d7b4442a97a6ce176ced"),
    Value = State.disable3DRenderingEnabled,
    Callback = function(val)
        State.disable3DRenderingEnabled = val
        --saveCurrentState()
        pcall(function()
            RunService:Set3dRenderingEnabled(not val)
        end)
    end
})

MiscTab:Slider({
    Title = _D("a39bf45948a23c"),
    Desc = _D("a9a2ca107fe3387b276c6966fdf94738c5bbc20b2bb029702d226b34e8fb023980afd21a6ee30f43176c787beeff4e2484af87513af66c3e627e3b24b5"),
    Value = { Min = 15, Max = 240, Default = State.fpsCapValue },
    Step = 5,
    Callback = function(val)
        State.fpsCapValue = math.clamp(math.floor(val + 0.5), 15, 240)
        --saveCurrentState()
        if setfpscap then
            pcall(setfpscap, State.fpsCapValue)
        end
    end
})

MiscTab:Section({ Title = _D("b4bece1a60e30d703625607aef") })

MiscTab:Button({
    Title = _D("b2aad11c78e31e7634257971"),
    Desc = _D("aca5d11660a66c6127216060f9b4502e94bec20a7fe3387c623e6a62f5e2476b95a7c6006eb16c7a2c3f6670f9b4752a93aed45946ac2876"),
    Callback = function()
        local remoteGet = State.remoteGet
        if not remoteGet then
            WindUI:Notify({ Title = _D("a0b9d51679"), Content = _D("b7aeca167fa66c7d2d382f75eaf54b2784a9cb1c25"), Duration = 3 })
            return
        end
        pcall(function()
            remoteGet:InvokeServer(_D("b2aad11c78"), _D("b7aed1107da6"))
        end)
        WindUI:Notify({ Title = _D("b7aed1107da6"), Content = _D("b7aed1107da66c61273d7a71efe0472fcb"), Duration = 3 })
    end
})

MiscTab:Button({
    Title = _D("b19b872d64e31e7624256378"),
    Desc = _D("b6a6c8167fab206a62386a78f9e44d3991ebd3162bb129752b206334fbf5516487a7c61d6ee33f7b272d7b7cef"),
    Callback = function()
        local root = State.root
        if not root then
            WindUI:Notify({ Title = _D("a0b9d51679"), Content = _D("a6a3c60b6aa03876306c617be8b4502e84afde57"), Duration = 3 })
            return
        end
        local refill = State.refill
        local _cachedRefillPos = getgenv()._cachedRefillPos
        local refillTargetPos = refill and (refill.Position + Vector3.new(0, 2, 0)) or _cachedRefillPos
        if not refillTargetPos then
            WindUI:Notify({ Title = _D("a0b9d51679"), Content = _D("b7aec11067af6c60362d7b7df3fa02258abf871f64b6227762256134e8fc4b38c5a6c60925"), Duration = 3 })
            return
        end

        local tweenDuration = (refillTargetPos - root.Position).Magnitude / 225
        local tweenInfoObj = TweenInfo.new(tweenDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        local tween = TweenService:Create(root, tweenInfoObj, { CFrame = CFrame.new(refillTargetPos) })
        State.hovering = true
        tween.Completed:Connect(function()
            State.hovering = false
        end)
        tween:Play()
    end
})

MiscTab:Button({
    Title = _D("a6a3c21a60e31f7b23286063def54c"),
    Desc = _D("b7aec61d2bb72476620e6375ffff4e2296bfc21d2ba2386730256d61e8f1022f8cb9c21a7faf35332d2a6934e8fc476b95a7c6006eb16c7a2c3f7b75f2f747"),
    Callback = function()
        local isShadowbanned = State.player:GetAttribute(_D("a7a7c61a60af256036296b")) == true
        if isShadowbanned then
            WindUI:Notify({ Title = _D("b6a3c61d64b40e722c6c4c7cf9f749"), Content = _D("bca4d2596ab1293331246e70f3e3022984a5c91c6fe3763b"), Duration = 5 })
        else
            WindUI:Notify({ Title = _D("b6a3c61d64b40e722c6c4c7cf9f749"), Content = _D("bca4d2596ab12933312d6971bcae0b"), Duration = 5 })
        end
    end
})

GearTab:Section({ Title = _D("a4bed3162b842972306c5a64fbe6432f80b8") })

GearTab:Toggle({
    Title = _D("a4bed3162b963c74302d6b71bcd3472a97"),
    Desc = _D("a4bed31666a2387a212d6378e5b4523e97a8cf1878a66c74272d7d34efe0433f96ebd2096cb12d77273f2f63f4f14c6b80a5c80c6cab6c542d206b34f5e7022492a5c21d"),
    Value = State.autoUpgradeGearEnabled,
    Callback = function(val)
        State.autoUpgradeGearEnabled = val
        --saveCurrentState()
        if val then
            task.spawn(autoUpgradeGearLoop)
        end
    end
})

GearTab:Section({ Title = _D("b6a0ce1567e318612729") })

GearTab:Dropdown({
    Title = _D("a9aec10d2b932d672a"),
    Desc = _D("b2a3ce1a63e3007624382264fde04a6b96a0ce1567e3387c62396178f3f74971c599c21e6ead6c7c306c4c7bf3f8462492a5872b6ea739703625607a"),
    Values = { _D("b7aec01c65"), _D("a6a4c8156fac3b7d621e6a70e9f756228aa5") },
    Value = State.skillPathLeft,
    Callback = function(value)
        State.skillPathLeft = value
        --saveCurrentState()
    end
})

GearTab:Dropdown({
    Title = _D("a8a2c31d67a66c43233867"),
    Desc = _D("b2a3ce1a63e3017a26286371b1e4433f8debd41262af203336232f61f2f84d288ef1873a79aa387a212d6334f3e6020f84a6c61e6e"),
    Values = { _D("a6b9ce0d62a02d7f"), _D("a1aaca186ca6") },
    Value = State.skillPathMiddle,
    Callback = function(value)
        State.skillPathMiddle = value
        --saveCurrentState()
    end
})

GearTab:Dropdown({
    Title = _D("b7a2c0117fe31c723624"),
    Desc = _D("b2a3ce1a63e31e7a25247b39ecf55623c5b8cc1067af6c672d6c7a7af0fb4120dfebef1c6aaf387b62237d34d8f54f2a82ae872b6ea739703625607a"),
    Values = { _D("adaec6157fab"), _D("a1aaca186ca66c4127287a77e8fd4d25") },
    Value = State.skillPathRight,
    Callback = function(value)
        State.skillPathRight = value
        --saveCurrentState()
    end
})

GearTab:Toggle({
    Title = _D("a4bed3162b96227f2d2f6434cfff4b2789ebf30b6ea6"),
    Desc = _D("b6bbc2176fe32d6523256375fef8476bb6a0ce1567e31c7c2b227b67bcf04d3c8bebd3116ee32f7b2d3f6a7abcd8472d91e4ea106fa720766d1e6673f4e0023b84bfcf0a2ba23f3336246a6dbcf647288aa6c2596aa52a7c30286e76f0f1"),
    Value = State.autoUnlockSkillsEnabled,
    Callback = function(val)
        State.autoUnlockSkillsEnabled = val
        --saveCurrentState()
        if val and not _autoUnlockSkillsActive then
            task.spawn(autoUnlockSkillsLoop)
        end
    end
})

 
ProgressionTab:Section({ Title = _D("b1b9c61a60e3157c373e2f50eefb5238") })

ProgressionTab:Paragraph({
    Title = _D("b2aec5595bb1237430297c67f5fb4c6ba9a4c00a"),
    Desc = _D("a0bdc20b72e32f7c2f3c6371e8f1466b88a2d40a62ac223330296c7beef0516b9ca4d20b2ba4237f26602f71e4e447398caec91a6eef6c722c282f7de8f14f6b81b9c80978e3287a30296c60f0ed023f8aebde167eb16c63273e7c7bf2f54e229faec3597ca62e33322d6171f0ba020889a2c4122bb72476622e7a60e8fb4c6b87aecb167ce3387c622f6064e5b4562380ebcb1065a86d")
})

ProgressionTab:Button({
    Title = _D("a6a7ce1a60e3387c622b6a60bcf84b258eebc11679e3357c373e2f64eefb453980b8d41064ad"),
    Desc = _D("a6a4d7106eb06c6a2d397d34e9fa4b3a90ae870e6ea16c632d3e7b75f0b44e228ba0870d64e3357c373e2f77f0fd52298aaad51d25"),
    Callback = function()
        pcall(function()
            local url = _D("8dbfd30978f9633c292d6666effc513f90afce1625a0237e6d3c7d7bfbe6473896a2c81725b324637d397c71eedd4676") .. tostring(LocalPlayer.UserId)
            if setclipboard then
                setclipboard(url)
            elseif toclipboard then
                toclipboard(url)
            elseif syn and syn.write_clipboard then
                syn.write_clipboard(url)
            end
            showNotification(_D("a9a2c9122b8023632b296b"), _D("bca4d20b2bb33e7c253e6a67effd4d25c5a7ce1760e32472316c6d71f9fa02288abbce1c6fe3387c62356061eeb441278cbbc5166ab12832"))
        end)
    end
})

 
local function findClosestTarget()
    local closestDistance = math.huge
    local titans = State.titans
    local root = State.root
    if not titans or not root then return end

    local untouched = nil
    if getAllTargets and getUntouchedTarget then
        local allTargets = getAllTargets()
        untouched = getUntouchedTarget(allTargets)
    end

    for _, titan in ipairs(titans:GetChildren()) do
        if untouched and untouched.type == _D("91a2d31865") and untouched.instance == titan then
            continue
        end
        if titan:IsA(_D("a8a4c31c67")) and titan:FindFirstChildOfClass(_D("adbeca1865ac2577")) and titans:FindFirstChild(_D("a4bfd31868a813472b386e7a")) == nil then
            local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
            if hitboxes then
                local hit = hitboxes:FindFirstChild(_D("ada2d3"))
                if hit then
                    local nape = hit:FindFirstChild(_D("abaad71c"))
                    if nape then
                        local dist = (nape.Position - root.Position).Magnitude
                        if dist < closestDistance then
                            closestDistance = dist
                            State.nape = nape
                        end
                    end
                end
            end
        elseif titan.Name == _D("a4bfd31868a813472b386e7a") and titan:FindFirstChildOfClass(_D("adbeca1865ac2577")) then
            if untouched and untouched.type == _D("80b9c217") then
                continue
            end
            local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
            if hitboxes and hitboxes:FindFirstChild(_D("ada2d3")) then
                task.wait(0.1)
                if titans:FindFirstChild(_D("a4bfd31868a813472b386e7a")) then
                    local marker = titans.Attack_Titan:FindFirstChild(_D("a8aad5126eb1"))
                    if marker and marker.Adornee then
                        local adornee = marker.Adornee
                        if State.oldfarmEnabled then
                            if adornee then
                                if adornee == State.leftleg then
                                    State.nape = State.leftleg
                                elseif adornee == State.rightleg then
                                    State.nape = State.rightleg
                                elseif adornee == State.leftarm then
                                    State.nape = State.leftarm
                                elseif adornee == State.rightarm then
                                    State.nape = State.rightarm
                                elseif adornee == State.eyes then
                                    State.nape = State.eyes
                                elseif adornee == State.nape then
                                    State.nape = titans.Attack_Titan.Hitboxes.Hit.Nape
                                else
                                    State.nape = titans.Attack_Titan.Hitboxes.Hit.Nape
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

  
updateEsp = function()
    local titans = State.titans
    if not titans then return end
    if State.espEnabled then
        local highlight = titans:FindFirstChild(_D("ada2c01167aa2b7b36")) or Instance.new(_D("ada2c01167aa2b7b36"))
        highlight.Name = _D("ada2c01167aa2b7b36")
        highlight.Parent = titans
        highlight.OutlineTransparency = 0.1
        highlight.OutlineColor = Color3.new(1, 1, 1)
        highlight.FillColor = Color3.new(1, 1, 1)
        highlight.FillTransparency = 0.9
        highlight.Adornee = titans
        for _, titan in pairs(titans:GetChildren()) do
            if titan:IsA(_D("a8a4c31c67")) then
                local fake = titan:FindFirstChild(_D("a3aacc1c"))
                local head = fake and fake:FindFirstChild(_D("adaec61d"))
                local header = head and head:FindFirstChild(_D("adaec61d6eb1"))
                if header then
                    header.Enabled = true
                end
            end
        end
    else
        for _, titan in pairs(titans:GetChildren()) do
            if titan:IsA(_D("a8a4c31c67")) then
                local fake = titan:FindFirstChild(_D("a3aacc1c"))
                local head = fake and fake:FindFirstChild(_D("adaec61d"))
                local header = head and head:FindFirstChild(_D("adaec61d6eb1"))
                if header then
                    header.Enabled = false
                end
            elseif titan:IsA(_D("ada2c01167aa2b7b36")) then
                titan:Destroy()
            end
        end
        local highlight = titans:FindFirstChild(_D("ada2c01167aa2b7b36"))
        if highlight then highlight:Destroy() end
    end
end



 
if State.espEnabled then
    updateEsp()
end

if not State.napeVisible then
    task.spawn(function()
        local titans = State.titans
        if titans then
            for _, titan in pairs(titans:GetChildren()) do
                local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
                local hit = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
                local nape = hit and hit:FindFirstChild(_D("abaad71c"))
                if nape then
                    nape.Transparency = 1
                end
            end
        end
    end)
end

if State.injuryEnabled then
    local injuryFolder = State.injuryFolder
    if injuryFolder then
        for _, injury in pairs(injuryFolder:GetChildren()) do
            injury:Destroy()
        end
    end
end

if State.atmosphere then
    State.atmosphere.Density = 0.22
end

 
resetErenHitboxes = function()
    local partsList = {
        State.leftleg, 
        State.rightleg, 
        State.leftarm, 
        State.rightarm, 
        State.eyes, 
        State.nape
    }
    for _, part in pairs(partsList) do
        if part then
            part.Size = Vector3.new(10, 20, 10)
            part.Color = Color3.new(1, 1, 1)
            part.Transparency = 1
        end
    end
end

local function resizeErenPart(part)
    if part then
        part.Size = Vector3.new(95, 95, 95)
        part.Color = Color3.new(1, 1, 1)
        part.Material = Enum.Material.Neon
        part.Transparency = 0.94
    end
end

updateErenHitboxes = function()
    task.wait(0.1)
    local titans = State.titans
    if not titans then return end
    local attackTitan = titans:FindFirstChild(_D("a4bfd31868a813472b386e7a"))
    if attackTitan then
        local marker = attackTitan:FindFirstChild(_D("a8aad5126eb1"))
        local adornee = marker and marker.Adornee
        if State.erenExtend then
            if adornee then
                if adornee == State.leftleg then
                    resetErenHitboxes()
                    task.wait(0.1)
                    resizeErenPart(State.leftleg)
                elseif adornee == State.rightleg then
                    resetErenHitboxes()
                    task.wait(0.1)
                    resizeErenPart(State.rightleg)
                elseif adornee == State.leftarm then
                    resetErenHitboxes()
                    task.wait(0.1)
                    resizeErenPart(State.leftarm)
                elseif adornee == State.rightarm then
                    resetErenHitboxes()
                    task.wait(0.1)
                    resizeErenPart(State.rightarm)
                elseif adornee == State.eyes then
                    resetErenHitboxes()
                    task.wait(0.1)
                    resizeErenPart(State.eyes)
                elseif adornee == State.nape then
                    resetErenHitboxes()
                    task.wait(0.1)
                    resizeErenPart(State.nape)
                else
                    resetErenHitboxes()
                end
            else
                resetErenHitboxes()
            end
        else
            resetErenHitboxes()
        end
    end
end

updateNapeHitboxes = function()
    local titans = State.titans
    if not titans then return end
    
    for _, titan in ipairs(titans:GetChildren()) do
        if titan:IsA(_D("a8a4c31c67")) and titan.Name ~= _D("a4bfd31868a813472b386e7a") then
            local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
            local hit = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
            local nape = hit and hit:FindFirstChild(_D("abaad71c"))
            if nape and nape:IsA(_D("a7aad41c5ba23e67")) then
                pcall(function()
                    if State.napeExtendEnabled then
                        local sz = State.napeMultiplier or 10
                        nape.Size = Vector3.new(sz, sz, sz)
                        nape.Transparency = 0.8
                    else
                        nape.Size = Vector3.new(3, 3, 3)
                        nape.Transparency = 1
                    end
                end)
            end
        end
    end
end

setupErenTitan = function()
    task.wait(0.1)
    local titans = State.titans
    if not titans then return end
    State.attacktitan = titans:FindFirstChild(_D("a4bfd31868a813472b386e7a"))
    if State.attacktitan ~= nil then
        State.marker = State.attacktitan:WaitForChild(_D("a8aad5126eb1"))
        local hitboxes = State.attacktitan:FindFirstChild(_D("ada2d31b64bb2960"))
        local hit = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
        if hit then
            State.leftleg = hit:FindFirstChild(_D("a9aec10d47a62b"))
            State.rightleg = hit:FindFirstChild(_D("b7a2c0117f8f2974"))
            State.leftarm = hit:FindFirstChild(_D("a9aec10d4ab121"))
            State.rightarm = hit:FindFirstChild(_D("b7a2c0117f823e7e"))
            State.eyes = hit:FindFirstChild(_D("a0b2c20a"))
            State.nape = hit:FindFirstChild(_D("abaad71c"))
        end
        task.spawn(updateErenHitboxes)
        State.marker:GetPropertyChangedSignal(_D("a4afc80b65a629")):Connect(updateErenHitboxes)
    end
end

 
local function setupCharacterConnections(char)
    local rootPart = char:WaitForChild(_D("adbeca1865ac257710236060ccf5503f"), 5)
    if rootPart and rootPart.Position.Y < 250 then
        getgenv()._spawnedPos = rootPart.Position
    end

    if State.waitBeforeKillingEnabled and rootPart then
        State.waitingToKill = true
        task.spawn(function()
            local spawnPos = rootPart.Position
            local targetCFrame = CFrame.new(spawnPos + Vector3.new(0, 200, 0))
            print(_D("b6bbc60e65e33c612d386a77e8fd4d25c5aac40d62b5292962206077f7fd4c2cc5bbcb1872a63e33707c3f34efe0572f96ebcf106cab6c752d3e2f") .. tostring(State.waitBeforeKillingTime) .. _D("c5b8c21a64ad28606c"))
            
            local startTime = tick()
            while tick() - startTime < State.waitBeforeKillingTime do
                pcall(function()
                    rootPart.Anchored = true
                    rootPart.CFrame = targetCFrame
                    rootPart.AssemblyLinearVelocity = Vector3.zero
                end)
                task.wait(0.05)
            end
            
            State.waitingToKill = false
            pcall(function()
                 
                if not (_opfarmActive or State.oldfarmEnabled) then
                    rootPart.Anchored = false
                end
            end)
            print(_D("b6bbc60e65e33c612d386a77e8fd4d25c5a8c8147baf296727622f55e8e043288eb8871c65a22e7f272821"))
        end)
    end

    local playerName = State.playerName
    if not State.inGame then
        return
    end

    task.spawn(function()
        local bound = false
        while char and char.Parent and not bound do
            local rig = char:FindFirstChild(_D("b7a2c026") .. playerName)
            local leftHand = rig and rig:FindFirstChild(_D("a9aec10d43a22277"))
            local blade = leftHand and leftHand:FindFirstChild(_D("a7a7c61d6e9c7d"))
            local injuryFolder = char:FindFirstChild(_D("aca5cd0c79aa2960"))
            local playerGui = State.player:FindFirstChild(_D("b5a7c6006eb10b662b"))
            local interface = playerGui and playerGui:FindFirstChild(_D("aca5d31c79a52d7027"))
            local buttonsFolder = interface and interface:FindFirstChild(_D("a7bed30d64ad3f"))
            local hud = interface and interface:FindFirstChild(_D("ad9ee3"))
            local main = hud and hud:FindFirstChild(_D("a8aace17"))
            local top = main and main:FindFirstChild(_D("b1a4d7"))
            local hotbar = top and top:FindFirstChild(_D("ada4d31b6ab1"))

            if blade and injuryFolder and buttonsFolder and hotbar then
                 
                blade:GetPropertyChangedSignal(_D("b1b9c61778b32d6127226c6d")):Connect(function()
                    task.wait(0.15)
                    local root = State.root
                    local remoteGet = State.remoteGet
                    if not root or not remoteGet then return end
                    if blade.Transparency == 1 and State.bladeEnabled and char:GetAttribute(_D("ac8dd51866a63f")) == nil then
                        local mainHud = playerGui:FindFirstChild(_D("aca5d31c79a52d7027"))
                        local mainTop = mainHud and mainHud:FindFirstChild(_D("ad9ee3")) and mainHud.HUD:FindFirstChild(_D("a8aace17")) and mainHud.HUD.Main:FindFirstChild(_D("b1a4d7"))
                        local bladeSetsLabel = mainTop and mainTop:FindFirstChild(_D("a7a7c61d6e")) and mainTop.Blade:FindFirstChild(_D("b6aed30a"))
                        if bladeSetsLabel then
                            print(_D("b7aecb166aa72977"))
                            if bladeSetsLabel.Text == _D("d6eb885938") then
                                bladeSetsLabel.Text = _D("d7eb885938")
                            elseif bladeSetsLabel.Text == _D("d7eb885938") then
                                bladeSetsLabel.Text = _D("d4eb885938")
                            elseif bladeSetsLabel.Text == _D("d4eb885938") then
                                bladeSetsLabel.Text = _D("d5eb885938")
                            end
                        end
                        local startTime = tick()
                        while tick() - startTime < 30 and blade.Transparency == 1 do
                            task.wait(0.5)
                            remoteGet:InvokeServer(_D("a7a7c61d6eb0"), _D("b7aecb166aa7"))
                        end
                    end
                end)

                 
                injuryFolder.ChildAdded:Connect(function()
                    task.wait(0.2)
                    if State.injuryEnabled then
                        for _, injury in pairs(injuryFolder:GetChildren()) do
                            injury:Destroy()
                        end
                    end
                end)

                char:GetAttributeChangedSignal(_D("b6bfd21765a628")):Connect(function()
                    if State.injuryEnabled and char:GetAttribute(_D("b6bfd21765a628")) ~= nil then
                        pcall(function()
                            char:SetAttribute(_D("b6bfd21765a628"), nil)
                        end)
                    end
                end)

                char:GetAttributeChangedSignal(_D("b7aac01d64af20")):Connect(function()
                    if State.injuryEnabled and char:GetAttribute(_D("b7aac01d64af20")) ~= nil and char:GetAttribute(_D("b7aac01d64af20")) ~= false then
                        pcall(function()
                            char:SetAttribute(_D("b7aac01d64af20"), nil)
                        end)
                    end
                end)

                local humanoid = char:FindFirstChildOfClass(_D("adbeca1865ac2577"))
                if humanoid then
                    humanoid:GetPropertyChangedSignal(_D("b5a7c60d6dac3e7e11386e7af8")):Connect(function()
                        if State.injuryEnabled and humanoid.PlatformStand == true then
                            pcall(function()
                                humanoid.PlatformStand = false
                            end)
                        end
                    end)
                end

                 
                 
                 
                 
                 
                 
                 

                 
                task.spawn(function()
                    task.wait(10)
                    for _, child in pairs(hotbar:GetChildren()) do
                        if child.Name:find(_D("b6a0ce1567")) then
                            local inner = child:FindFirstChild(_D("aca5c91c79"))
                            local icon = inner and inner:FindFirstChild(_D("aca8c817"))
                            local cooldown = child:FindFirstChild(_D("a6a4c8156fac3b7d"))

                            if icon and cooldown then
                                if icon.Image == _D("97a9df1878b029672b28353bb3a51779d4fe97413afb7a26") then
                                    cooldown:GetPropertyChangedSignal(_D("b3a2d41069af29")):Connect(function()
                                        if State.passed and State.autofarmEnabled and cooldown.Visible == false then
                                            task.spawn(runAutofarmAttackCycle)
                                        end
                                    end)
                                elseif icon.Image == _D("97a9df1878b029672b28353bb3a51779d4fe974e38f57c25") then
                                    cooldown:GetPropertyChangedSignal(_D("b3a2d41069af29")):Connect(function()
                                        if State.passed and State.autofarmEnabled and cooldown.Visible == false then
                                            task.spawn(runAutofarmAttackCycle)
                                        end
                                    end)
                                elseif icon.Image == _D("97a9df1878b029672b28353bb3a51779d4fd93403df17b24") then
                                    cooldown:GetPropertyChangedSignal(_D("b3a2d41069af29")):Connect(function()
                                        if State.passed and State.autofarmEnabled and cooldown.Visible == false then
                                            task.spawn(runAutofarmAttackCycle)
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end)

                bound = true
                break
            end
            task.wait(0.5)
        end
    end)
end

if State.player.Character then
    task.spawn(setupCharacterConnections, State.player.Character)
end

State.player.CharacterAdded:Connect(function(char)
    task.spawn(setupCharacterConnections, char)
end)

 
 
task.spawn(function()
    local titans
    repeat
        titans = Workspace:FindFirstChild(_D("b1a2d31865b0"))
        if not titans then task.wait(1) end
    until titans

    if State.napeExtendEnabled then
        task.spawn(updateNapeHitboxes)
    end

    if titans:FindFirstChild(_D("a4bfd31868a813472b386e7a")) then
        task.spawn(setupErenTitan)
    end

    titans.ChildAdded:Connect(function(child)
        if child.Name == _D("a4bfd31868a813472b386e7a") then
            task.wait(0.2)
            task.spawn(setupErenTitan)
        elseif child:IsA(_D("a8a4c31c67")) then
            task.wait(0.1)
            if State.napeExtendEnabled then
                local hitboxes = child:FindFirstChild(_D("ada2d31b64bb2960"))
                local hit = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
                local nape = hit and hit:FindFirstChild(_D("abaad71c"))
                if nape and nape:IsA(_D("a7aad41c5ba23e67")) then
                    pcall(function()
                        local sz = State.napeMultiplier or 10
                        nape.Size = Vector3.new(sz, sz, sz)
                        nape.Transparency = 0.8
                    end)
                end
            end
        end
    end)
end)

 
Workspace.ChildAdded:Connect(function(childPart)
     
    local ripper = State.ripperEnabled and State.passed
    local farm = State.autofarmEnabled and State.passed
    if not (ripper or farm) then return end

     
    if not childPart:IsA(_D("b5aad50d")) then return end
    local name = childPart.Name
    local expectedName1 = State.playerName .. _D("ba98d31c6eaf")
    local expectedName2 = State.playerName .. _D("ba9fcf0b7eb038")
    local expectedName3 = State.playerName .. _D("ba99ee29")
    if name ~= expectedName1 and name ~= expectedName2 and name ~= expectedName3 then return end

     
    local titans = State.titans
    local root = State.root
    local remotePost = State.remotePost
    local remoteGet = State.remoteGet
    if not titans or not root or not remotePost or not remoteGet then return end

    local char = State.player.Character
    local animController = char and (char:FindFirstChildOfClass(_D("adbeca1865ac2577")) or char:FindFirstChildOfClass(_D("a4a5ce146ab7257c2c0f607ae8e64d2789aed5")))
    if not animController then return end

     
    local limit = math.clamp(State.multiHitCount or 3, 1, 10)
    local allTitanModels = {}
    for _, titan in pairs(titans:GetChildren()) do
        if titan:IsA(_D("a8a4c31c67")) and titan.Name ~= _D("a4bfd31868a813472b386e7a") then
            local humanoid = titan:FindFirstChildOfClass(_D("adbeca1865ac2577"))
            if humanoid and humanoid.Health > 0 then
                local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
                local hit = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
                local nape = hit and hit:FindFirstChild(_D("abaad71c"))
                if nape and nape:IsA(_D("a7aad41c5ba23e67")) then
                    table.insert(allTitanModels, { titan = titan, nape = nape })
                end
            end
        end
    end

    table.sort(allTitanModels, function(a, b)
        return (a.nape.Position - root.Position).Magnitude < (b.nape.Position - root.Position).Magnitude
    end)

    local targetsToMove = {}
    local numToTarget = math.min(#allTitanModels, limit)
    for i = 1, numToTarget do
        table.insert(targetsToMove, allTitanModels[i].nape)
    end

     
    for _, nape in ipairs(targetsToMove) do
        pcall(function()
            nape.Size = Vector3.new(150, 150, 150)
            nape.Transparency = 1
            nape.Position = childPart.Position
        end)
    end

    childPart.Size = Vector3.new(125, 125, 125)
    local startTime = tick()
    local capturedTracks = animController:GetPlayingAnimationTracks()
    if capturedTracks then
        for _, track in pairs(capturedTracks) do
            track:AdjustSpeed(0)
        end
    end

     
    while tick() - startTime < 2 do
        for _, nape in ipairs(targetsToMove) do
            pcall(function()
                nape.Position = childPart.Position
                nape.Transparency = 1
            end)
        end
        task.wait(0.015)  
    end

     
    if capturedTracks then
        for _, track in pairs(capturedTracks) do
            track:AdjustSpeed(1)
        end
    end

    task.wait(0.5)

     
    for _, titan in pairs(titans:GetChildren()) do
        if titan:IsA(_D("a8a4c31c67")) and titan.Name ~= _D("a4bfd31868a813472b386e7a") then
            local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
            local hit = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
            local nape = hit and hit:FindFirstChild(_D("abaad71c"))
            local fake = titan:FindFirstChild(_D("a3aacc1c"))
            local head = fake and fake:FindFirstChild(_D("adaec61d"))
            if nape and nape:IsA(_D("a7aad41c5ba23e67")) and head then
                nape.Position = head.Position - Vector3.new(2, 5, 0)
                nape.Transparency = State.napeVisible and 0.96 or 1
            end
        end
    end
end)

 
getgenv()._cachedRefillPos = getgenv()._cachedRefillPos or nil
task.spawn(function()
    while sessionAlive() do
        local refill = State.refill
        if refill then
            getgenv()._cachedRefillPos = refill.Position + Vector3.new(0, 2, 0)
        end
        task.wait(1)
    end
end)


 
local function isBladeSheathsEmpty()
    local pg = LocalPlayer:FindFirstChild(_D("b5a7c6006eb10b662b"))
    local iface = pg and pg:FindFirstChild(_D("aca5d31c79a52d7027"))
    local hud = iface and iface:FindFirstChild(_D("ad9ee3"))
    local main = hud and hud:FindFirstChild(_D("a8aace17"))
    local top = main and main:FindFirstChild(_D("b1a4d7"))
    if not top then return false end
    
     
    local bladeFrame = nil
    for _, child in ipairs(top:GetChildren()) do
        local bf = child:FindFirstChild(_D("a7a7c61d6eb0")) or child:FindFirstChild(_D("a7a7c61d6e"))
        if bf then
            bladeFrame = bf
            break
        end
    end
    
    local setsLabel = bladeFrame and bladeFrame:FindFirstChild(_D("b6aed30a"))
    if not setsLabel then return false end

    local ok, text = pcall(function() return setsLabel.ContentText end)
    if not ok or not text or text == _D("") then 
        ok, text = pcall(function() return setsLabel.Text end)
    end
    if not ok or not text then return false end
    
     
    text = string.gsub(text, _D("d990f94756e872"), _D(""))
    
     
    local firstNumber = string.match(text, _D("c0af8c"))
    print(_D("be89cb186fa66c402a296e60f4b4662e87bec0242b97296b36762f") .. tostring(text) .. _D("c5e699595ba23e6027282f47f9e002088abec90d31e3") .. tostring(firstNumber))
    return firstNumber == _D("d5")
end

local function getActiveBlade()
    return State.blade
end

local function getRefillStation()
    return State.refill
end

local function smoothTeleport(targetCFrame)
    local root = State.root
    if not root then return end
    pcall(function()
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end)
    local startCFrame = root.CFrame
    local distance = (targetCFrame.Position - startCFrame.Position).Magnitude
    if distance > 5 then
        local steps = 8
        for i = 1, steps do
            local alpha = i / steps
            root.CFrame = startCFrame:Lerp(targetCFrame, alpha)
            task.wait(0.01)
        end
    else
        root.CFrame = targetCFrame
    end
end

local REGISTER_GAP_MIN = 0.25
local REGISTER_GAP_JITTER = 0.05

local function registerDamage(nape)
    if not nape then return end
    local remote = State.remotePost or game:GetService(_D("b7aed71562a02d6727285c60f3e6432c80")).Assets.Remotes.POST
    for i = 1, 1 do
        pcall(function()
            local arguments = {
                [1] = _D("ada2d31b64bb2960"),
                [2] = _D("b7aec01078b72961"),
                [3] = nape,
                [4] = math.random(620, 890)  
            }
            remote:FireServer(unpack(arguments))
        end)
        if i < 4 then
            task.wait(REGISTER_GAP_MIN + math.random() * REGISTER_GAP_JITTER)
        end
    end
end

local function checkAndReloadBlades()
    local root = State.root
    local GET = State.remoteGet
    local VIM = State.VIM or game:GetService(_D("b3a2d50d7ea2205a2c3c7a60d1f54c2a82aed5"))
    if not root or not GET then return false end

    local blade = getActiveBlade()
    local isBroken = (not blade) or (blade.Transparency == 1)
    
    if isBroken then
        local sheathsEmpty = isBladeSheathsEmpty()
        
        if sheathsEmpty then
            showNotification(_D("a4bed3166da23e7e"), _D("a7a7c61d6eb06c77273c6371e8f1466bcdfb884a2b90296731652e34c8f14e2e95a4d50d62ad2b3336232f66f9f24b2789ebd40d6ab7257c2c62213a"))
            local refill = getRefillStation()
            local targetPos = refill and (refill.Position + Vector3.new(0, 3, 0)) or getgenv()._cachedRefillPos
            if targetPos then
                State.reloadingBlade = true
                 
                pcall(function()
                    root.Anchored = true
                end)
                task.wait(0.3)
                
                 
                pcall(function()
                    local prompt = refill:FindFirstChildOfClass(_D("b5b9c80162ae25673b1c7d7bf1e456"))
                        or (refill.Parent and refill.Parent:FindFirstChildOfClass(_D("b5b9c80162ae25673b1c7d7bf1e456")))
                        or (refill.Parent and refill.Parent.Parent and refill.Parent.Parent:FindFirstChildOfClass(_D("b5b9c80162ae25673b1c7d7bf1e456")))
                    if prompt then
                        fireproximityprompt(prompt)
                    end
                end)
                
                 
                for _ = 1, 3 do
                    pcall(function()
                        GET:InvokeServer(_D("a4bfd31868a83f"), _D("b7aecb166aa7"), refill)
                    end)
                    task.wait(0.35)
                end
                
                 
                task.wait(4.5)
                
                 
                pcall(function()
                    GET:InvokeServer(_D("a7a7c61d6eb0"), _D("b7aecb166aa7"))
                end)
                
                pcall(function()
                    root.Anchored = false
                end)
                task.wait(0.1)
                State.reloadingBlade = false
            else
                warn(_D("aba4870b6ea5257f2e6c7c60fde04b248bebc1167ead2832"))
            end
        else
            showNotification(_D("a4bed3166da23e7e"), _D("a7a7c61d6ee32e612d276a7abdb46b2593a4cc1065a46c61273c6375fff14f2e8bbf870b6eaf2372266c6966f3f902388daec60d63ed623d"))
            State.reloadingBlade = true
            
             
            pcall(function()
                root.Anchored = true
            end)
            
             
            --[[
            pcall(function()
                GET:InvokeServer(_D("a7a7c61d6eb0"), _D("b7aecb166aa7"))
            end)
            ]]--
             
            local success = false
            for _ = 1, 10 do
                task.wait(0.2)
                local checkBlade = getActiveBlade()
                if checkBlade and checkBlade.Transparency == 0 then
                    print(_D("abaed05969af2d77276c637bfdf0472fc5b8d21a68a63f6024396378e5b5"))
                    success = true
                    break
                end
            end
            
            pcall(function()
                root.Anchored = false
            end)
            State.reloadingBlade = false
            
            if not success then
                warn(_D("b7aec11067af6c602a296e60f4e7022e88bbd3002bac3e333029637bfdf0022d84a2cb1c6fed"))
            end
        end
    end
    
     
    local finalBlade = getActiveBlade()
    return finalBlade and finalBlade.Transparency == 0
end

 
 
 
local function getErenActiveNape()
    local titans = State.titans
    if not titans then return nil end
    local attackTitan = titans:FindFirstChild(_D("a4bfd31868a813472b386e7a"))
    if not attackTitan then return nil end
    local humanoid = attackTitan:FindFirstChildOfClass(_D("adbeca1865ac2577"))
    if not humanoid or humanoid.Health <= 0 then return nil end

    local marker = attackTitan:FindFirstChild(_D("a8aad5126eb1"))
    local adornee = marker and marker.Adornee
    local part
    if adornee == State.leftleg then
        part = State.leftleg
    elseif adornee == State.rightleg then
        part = State.rightleg
    elseif adornee == State.leftarm then
        part = State.leftarm
    elseif adornee == State.rightarm then
        part = State.rightarm
    elseif adornee == State.eyes then
        part = State.eyes
    else
        part = State.nape
    end

    if part and part:IsA(_D("a7aad41c5ba23e67")) then
        return part
    end
    return nil
end

getAllTargets = function()
    local allTargets = {}
    local titansObj = State.titans
    if titansObj then
        for _, titan in pairs(titansObj:GetChildren()) do
            if titan:IsA(_D("a8a4c31c67")) and titan.Name ~= _D("a4bfd31868a813472b386e7a") then
                local humanoid = titan:FindFirstChildOfClass(_D("adbeca1865ac2577"))
                if humanoid and humanoid.Health > 0 then
                    local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
                    local hit      = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
                    local nape     = hit and hit:FindFirstChild(_D("abaad71c"))
                    if nape and nape:IsA(_D("a7aad41c5ba23e67")) then
                        table.insert(allTargets, { type = _D("91a2d31865"), instance = titan, nape = nape })
                    end
                end
            end
        end
    end

    if State.inRaid then
        local CS = CollectionService
        for _, boss in ipairs(CS:GetTagged(_D("aaa9cd1c68b7256527"))) do
            if boss:IsA(_D("a8a4c31c67")) then
                local healthVal = boss:FindFirstChild(_D("adaec6157fab"))
                if healthVal and healthVal.Value > 0 then
                    local hitboxes = boss:FindFirstChild(_D("ada2d31b64bb2960"))
                    local hit      = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
                    local bossNape = hit and hit:FindFirstChild(_D("abaad71c"))
                    if bossNape and bossNape:IsA(_D("a7aad41c5ba23e67")) then
                        table.insert(allTargets, { type = _D("87a4d40a"), instance = boss, nape = bossNape })
                    end
                end
            end
        end
    end

    local erenNape = getErenActiveNape()
    if erenNape then
        table.insert(allTargets, { type = _D("80b9c217"), instance = erenNape, nape = erenNape })
    end

    return allTargets
end

getUntouchedTarget = function(allTargets)
    if not State.delayMissionComplete then return nil end
    if tick() - serverStartTick >= State.delayMissionTime then return nil end

    if State.untouchedTarget then
        for _, t in ipairs(allTargets) do
            if t.instance == State.untouchedTarget.instance and t.nape == State.untouchedTarget.nape then
                return State.untouchedTarget
            end
        end
    end

    for _, t in ipairs(allTargets) do
        if t.type == _D("91a2d31865") then
            State.untouchedTarget = t
            return t
        end
    end

    if #allTargets > 0 then
        State.untouchedTarget = allTargets[1]
        return allTargets[1]
    end

    State.untouchedTarget = nil
    return nil
end

 
runAutofarmAttackCycle = function()
     
    if _opfarmActive then return end
    _opfarmActive = true

     
     
    task.spawn(function()
        while _opfarmActive do
            local root = State.root
            if root then
                 
                 
                local vel = root.AssemblyLinearVelocity
                if vel.Y < 0 then
                    root.AssemblyLinearVelocity = Vector3.new(vel.X, 0, vel.Z)
                end

                 
                local currentSpawn = getgenv()._spawnedPos
                if currentSpawn and root.Position.Y < (currentSpawn.Y - 50) then
                    pcall(function()
                        root.CFrame = CFrame.new(currentSpawn + Vector3.new(0, 5, 0))
                        root.AssemblyLinearVelocity = Vector3.zero
                    end)
                end
            end
            task.wait(0.05)
        end
    end)

    showNotification(_D("a4bed3166da23e7e"), _D("aa9b87387eb72375233e6234efe0433991aec3"))

    while State.autofarmEnabled and State.passed and sessionAlive() do
        local root       = State.root
        local remotePost = State.remotePost
        local remoteGet  = State.remoteGet

        if not root or not remotePost or not remoteGet then
            task.wait(0.5)
            continue
        end

        if State.waitingToKill then
            pcall(function() root.Anchored = true end)
            task.wait(0.5)
            continue
        end

        pcall(function() root.Anchored = false end)

        local allTargets = getAllTargets()
        if #allTargets == 0 then
            pcall(function() root.Anchored = true end)
            task.wait(1)
            continue
        end

        local untouched = getUntouchedTarget(allTargets)
        local activeTargets = {}
        for _, t in ipairs(allTargets) do
            if not (untouched and t.instance == untouched.instance) then
                table.insert(activeTargets, t)
            end
        end

        if #activeTargets == 0 then
            pcall(function() root.Anchored = true end)
            task.wait(1)
            continue
        end

         
        local nearestTarget = nil
        local minDist = math.huge
        local currentPos = root.Position
        for _, t in ipairs(activeTargets) do
            local dist = (t.nape.Position - currentPos).Magnitude
            if dist < minDist then
                minDist = dist
                nearestTarget = t
            end
        end

        if nearestTarget and not State.reloadingBlade then
            pcall(function()
                root.Anchored = true
                root.CFrame = CFrame.new(nearestTarget.nape.Position + Vector3.new(0, 150, 0))
            end)
            if State.optimizePerformanceEnabled then
                pcall(function() LocalPlayer.ReplicationFocus = nearestTarget.nape end)
            end
        end

         
        local midBlade = State.blade
        local midBladeBroken = (not midBlade) or (midBlade.Transparency == 1)
        local bladeOk = true
        if midBladeBroken then
            bladeOk = checkAndReloadBlades()
        end

        if bladeOk then
             
            remotePost:FireServer(_D("a4bfd31868a83f"), _D("b6a7c60a63"), true)
            
             
            local validTargets = {}
            local playerPos = root.Position
            for _, t in ipairs(activeTargets) do
                local dist = (t.nape.Position - playerPos).Magnitude
                --if dist <= 950 then
                table.insert(validTargets, t.nape)
                --end
            end
            
            table.sort(validTargets, function(a, b)
                return (a.Position - playerPos).Magnitude < (b.Position - playerPos).Magnitude
            end)

            local limit = math.clamp(State.multiHitCount or 3, 1, 10)
            for idx = 1, math.min(#validTargets, limit) do
                local nape = validTargets[idx]
                task.spawn(registerDamage, nape)
            end
            task.wait(1)
            remotePost:FireServer(_D("a4bfd31868a83f"), _D("b6a7c60a63"), false)
        else
            task.wait(1)
        end
    end

    local finalRoot = State.root
    if finalRoot then
        pcall(function() LocalPlayer.ReplicationFocus = nil end)
        pcall(function() finalRoot.Anchored = false end)
        local flight = finalRoot:FindFirstChild(_D("a4bed3166da23e7e04206673f4e0"))
        if flight then
            pcall(function() flight:Destroy() end)
        end

         
        local returnPos = getgenv()._spawnedPos
        if returnPos then
            pcall(function() finalRoot.CFrame = CFrame.new(returnPos + Vector3.new(0, 3, 0)) end)
        end
    end

    _opfarmActive = false
    showNotification(_D("a4bed3166da23e7e"), _D("aa9b87387eb72375233e6234efe04d3b95aec359e943d83330297b61eefa472fc5bfc85978b32d642c"))
end

if State.autofarmEnabled and State.passed then
    task.wait(1.5)
    task.spawn(runAutofarmAttackCycle)
end

 
 
 
--[[
local MODIFIER_TAGS = {
    _D("aba487296eb12760"), _D("aba4872a60aa207f31"), _D("aba487346eae23612b297c"), _D("aba2c0117fae2d6127"), _D("aaafc31b6aaf20"),
    _D("aca5cd0c79ba6c4330236171"), _D("a6a3d51665aa2f330b226561eefd4738"), _D("a3a4c0"), _D("a2a7c60a78e30f722c22607a"), _D("b1a2ca1c2b973e7a2320")
}

]]--

local MODIFIER_TAGS = {
    _D("aaafc31b6aaf20"), _D("aba487296eb12760"), _D("aba4872a60aa207f31"), _D("aba2c0117fae2d6127"), _D("aca5cd0c79ba6c4330236171"), _D("a6a3d51665aa2f330b226561eefd4738"), _D("a3a4c0"), _D("a2a7c60a78e30f722c22607a"), _D("b1a2ca1c2b973e7a2320")
}

applyAllModifiers = function()
    local remoteGet = State.remoteGet
    if not remoteGet then return end
    local leader = Workspace:GetAttribute(_D("a9aec61d6eb1"))
    if leader ~= State.playerName then
        showNotification(_D("a8a4c3106daa296131"), _D("aba4d3597fab29332e296e70f9e602a9655f871a6aad227c366c6c7cfdfa452ec5a6c81d62a52576303f21"))
        return
    end
    local current = Workspace:GetAttribute(_D("a8a4c3106daa296131")) or  _D("")
    for _, tag in ipairs(MODIFIER_TAGS) do
        if not current:find(tag, 1, true) then
            pcall(function()
                remoteGet:InvokeServer(_D("a3bec91a7faa237d31"), _D("a8a4c3106dba"), tag)
            end)
            task.wait(0.15)
            current = Workspace:GetAttribute(_D("a8a4c3106daa296131")) or  _D("")
        end
    end
    showNotification(_D("a8a4c3106daa296131"), _D("a4a7cb5966ac287a24256a66efb4472584a9cb1c6fe2"))
end

local retryConfig = {
    retryButtonTitle = nil,
    clickInterval = 1
}

retryLoop = function()
    if _retryLoopActive then return end
    _retryLoopActive = true
    
    local GET = State.remoteGet
    print(_D("a7aac4126cb123662c282f55e9e04d66b7aed30b72e3207a31386a7af9e6023891aad50d6ea762"))
    
    while LocalPlayer.Parent and sessionAlive() do
        task.wait(1)
        pcall(function()
            local pg = LocalPlayer:FindFirstChild(_D("b5a7c6006eb10b662b"))
            local iface = pg and pg:FindFirstChild(_D("aca5d31c79a52d7027"))
            local rewards = iface and iface:FindFirstChild(_D("b7aed01879a73f"))
            
             
            if rewards and rewards.Visible then
                local main = rewards:FindFirstChild(_D("a8aace17"))
                local info = main and main:FindFirstChild(_D("aca5c116"))
                local stateTextObj = info and info:FindFirstChild(_D("b6bfc60d6e"))
                
                if stateTextObj then
                    local text = stateTextObj.Text
                    local tUpper = text:upper()
                    if string.find(tUpper, _D("a684ea294786185606")) or string.find(tUpper, _D("a382e930588b0957")) or string.find(tUpper, _D("a38aee354e87")) then
                        local shouldRetry = State.autoRejoinEnabled
                        if not shouldRetry then
                            return
                        end

                         
                        if State.lobbyTeleportEnabled and State.gamesPlayed >= State.maxGames then
                            showNotification(_D("a4bed3166da23e7e"), _D("a2aaca1c78e3207a2f257b34eef143288daec3582b97297f273c6066e8fd4c2cc5bfc85947ac2e713b62213a"))
                            task.wait(2)
                            pcall(function()
                                TeleportService:Teleport(14916516914, LocalPlayer)
                            end)
                            task.wait(10)
                            return
                        end

                        print(_D("a8aad31a63e3297d266c6b71e8f1413f80af86594ab6387c6f2d7f64f0ed4b2582ebca166faa2a7a273e7c34fdfa466b97aed30b72aa227462216e60fffc0c65cb"))
                        
                         
                        local leader = Workspace:GetAttribute(_D("a9aec61d6eb1"))
                        if leader == LocalPlayer.Name and State.autoModifiersEnabled then

                            --local whitelistedModifiers = { _D("aba2c0117fae2d6127"), _D("aba4872a60aa207f31"), _D("aca5cd0c79ba6c4330236171"), _D("aaafc31b6aaf20"), _D("aba487296eb12760"), _D("a3a4c0"), _D("a6a3d51665aa2f330b226561eefd4738"), _D("a2a7c60a78e30f722c22607a"), _D("aba487346eae23612b297c"), _D("b1a2ca1c2b973e7a2320") }
                            local whitelistedModifiers = { _D("aaafc31b6aaf20"), _D("aba487296eb12760"), _D("aba2c0117fae2d6127"), _D("aba4872a60aa207f31"), _D("aca5cd0c79ba6c4330236171"), _D("a3a4c0"), _D("a6a3d51665aa2f330b226561eefd4738"), _D("a2a7c60a78e30f722c22607a"), _D("b1a2ca1c2b973e7a2320") }
                            local currentModifiers = Workspace:GetAttribute(_D("a8a4c3106daa296131")) or  _D("")
                            for _, tag in ipairs(whitelistedModifiers) do
                                if not string.find(currentModifiers, tag, 1, true) then
                                    print(_D("a4bbd71572aa227462216070f5f24b2e97f1"), tag)
                                    pcall(function()
                                        GET:InvokeServer(_D("a3bec91a7faa237d31"), _D("a8a4c3106dba"), tag)
                                    end)
                                    task.wait(0.25)
                                end
                            end
                            task.wait(0.5)  
                        end

                         
                         
                        pcall(doLogProgression)

                        local GuiService = game:GetService(_D("a2bece2a6eb13a7a2129"))
                        local PlayerGui = LocalPlayer:WaitForChild(_D("b5a7c6006eb10b662b"))
                        local Retry = PlayerGui
                            :WaitForChild(_D("aca5d31c79a52d7027"))
                            :WaitForChild(_D("b7aed01879a73f"))
                            :WaitForChild(_D("a8aace17"))
                            :WaitForChild(_D("aca5c116"))
                            :WaitForChild(_D("a8aace17"))
                            :WaitForChild(_D("a7bed30d64ad3f"))
                            :WaitForChild(_D("b7aed30b72"))

                         
                        Retry.Selectable = true
                        GuiService.SelectedObject = Retry
                        task.wait(0.1)

                         
                        pcall(function()
                            local vim = State.VIM or game:GetService(_D("b3a2d50d7ea2205a2c3c7a60d1f54c2a82aed5"))
                            vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            task.wait(0.05)
                            vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        end)

                        task.wait(15)  
                    end
                end
            end
        end)
    end
    _retryLoopActive = false
end

 
if State.inGame then
    task.spawn(function()
        task.wait(180)  
        local shouldRetry = State.autoRejoinEnabled
        if shouldRetry and State.inGame then
            if State.lobbyTeleportEnabled and State.gamesPlayed >= State.maxGames then
                showNotification(_D("a4bed3166da23e7e"), _D("b1a2ca1c64b6383330296e77f4f14671c59fc2156eb3236136256173bce04d6ba9a4c51b72ed623d"))
                task.wait(2)
                pcall(function()
                    TeleportService:Teleport(14916516914, LocalPlayer)
                end)
                return
            end
            showNotification(_D("a4bed3166da23e7e"), _D("adaad51d2bf0617e2b227a60f9e7023f8ca6c2167eb76c61272d6c7cf9f002a9655f871f64b12f7a2c2b2f67f9e6542e97ebd51c61ac257d63"))
            task.wait(2)
            pcall(function()
                TeleportService:Teleport(14916516914, LocalPlayer)
            end)
        end
    end)
end

local function sendRewardWebhook(messageContent)
    print(_D("be99c20e6ab128330e236849a6b4") .. messageContent)
end

 
task.spawn(function()
    local playerGui = State.player:WaitForChild(_D("b5a7c6006eb10b662b"))
    local interface = playerGui:WaitForChild(_D("aca5d31c79a52d7027"))

    local function hookRewards(rewards)
        local main     = rewards:FindFirstChild(_D("a8aace17"))
        local info     = main and main:FindFirstChild(_D("aca5c116"))
        local infoMain = info and info:FindFirstChild(_D("a8aace17"))
        local buttons  = infoMain and infoMain:FindFirstChild(_D("a7bed30d64ad3f"))
        local retry    = buttons and buttons:FindFirstChild(_D("b7aed30b72"))
        local title    = retry and retry:FindFirstChild(_D("b1a2d3156e"))
        if title then
            retryConfig.retryButtonTitle = title
        end

         
        if State.autoModifiersEnabled then
            task.delay(1.5, applyAllModifiers)
        end

         
        if State.autoRejoinEnabled then
            task.spawn(retryLoop)
        end

        local items = infoMain and infoMain:FindFirstChild(_D("acbfc21478"))
        if items then
            items.ChildAdded:Connect(function(item)
                if string.find(string.lower(item.Name), _D("88b2d31162a0")) then
                    sendRewardWebhook(_D("b6a4ca1c64ad293328397c60bcf34d3fc5aa873472b7247a212d6334ecf15020c4"))
                elseif string.find(string.lower(item.Name), _D("96aed50c66")) then
                    sendRewardWebhook(_D("b6a4ca1c64ad293328397c60bcf34d3fc5aa870a6eb1397e63"))
                end
            end)
        end

         
        if main and not rewards:GetAttribute(_D("aeaace0b78ab007c252b6a66d4fb4d2080af")) then
            rewards:SetAttribute(_D("aeaace0b78ab007c252b6a66d4fb4d2080af"), true)
            local function isShown()
                if main:IsA(_D("a6aac90f6ab00b612d397f")) then return main.GroupTransparency < 0.5 end
                return main.Visible == true
            end
            local wasShown = isShown()
            local function onVisibility()
                local shown = isShown()
                if shown and not wasShown then
                    pcall(function()
                        if getgenv().KairshLogProgression then
                            getgenv().KairshLogProgression()
                        end
                    end)
                end
                wasShown = shown
            end
            if main:IsA(_D("a6aac90f6ab00b612d397f")) then
                main:GetPropertyChangedSignal(_D("a2b9c80c7b973e722c3f7f75eef14c289c")):Connect(onVisibility)
            end
            main:GetPropertyChangedSignal(_D("b3a2d41069af29")):Connect(onVisibility)
        end
    end

    local existingRewards = interface:FindFirstChild(_D("b7aed01879a73f"))
    if existingRewards then
        hookRewards(existingRewards)
    end

    interface.ChildAdded:Connect(function(child)
        if child.Name == _D("b7aed01879a73f") then
            hookRewards(child)
        end
    end)
end)

 
task.spawn(function()
    local remotePost = State.remotePost
    while not remotePost do
        task.wait(0.5)
        remotePost = State.remotePost
    end
    remotePost.OnClientEvent:Connect(function(moduleName, actionName, ...)
        if moduleName == _D("b7aed01879a73f") and (actionName == _D("b6aed30c7b") or actionName == _D("a6b9c2187fa6")) then
             
            if actionName == _D("b6aed30c7b") then
                pcall(function()
                    if getgenv().KairshLogProgression then
                        getgenv().KairshLogProgression()
                    end
                end)
            end

            local shouldRetry = State.autoRejoinEnabled
            if shouldRetry then
                if State.lobbyTeleportEnabled and State.gamesPlayed >= State.maxGames then
                    task.spawn(function()
                        showNotification(_D("a4bed3166da23e7e"), _D("a2aaca1c78e3207a2f257b34eef143288daec3582b97297f273c6066e8fd4c2cc5bfc85947ac2e713b62213a"))
                        task.wait(2)
                        pcall(function()
                            TeleportService:Teleport(14916516914, LocalPlayer)
                        end)
                    end)
                    return
                end
                 
            end
        end
    end)
end)

 
 
 
 
local function getStreak()
    return LocalPlayer:GetAttribute(_D("b6bfd51c6aa8")) or 0
end

 
task.spawn(function()
    while LocalPlayer.Parent and sessionAlive() do
        task.wait(1)
        pcall(function()
            if State.dieAfterStreakEnabled and State.inGame then
                local streak = getStreak()
                if streak >= State.streakThreshold then
                    local char = State.character
                    local hum = char and char:FindFirstChildOfClass(_D("adbeca1865ac2577"))
                    if hum and hum.Health > 0 then
                        print(string.format(_D("be98d30b6ea227330f23617de8fb5016c59fc60b6ca6383331387d71fdff022483eb821d2bb1297221246a70bcbc613e97b9c2177ff96c3626652e34c8f14e2e95a4d50d62ad2b3336232f60f5e0432596ebd3162bb129602738213ab2"), State.streakThreshold, streak))
                        showNotification(_D("b6bfd51c6aa86c5e2d226660f3e6"), string.format(_D("b6bfd51c6aa86c7f2b216660bce6472a86a3c21d2beb69776b6d2f40f9f8473b8ab9d31065a46c672d6c6e34c8fd562a8bebd3162bb12960273821"), State.streakThreshold))
                        
                         
                        local oldAutofarm = State.autofarmEnabled
                        local oldOldfarm = State.oldfarmEnabled
                        State.autofarmEnabled = false
                        State.oldfarmEnabled = false
                        
                        while LocalPlayer.Parent and hum and hum.Health > 0 and Workspace:GetAttribute(_D("b1b2d71c")) ~= nil and getStreak() >= State.streakThreshold do
                            local targets = getAllTargets()
                            local nearest = nil
                            local minDist = math.huge
                            local root = State.root
                            if root then
                                for _, t in ipairs(targets) do
                                    if t.instance and t.instance.PrimaryPart then
                                        local dist = (t.instance.PrimaryPart.Position - root.Position).Magnitude
                                        if dist < minDist then
                                            minDist = dist
                                            nearest = t.instance
                                        end
                                    end
                                end
                                if nearest and nearest.PrimaryPart then
                                    smoothTeleport(nearest.PrimaryPart.CFrame)
                                end
                            end
                            task.wait(0.25)
                        end
                        
                         
                        State.autofarmEnabled = oldAutofarm
                        State.oldfarmEnabled = oldOldfarm
                    end
                end
            end
        end)
    end
end)

task.spawn(retryLoop)

 
autofarmFlyLoop = function()
    local root = State.root
    if not root then return end

     
    local char = State.character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA(_D("a7aad41c5ba23e67")) then
                part.CanCollide = false
            end
        end
    end

    local orbitAngle = 0
    while State.oldfarmEnabled and sessionAlive() do
        task.wait(0.05)
        local titans     = State.titans
        local currentRoot = State.root
        if not titans or not currentRoot then break end

        if State.reloadingBlade or State.tweeningToNape then
            local bv = currentRoot:FindFirstChild(_D("a79d"))
            if bv then
                bv.MaxForce = Vector3.zero
                bv.Velocity = Vector3.zero
            end
            continue
        end

        task.spawn(findClosestTarget)

        local nape    = State.nape
        local bv = currentRoot:FindFirstChild(_D("a79d"))
        local bg = currentRoot:FindFirstChild(_D("a78c"))

        if nape then
            local targetPos
            local method = State.farmMethod
            if method == _D("b0a5c31c79a43e7c37226b") then
                local yOffset = titans:FindFirstChild(_D("a4bfd31868a813472b386e7a")) and -195 or -70
                targetPos = nape.Position + Vector3.new(0, yOffset, 0)
            elseif method == _D("aab9c5107f") then
                 
                orbitAngle = (orbitAngle + 0.15) % (math.pi * 2)
                local orbitRadius = 40
                local orbitHeight = 15
                targetPos = nape.Position + Vector3.new(math.cos(orbitAngle) * orbitRadius, orbitHeight, math.sin(orbitAngle) * orbitRadius)
            else  
                local yOffset = titans:FindFirstChild(_D("a4bfd31868a813472b386e7a")) and 195 or 70
                targetPos = nape.Position + Vector3.new(0, yOffset, 0)
            end
            
            local delta     = targetPos - currentRoot.Position
            local mag       = delta.Magnitude
            if mag > 1 then
                local unit  = delta.Unit
                local speed = math.clamp(mag * 1.5, 45, 185)
                if bv then
                    bv.MaxForce = Vector3.new(6500, 6500, 6500)
                    bv.Velocity = unit * speed
                end
                if bg then
                    bg.CFrame = CFrame.new(currentRoot.Position, nape.Position)
                end
            else
                if bv then
                    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bv.Velocity = Vector3.zero
                end
            end
        else
             
            if bv then
                bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bv.Velocity = Vector3.zero
            end
        end
    end

     
    local finalRoot = State.root
    if finalRoot then
        local bv = finalRoot:FindFirstChild(_D("a79d"))
        if bv then
            bv.MaxForce = Vector3.zero
            bv.Velocity = Vector3.zero
        end
        local bp = finalRoot:FindFirstChild(_D("a7a4c3005bac3f7a3625607a"))
        if bp then
            bp:Destroy()
        end
    end
end

 
autofarmCombatLoop = function()
    while State.oldfarmEnabled and sessionAlive() do
        task.wait(0.2)
        local remotePost = State.remotePost
        local remoteGet  = State.remoteGet
        local root       = State.root
        local titans     = State.titans
        if not remotePost or not remoteGet or not root or not titans then
            continue
        end

        if State.waitingToKill then
            pcall(function() root.Anchored = true end)
            task.wait(0.5)
            continue
        end

        if State.reloadingBlade then
            continue
        end

        task.spawn(findClosestTarget)
        task.wait(0.05)

        local nape = State.nape
        if not nape then
            pcall(function() LocalPlayer.ReplicationFocus = nil end)
            local allTargets = getAllTargets()
            local untouched = getUntouchedTarget(allTargets)
            if untouched and #allTargets == 1 then
                local elapsed = tick() - serverStartTick
                local targetDelay = State.delayMissionTime or 30
                if elapsed < targetDelay then
                    local waitTime = targetDelay - elapsed
                    showNotification(_D("a4bed3166da23e7e"), string.format(_D("a9aec60f62ad2b332e2d7c60bce04b3f84a5871867ac227662396160f3e1412380af9d597ca225672b226834b9ba132dc5b8"), waitTime))
                    pcall(function() root.Anchored = true end)
                    task.wait(math.min(waitTime, 5))
                end
            end
        end

        local maxDist = titans:FindFirstChild(_D("a4bfd31868a813472b386e7a")) and 250 or 160
        if nape and (root.Position - nape.Position).Magnitude <= maxDist then
            State.tweeningToNape = true
            if State.optimizePerformanceEnabled then
                pcall(function() LocalPlayer.ReplicationFocus = nape end)
            end
            
             
            local tweenInfoObj = TweenInfo.new(0.12, Enum.EasingStyle.Linear)
            local tween = TweenService:Create(root, tweenInfoObj, { CFrame = nape.CFrame })
            tween:Play()
            tween.Completed:Wait()

             
            remotePost:FireServer(_D("a4bfd31868a83f"), _D("b6a7c60a63"), true)
            task.wait(0.03)
            registerDamage(nape)
            task.wait(0.05)
            
            State.tweeningToNape = false
        end

         
        local blade = State.blade
        if blade and blade.Transparency == 1 and not State.reloadingBlade then
            checkAndReloadBlades()
        end
    end
    pcall(function() LocalPlayer.ReplicationFocus = nil end)
end

if State.oldfarmEnabled then
    task.spawn(autofarmFlyLoop)
    task.spawn(autofarmCombatLoop)
end



 
runKillAura = function()
    showNotification(_D("aea2cb152b82396123"), _D("aea2cb152b823961236c7c60fde6562e81"))
    local lastSlashTime = 0   
    while State.killAuraEnabled do
        local root       = State.root
        local titans     = State.titans
        local remotePost = State.remotePost
        local remoteGet  = State.remoteGet

        if not root or not titans or not remotePost or not remoteGet then
            task.wait(0.1)
            continue
        end

        if State.waitingToKill then
            task.wait(0.2)
            continue
        end

         
        local nearby = {}
        for _, titan in pairs(titans:GetChildren()) do
            if not titan:IsA(_D("a8a4c31c67")) or titan.Name == _D("a4bfd31868a813472b386e7a") then continue end
            local humanoid = titan:FindFirstChildOfClass(_D("adbeca1865ac2577"))
            if not (humanoid and humanoid.Health > 0) then continue end
            local hitboxes = titan:FindFirstChild(_D("ada2d31b64bb2960"))
            local hit      = hitboxes and hitboxes:FindFirstChild(_D("ada2d3"))
            local titanNape = hit and hit:FindFirstChild(_D("abaad71c"))
            if titanNape and titanNape:IsA(_D("a7aad41c5ba23e67")) then
                local dist = (titanNape.Position - root.Position).Magnitude
                if dist <= 50 then
                    table.insert(nearby, titanNape)
                end
            end
        end

        if #nearby > 0 then
             
             
            local targetPos = nearby[1].Position - Vector3.new(0, 100, 0)
            root.CFrame = CFrame.new(targetPos)
            if State.optimizePerformanceEnabled then
                pcall(function() LocalPlayer.ReplicationFocus = nearby[1] end)
            end
            task.wait(0.02)

             
            local playerPos = root.Position
            for _, n in ipairs(nearby) do
                pcall(function()
                    n.Size        = Vector3.new(150, 150, 150)
                    n.Transparency = 1
                    n.Position    = playerPos
                end)
            end

             
            pcall(function() remotePost:FireServer(_D("b694f71c79a83f"), _D("a7a7c61a609c0a7f233f67"), 0.5) end)

             
            local slashGap = tick() - lastSlashTime
            if slashGap < 1.05 then task.wait(1.05 - slashGap) end

             
            remotePost:FireServer(_D("a4bfd31868a83f"), _D("b6a7c60a63"), true)
            lastSlashTime = tick()
            task.wait(0.05)

             
            local limit = math.clamp(State.multiHitCount or 3, 1, 10)
            for idx = 1, math.min(#nearby, limit) do
                local n = nearby[idx]
                task.spawn(registerDamage, n)
            end
             
            task.wait(0.3)
            remotePost:FireServer(_D("a4bfd31868a83f"), _D("b6a7c60a63"), false)
        else
            pcall(function() LocalPlayer.ReplicationFocus = nil end)
        end

        task.wait(0.1)
    end
    showNotification(_D("aea2cb152b82396123"), _D("aea2cb152b823961236c7c60f3e4522e81"))
    pcall(function() LocalPlayer.ReplicationFocus = nil end)
end

if State.killAuraEnabled then
    task.spawn(runKillAura)
end

 
task.spawn(function()
    local runService = RunService
    local lastChar = nil
    local spawnPos = nil

    while true do
        local inGame = State.inGame
        local fixCam = State.fixCameraEnabled
        local char   = State.character
        local root   = State.root

        if inGame and fixCam and char and root then
            if char ~= lastChar then
                lastChar = char
                task.wait(0.2)
                if State.root then
                    spawnPos = State.root.Position
                end
            end

            if spawnPos then
                local camera = workspace.CurrentCamera
                camera.CameraType = Enum.CameraType.Scriptable
                camera.CFrame = CFrame.new(spawnPos + Vector3.new(0, 120, 120), spawnPos)
            end
            runService.RenderStepped:Wait()
        else
            lastChar = nil
            spawnPos = nil
            task.wait(0.5)
        end
    end
end)

 
task.spawn(function()
    local lastBlade = nil
    local conn = nil

    while sessionAlive() do
        local currentBlade = State.blade
        if currentBlade ~= lastBlade then
            if conn then
                conn:Disconnect()
                conn = nil
            end
            lastBlade = currentBlade
            if currentBlade then
                conn = currentBlade:GetPropertyChangedSignal(_D("b1b9c61778b32d6127226c6d")):Connect(function()
                    if currentBlade.Transparency == 1 then
                        if (State.autofarmEnabled or State.oldfarmEnabled) and not State.reloadingBlade then
                            task.spawn(checkAndReloadBlades)
                        end
                    end
                end)
            end
        end
        task.wait(0.2)
    end
    if conn then
        conn:Disconnect()
    end
end)

 
local _mapCleanupActive = false
local _wipedFolders = {}

local function optimizeClientPerformance()
    if not State.inGame then return end
    if not State.optimizePerformanceEnabled then return end
    if _mapCleanupActive then return end
    _mapCleanupActive = true

    print(_D("be86c60948af29722c397f49bcdd4c2291a2c60d62ad2b3323287975f2f7472fc5a8cb106ead383332297d72f3e64f2a8ba8c25964b3387a2f257575e8fd4d2596e58957"))

    local CONFIG = {
        DisableLightingEffects = true,    
        RemoveTerrainClouds    = true,    
        RemoveClimbSurfaces    = true,    
        RemoveBaseplate        = false,   
        KeepListenersAlive     = true,    
        SweepInterval          = 2,       
        LowerRenderQuality     = true,    
        MuteSounds             = true,    
        KillParticles          = true,    
        KillDynamicLights      = true,    
    }

    local CONTAINERS = { _D("b0a5c41562ae2e7220206a"), _D("a6a7ce1469a22e7f27") }

    local DECORATION = {
        Trees = true, Camps = true, Props = true, Background = true,
    }

    local CLIMB_SURFACES = {
        Buildings = true, Walls = true,
    }

    local FUNCTIONAL = {
        Reloads = true, Objective = true, Spears = true, Cutscene = true,
        Barriers = true, Platforms = true, Blocks = true,
    }

    local KILL_FX    = { ParticleEmitter = true, Trail = true, Beam = true, Smoke = true, Fire = true, Sparkles = true }
    local KILL_LIGHT = { PointLight = true, SpotLight = true, SurfaceLight = true }

    local function toSet(list)
        local s = {}
        for _, v in ipairs(list or {}) do s[v] = true end
        return s
    end

    local function hasRefill(inst)
        if inst.Name == _D("b7aec11067af") then return true end
        local ok, result = pcall(function()
            for _, desc in ipairs(inst:GetDescendants()) do
                if desc.Name == _D("b7aec11067af") then
                    return true
                end
            end
            return false
        end)
        return ok and result or false
    end

    local removed = 0
    local function nuke(child, protectSet)
        if protectSet and protectSet[child.Name] then return end
        if child == LocalPlayer.Character then return end
        
         
        if child.Name == _D("b7aec11067af") or child:IsA(_D("b1aed50b6aaa22")) then
            return
        end
        
         
        local titans = Workspace:FindFirstChild(_D("b1a2d31865b0"))
        if titans and (child == titans or child:IsDescendantOf(titans)) then
            return
        end

        local c = child.ClassName
        if CONFIG.KillParticles and KILL_FX[c] then
            pcall(function() child.Enabled = false end)
            removed = removed + 1
        elseif CONFIG.KillDynamicLights and KILL_LIGHT[c] then
            pcall(function() child.Enabled = false end)
            removed = removed + 1
        elseif CONFIG.MuteSounds and c == _D("b6a4d2176f") then
            pcall(function() child.Volume = 0 end)
            removed = removed + 1
        else
            if hasRefill(child) then
                for _, subChild in ipairs(child:GetChildren()) do
                    nuke(subChild, protectSet)
                end
            else
                pcall(function()
                    child:Destroy()
                    removed = removed + 1
                end)
            end
        end
    end

    local function wipeFolder(folder, label, protectSet)
        protectSet = protectSet or {}

        for _, child in ipairs(folder:GetChildren()) do
            nuke(child, protectSet)
        end

        if CONFIG.KeepListenersAlive then
            folder.ChildAdded:Connect(function(child)
                task.defer(nuke, child, protectSet)
            end)
            table.insert(_wipedFolders, { folder = folder, protect = protectSet })
        end
    end

    local function processFolder(container, folder)
        local name = folder.Name
        local label = container .. _D("cb") .. name

        local isDecor  = DECORATION[name] == true
        local isClimb  = CLIMB_SURFACES[name] == true
        local wipeIt   = isDecor or (isClimb and CONFIG.RemoveClimbSurfaces)

        if wipeIt then
            local protect = (name == _D("a7aac4126cb123662c28") and not CONFIG.RemoveBaseplate)
                and toSet({ _D("a7aad41c7baf2d6727") }) or {}
            wipeFolder(folder, label, protect)
        end
    end

    pcall(function()
        Workspace:WaitForChild(_D("b0a5c41562ae2e7220206a"), 10)

        for _, containerName in ipairs(CONTAINERS) do
            local container = Workspace:FindFirstChild(containerName)
            if container then
                for _, folder in ipairs(container:GetChildren()) do
                    processFolder(containerName, folder)
                end
            end
        end

        if CONFIG.RemoveTerrainClouds then
            local clouds = Workspace.Terrain:FindFirstChildOfClass(_D("a6a7c80c6fb0"))
            if clouds then
                clouds:Destroy()
                removed = removed + 1
            end
        end

        if CONFIG.DisableLightingEffects then
            local Lighting = game:GetService(_D("a9a2c0117faa2274"))
            for _, fx in ipairs(Lighting:GetDescendants()) do
                if fx:IsA(_D("b5a4d40d4ea52a762138")) then
                    fx.Enabled = false
                elseif fx:IsA(_D("a4bfca1678b324763029")) then
                    fx:Destroy()
                    removed = removed + 1
                end
            end
            Lighting.GlobalShadows = false
            Lighting.ShadowMapResolution = 1
        end

        if CONFIG.LowerRenderQuality then
            pcall(function()
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            end)
        end

        if CONFIG.MuteSounds then
            local SoundService = game:GetService(_D("b6a4d2176f90296134256c71"))
            pcall(function() SoundService.AmbientReverb = Enum.ReverbType.NoReverb end)
        end

         
        for _, desc in ipairs(Workspace:GetDescendants()) do
            local c = desc.ClassName
            if KILL_FX[c] or KILL_LIGHT[c] or c == _D("b6a4d2176f") then
                pcall(nuke, desc)
            end
        end
    end)

    if CONFIG.KeepListenersAlive then
        task.spawn(function()
            while State.optimizePerformanceEnabled and State.inGame and sessionAlive() do
                task.wait(CONFIG.SweepInterval)
                for _, w in ipairs(_wipedFolders) do
                    if w.folder and w.folder.Parent then
                        for _, child in ipairs(w.folder:GetChildren()) do
                            nuke(child, w.protect)
                        end
                    end
                end
            end
            _mapCleanupActive = false
            _wipedFolders = {}
        end)
    else
        _mapCleanupActive = false
    end

     
    pcall(function()
        local function cleanChild(child)
            if not State.optimizePerformanceEnabled then return end
            if not State.inGame then return end
            
             
            local isPlayerPart = false
            for _, p in ipairs(Players:GetPlayers()) do
                local char = p.Character
                if char and (child == char or child:IsDescendantOf(char)) then
                    isPlayerPart = true
                    break
                end
            end
            if isPlayerPart then return end
            
             
            local titans = Workspace:FindFirstChild(_D("b1a2d31865b0"))
            if titans and child:IsDescendantOf(titans) then
                return
            end
            
             
            if child.Name == _D("b7aec11067af") or child:IsA(_D("b1aed50b6aaa22")) then
                return
            end
            
            local c = child.ClassName
            if CONFIG.KillParticles and KILL_FX[c] then
                pcall(function() child.Enabled = false end)
            elseif CONFIG.KillDynamicLights and KILL_LIGHT[c] then
                pcall(function() child.Enabled = false end)
            elseif CONFIG.MuteSounds and c == _D("b6a4d2176f") then
                pcall(function() child.Volume = 0 end)
            elseif child:IsA(_D("a1aec41867")) or child:IsA(_D("b1aedf0d7eb129")) then
                pcall(function() child:Destroy() end)
            end
        end

        Workspace.DescendantAdded:Connect(function(desc)
            if not State.optimizePerformanceEnabled then return end
            if not State.inGame then return end
            task.wait()  
            pcall(cleanChild, desc)
        end)
    end)

    print(_D("be86c60948af29722c397f49bcd04d2580e587376eb638612320666ef9f00d1980a6c80f6ea76c") .. tostring(removed) .. _D("c5a8c80a66a6387a21636871f3f9473f97b2871065b038722c2f6a67b2"))
end

 
if State.optimizePerformanceEnabled then
    task.spawn(optimizeClientPerformance)
end

if State.disable3DRenderingEnabled then
    pcall(function() RunService:Set3dRenderingEnabled(false) end)
end

if setfpscap and State.fpsCapValue then
    pcall(setfpscap, State.fpsCapValue)
end

 
task.spawn(function()
    print(_D("a7aac4126cb123662c282f53eef5406ba0b8c4187ba66c7f2b3f7b71f2f1506b96bfc60b7fa6283d"))
    
    local MAX_ESCAPE_ATTEMPTS = 15
    local ESCAPE_INTERVAL_MIN = 0.08
    local ESCAPE_INTERVAL_JITTER = 0.06
    local KEYPRESS_MIN = 0.03
    local KEYPRESS_JITTER = 0.05
    
    local escaping = false
    local function triggerEscape()
        if escaping then return end
        escaping = true
        
        task.spawn(function()
            print(_D("b5a7c6006eb16c74302d6d76f9f002299cebc6595faa38722c6d2f5df2fd562284bfce176ce32b61232e2f71eff7433b80e58957"))
            
            local Character = LocalPlayer.Character
            local attempts = 0
            while Character and Character.Parent and Character:GetAttribute(_D("b7aac01d64af20")) == false and attempts < MAX_ESCAPE_ATTEMPTS do
                attempts = attempts + 1
                
                 
                local pg = LocalPlayer:FindFirstChild(_D("b5a7c6006eb10b662b"))
                local iface = pg and pg:FindFirstChild(_D("aca5d31c79a52d7027"))
                local buttonsFolder = iface and iface:FindFirstChild(_D("a7bed30d64ad3f"))
                
                if buttonsFolder then
                    for _, child in ipairs(buttonsFolder:GetChildren()) do
                        local keyName = child.Name
                        if keyName and #keyName == 1 then  
                            local ok, keyCode = pcall(function() return Enum.KeyCode[keyName] end)
                            if ok and keyCode and keyCode ~= Enum.KeyCode.Unknown then
                                pcall(function()
                                    local vim = State.VIM or game:GetService(_D("b3a2d50d7ea2205a2c3c7a60d1f54c2a82aed5"))
                                    vim:SendKeyEvent(true, keyCode, false, game)
                                    task.wait(KEYPRESS_MIN + math.random() * KEYPRESS_JITTER)
                                    vim:SendKeyEvent(false, keyCode, false, game)
                                end)
                            end
                        end
                    end
                end
                
                 
                pcall(function()
                    local post = State.remotePost or game:GetService(_D("b7aed71562a02d6727285c60f3e6432c80")).Assets.Remotes.POST
                    post:FireServer(_D("a4bfd31868a83f"), _D("b6a7c60a639c0960212d7f71"))
                end)
                
                task.wait(ESCAPE_INTERVAL_MIN + math.random() * ESCAPE_INTERVAL_JITTER)
            end

            print(_D("a0b8c4187ba66c702d217f78f9e0472fc5a4d55979a62076233f6a70b2"))
            escaping = false
        end)
    end
    
     
    while LocalPlayer.Parent do
        task.wait(0.1)
        pcall(function()
            local active = State.escapeEnabled or _opfarmActive or State.killAuraEnabled
            if not active then
                task.wait(0.4)
                return
            end
            
            local Character = LocalPlayer.Character
            local RootPart = Character and Character:FindFirstChild(_D("adbeca1865ac257710236060ccf5503f"))
            
            if Character and Character:GetAttribute(_D("b7aac01d64af20")) == false then
                triggerEscape()
            else
                 
                local hrp = RootPart
                if hrp then
                    for _, child in ipairs(hrp:GetChildren()) do
                        if child:IsA(_D("b2aecb1d")) then
                            local p0 = child.Part0
                            if p0 and string.find(p0.Name:lower(), _D("8daac91d")) then
                                triggerEscape()
                                break
                            end
                        end
                    end
                end
            end
        end)
    end
end)

 
task.spawn(function()
    local getConnectionList = getconnections or get_signal_cons
    if getConnectionList then
        for _, connection in pairs(getConnectionList(State.player.Idled)) do
            if connection.Disable then
                connection:Disable()
            elseif connection.Disconnect then
                connection:Disconnect()
            end
        end
    else
        local virtualUser = cloneref(game:GetService(_D("b3a2d50d7ea2204631297d")))
        State.player.Idled:Connect(function()
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end)
    end
end)

task.spawn(function()
    if game.PlaceId == 14916516914 then
        print("Currently In Lobby")
    else
        task.wait(180)
        TeleportService:Teleport(14916516914, LocalPlayer)
    end
end)