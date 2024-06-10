function writefileExploit()
	if writefile then
		return true
	end
end
local jsonAttempts = 0
function saves()
	if writefileExploit() and jsonAttempts < 50 then
		if pcall(function() readfile("IY_FE.iy") end) then
			if readfile("IY_FE.iy") ~= nil then
				local success, response = pcall(function()
					local json = HttpService:JSONDecode(readfile("IY_FE.iy"))
					if json.prefix ~= nil then prefix = json.prefix else prefix = ';' end
					if json.StayOpen ~= nil then StayOpen = json.StayOpen else StayOpen = false end
					if json.keepIY ~= nil then KeepInfYield = json.keepIY else KeepInfYield = true end
					if json.espTransparency ~= nil then espTransparency = json.espTransparency else espTransparency = 0.3 end
					if json.logsEnabled ~= nil then logsEnabled = json.logsEnabled else logsEnabled = false end
					if json.jLogsEnabled ~= nil then jLogsEnabled = json.jLogsEnabled else jLogsEnabled = false end
					if json.aliases ~= nil then aliases = json.aliases else aliases = {} end
					if json.binds ~= nil then binds = (json.binds or {}) else binds = {} end
					if json.spawnCmds ~= nil then spawnCmds = json.spawnCmds end
					if json.WayPoints ~= nil then AllWaypoints = json.WayPoints else WayPoints = {} AllWaypoints = {} end
					if json.PluginsTable ~= nil then PluginsTable = json.PluginsTable else PluginsTable = {} end
					if json.currentShade1 ~= nil then currentShade1 = Color3.new(json.currentShade1[1],json.currentShade1[2],json.currentShade1[3]) end
					if json.currentShade2 ~= nil then currentShade2 = Color3.new(json.currentShade2[1],json.currentShade2[2],json.currentShade2[3]) end
					if json.currentShade3 ~= nil then currentShade3 = Color3.new(json.currentShade3[1],json.currentShade3[2],json.currentShade3[3]) end
					if json.currentText1 ~= nil then currentText1 = Color3.new(json.currentText1[1],json.currentText1[2],json.currentText1[3]) end
					if json.currentText2 ~= nil then currentText2 = Color3.new(json.currentText2[1],json.currentText2[2],json.currentText2[3]) end
					if json.currentScroll ~= nil then currentScroll = Color3.new(json.currentScroll[1],json.currentScroll[2],json.currentScroll[3]) end
					if json.eventBinds ~= nil then loadedEventData = json.eventBinds end
				end)
				if not success then
					jsonAttempts = jsonAttempts + 1
					warn("Save Json Error:", response)
					warn("Overwriting Save File")
					writefileCooldown("IY_FE.iy", defaults)
					wait()
					saves()
				end
			else
				writefileCooldown("IY_FE.iy", defaults)
				wait()
				saves()
			end
		else
			writefileCooldown("IY_FE.iy", defaults)
			wait()
			if pcall(function() readfile("IY_FE.iy") end) then
				saves()
			else
				nosaves = true
				useFactorySettings()

				local FileError = Instance.new("Frame")
				local background = Instance.new("Frame")
				local Directions = Instance.new("TextLabel")
				local shadow = Instance.new("Frame")
				local PopupText = Instance.new("TextLabel")
				local Exit = Instance.new("TextButton")
				local ExitImage = Instance.new("ImageLabel")

				FileError.Name = randomString()
				FileError.Parent = PARENT
				FileError.Active = true
				FileError.BackgroundTransparency = 1
				FileError.Position = UDim2.new(0.5, -180, 0, 290)
				FileError.Size = UDim2.new(0, 360, 0, 20)
				FileError.ZIndex = 10

				background.Name = "background"
				background.Parent = FileError
				background.Active = true
				background.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
				background.BorderSizePixel = 0
				background.Position = UDim2.new(0, 0, 0, 20)
				background.Size = UDim2.new(0, 360, 0, 205)
				background.ZIndex = 10

				Directions.Name = "Directions"
				Directions.Parent = background
				Directions.BackgroundTransparency = 1
				Directions.BorderSizePixel = 0
				Directions.Position = UDim2.new(0, 10, 0, 10)
				Directions.Size = UDim2.new(0, 340, 0, 185)
				Directions.Font = Enum.Font.SourceSans
				Directions.TextSize = 14
				Directions.Text = "There was a problem writing a save file to your PC.\n\nPlease contact the developer/support team for your exploit and tell them writefile is not working.\n\nYour settings, keybinds, waypoints, and aliases will not save if you continue.\n\nThings to try:\n> Make sure a 'workspace' folder is located in the same folder as your exploit\n> If your exploit is inside of a zip/rar file, extract it.\n> Rejoin the game and try again or restart your PC and try again."
				Directions.TextColor3 = Color3.new(1, 1, 1)
				Directions.TextWrapped = true
				Directions.TextXAlignment = Enum.TextXAlignment.Left
				Directions.TextYAlignment = Enum.TextYAlignment.Top
				Directions.ZIndex = 10

				shadow.Name = "shadow"
				shadow.Parent = FileError
				shadow.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
				shadow.BorderSizePixel = 0
				shadow.Size = UDim2.new(0, 360, 0, 20)
				shadow.ZIndex = 10

				PopupText.Name = "PopupText"
				PopupText.Parent = shadow
				PopupText.BackgroundTransparency = 1
				PopupText.Size = UDim2.new(1, 0, 0.95, 0)
				PopupText.ZIndex = 10
				PopupText.Font = Enum.Font.SourceSans
				PopupText.TextSize = 14
				PopupText.Text = "File Error"
				PopupText.TextColor3 = Color3.new(1, 1, 1)
				PopupText.TextWrapped = true

				Exit.Name = "Exit"
				Exit.Parent = shadow
				Exit.BackgroundTransparency = 1
				Exit.Position = UDim2.new(1, -20, 0, 0)
				Exit.Size = UDim2.new(0, 20, 0, 20)
				Exit.Text = ""
				Exit.ZIndex = 10

				ExitImage.Parent = Exit
				ExitImage.BackgroundColor3 = Color3.new(1, 1, 1)
				ExitImage.BackgroundTransparency = 1
				ExitImage.Position = UDim2.new(0, 5, 0, 5)
				ExitImage.Size = UDim2.new(0, 10, 0, 10)
				ExitImage.Image = "rbxassetid://5054663650"
				ExitImage.ZIndex = 10

				Exit.MouseButton1Click:Connect(function()
					FileError:Destroy()
				end)
			end
		end
	else
        if jsonAttempts >= 50 then
            nosaves = true
            useFactorySettings()

            local FileError = Instance.new("Frame")
            local background = Instance.new("Frame")
            local Directions = Instance.new("TextLabel")
            local shadow = Instance.new("Frame")
            local PopupText = Instance.new("TextLabel")
            local Exit = Instance.new("TextButton")
            local ExitImage = Instance.new("ImageLabel")

            FileError.Name = randomString()
            FileError.Parent = PARENT
            FileError.Active = true
            FileError.BackgroundTransparency = 1
            FileError.Position = UDim2.new(0.5, -180, 0, 290)
            FileError.Size = UDim2.new(0, 360, 0, 20)
            FileError.ZIndex = 10

            background.Name = "background"
            background.Parent = FileError
            background.Active = true
            background.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
            background.BorderSizePixel = 0
            background.Position = UDim2.new(0, 0, 0, 20)
            background.Size = UDim2.new(0, 360, 0, 205)
            background.ZIndex = 10

            Directions.Name = "Directions"
            Directions.Parent = background
            Directions.BackgroundTransparency = 1
            Directions.BorderSizePixel = 0
            Directions.Position = UDim2.new(0, 10, 0, 10)
            Directions.Size = UDim2.new(0, 340, 0, 185)
            Directions.Font = Enum.Font.SourceSans
            Directions.TextSize = 14
            Directions.Text = "Sorry, but we have attempted to parse your data, but it is unreadable!\n\nInfinite Yield is now using factory settings until your executor fixes its file system.\n\nYour data has not been deleted."
            Directions.TextColor3 = Color3.new(1, 1, 1)
            Directions.TextWrapped = true
            Directions.TextXAlignment = Enum.TextXAlignment.Left
            Directions.TextYAlignment = Enum.TextYAlignment.Top
            Directions.ZIndex = 10

            shadow.Name = "shadow"
            shadow.Parent = FileError
            shadow.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
            shadow.BorderSizePixel = 0
            shadow.Size = UDim2.new(0, 360, 0, 20)
            shadow.ZIndex = 10

            PopupText.Name = "PopupText"
            PopupText.Parent = shadow
            PopupText.BackgroundTransparency = 1
            PopupText.Size = UDim2.new(1, 0, 0.95, 0)
            PopupText.ZIndex = 10
            PopupText.Font = Enum.Font.SourceSans
            PopupText.TextSize = 14
            PopupText.Text = "File Error"
            PopupText.TextColor3 = Color3.new(1, 1, 1)
            PopupText.TextWrapped = true

            Exit.Name = "Exit"
            Exit.Parent = shadow
            Exit.BackgroundTransparency = 1
            Exit.Position = UDim2.new(1, -20, 0, 0)
            Exit.Size = UDim2.new(0, 20, 0, 20)
            Exit.Text = ""
            Exit.ZIndex = 10

            ExitImage.Parent = Exit
            ExitImage.BackgroundColor3 = Color3.new(1, 1, 1)
            ExitImage.BackgroundTransparency = 1
            ExitImage.Position = UDim2.new(0, 5, 0, 5)
            ExitImage.Size = UDim2.new(0, 10, 0, 10)
            ExitImage.Image = "rbxassetid://5054663650"
            ExitImage.ZIndex = 10

            Exit.MouseButton1Click:Connect(function()
                FileError:Destroy()
            end)
        else
            useFactorySettings()
        end
	end
end

saves()
