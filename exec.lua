repeat wait() until game:IsLoaded()
local cloneref = cloneref or function(o) return o end
Players = cloneref(game:GetService("Players"))
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local TeleportCheck = false
Players.LocalPlayer.OnTeleport:Connect(function(State)
	if not TeleportCheck and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()")
	end
end)
loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()
