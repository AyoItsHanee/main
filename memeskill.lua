local spawn, wait = task.spawn, task.wait
local function pressz()
	local VirtualInputManager = game:GetService('VirtualInputManager')

	VirtualInputManager:SendKeyEvent(true, "Z", false, game)
	wait(3) -- Simulate key press duration
	VirtualInputManager:SendKeyEvent(false, "Z", false, game)
end
local function pressx()
	local VirtualInputManager = game:GetService('VirtualInputManager')

	VirtualInputManager:SendKeyEvent(true, "X", false, game)
	wait(0.5) -- Simulate key press duration
	VirtualInputManager:SendKeyEvent(false, "X", false, game)
end
while true do
    spawn(pressz)
    wait()
    spawn(pressx)
    wait()
end