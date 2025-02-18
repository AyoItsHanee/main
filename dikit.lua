repeat wait() until game:IsLoaded()
print("Roblox loaded")

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
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local vu = game:GetService("VirtualInputManager")

    -- 2. Wait for "MenuFrame" to become visible and keep clicking until it disappears
    local menuFramePath = player:WaitForChild("PlayerGui")
        :WaitForChild("Start")
        :WaitForChild("MenuFrame")
    
    while not menuFramePath.Visible do
        task.wait(0.1)
    end
    
    print("MenuFrame is visible, clicking until it disappears...")
    
    while menuFramePath.Visible do
        vu:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.1)
        vu:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        task.wait(0.5) -- Short delay before checking again
    end
    
    print("MenuFrame is no longer visible, proceeding...")
loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/refs/heads/main/FrostByte/Initiate.lua"))()
