repeat wait() until game:IsLoaded()
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()
local TeleportCheck = false
Players.LocalPlayer.OnTeleport:Connect(function(State)
	if not TeleportCheck and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()")
	end
end)
