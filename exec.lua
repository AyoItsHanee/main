repeat wait() until game:IsLoaded()
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()")
loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()
