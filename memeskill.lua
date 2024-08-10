local spawn, wait = task.spawn, task.wait
local function cdz()
    local ass = true
    wait(7)
    local ass = false
end
local function cdx()
    local assx = true
    wait(10)
    local assx = false
end

local function pressz()
    if not ass then
	local VirtualInputManager = game:GetService('VirtualInputManager')

	VirtualInputManager:SendKeyEvent(true, "Z", false, game)
	wait(3) -- Simulate key press duration
	VirtualInputManager:SendKeyEvent(false, "Z", false, game)
    wait()
    spawn(cdz)
    end
end
local function pressx()
    if not assx then
	local VirtualInputManager = game:GetService('VirtualInputManager')

	VirtualInputManager:SendKeyEvent(true, "X", false, game)
	wait(0.1) -- Simulate key press duration
	VirtualInputManager:SendKeyEvent(false, "X", false, game)
    wait()
    spawn(cdx)
    end
end
while true do
    spawn(pressz)
    spawn(pressx)
    wait()
end