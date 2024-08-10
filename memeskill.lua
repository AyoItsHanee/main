local spawn, wait = task.spawn, task.wait
local function cdz()
    local ass = true
    wait(8)
    local ass = false
end
local function cdx()
    local assx = true
    wait(10.5)
    local assx = false
end

local function pressz()
    if not ass then
	local VirtualInputManager = game:GetService('VirtualInputManager')

	VirtualInputManager:SendKeyEvent(true, "Z", false, game)
	wait(3) -- Simulate key press duration
	VirtualInputManager:SendKeyEvent(false, "Z", false, game)
    end
end
local function pressx()
    if not assx then
	local VirtualInputManager = game:GetService('VirtualInputManager')

	VirtualInputManager:SendKeyEvent(true, "X", false, game)
	wait(0.1) -- Simulate key press duration
	VirtualInputManager:SendKeyEvent(false, "X", false, game)
    end
end
while true do
    spawn(pressz)
    wait(3.5)
    spawn(pressx)
    wait(1)
end