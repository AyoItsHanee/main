if not game:IsLoaded() then
	game.Loaded:Wait()
end

local games = {
	[12229756] = 'https://api.luarmor.net/files/v3/loaders/2693a688362ddb52f452a288ea86ba89.lua', -- ALS
	[5292947] =  'https://api.luarmor.net/files/v3/loaders/5626ab81ffceae865d22d54cb5042edf.lua', -- ASTD
	[15022320] = 'https://api.luarmor.net/files/v3/loaders/5626ab81ffceae865d22d54cb5042edf.lua', -- TTD
	[5102326] = 'https://api.luarmor.net/files/v3/loaders/1b4c42f5913d7a5b7be56ee7766eb814.lua', -- ACD
	[34121350] = 'https://api.luarmor.net/files/v3/loaders/1b4c42f5913d7a5b7be56ee7766eb814.lua' -- AD
	[5956785391] = 'https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua' -- AD
	[13883059853] = 'https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua' -- AD
}

	getgenv().buanghub_autoload = true;
	task.wait(3)
	loadstring(game:HttpGet('https://raw.githubusercontent.com/AyoItsHanee/main/main/wfps.lua'))()

