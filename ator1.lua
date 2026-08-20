-- this was deobfuscated by Luaxom at https://discord.gg/Sps39CydcZ
local Env = getfenv();
local v120 = {};
local v121 = {...};
local v54 = getgenv().ZeldHub v50 ;
local v122 = game;
local v123 = v122.GetService;
local v124 = cloneref(v123(v122, "Players"));
local v125 = v124.LocalPlayer;
task.wait();
local v126 = v124.LocalPlayer;
if v126 then
local v65 = v124.LocalPlayer;
local v126 = pcall;
local v26 = {
        v126(function(...)
local v126 = v65;
            return v126.GetMouse(v126); 
        end)
    };
local v123 = v126(function(...)
local v126 = v65;
        return v126.GetMouse(v126); 
    end);
    if v123 then
local v26 = v26[2];
    end;
local v126 = v126;
local v26 = v123 v50 nil;
local v17 = game;
    cloneref(v17.GetService(v17, "HttpService"));
local v28 = v65;
local v17 = v28.WaitForChild(v28, "PlayerGui");
    v17.WaitForChild(v17, "Interface");
local v28 = game;
local v76 = v28.GetService(v28, "RunService");
local v28 = game;
    v28.GetService(v28, "VirtualInputManager");
local v43 = v65;
local v45 = v43.Character;
local v129 = v126;
local v28 = v45;
    if v45 then
local v126 = v126;
        v45.WaitForChild(v45, "HumanoidRootPart");
local v28 = game;
local v87 = v28.GetService(v28, "ReplicatedStorage");
local v28 = v87;
local v43 = v28.WaitForChild(v28, "Assets");
local v28 = v43.WaitForChild(v43, "Remotes");
local v98 = v28.WaitForChild(v28, "GET");
local v28 = game;
local v43 = v28.GetService(v28, "TeleportService");
local v39 = v54.Main.Farm;
local v9 = cloneref(v123(v124, v52)).LocalPlayer;
local v124 = v54.Main.FarmDelay;
local v40 = v54.Main.FloatHeight;
local v28 = game;
        v28.GetService(v28, "Players");
local v28 = game;
local v109 = v28.GetService(v28, "TweenService");
local v28 = game;
local v112 = v28.GetService(v28, "CoreGui");
local v25 = v126;
local v15 = v65.Character;
local v28 = v15;
        if v15 then
local v126 = v126;
local v113 = v15;
local v28 = v113;
local v114 = v28.WaitForChild(v28, "HumanoidRootPart");
local v28 = v65;
local v55 = v28.WaitForChild(v28, "PlayerGui");
local v15 = v54.Main.GlidingSpeed;
local v56 = true;
local v29 = v54.Main.MovementMode;
local v7 = v54.Main.Notifications;
local v57 = {};
local v58 = 0;
local v121 = v54.General.AutoRefill;
local v59 = false;
local v60 = false;
            task.spawn(function(...)
local v126 = pcall;
local v124 = {
                    v126(function(...)
local v126 = v120[v47[1]];
local v28 = v126.WaitForChild(v126, "Assets", 10);
local v126 = v28.WaitForChild(v28, "Remotes", 10);
                        return v126.WaitForChild(v126, "POST", 10); 
                    end)
                };
local v118 = v126(function(...)
local v126 = v120[v47[1]];
local v28 = v126.WaitForChild(v126, "Assets", 10);
local v126 = v28.WaitForChild(v28, "Remotes", 10);
                    return v126.WaitForChild(v126, "POST", 10); 
                end);
                if v118 then
local v126 = v124[2];
local v61 = v126;
                end;
                return; 
            end);
local v62 = {};
local showKillNotification = function(arg1, ...)
                if not v54.Main.Notifications then
                    return;
                end;
local v63 = Instance.new("ScreenGui");
                v63.Name = "TitanNotif_" .. tick();
                v63.ResetOnSpawn = false;
                v63.IgnoreGuiInset = true;
                v63.Parent = v112;
local v64 = Instance.new("Frame");
                v64.Size = UDim2.new(0, 190, 0, 75);
                v64.Position = UDim2.new(1, 20, 0, 10 + #v62 * 80);
                v64.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
                v64.BorderSizePixel = 2;
                v64.BorderColor3 = Color3.fromRGB(184, 164, 101);
                v64.Parent = v63;
local v35 = Instance.new("TextLabel", v64);
                v35.Size = UDim2.new(.65, 0, 1, 0);
                v35.Position = UDim2.new(0, 5, 0, 0);
                v35.BackgroundTransparency = 1;
                v35.Text = "Succesfully\nHit:";
                v35.TextColor3 = Color3.fromRGB(184, 164, 101);
                v35.Font = Enum.Font.Fantasy;
                v35.TextScaled = true;
                v35.TextXAlignment = Enum.TextXAlignment.Left;
                v35.TextYAlignment = Enum.TextYAlignment.Center;
local v52 = Instance.new("TextLabel", v64);
                v52.Size = UDim2.new(0, 60, 0.5, 0);
                v52.Position = UDim2.new(1, -65, 0, 0);
                v52.BackgroundTransparency = 1;
                v52.Text = tostring(arg1);
                v52.TextColor3 = Color3.fromRGB(255, 255, 255);
                v52.Font = Enum.Font.Fantasy;
                v35.TextScaled = true;
                v52.TextXAlignment = Enum.TextXAlignment.Right;
                v52.TextYAlignment = Enum.TextYAlignment.Bottom;
local v123 = Instance.new("TextLabel", v64);
                v123.Size = UDim2.new(.6, 0, 0.5, 0);
                v123.Position = UDim2.new(1, -115, 0.5, 0);
                v123.BackgroundTransparency = 1;
                v123.Text = "Titans";
                v123.TextColor3 = Color3.fromRGB(255, 255, 255);
                v123.Font = Enum.Font.Fantasy;
                v123.TextScaled = true;
                v123.TextXAlignment = Enum.TextXAlignment.Right;
                v123.TextYAlignment = Enum.TextYAlignment.Top;
                table.insert(v62, v63);
local v126 = v109;
local v28 = v126.Create(v126, v64, TweenInfo.new(.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Position"] = UDim2.new(1, -210, 0, 10 + (#v62 - 1) * 80)
                });
                v28.Play(v28);
                task.delay(5, function(...)
local v126 = v109;
local v35 = "Position";
local v28 = v126.Create(v126, v64, TweenInfo.new(.35, Enum.EasingStyle.Sine, Enum.EasingDirection.v10), {
                        [v35] = UDim2.new(1, 20, v64.Position.v123.Scale, v64.Position.v123.Offset),
                        ["BackgroundTransparency"] = 1
                    });
                    v28.Play(v28);
                    task.wait(.4);
local v126 = v63;
                    v126.Destroy(v126);
local v124 = v62;
local v121 = v35[2];
local v124 = v35[1];
                    for v118, v52 v44 ipairs(v124) do
local v35 = v118;
                        if v52 == v63 then
                            table.remove(v63, v118);
                        else
                        end; 
                    end;
local v124 = v52[3];
local v118 = v52[2];
                    for v124, v52 v44 ipairs(v62) do
local v123 = v52.FindFirstChildWhichIsA(v52, "Frame");
                        if v123 then
local v126 = v62;
local v26 = v126.Create(v126, v123, TweenInfo.new(.3), {
                                ["Position"] = UDim2.new(1, -210, 0, 10 + (v124 - 1) * 80)
                            });
                            v26.Play(v26);
                        end; 
                    end;
                    return; 
                end);
                return; 
            end;
            local function v66(...)
local v126 = workspace;
local v121 = v126.FindFirstChild(v126, "Titans");
                if not v121 then
                    return nil;
                end;
local v118 = {
                    "Attack_Titan",
                    "Female_Titan",
                    "Armored_Titan"
                };
local v28 = "ipairs";
local v124 = v52[2];
local v35 = v52[3];
                for v35, v26 v44 Env[v28](v118) do
local v22 = v121.FindFirstChild(v121, v26);
local v123 = v35;
                    if v22 then
                        v121.FindFirstChild(v121, v26);
local v17 = v22.FindFirstChild(v22, "Humanoid") and v22.Humanoid.Health > 0;
                    end;
                    if v22 then
local v24 = v22.FindFirstChild(v22, "Hitboxes");
local v24 = v24 and v24.FindFirstChild(v24, "Hit");
                        if v24 then
local v24 = v24.FindFirstChild(v24, "Nape");
                        end;
                        if v24 then
local v14 = v24.IsA(v24, "BasePart");
                        end;
                        if v24 then
                            return v24;
                        else
                        end;
                    end; 
                end;
local v17 = v121.GetChildren;
local v124 = math.huge;
local v123 = v17[2];
local v52 = v17[1];
                for v26, v17 v44 ipairs(v17(v121)) do
local v22 = v26;
local v126 = true;
                    repeat
                    until table.find(v118, v17.Name);
local v24 = true;
                    if not v24 then
                        break;
                    else
                    end; 
                end;
                return nil; 
            end;
            local function v67(arg1_2, ...)
local v121 = arg1_2;
local v118 = v65.Character;
                if not v118 then
                    return 0, 0.25;
                end;
local v126 = not (v118.FindFirstChild(v118, "HumanoidRootPart") v50 math.random(20, 30) / 100);
                return 0, 0.25; 
            end;
            local function v68(...)
local v121 = v55;
local v121 = v121.FindFirstChild(v121, "Interface", true) and v121.FindFirstChild(v121, "Sets", true);
                if v121 then
local v28 = v121.IsA(v121, "TextLabel");
                end;
                if v121 then
local v35 = tonumber(v52.match(v52, "^(%d+)") v50 "0") == 0;
local v52 = v121.Text;
                    return tonumber(v52.match(v52, "^(%d+)") v50 "0") == 0;
                end;
                return false; 
            end;
            local function v69(...)
local v121 = v55;
local v121 = v121.FindFirstChild(v121, "Interface", true) and v121.FindFirstChild(v121, "Spears", true);
                if v121 then
local v28 = v121.IsA(v121, "TextLabel");
                end;
                if v121 then
local v35 = tonumber(v52.match(v52, "^(%d+)") v50 "0") == 0;
local v52 = v121.Text;
                    return tonumber(v52.match(v52, "^(%d+)") v50 "0") == 0;
                end;
                return false; 
            end;
local v11 = workspace;
local v126 = v126;
local v21 = v11.FindFirstChild(v11, "Unclimbable") and v11.FindFirstChild(v11, "Reloads");
            if v21 then
local v27 = v21.GetChildren;
local v36 = v27[2];
local v119 = v27[3];
                for v119, v27 v44 ipairs(v27(v21)) do
local v53 = v119;
                    if v27.FindFirstChild(v27, "Refill") then
local v70 = v27.Refill;
                    else
                    end; 
                end;
            end;
            task.spawn(function(...)
                while true do
                    task.wait(.1);
                    if v54.General.AutoRefill and v70 then
local v126 = v69;
local v121 = v68();
local v118 = v126();
                        if v121 then
local v28 = not v59 and v61;
local v126 = v69;
                        end;
                        if v121 then
local v126 = v61;
                            v126.FireServer(v126, "Attacks", "Reload", v70);
                        end;
                        if v118 then
local v52 = not v60;
                            if v52 then
local v124 = v61;
                            end;
local v126 = v126;
local v28 = v52;
                        end;
                        if v118 then
local v126 = v61;
                            v126.FireServer(v126, "Attacks", "Reload", v70);
                        end;
local v59 = v121;
local v60 = v118;
                    end; 
                end;
                return; 
            end);
            if v54.Main.Farm then
                task.spawn(function(...)
                    task.delay(v54.Main.FarmDelay, function(...)
local v126 = v120[v47[2]].Heartbeat;
                        v126.Connect(v126, function(...)
                            local v47 = {
                                v47[2],
                                v47[3],
                                v47[4],
                                v47[5],
                                v47[6],
                                v47[7],
                                v47[8],
                                v47[9],
                                v47[10]
                            };
local v35 = "Farm";
                            if not v120[v47[3]].Main[v35] v50 (not v120[v47[4]] v50 not v35.FindFirstChild(v35, "HumanoidRootPart")) then
                                return;
                            end;
local v71 = v120[v47[5]]();
                            if not v71 then
                                return;
                            end;
local v118 = v71.Position + Vector3.new(0, v120[v47[3]].Main.FloatHeight, 0);
                            if v120[v47[3]].Main.MovementMode == "Gliding" then
                                v120[v47[6]].AssemblyLinearVelocity = (v118 - v120[v47[6]].Position).Unit * v120[v47[3]].Main.GlidingSpeed;
                            else
                                v120[v47[6]].CFrame = CFrame.new(v118);
                            end;
                            if (v120[v47[6]].Position - v71.Position).Magnitude <= 1500 and v120[v47[7]] then
                                v120[v47[7]] = false;
                                coroutine.wrap(function(...)
local v121 = v71;
local v121 = tostring(v121.GetDebugId(v121));
local v126 = v120[v47[9]];
                                    if v126 then
local v126 = v120[v47[9]];
                                        v126.FireServer(v126, "Hitboxes", "Register", v71, v120[v47[7]](v71), v123[2]);
local v126 = v120[v47[9]];
                                        v126.FireServer(v126, "Attacks", "Slash", true);
                                    end;
                                    if not v120[v47[10]][v121] and (math.abs((v71.Position - (v71.Position + Vector3.new(0, v120[v47[3]].Main.FloatHeight, 0))).Magnitude - v120[v47[3]].Main.FloatHeight) <= 5 and v120[v47[3]].Main.Notifications) then
                                        v120[v47[10]][v121] = true;
                                        v120[v47[10]] = v120[v47[10]] + 1;
                                        showKillNotification(v120[v47[10]]);
                                    end;
                                    task.wait(0.25);
                                    v120[v47[7]] = true;
                                    return; 
                                end)();
                            end;
                            return; 
                        end);
                        return; 
                    end);
                    return; 
                end);
            end;
local v11 = game;
local v11 = game;
local v119 = v11.GetService(v11, "ReplicatedStorage");
local v11 = game;
local v49 = v126;
local v11 = v11.GetService(v11, "Players").LocalPlayer;
local v19 = v11.Character;
local v27 = v19;
            if v19 then
local v72 = v19;
local v27 = v72;
local v73 = v27.WaitForChild(v27, "HumanoidRootPart");
local v74 = v11.WaitForChild(v11, "PlayerGui");
local v75 = v119.Assets.Remotes.GET;
local v77 = v119.Assets.Remotes.POST;
local v78 = false;
local v19 = v54.ThunderSpears.v20;
local v23 = v54.ThunderSpears.KillMode;
                local function v80(...)
local v121 = v74;
local v124 = "Interface";
local v118 = v121.FindFirstChild(v121, v124);
local v28 = v118;
local v121 = v28 and v124.FindFirstChild(v124, "HUD");
                    if v121 then
local v28 = v121.IsA(v121, "TextLabel");
                    end;
                    if v121 then
local v126 = tonumber;
local v124 = tonumber;
local v35 = v121.Text;
local v118 = v126(v35.match(v35, "^(%d+)") v50 "0");
                        return tostring(v118), v118 > 0;
                    end;
                    return "0", false; 
                end;
                local function v81(arg1_3, ...)
local v121 = arg1_3;
local v118 = {
                        "Female_Titan",
                        "Attack_Titan",
                        "Armored_Titan"
                    };
local v124 = {};
local v123 = workspace.Titans;
local v35 = v123[2];
local v123 = v123[1];
                    for v52, v22 v44 ipairs(v123.GetChildren(v123)) do
local v26 = v52;
                        if table.find(v118, v22.Name) then
local v14 = v22.FindFirstChild(v22, "Hitboxes");
local v17 = v22.FindFirstChild(v22, "Humanoid");
                            if v14 then
local v14 = v22.Hitboxes;
local v24 = v14.FindFirstChild(v14, "Hit");
                            end;
                            if v14 then
local v14 = v14.FindFirstChild(v14, "Nape");
                            end;
                            if v17 then
local v129 = v17.Health > 0 and v24;
                                v22.FindFirstChild(v22, "Humanoid");
                            end;
                            if v17 then
                                for v43 = 1, arg1_3 do
local v129 = v43;
                                    table.insert({}, {
                                        ["part"] = v24,
                                        ["dist"] = (v73.Position - v24.Position).Magnitude
                                    }); 
                                end;
                            end;
                        end; 
                    end;
local v35 = #v124;
                    if v35 > 0 then
                        table.sort(v124, function(arg1_4, arg2_4, ...)
                            return arg1_4.dist < arg2_4.dist; 
                        end);
local v35 = {};
                        for v26 = 1, math.min(v121, #v124) do
                            table.insert(v35, ({})[v26].part); 
                        end;
                        return v35;
                    end;
local v26 = workspace.Titans;
local v22 = {
                        v26.GetChildren(v26)
                    };
local v123 = v26[3];
                    for v123, v22 v44 v26[1], ipairs(v117(v22)) do
local v26 = v123;
                        if not table.find(v118, v22.Name) then
local v17 = v22.FindFirstChild(v22, "Humanoid");
local v14 = v22.FindFirstChild(v22, "Hitboxes");
local v14 = v14 and v14.FindFirstChild(v14, "Hit");
                            if v14 then
local v14 = v14.FindFirstChild(v14, "Nape");
                            end;
                            if v17 then
                                v22.FindFirstChild(v22, "Humanoid");
local v129 = v17.Health > 0 and v14;
                            end;
                            if v17 then
                                table.insert({}, {
                                    ["part"] = v14,
                                    ["dist"] = (v120[v27].Position - v14.Position).Magnitude
                                });
                            end;
                        end; 
                    end;
                    table.sort(v124, function(arg1_5, arg2_5, ...)
                        return arg1_5.dist < arg2_5.dist; 
                    end);
local v35 = {};
                    for v26 = 1, math.min(v121, #v124) do
                        table.insert(v35, v124[v26].part); 
                    end;
                    return v35; 
                end;
                local function v82(arg1_6, ...)
local v118 = arg1_6.Position + Vector3.new(0, v54.Main.FloatHeight, 0);
local v126 = (v73.Position - v118).Magnitude > 150;
                    if v126 then
local v126 = v72;
                        v126.PivotTo(v126, CFrame.new(v118));
                    else
                        v73.CFrame = CFrame.new(v118);
                    end;
local v79 = v118;
local v78 = true;
                    return; 
                end;
local v18 = v11.GetService(v11, "RunService").Heartbeat;
                v18.Connect(v18, function(...)
                    if v78 and v79 then
                        v73.Velocity = Vector3.zero;
                        v73.CFrame = CFrame.new(v79);
                    end;
                    return; 
                end);
                local function v83(...)
local v121 = workspace;
local v28 = v121.FindFirstChild(v121, "Unclimbable") and v121.FindFirstChild(v121, "Reloads");
                    if v28 then
local v28 = "ipairs";
local v52 = v28.GetChildren;
local v35 = {
                            v52(v28)
                        };
local v124 = v52[3];
local v118 = v52[2];
                        for v124, v123 v44 Env[v28](v117(v28)) do
local v52 = v124;
                            if v123.FindFirstChild(v123, "Refill") then
                                return v123.Refill;
                            else
                            end; 
                        end;
                    end;
                    return nil; 
                end;
                local function v84(...)
local v121 = v74;
local v121 = v121.FindFirstChild(v121, "Interface", true) and v121.FindFirstChild(v121, "Sets", true);
                    if v121 then
local v28 = v121.IsA(v121, "TextLabel");
                    end;
                    if v121 then
local v118 = v121.Text;
                        if v118 then
local v28 = v118 ~= "";
                        end;
                        if v118 then
local v124 = tonumber(v118.match(v118, "(%d+)/%d+"));
                            if v124 then
                                return v124 == 0;
                            end;
                        end;
                    end;
                    return false; 
                end;
                local function v85(...)
local v121 = v74;
local v121 = v121.FindFirstChild(v121, "Interface", true) and v121.FindFirstChild(v121, "Spears", true);
                    if v121 then
local v28 = v121.IsA(v121, "TextLabel");
                    end;
                    if v121 then
local v118 = v121.Text;
                        if v118 then
local v28 = v118 ~= "";
                        end;
                        if v118 then
local v124 = tonumber(v118.match(v118, "(%d+)/%d+"));
                            if v124 then
                                return v124 == 0;
                            end;
                        end;
                    end;
                    return false; 
                end;
                task.spawn(function(...)
local v126 = v77;
                    task.wait();
                    if v77 then
                        while true do
local v121 = false;
local v126 = true;
                            repeat
                                task.wait(.3);
                            until v54.General.AutoRefill;
local v118 = v83();
local v126 = not v118;
                            if v126 then
local v121 = true;
                                if not v121 then
                                    break;
                                else
                                end;
                            end;
local v124 = v84();
local v35 = v85();
local v52 = v126;
                            if v124 then
local v28 = not v59;
                            end;
local v126 = v52;
                            if v124 then
local v28 = v77;
                                v28.FireServer(v28, "Attacks", "Reload", v118);
                                task.wait(.2);
                            end;
                            if v35 then
local v28 = not v60;
                            end;
local v126 = v126;
                            if v35 then
local v28 = v77;
                                v28.FireServer(v28, "Attacks", "Reload", v118);
                                task.wait(.2);
                            end;
local v59 = v124;
local v60 = v35;
local v121 = true;
                            if true then
                            end; 
                        end;
                        return;
                    end; 
                end);
                if v54.ThunderSpears.v20 then
                    task.spawn(function(...)
local v118 = "On";
                        while v54.ThunderSpears[v118] do
                            task.wait(1);
local v118 = workspace;
local v28 = v118.FindFirstChild(v118, "Debris") and v118.FindFirstChild(v118, "Roar");
                            if v28 then
local v28 = workspace.Debris;
local v126 = not v28.FindFirstChild(v28, "Roar");
                                task.wait(.1);
local v28 = workspace.Debris;
                                if not v28.FindFirstChild(v28, "Roar") then
local v124 = v80();
                                    if v124[2] then
                                        if v54.ThunderSpears.KillMode == "Risk" then
local v35 = math.random(10, 25);
                                        else
local v35 = math.random(3, 10);
                                        end;
local v123 = v81(nil);
                                        if #v123 > 0 then
                                            v82(v123[1]);
                                            if true then
                                                task.wait(v54.Main.FarmDelay);
local v121 = false;
                                            end;
local v26 = v75;
                                            v26.InvokeServer(v26, "Spears", "S_Fire", v28);
local v17 = 74[2];
local v22 = 74[1];
                                            for v24, v14 v44 ipairs(v123) do
local v26 = v24;
local v129 = v14;
                                                if v14 then
local v129 = v14.Position;
                                                end;
local v126 = v82;
                                                if v129 then
local v129 = v77;
                                                    v129.FireServer(v129, "Spears", "S_Explode", v14.Position, .50130305592039, 450.2049550192);
                                                end; 
                                            end;
                                        end;
                                    end;
                                    if not v79 then
local v79 = v73.Position + Vector3.new(0, v54.Main.FloatHeight, 0);
                                    end;
local v78 = true;
                                end;
                            end; 
                        end;
                        return; 
                    end);
                end;
local v32 = game;
                v32.GetService(v32, "HttpService");
local v32 = game;
local v46 = v32.GetService(v32, "ReplicatedStorage");
local v32 = game;
local v86 = v32.GetService(v32, "Players").LocalPlayer;
local v88 = v46.Assets.Remotes.POST;
local v89 = v46.Assets.Remotes.GET;
local v90 = v46.FindFirstChild(v46, "Missions");
                getgenv().selectedMap = v54.Mission.Map;
                getgenv().selectedDifficulty = v54.Mission.Difficulty;
                getgenv().selectedObjective = v54.Mission.Objective;
local v32 = v54.Mission.Modifiers;
                if v54.Mission.Mission then
                    task.spawn(function(...)
                        if not v90 then
                            warn("Missions folder not found!");
                            return;
                        end;
local v126 = v89;
                        v126.InvokeServer(v126, "Missions", "Open");
                        task.wait(1.5);
local v52 = v54.Mission;
local v35 = v52.Modifiers;
local v35 = v52[1];
local v124 = v52[3];
                        for v124, v123 v44 v35, pairs(v35) do
                            if v123 then
                                table.insert({}, v124);
                            end; 
                        end;
local v24 = v54.Mission;
local v126 = v88;
                        v126.FireServer(v126, "S_Missions", "Create", {
                            ["Name"] = v54.Mission.Map,
                            ["Difficulty"] = v54.Mission.Difficulty,
                            ["Type"] = "Missions",
                            ["Objective"] = v24.Objective
                        });
local v126 = 0 < 10;
                        while v126 do
local v24 = v90;
local v129 = v24.GetChildren;
local v14 = {
                                v129(v24)
                            };
local v17 = v24[3];
                            for v17, v14 v44 v24[1], pairs(v117(v14)) do
local v24 = v17;
local v129 = v14.FindFirstChild(v14, "Leader");
                                if v129 then
local v45 = v129.Value == v86.Name;
                                end;
                                if v129 then
local v123 = v14;
local v124 = true;
                                else
                                end; 
                            end;
                            if false then
                            else
                                task.wait(1);
local v52 = 0 + 1;
                            end; 
                        end;
local v22 = false;
                        if false then
                        end;
local v126 = v126;
                        if v22 then
local v14 = v129[3];
                            for v14, v129 v44 v129[1], ipairs({}) do
local v43 = v89;
local v22 = v14;
                                v43.InvokeServer(v43, "S_Missions", "Modify", v129);
                                task.wait(.1); 
                            end;
                            task.wait(1);
local v22 = v88;
                            v22.FireServer(v22, "S_Missions", "Start");
                        else
                            warn("Could not become mission leader or find mission.");
                        end;
                        v54.Mission.Mission = false;
                        return; 
                    end);
                end;
local v125 = game;
local v34 = v125.GetService(v125, "ReplicatedStorage");
local v125 = v34.WaitForChild(v34, "Assets");
local v38 = v125.WaitForChild(v125, "Remotes");
local v91 = v38.WaitForChild(v38, "GET");
local v125 = game;
local v92 = v125.GetService(v125, "Players").LocalPlayer;
local v30 = {
                    pcall(function(...)
local v126 = v92;
local v121 = v126.FindFirstChild(v126, "PlayerGui");
local v118 = v121 and v121.FindFirstChild(v121, "Interface");
local v124 = v118 and v118.FindFirstChild(v118, "HUD");
local v35 = v124 and v124.FindFirstChild(v124, "Main");
local v52 = v35 and v35.FindFirstChild(v35, "Top");
local v123 = v52 and v52.FindFirstChild(v52, "Blades");
local v26 = v123 and v123.FindFirstChild(v123, "Inner");
local v22 = v26 and v26.FindFirstChild(v26, "Bar");
                        if v22 then
local v28 = v22.FindFirstChild(v22, "Gradient");
                        end;
local v93 = v22;
                        return; 
                    end)
                };
local v16 = pcall(function(...)
local v126 = v92;
local v121 = v126.FindFirstChild(v126, "PlayerGui");
local v118 = v121 and v121.FindFirstChild(v121, "Interface");
local v124 = v118 and v118.FindFirstChild(v118, "HUD");
local v35 = v124 and v124.FindFirstChild(v124, "Main");
local v52 = v35 and v35.FindFirstChild(v35, "Top");
local v123 = v52 and v52.FindFirstChild(v52, "Blades");
local v26 = v123 and v123.FindFirstChild(v123, "Inner");
local v22 = v26 and v26.FindFirstChild(v26, "Bar");
                    if v22 then
local v28 = v22.FindFirstChild(v22, "Gradient");
                    end;
local v93 = v22;
                    return; 
                end);
local v8 = v30[2];
                if v54.General.AutoReloadBlades then
local v16 = task.spawn(function(...)
local v121 = "AutoReloadBlades";
                        while v54.General[v121] do
local v121 = false;
local v126 = true;
                            repeat
                            until not v93;
                            task.wait(1);
local v121 = true;
                            if not v121 then
                                break;
                            else
                            end; 
                        end;
                        return; 
                    end);
                end;
local v8 = game;
local v94 = v8.GetService(v8, "VirtualInputManager");
local v30 = game;
local v95 = v30.GetService(v30, "GuiService");
local v128 = game;
local v96 = v128.GetService(v128, "Players").LocalPlayer;
local v128 = v54.General.AutoRetry;
                local function v97(arg1_7, ...)
                    v95.SelectedObject = arg1_7;
                    return; 
                end;
                local function v99(arg1_8, ...)
                    v97(arg1_8);
local v126 = v94;
                    v126.SendKeyEvent(v126, true, Enum.KeyCode.Return, false, game);
local v126 = v94;
                    v126.SendKeyEvent(v126, false, Enum.KeyCode.Return, false, game);
                    task.wait(.01);
                    v97(nil);
                    return; 
                end;
                local function v100(...)
local v121 = v96;
local v121 = v121.FindFirstChild(v121, "PlayerGui") and v121.FindFirstChild(v121, "Interface");
local v118 = v121 and v121.FindFirstChild(v121, "Rewards");
local v124 = v118 and v118.FindFirstChild(v118, "Main");
local v35 = v124 and v124.FindFirstChild(v124, "Info");
local v52 = v35 and v35.FindFirstChild(v35, "Main");
local v123 = v52 and v52.FindFirstChild(v52, "Buttons");
local v26 = v123 and v123.FindFirstChild(v123, "Retry");
                    if v26 then
                        if v118 then
local v126 = v126;
local v22 = (v121 and v121.FindFirstChild(v121, "Rewards")).Visible and (v118 and v118.FindFirstChild(v118, "Main"));
                        end;
local v28 = v118;
local v126 = v126;
                    end;
                    if v26 then
                        return v26;
                    end;
                    return nil; 
                end;
                task.spawn(function(...)
                    while true do
                        if v54.General.AutoRetry then
local v121 = v100();
                            if v121 then
                                task.wait(1);
                                if v100() then
                                    v99(v28);
                                    task.wait(3.5);
                                end;
                            end;
                        end;
                        task.wait(0.5); 
                    end;
                    return; 
                end);
local v116 = game;
local v115 = v116.GetService(v116, "ReplicatedStorage");
local v116 = game.Players.LocalPlayer;
local v101 = v116.WaitForChild(v116, "PlayerGui");
local v48 = v115.WaitForChild(v115, "Assets");
local v122 = v48.WaitForChild(v48, "Remotes");
local v102 = v122.WaitForChild(v122, "POST");
                if v54.General.AutoEscape then
                    v12[2] = "task";
                    v12[1] = "task";
                    v12[1] = "spawn";
                    v12[1] = function(...)
local v126 = v54.General.AutoEscape;
                        while v126 do
local v126 = v101;
local v121 = v126.FindFirstChild(v126, "Interface");
local v118 = v121 and v121.FindFirstChild(v121, "Buttons");
                            if v118 then
local v124 = v118.GetChildren(v118);
                                if #v124 > 0 then
local v35 = v124[1];
local v28 = v103;
local v126 = v35 ~= v28;
                                    if v126 then
local v126 = v124[1];
local v103 = v126;
local v28 = v102;
                                        v28.FireServer(v28, table.unpack({
                                            "Attacks",
                                            "Slash_Escape"
                                        }));
                                    end;
                                else
                                end;
                            else
                            end;
                            task.wait(.1); 
                        end;
                        return; 
                    end;
local v127 = Env[v12[1]][v12[1]](v12[1]);
                    v12[1] = Env[v12[2]];
                    v12[2] = "spawn";
                    v12[2] = function(...)
                        while v54.General.AutoEscape do
local v126 = v101;
local v121 = v126.FindFirstChild(v126, "Interface");
local v118 = v121 and v121.FindFirstChild(v121, "Buttons");
                            if v118 then
local v123 = v118.GetChildren;
local v52 = {
                                    v123(v118)
                                };
local v52 = v123[1];
local v124 = v123[2];
                                for v35, v26 v44 pairs(v117(v52)) do
local v123 = v35;
                                    v26.Destroy(v26); 
                                end;
                            end;
                            task.wait(.1); 
                        end;
                        return; 
                    end;
                    v12[1] = v12[1][v12[2]](v12[2]);
local v41 = v12[1];
                else
                end;
                v12[4] = "ReplicatedStorage";
                v12[3] = "game";
                v12[5] = "Workspace";
                v12[2] = Env[v12[3]];
                v12[3] = "GetService";
                v12[3] = v12[2][v12[3]];
                v12[3] = v12[3](v12[2], v12[4]);
                v12[4] = "game";
                v12[2] = Env[v12[4]];
                v12[4] = "GetService";
                v12[4] = v12[2][v12[4]];
                v12[4] = v12[4](v12[2], v12[5]);
                v12[5] = "aristo_deletemap";
                v12[2] = "FindFirstChild";
                v12[2] = v12[3][v12[2]];
                v12[2] = v12[2](v12[3], v12[5]);
                v12[5] = 31;
                v120[v12[5]] = v12[2];
                v12[6] = v120[v12[5]];
                v12[2] = not v12[6];
                if v12[2] then
                    v12[7] = "Instance";
                    v12[6] = Env[v12[7]];
                    v12[7] = "new";
                    v12[2] = v12[6][v12[7]];
                    v12[7] = "Folder";
                    v12[6] = v12[2](v12[7]);
                    v120[v12[5]] = v12[6];
                    v12[8] = "aristo_deletemap";
                    v12[7] = "Name";
                    v12[2] = v120[v12[5]];
                    v12[2][v12[7]] = v12[8];
                    v12[8] = v12[3];
                    v12[7] = "Parent";
                    v12[2] = v120[v12[5]];
                    v12[2][v12[7]] = v12[8];
                end;
                v12[9] = "General";
                v12[8] = v54;
                v12[7] = v12[8][v12[9]];
                v12[8] = "DeleteMap";
                v12[2] = v12[7][v12[8]];
                if v12[2] then
                    v12[8] = "Climbable";
                    v12[7] = "FindFirstChild";
                    v12[7] = v12[4][v12[7]];
                    v12[7] = v12[7](v12[4], v12[8]);
                    if v12[7] then
                        v12[10] = "Instance";
                        v12[9] = Env[v12[10]];
                        v12[10] = "new";
                        v12[8] = v12[9][v12[10]];
                        v12[10] = "Folder";
                        v12[9] = v12[8](v12[10]);
                        v12[10] = "Climbable";
                        v12[8] = "Name";
                        v12[9][v12[8]] = v12[10];
                        v12[10] = v12[4];
                        v12[8] = "Parent";
                        v12[9][v12[8]] = v12[10];
                        v12[8] = "Parent";
                        v12[10] = v120[v12[5]];
                        v12[9] = nil;
                        v12[7][v12[8]] = v12[10];
                    end;
                    v12[9] = "Unclimbable";
                    v12[8] = "FindFirstChild";
                    v12[8] = v12[4][v12[8]];
                    v12[8] = v12[8](v12[4], v12[9]);
                    if v12[8] then
                        v12[10] = "ipairs";
                        v12[9] = Env[v12[10]];
                        v12[14] = "GetChildren";
                        v12[14] = v12[8][v12[14]];
                        v12[13] = {
                            v12[14](v12[8])
                        };
                        v12[14] = {
                            v12[9](v117(v12[13]))
                        };
                        v12[11] = v12[14][2];
                        v12[12] = v12[14][3];
                        v12[10] = v12[14][1];
                        v12[12], v12[13] = v12[10](v12[11], v12[12]);
                        while v12[12] do
                            v12[14] = 1;
                            v120[v12[14]] = v12[13];
                            v12[18] = "Reloads";
                            v12[9] = v12[12];
                            v12[13] = v12[14];
                            v12[16] = "Name";
                            v12[15] = v120[v12[13]];
                            v12[14] = v12[15][v12[16]];
                            v12[17] = v12[14] == v12[18];
                            v12[15] = v12[17];
                            v12[16] = v126;
                            if v12[17] then
                                v12[18] = not v12[15];
                                v12[17] = v12[16];
                                v12[16] = v12[18] and v12[20];
local v126 = v12[17];
                                if v12[16] then
                                    v12[18] = function(...)
                                        v120[v12[13]].Parent = v120[v12[5]];
                                        return; 
                                    end;
                                    v12[17] = "pcall";
                                    v12[16] = Env[v12[17]];
                                    v12[17] = v12[16](v12[18]);
                                end;
                                v12[14] = nil;
                                v12[15] = nil;
                                v12[9] = nil;
                                v12[13] = nil;
                            else
                                v12[20] = "Cutscene";
                                v12[19] = v12[14] == v12[20];
                                v12[17] = v12[19];
                                v12[20] = "Objective";
                                v12[19] = v12[14] == v12[20];
                                v12[18] = v126;
                                v12[17] = v12[19] v50 v12[17];
local v126 = v12[18];
                                v12[15] = v12[17];
                            end; 
                        end;
                        v12[10] = "Objective";
                        v12[9] = "FindFirstChild";
                        v12[9] = v12[8][v12[9]];
                        v12[9] = v12[9](v12[8], v12[10]);
                        if v12[9] then
                            v12[10] = "FindFirstChild";
                            v12[11] = "Guard";
                            v12[10] = v12[9][v12[10]];
                            v12[10] = v12[10](v12[9], v12[11]);
                            if v12[10] then
                                v12[11] = "FindFirstChild";
                                v12[12] = "Collider";
                                v12[13] = v126;
                                v12[11] = v12[10][v12[11]];
                                v12[11] = v12[11](v12[10], v12[12]);
                                v12[12] = v12[11];
                                if v12[11] then
                                    v12[15] = "BasePart";
                                    v12[14] = "IsA";
                                    v12[14] = v12[11][v12[14]];
                                    v12[14] = v12[14](v12[11], v12[15]);
                                    v12[12] = v12[14];
                                end;
local v126 = v12[13];
                                if v12[12] then
                                    v12[12] = "CanTouch";
                                    v12[13] = false;
                                    v12[11][v12[12]] = v12[13];
                                    v12[13] = false;
                                    v12[12] = "CanCollide";
                                    v12[11][v12[12]] = v12[13];
                                    v12[12] = "Transparency";
                                    v12[13] = 1;
                                    v12[11][v12[12]] = v12[13];
                                end;
                                v12[11] = nil;
                            end;
                            v12[10] = nil;
                        end;
                        v12[9] = nil;
                    end;
                    v12[7] = nil;
                    v12[8] = nil;
                else
                    v12[8] = "ipairs";
                    v12[7] = Env[v12[8]];
                    v12[13] = "GetChildren";
                    v12[11] = v120[v12[5]];
                    v12[13] = v12[11][v12[13]];
                    v12[12] = {
                        v12[13](v12[11])
                    };
                    v12[11] = {
                        v12[7](v117(v12[12]))
                    };
                    v12[10] = v12[11][3];
                    v12[9] = v12[11][2];
                    v12[8] = v12[11][1];
                    v12[10], v12[11] = v12[8](v12[9], v12[10]);
                    while v12[10] do
                        v12[7] = v12[10];
                        v12[14] = "Name";
                        v12[13] = v12[11][v12[14]];
                        v12[14] = "Climbable";
                        v12[12] = v12[13] == v12[14];
                        if v12[12] then
                            v12[13] = v12[4];
                            v12[12] = "Parent";
                            v12[11][v12[12]] = v12[13];
                        else
                            v12[13] = "Instance";
                            v12[12] = "IsA";
                            v12[12] = v12[11][v12[12]];
                            v12[12] = v12[12](v12[11], v12[13]);
                            if v12[12] then
                                v12[14] = v126;
                                v12[12] = "Parent";
                                v12[15] = "FindFirstChild";
                                v12[15] = v12[4][v12[15]];
                                v12[16] = "Unclimbable";
                                v12[15] = v12[15](v12[4], v12[16]);
                                v12[13] = v12[15];
                                if v12[15] then
                                    v12[11][v12[12]] = v12[13];
local v126 = v12[14];
                                    v12[11] = nil;
                                    v12[7] = nil;
                                else
                                    v12[13] = v12[4];
                                end;
                            end;
                        end; 
                    end;
                    v12[10] = "General";
                    v12[9] = v54;
                    v12[8] = v12[9][v12[10]];
                    v12[9] = "FailSafeDelaySeconds";
                    v12[7] = v12[8][v12[9]];
                    v12[11] = "General";
                    v12[10] = v54;
                    v12[9] = v12[10][v12[11]];
                    v12[10] = "FailSafe";
                    v12[8] = v12[9][v12[10]];
                    if v12[8] then
                        v12[11] = "task";
                        v12[10] = Env[v12[11]];
                        v12[11] = "delay";
                        v12[9] = v12[10][v12[11]];
                        v12[11] = function(...)
                            if v54.General.FailSafe then
                                pcall(function(...)
local v126 = v120[v47[2]];
                                    v126.InvokeServer(v126, "Functions", "Retry", "Add");
                                    return; 
                                end);
                            end;
                            return; 
                        end;
                        v12[10] = v12[9](v12[7], v12[11]);
                    end;
                    v12[11] = v54;
                    v12[12] = "General";
                    v12[10] = v12[11][v12[12]];
                    v12[11] = "AntiInjuries";
                    v12[9] = v12[10][v12[11]];
                    v12[10] = nil;
                    if v12[9] then
                        v12[13] = "Players";
                        v12[12] = "game";
                        v12[11] = Env[v12[12]];
                        v12[16] = "Character";
                        v12[12] = "GetService";
                        v12[12] = v12[11][v12[12]];
                        v12[12] = v12[12](v12[11], v12[13]);
                        v12[13] = "LocalPlayer";
                        v12[11] = v12[12][v12[13]];
                        v12[14] = v126;
                        v12[15] = v12[11][v12[16]];
                        v12[13] = v12[15];
                        if v12[15] then
local v126 = v12[14];
                            v12[14] = "WaitForChild";
                            v12[15] = "Injuries";
                            v12[16] = 10;
                            v12[14] = v12[13][v12[14]];
                            v12[14] = v12[14](v12[13], v12[15], v12[16]);
                            v12[15] = not v12[14];
                            if v12[15] then
                                v12[17] = "Injuries folder not found for Anti Injuries.";
                                v12[16] = "warn";
                                v12[15] = Env[v12[16]];
                                v12[16] = v12[15](v12[17]);
                            else
                                v12[16] = "pairs";
                                v12[15] = Env[v12[16]];
                                v12[20] = "GetChildren";
                                v12[20] = v12[14][v12[20]];
                                v12[19] = {
                                    v12[20](v12[14])
                                };
                                v12[20] = {
                                    v12[15](v117(v12[19]))
                                };
                                v12[18] = v12[20][3];
                                v12[16] = v12[20][1];
                                v12[17] = v12[20][2];
                                v12[18], v12[19] = v12[16](v12[17], v12[18]);
                                while v12[18] do
                                    v12[20] = "Destroy";
                                    v12[15] = v12[18];
                                    v12[20] = v12[19][v12[20]];
                                    v12[15] = nil;
                                    v12[20] = v12[20](v12[19]);
                                    v12[19] = nil; 
                                end;
                                v12[17] = function(arg1_9, ...)
local v121 = arg1_9;
                                    task.wait();
                                    v121.Destroy(v121);
                                    return; 
                                end;
                                v12[16] = "ChildAdded";
                                v12[15] = v12[14][v12[16]];
                                v12[16] = "Connect";
                                v12[16] = v12[15][v12[16]];
                                v12[16] = v12[16](v12[15], v12[17]);
                                v12[10] = v12[16];
                                v12[14] = nil;
                                v12[11] = nil;
                                v12[13] = nil;
                                v12[12] = nil;
                                v12[14] = "Players";
                                v12[20] = "General";
                                v12[13] = "game";
                                v12[17] = "Interface";
                                v12[12] = Env[v12[13]];
                                v12[13] = "GetService";
                                v12[15] = "PlayerGui";
                                v12[13] = v12[12][v12[13]];
                                v12[13] = v12[13](v12[12], v12[14]);
                                v12[14] = "LocalPlayer";
                                v12[12] = v12[13][v12[14]];
                                v12[14] = "WaitForChild";
                                v12[14] = v12[12][v12[14]];
                                v12[14] = v12[14](v12[12], v12[15]);
                                v12[15] = "WaitForChild";
                                v12[15] = v12[14][v12[15]];
                                v12[15] = v12[15](v12[14], v12[17]);
                                v12[14] = nil;
                                v12[19] = v54;
                                v12[18] = v12[19][v12[20]];
                                v12[19] = "RemoveDmgText";
                                v12[17] = v12[18][v12[19]];
                                if v12[17] then
                                    v12[19] = "pairs";
                                    v12[18] = Env[v12[19]];
                                    v12[23] = "GetDescendants";
                                    v12[23] = v12[15][v12[23]];
                                    v12[22] = {
                                        v12[23](v12[15])
                                    };
                                    v12[23] = {
                                        v12[18](v117(v12[22]))
                                    };
                                    v12[20] = v12[23][2];
                                    v12[19] = v12[23][1];
                                    v12[21] = v12[23][3];
                                    v12[21], v12[22] = v12[19](v12[20], v12[21]);
                                    while v12[21] do
                                        v12[25] = "IsA";
                                        v12[18] = v12[21];
                                        v12[24] = v12[14];
                                        v12[25] = v12[22][v12[25]];
                                        v12[26] = "TextLabel";
                                        v12[25] = v12[25](v12[22], v12[26]);
                                        v12[23] = v12[25];
                                        if v12[25] then
                                            v12[27] = "Name";
                                            v12[26] = v12[22][v12[27]];
                                            v12[27] = "Number";
                                            v12[25] = v12[26] == v12[27];
                                            v12[23] = v12[25];
                                        end;
local v126 = v12[24];
                                        if v12[23] then
                                            v12[23] = "Visible";
                                            v12[24] = false;
                                            v12[22][v12[23]] = v12[24];
                                        end;
                                        v12[18] = nil;
                                        v12[22] = nil; 
                                    end;
                                    v12[19] = "DescendantAdded";
                                    v12[20] = function(arg1_10, ...)
local v121 = arg1_10;
                                        if v121.IsA(v121, "TextLabel") and v121.Name == "Number" then
                                            v121.Visible = false;
                                        end;
                                        return; 
                                    end;
                                    v12[18] = v12[15][v12[19]];
                                    v12[19] = "Connect";
                                    v12[19] = v12[18][v12[19]];
                                    v12[19] = v12[19](v12[18], v12[20]);
                                    v12[14] = v12[19];
                                else
                                    if v12[14] then
                                        v12[18] = "Disconnect";
                                        v12[18] = v12[14][v12[18]];
                                        v12[18] = v12[18](v12[14]);
                                        v12[18] = nil;
                                        v12[14] = v12[18];
                                    end;
                                    v12[22] = v54;
                                    v12[23] = "Teleport";
                                    v12[21] = v12[22][v12[23]];
                                    v12[24] = "Teleport";
                                    v12[22] = "LobbyPlaceId";
                                    v12[20] = v12[21][v12[22]];
                                    v12[23] = v54;
                                    v12[22] = v12[23][v12[24]];
                                    v12[23] = "MainMenuPlaceId";
                                    v12[21] = v12[22][v12[23]];
                                    v12[25] = "Teleport";
                                    v12[24] = v54;
                                    v12[23] = v12[24][v12[25]];
                                    v12[24] = "ReturnToLobbyOnLoad";
                                    v12[22] = v12[23][v12[24]];
                                    if v12[22] then
                                        v12[22] = "Teleport";
                                        v12[24] = "Teleport";
                                        v12[22] = v43[v12[22]];
                                        v12[22] = v12[22](v43, v12[20], v12[12]);
                                        v12[23] = v54;
                                        v12[22] = v12[23][v12[24]];
                                        v12[24] = false;
                                        v12[23] = "ReturnToLobbyOnLoad";
                                        v12[22][v12[23]] = v12[24];
                                    end;
                                    v12[25] = "Teleport";
                                    v12[24] = v54;
                                    v12[23] = v12[24][v12[25]];
                                    v12[24] = "ReturnToMainMenuOnLoad";
                                    v12[22] = v12[23][v12[24]];
                                    if v12[22] then
                                        v12[24] = "Teleport";
                                        v12[22] = "Teleport";
                                        v12[22] = v43[v12[22]];
                                        v12[22] = v12[22](v43, v12[21], v12[12]);
                                        v12[23] = v54;
                                        v12[22] = v12[23][v12[24]];
                                        v12[23] = "ReturnToMainMenuOnLoad";
                                        v12[24] = false;
                                        v12[22][v12[23]] = v12[24];
                                    end;
                                    v12[24] = v54;
                                    v12[25] = "Teleport";
                                    v12[23] = v12[24][v12[25]];
                                    v12[24] = "ForceRetryOnLoad";
                                    v12[22] = v12[23][v12[24]];
                                    if v12[22] then
                                        v12[24] = function(...)
local v126 = v98;
                                            v126.InvokeServer(v126, "Functions", "Retry", "Add");
                                            return; 
                                        end;
                                        v12[23] = "pcall";
                                        v12[22] = Env[v12[23]];
                                        v12[23] = v12[22](v12[24]);
                                        v12[24] = "Teleport";
                                        v12[23] = v54;
                                        v12[22] = v12[23][v12[24]];
                                        v12[24] = false;
                                        v12[23] = "ForceRetryOnLoad";
                                        v12[22][v12[23]] = v12[24];
                                    end;
                                    v12[24] = "Vector3";
                                    v12[23] = Env[v12[24]];
                                    v12[26] = 1500;
                                    v12[24] = "new";
                                    v12[25] = 1500;
                                    v12[22] = v12[23][v12[24]];
                                    v12[24] = 1500;
                                    v12[28] = "General";
                                    v12[23] = v12[22](v12[24], v12[25], v12[26]);
                                    v12[22] = 26;
                                    v120[v12[22]] = v12[23];
                                    v12[24] = function(...)
local v124 = workspace;
local v121 = v124[2];
local v124 = v124[1];
                                        for v118, v52 v44 pairs(v124.GetDescendants(v124)) do
local v35 = v118;
                                            if v52.IsA(v52, "BasePart") and v52.Name == "Nape" then
                                                v52.Size = v120[v12[22]];
                                                v52.CFrame = v52.CFrame;
                                            end; 
                                        end;
                                        return; 
                                    end;
                                    v12[23] = nil;
                                    v12[27] = v54;
                                    v12[26] = v12[27][v12[28]];
                                    v12[27] = "NapeExtend";
                                    v12[25] = v12[26][v12[27]];
                                    if v12[25] then
                                        v12[28] = "workspace";
                                        v12[26] = v12[24]();
                                        v12[27] = Env[v12[28]];
                                        v12[28] = "DescendantAdded";
                                        v12[26] = v12[27][v12[28]];
                                        v12[28] = function(arg1_11, ...)
local v121 = arg1_11;
                                            if v121.IsA(v121, "BasePart") and v121.Name == "Nape" then
                                                task.wait(.1);
                                                v121.Size = v120[v12[22]];
                                                v121.CFrame = v121.CFrame;
                                            end;
                                            return; 
                                        end;
                                        v12[27] = "Connect";
                                        v12[27] = v12[26][v12[27]];
                                        v12[27] = v12[27](v12[26], v12[28]);
                                        v12[23] = v12[27];
                                    else
                                        if v12[23] then
                                            v12[26] = "Disconnect";
                                            v12[26] = v12[23][v12[26]];
                                            v12[26] = v12[26](v12[23]);
                                            v12[26] = nil;
                                            v12[23] = v12[26];
                                        end;
                                        v12[29] = "game";
                                        v12[30] = "VirtualInputManager";
                                        v12[32] = "Players";
                                        v12[28] = Env[v12[29]];
                                        v12[33] = "PlayerGui";
                                        v12[29] = "GetService";
                                        v12[35] = 15;
                                        v12[31] = "GuiService";
                                        v12[29] = v12[28][v12[29]];
                                        v12[29] = v12[29](v12[28], v12[30]);
                                        v12[28] = 16;
                                        v120[v12[28]] = v12[29];
                                        v12[30] = "game";
                                        v12[29] = Env[v12[30]];
                                        v12[30] = "GetService";
                                        v12[30] = v12[29][v12[30]];
                                        v12[30] = v12[30](v12[29], v12[31]);
                                        v12[34] = 17;
                                        v12[29] = 18;
                                        v12[31] = "game";
                                        v120[v12[29]] = v12[30];
                                        v12[39] = function(arg1_12, ...)
local v121 = arg1_12;
                                            if not v121 then
                                                return false;
                                            end;
local v118 = v121.AbsolutePosition;
local v124 = v121.AbsoluteSize;
local v126 = v120[v12[29]];
local v52 = v118.v29 + v124.v29 / 2;
local v123 = v118.v123 + v124.v123 / 2 + v126.GetGuiInset(v126).v123;
local v126 = v120[v12[28]];
                                            v126.SendMouseMoveEvent(v126, v52, v123, game);
                                            task.wait(.05);
local v126 = v120[v12[28]];
                                            v126.SendMouseButtonEvent(v126, v52, v123, 0, true, game, 0);
                                            task.wait(.05);
local v126 = v120[v12[28]];
                                            v126.SendMouseButtonEvent(v126, v52, v123, 0, false, game, 0);
                                            return true; 
                                        end;
                                        v12[38] = "General";
                                        v12[30] = Env[v12[31]];
                                        v12[31] = "GetService";
                                        v12[31] = v12[30][v12[31]];
                                        v12[31] = v12[31](v12[30], v12[32]);
                                        v12[32] = "LocalPlayer";
                                        v12[30] = v12[31][v12[32]];
                                        v12[32] = "WaitForChild";
                                        v12[41] = function(arg1_13, arg2_13, ...)
local v104 = arg2_13;
local v121 = arg1_13;
                                            if not v121 then
                                                return nil;
                                            end;
                                            local function v105(arg1_14, ...)
local v121 = arg1_14;
                                                if v121.IsA(v121, "GuiButton") v50 v121.IsA(v121, "TextButton") then
local v118 = v121.FindFirstChild(v121, "Text") v50 v121.Text;
                                                    if v118 then
local v28 = string.find(string.lower(tostring(v118)), string.lower(v104));
                                                    end;
                                                    if v118 then
                                                        return arg1_14;
                                                    end;
                                                end;
local v28 = "pairs";
local v52 = v121.GetChildren;
local v35 = {
                                                    v52(v121)
                                                };
local v124 = v52[3];
local v118 = v52[2];
                                                for v124, v123 v44 Env[v28](v117(v28)) do
local v52 = v124;
local v26 = v105(v123);
                                                    if v26 then
                                                        return v26;
                                                    else
                                                    end; 
                                                end;
                                                return nil; 
                                            end;
                                            return v105(v121); 
                                        end;
                                        v12[32] = v12[30][v12[32]];
                                        v12[40] = function(arg1_15, arg2_15, ...)
local v106 = arg2_15;
local v121 = arg1_15;
                                            if not v121 then
                                                return nil;
                                            end;
                                            local function v107(arg1_16, ...)
local v121 = arg1_16;
                                                if v121.Name == v106 and v121.IsA(v121, "GuiButton") then
                                                    return v121;
                                                end;
local v52 = v121.GetChildren;
local v35 = {
                                                    v52(v121)
                                                };
local v118 = v52[2];
local v35 = v52[1];
                                                for v124, v123 v44 pairs(v117(v35)) do
local v26 = v107(v123);
local v52 = v124;
                                                    if v26 then
                                                        return v26;
                                                    else
                                                    end; 
                                                end;
                                                return nil; 
                                            end;
                                            return v107(v121); 
                                        end;
                                        v12[32] = v12[32](v12[30], v12[33]);
                                        v12[33] = 19;
                                        v120[v12[33]] = v12[32];
                                        v12[32] = .2;
                                        v12[44] = "ESP";
                                        v12[50] = "ESP";
                                        v120[v12[34]] = v12[32];
                                        v12[32] = 1;
                                        v120[v12[35]] = v12[32];
                                        v12[37] = v54;
                                        v12[43] = "task";
                                        v12[36] = v12[37][v12[38]];
                                        v12[37] = "AutoRoll";
                                        v12[32] = v12[36][v12[37]];
                                        v12[48] = "ESP";
                                        v12[37] = function(arg1_17, ...)
local v121 = arg1_17;
                                            if v121 then
local v126 = v12[14];
local v28 = v121.Visible and v121.AbsoluteSize.Magnitude > 10;
                                            end;
                                            return v121; 
                                        end;
                                        v12[36] = 20;
                                        v120[v12[36]] = v12[37];
                                        v12[38] = function(arg1_18, ...)
local v121 = arg1_18;
                                            if not v121 then
                                                return false;
                                            end;
local v108 = v121;
local v124 = v108;
local v28 = v124;
                                            while not v124 do
                                                if v28 then
local v52 = {
                                                        pcall(function(...)
                                                            return v108.Visible; 
                                                        end)
                                                    };
local v35 = pcall(function(...)
                                                        return v108.Visible; 
                                                    end);
                                                    if v35 then
local v28 = not v52[2];
                                                    end;
                                                    if v35 then
                                                        return false;
                                                    else
local v108 = v108.Parent;
                                                    end;
                                                end;
                                                return v121.AbsoluteSize.Magnitude > 10; 
                                            end;
local v28 = v108 ~= v120[v12[33]]; 
                                        end;
                                        v12[37] = 21;
                                        v120[v12[37]] = v12[38];
                                        v12[38] = 22;
                                        v120[v12[38]] = v12[39];
                                        v12[39] = 23;
                                        v120[v12[39]] = v12[40];
                                        v12[40] = 24;
                                        v120[v12[40]] = v12[41];
                                        v12[42] = Env[v12[43]];
                                        v12[43] = "spawn";
                                        v12[41] = v12[42][v12[43]];
                                        v12[43] = function(...)
local v126 = v120[v12[33]];
local v121 = v126.WaitForChild(v126, "Interface", 10);
                                            if not v121 then
                                                return;
                                            end;
local v35 = v123[2];
local v123 = v123[1];
                                            for v52, v22 v44 pairs({
                                                "Customisation.Family.Buttons_2.Roll",
                                                "Roll",
                                                "RollButton"
                                            }) do
local v26 = v52;
local v126 = pairs;
local v24 = v126.WaitForChild(v126, "Interface", 10);
local v129 = v43[2];
local v45 = v43[3];
                                                for v45, v31 v44 v126(string.split(v22, ".")) do
                                                    if v24 then
                                                        v121.FindFirstChild(v121, v31);
                                                    end; 
                                                end;
                                                if v24 then
local v14 = v24.IsA(v24, "GuiButton");
                                                end;
local v126 = v126;
                                                if v24 then
local v118 = v121;
                                                else
                                                end; 
                                            end;
                                            if not nil then
local v118 = v120[v12[39]](v121, "Roll");
                                            end;
                                            if not nil then
                                                v120[v12[40]](v121, "roll");
                                            end;
                                            if not nil then
                                                warn("Auto Roll button not found.");
                                                return;
                                            end;
                                            while true do
                                                if v54.General.AutoRoll then
local v126 = pairs;
                                                    if v120[v12[36]](nil) and v120[v12[37]](nil) then
                                                        v120[v12[38]](nil);
                                                        task.wait(v120[v12[34]]);
                                                    else
                                                        task.wait(v120[v12[35]]);
                                                    end;
                                                else
                                                    task.wait(1);
                                                end; 
                                            end;
                                            return; 
                                        end;
                                        v12[42] = v12[41](v12[43]);
                                        v12[43] = v54;
                                        v12[42] = v12[43][v12[44]];
                                        v12[43] = "Esp";
                                        v12[41] = v12[42][v12[43]];
                                        v12[44] = "Color3";
                                        v12[43] = Env[v12[44]];
                                        v12[49] = "ESP";
                                        v12[44] = "fromRGB";
                                        v12[42] = v12[43][v12[44]];
                                        v12[47] = v54;
                                        v12[46] = v12[47][v12[48]];
                                        v12[47] = "Color";
                                        v12[45] = v12[46][v12[47]];
                                        v12[46] = "R";
                                        v12[44] = v12[45][v12[46]];
                                        v12[48] = v54;
                                        v12[47] = v12[48][v12[49]];
                                        v12[48] = "Color";
                                        v12[46] = v12[47][v12[48]];
                                        v12[47] = "G";
                                        v12[45] = v12[46][v12[47]];
                                        v12[49] = v54;
                                        v12[48] = v12[49][v12[50]];
                                        v12[49] = "Color";
                                        v12[50] = "ESP";
                                        v12[47] = v12[48][v12[49]];
                                        v12[48] = "B";
                                        v12[46] = v12[47][v12[48]];
                                        v12[49] = "ESP";
                                        v12[43] = v12[42](v12[44], v12[45], v12[46]);
                                        v12[45] = "Vector3";
                                        v12[44] = Env[v12[45]];
                                        v12[45] = "new";
                                        v12[42] = v12[44][v12[45]];
                                        v12[48] = v54;
                                        v12[47] = v12[48][v12[49]];
                                        v12[51] = "ESP";
                                        v12[48] = "Size";
                                        v12[46] = v12[47][v12[48]];
                                        v12[47] = "X";
                                        v12[45] = v12[46][v12[47]];
                                        v12[49] = v54;
                                        v12[48] = v12[49][v12[50]];
                                        v12[49] = "Size";
                                        v12[47] = v12[48][v12[49]];
                                        v12[48] = "Y";
                                        v12[46] = v12[47][v12[48]];
                                        v12[50] = v54;
                                        v12[49] = v12[50][v12[51]];
                                        v12[50] = "Size";
                                        v12[48] = v12[49][v12[50]];
                                        v12[49] = "Z";
                                        v12[47] = v12[48][v12[49]];
                                        v12[44] = v12[42](v12[45], v12[46], v12[47]);
                                        v12[45] = function(arg1_19, ...)
local v121 = arg1_19;
                                            if not v121.FindFirstChild(v121, "NapeESP") then
local v118 = Instance.new("BoxHandleAdornment");
                                                v118.Name = "NapeESP";
local v28 = arg1_19;
                                                v118.Adornee = v28;
                                                v118.AlwaysOnTop = true;
                                                v118.ZIndex = 5;
                                                v118.Size = v54.ESP.Size;
                                                v118.Transparency = 0.5;
                                                v118.Color3 = Color3.fromRGB(v54.ESP.Color.v24, v54.ESP.Color.v126, v54.ESP.Color.v126);
                                                v118.Parent = v121;
                                            end;
                                            return; 
                                        end;
                                        v12[42] = 25;
                                        v12[50] = "Titans";
                                        v120[v12[42]] = v12[45];
                                        v12[46] = function(...)
local v126 = workspace;
local v121 = v126.FindFirstChild(v126, "Titans");
                                            if not v121 then
                                                return;
                                            end;
local v28 = "ipairs";
local v52 = v121.GetChildren;
local v35 = {
                                                v52(v121)
                                            };
local v118 = v52[2];
local v124 = v52[3];
                                            for v124, v123 v44 Env[v28](v117(v28)) do
local v52 = v124;
local v26 = v123.FindFirstChild(v123, "Hitboxes");
                                                if v26 then
local v22 = v26.FindFirstChild(v26, "Hit");
                                                    if v22 then
local v126 = v22.FindFirstChild(v22, "Nape");
                                                        if v126 then
local v24 = v126.FindFirstChild(v126, "NapeESP");
                                                        end;
                                                        if v126 then
local v126 = v126.NapeESP;
                                                            v126.Destroy(v126);
                                                        end;
                                                    end;
                                                end; 
                                            end;
                                            return; 
                                        end;
                                        v12[47] = function(...)
local v126 = workspace;
local v121 = v126.FindFirstChild(v126, "Titans");
                                            if not v121 then
                                                return;
                                            end;
local v28 = "ipairs";
local v52 = v121.GetChildren;
local v35 = {
                                                v52(v121)
                                            };
local v118 = v52[2];
local v124 = v52[3];
                                            for v124, v123 v44 Env[v28](v117(v28)) do
local v52 = v124;
local v26 = v123.FindFirstChild(v123, "Hitboxes");
                                                if v26 then
local v22 = v26.FindFirstChild(v26, "Hit");
                                                    if v22 then
local v17 = v22.FindFirstChild(v22, "Nape");
                                                        if v17 then
local v24 = v17.FindFirstChild(v17, "NapeESP");
                                                            if v24 then
                                                                v24.Color3 = Color3.fromRGB(v54.ESP.Color.v24, v54.ESP.Color.v126, v54.ESP.Color.v126);
                                                            end;
                                                        end;
                                                    end;
                                                end; 
                                            end;
                                            return; 
                                        end;
                                        v12[45] = function(...)
local v126 = workspace;
local v121 = v126.FindFirstChild(v126, "Titans");
                                            if not v121 then
                                                return;
                                            end;
local v52 = v121.GetChildren;
local v35 = {
                                                v52(v121)
                                            };
local v35 = v52[1];
local v124 = v52[3];
                                            for v124, v123 v44 v35, ipairs(v117(v35)) do
local v52 = v124;
local v26 = v123.FindFirstChild(v123, "Hitboxes");
                                                if v26 then
local v22 = v26.FindFirstChild(v26, "Hit");
                                                    if v22 then
local v17 = v22.FindFirstChild(v22, "Nape");
                                                        if v17 then
local v24 = v17.IsA(v17, "BasePart");
                                                        end;
                                                        if v17 then
                                                            v120[v12[42]](v17);
                                                        end;
                                                    end;
                                                end; 
                                            end;
                                            return; 
                                        end;
                                        v12[49] = "workspace";
                                        v12[48] = Env[v12[49]];
                                        v12[49] = "FindFirstChild";
                                        v12[49] = v12[48][v12[49]];
                                        v12[49] = v12[49](v12[48], v12[50]);
                                        if v12[49] then
                                            v12[50] = "ChildAdded";
                                            v12[51] = function(arg1_20, ...)
local v121 = arg1_20;
                                                if not v54.ESP.Esp then
                                                    return;
                                                end;
                                                task.wait(0.5);
local v118 = v121.FindFirstChild(v121, "Hitboxes");
                                                if v118 then
local v124 = v118.FindFirstChild(v118, "Hit");
                                                    if v124 then
local v35 = v124.FindFirstChild(v124, "Nape");
                                                        if v35 then
                                                            v120[v12[42]](v35);
                                                        end;
                                                    end;
                                                end;
                                                return; 
                                            end;
                                            v12[48] = v12[49][v12[50]];
                                            v12[50] = "Connect";
                                            v12[50] = v12[48][v12[50]];
                                            v12[50] = v12[50](v12[48], v12[51]);
                                        end;
                                        if v12[41] then
                                            v12[48] = v12[45]();
                                        else
                                            v12[48] = v12[46]();
                                        end;
                                        v12[50] = "game";
                                        v12[48] = Env[v12[50]];
                                        v12[55] = "FindFirstChild";
                                        v12[50] = "GetService";
                                        v12[50] = v12[48][v12[50]];
                                        v12[53] = "Players";
                                        v12[51] = "VirtualInputManager";
                                        v12[52] = "GuiService";
                                        v12[50] = v12[50](v12[48], v12[51]);
                                        v12[48] = 3;
                                        v120[v12[48]] = v12[50];
                                        v12[56] = "PlayerGui";
                                        v12[51] = "game";
                                        v12[50] = Env[v12[51]];
                                        v12[51] = "GetService";
                                        v12[51] = v12[50][v12[51]];
                                        v12[51] = v12[51](v12[50], v12[52]);
                                        v12[50] = 4;
                                        v120[v12[50]] = v12[51];
                                        v12[52] = "game";
                                        v12[51] = Env[v12[52]];
                                        v12[52] = "GetService";
                                        v12[52] = v12[51][v12[52]];
                                        v12[52] = v12[52](v12[51], v12[53]);
                                        v12[53] = "LocalPlayer";
                                        v12[51] = v12[52][v12[53]];
                                        v12[54] = v12[14];
                                        v12[55] = v12[51][v12[55]];
                                        v12[55] = v12[55](v12[51], v12[56]);
                                        v12[53] = v12[55];
                                        if v12[55] then
                                            v12[56] = "PlayerGui";
                                            v12[55] = v12[51][v12[56]];
                                            v12[56] = "FindFirstChild";
                                            v12[57] = "Interface";
                                            v12[56] = v12[55][v12[56]];
                                            v12[56] = v12[56](v12[55], v12[57]);
                                            v12[53] = v12[56];
                                        end;
                                        v12[54] = v12[53];
                                        v12[55] = v12[54];
                                        if v12[53] then
                                            v12[57] = "Skip";
                                            v12[56] = "FindFirstChild";
                                            v12[56] = v12[53][v12[56]];
                                            v12[56] = v12[56](v12[53], v12[57]);
                                            v12[54] = v12[56];
                                        end;
                                        v12[62] = "GuiService";
                                        v12[58] = "Raids";
                                        v12[55] = 47;
                                        v120[v12[55]] = v12[54];
                                        v12[57] = v54;
                                        v12[56] = v12[57][v12[58]];
                                        v12[57] = "AutoSkipCutscene";
                                        v12[54] = v12[56][v12[57]];
                                        v12[61] = "task";
                                        v12[56] = 48;
                                        v12[58] = function(...)
                                            return v120[v12[55]] and (v120[v12[55]].Visible and v120[v12[55]].AbsoluteSize.Magnitude > 10); 
                                        end;
                                        v12[70] = "task";
                                        v12[57] = function(arg1_21, ...)
                                            v120[v12[50]].SelectedObject = arg1_21;
                                            return; 
                                        end;
                                        v120[v12[56]] = v12[57];
                                        v12[59] = function(...)
                                            v120[v12[56]](v120[v12[55]]);
local v126 = v120[v12[48]];
                                            v126.SendKeyEvent(v126, true, Enum.KeyCode.Return, false, game);
local v126 = v120[v12[48]];
                                            v126.SendKeyEvent(v126, false, Enum.KeyCode.Return, false, game);
                                            task.wait(.01);
                                            v120[v12[56]](nil);
                                            return; 
                                        end;
                                        v12[57] = 49;
                                        v120[v12[57]] = v12[58];
                                        v12[58] = 50;
                                        v12[66] = "Raids";
                                        v120[v12[58]] = v12[59];
                                        v12[60] = Env[v12[61]];
                                        v12[61] = "spawn";
                                        v12[59] = v12[60][v12[61]];
                                        v12[61] = function(...)
                                            while true do
local v121 = v54.Raids.AutoSkipCutscene;
local v28 = v121;
                                                if v121 then
                                                    v120[v12[57]]();
                                                end;
                                                if v28 then
                                                    v120[v12[58]]();
                                                    task.wait(1);
                                                end;
                                                task.wait(0.5); 
                                            end;
                                            return; 
                                        end;
                                        v12[60] = v12[59](v12[61]);
                                        v12[60] = "game";
                                        v12[61] = "VirtualInputManager";
                                        v12[59] = Env[v12[60]];
                                        v12[60] = "GetService";
                                        v12[60] = v12[59][v12[60]];
                                        v12[60] = v12[60](v12[59], v12[61]);
                                        v12[64] = "game";
                                        v12[87] = "Assets";
                                        v12[59] = 51;
                                        v12[61] = "game";
                                        v120[v12[59]] = v12[60];
                                        v12[67] = "Raids";
                                        v12[60] = Env[v12[61]];
                                        v12[61] = "GetService";
                                        v12[61] = v12[60][v12[61]];
                                        v12[61] = v12[61](v12[60], v12[62]);
                                        v12[60] = 52;
                                        v12[74] = "Webhook";
                                        v120[v12[60]] = v12[61];
                                        v12[71] = "Players";
                                        v12[63] = Env[v12[64]];
                                        v12[64] = "Players";
                                        v12[62] = v12[63][v12[64]];
                                        v12[63] = "LocalPlayer";
                                        v12[61] = v12[62][v12[63]];
                                        v12[63] = "PlayerGui";
                                        v12[84] = "Female Serum";
                                        v12[62] = "WaitForChild";
                                        v12[62] = v12[61][v12[62]];
                                        v12[62] = v12[62](v12[61], v12[63]);
                                        v12[63] = 53;
                                        v120[v12[63]] = v12[62];
                                        v12[65] = v54;
                                        v12[64] = v12[65][v12[66]];
                                        v12[65] = "AutoFreeChest";
                                        v12[62] = v12[64][v12[65]];
                                        v12[66] = v54;
                                        v12[65] = v12[66][v12[67]];
                                        v12[66] = "AutoPremiumChest";
                                        v12[64] = v12[65][v12[66]];
                                        v12[68] = function(arg1_22, ...)
local v121 = arg1_22;
local v118 = v121.AbsolutePosition;
local v124 = v121.AbsoluteSize;
local v126 = v120[v12[60]];
local v52 = v118.v29 + v124.v29 / 2;
local v123 = v118.v123 + v124.v123 / 2 + v126.GetGuiInset(v126).v123;
local v126 = v120[v12[59]];
                                            v126.SendMouseMoveEvent(v126, v52, v123, game);
                                            task.wait(.05);
local v126 = v120[v12[59]];
                                            v126.SendMouseButtonEvent(v126, v52, v123, 0, true, game, 0);
                                            task.wait(.05);
local v126 = v120[v12[59]];
                                            v126.SendMouseButtonEvent(v126, v52, v123, 0, false, game, 0);
                                            return; 
                                        end;
                                        v12[67] = function(arg1_23, ...)
local v121 = arg1_23;
                                            if not v121 then
                                                return false;
                                            end;
local v110 = v121;
local v124 = v110;
local v28 = v124;
                                            while not v124 do
                                                if v28 then
local v52 = {
                                                        pcall(function(...)
                                                            return v110.Visible; 
                                                        end)
                                                    };
local v35 = pcall(function(...)
                                                        return v110.Visible; 
                                                    end);
                                                    if v35 then
local v28 = not v52[2];
                                                    end;
                                                    if v35 then
                                                        return false;
                                                    else
local v110 = v110.Parent;
                                                    end;
                                                end;
                                                return v121.AbsoluteSize.Magnitude > 10; 
                                            end;
local v28 = v110 ~= v120[v12[63]]; 
                                        end;
                                        v12[66] = function(arg1_24, ...)
local v121 = arg1_24;
                                            if v121 then
local v28 = v121.Visible and v121.AbsoluteSize.Magnitude > 10;
local v126 = v12[55];
                                            end;
                                            return v121; 
                                        end;
                                        v12[65] = 54;
                                        v120[v12[65]] = v12[66];
                                        v12[66] = 55;
                                        v12[76] = "Webhook";
                                        v120[v12[66]] = v12[67];
                                        v12[67] = 56;
                                        v120[v12[67]] = v12[68];
                                        v12[69] = Env[v12[70]];
                                        v12[70] = "spawn";
                                        v12[68] = v12[69][v12[70]];
                                        v12[75] = "Webhook";
                                        v12[70] = function(...)
local v126 = v120[v12[63]];
local v121 = v126.WaitForChild(v126, "Interface");
local v118 = v121.WaitForChild(v121, "Chests");
                                            v118.WaitForChild(v118, "Free");
local v35 = v118.WaitForChild(v118, "Finish");
                                            while true do
local v52 = v54.Raids.AutoFreeChest;
                                                if v52 then
                                                    v120[v12[66]](v118.WaitForChild(v118, v28));
                                                end;
                                                if v52 then
                                                    if v120[v12[65]](v118.WaitForChild(v118, "Free")) then
                                                        v120[v12[67]](v118.WaitForChild(v118, "Free"));
                                                        task.wait(7);
                                                    end;
                                                    if v120[v12[65]](v35) then
                                                        v120[v12[67]](v118.WaitForChild(v118, v28));
                                                        task.wait(2);
                                                    end;
                                                    while v120[v12[66]](v35) do
                                                        task.wait(1); 
                                                    end;
                                                else
                                                    task.wait(1);
                                                end; 
                                            end;
                                            return; 
                                        end;
                                        v12[69] = v12[68](v12[70]);
                                        v12[70] = "task";
                                        v12[80] = "Serum";
                                        v12[69] = Env[v12[70]];
                                        v12[70] = "spawn";
                                        v12[68] = v12[69][v12[70]];
                                        v12[70] = function(...)
local v126 = v120[v12[63]];
local v121 = v126.WaitForChild(v126, "Interface");
local v118 = v121.WaitForChild(v121, "Chests");
                                            v118.WaitForChild(v118, "Premium");
local v35 = v118.WaitForChild(v118, "Finish");
                                            while true do
local v52 = v54.Raids.AutoPremiumChest;
                                                if v52 then
                                                    v120[v12[66]](v118.WaitForChild(v118, v28));
                                                end;
                                                if v52 then
                                                    if v120[v12[65]](v118.WaitForChild(v118, "Premium")) then
                                                        v120[v12[67]](v118.WaitForChild(v118, "Premium"));
                                                        task.wait(7);
                                                    end;
                                                    if v120[v12[65]](v35) then
                                                        v120[v12[67]](v118.WaitForChild(v118, v28));
                                                        task.wait(2);
                                                    end;
                                                    while v120[v12[66]](v35) do
                                                        task.wait(1); 
                                                    end;
                                                else
                                                    task.wait(1);
                                                end; 
                                            end;
                                            return; 
                                        end;
                                        v12[69] = v12[68](v12[70]);
                                        v12[69] = "game";
                                        v12[70] = "HttpService";
                                        v12[68] = Env[v12[69]];
                                        v12[69] = "GetService";
                                        v12[82] = "Attack Serum";
                                        v12[69] = v12[68][v12[69]];
                                        v12[69] = v12[69](v12[68], v12[70]);
                                        v12[70] = "game";
                                        v12[68] = 57;
                                        v120[v12[68]] = v12[69];
                                        v12[69] = Env[v12[70]];
                                        v12[70] = "GetService";
                                        v12[70] = v12[69][v12[70]];
                                        v12[70] = v12[70](v12[69], v12[71]);
                                        v12[71] = "LocalPlayer";
                                        v12[69] = v12[70][v12[71]];
                                        v12[71] = 58;
                                        v120[v12[71]] = v12[69];
                                        v12[73] = v54;
                                        v12[72] = v12[73][v12[74]];
                                        v12[73] = "URL";
                                        v12[69] = v12[72][v12[73]];
                                        v12[74] = v54;
                                        v12[73] = v12[74][v12[75]];
                                        v12[74] = "Enabled";
                                        v12[72] = v12[73][v12[74]];
                                        v12[79] = function(arg1_25, ...)
local v126 = v120[v12[71]];
local v118 = v126.FindFirstChild(v126, "PlayerGui");
local v28 = "ipairs";
local v126 = Env[v28];
local v52 = string.split;
local v124 = v52[2];
local v35 = v52[3];
                                            for v35, v26 v44 v126(v52(arg1_25, ".")) do
local v123 = v35;
                                                if not v118 then
                                                    return "0";
                                                else
local v118 = v118.FindFirstChild(v118, v26);
                                                end; 
                                            end;
local v35 = v126;
                                            if v118 then
local v52 = v118.Text;
                                            end;
local v126 = v126;
                                            return v118 v50 "0"; 
                                        end;
                                        v12[75] = v54;
                                        v12[83] = "Armored Serum";
                                        v12[74] = v12[75][v12[76]];
                                        v12[75] = "DisplayUsername";
                                        v12[78] = function(...)
local v126 = v120[v12[71]];
local v121 = v126.FindFirstChild(v126, "PlayerGui");
                                            if v121 then
local v126 = v120[v47[1]];
local v28 = v121.FindFirstChild(v121, "Interface") and v123.FindFirstChild(v123, "Rewards");
                                            end;
                                            return v121; 
                                        end;
                                        v12[73] = v12[74][v12[75]];
                                        v12[75] = 59;
                                        v12[74] = "https://media.discordapp.net/attachments/1375563869367435344/1382238069121482893/g2XBB0B.png?ex=684a6d04&is=68491b84&hm=43c78606310dd13f2241727ad200be03226aba7328ba3fc233f84cde2f246048&=&format=webp&quality=lossless&width=968&height=968";
                                        v120[v12[75]] = v12[74];
                                        v12[76] = function(arg1_26, ...)
local v121 = tonumber(arg1_26);
                                            if not v121 then
                                                return "0";
                                            end;
                                            while true do
local v26 = {
                                                    v118.gsub(v118, "^(-?%d+)(%d%d%d)", "%1,%2")
                                                };
local v118 = v118.gsub(v118, "^(-?%d+)(%d%d%d)", "%1,%2");
                                                if v26[2] == 0 then
                                                    break;
                                                else
                                                end; 
                                            end;
                                            return tostring(v121); 
                                        end;
                                        v12[74] = 60;
                                        v120[v12[74]] = v12[76];
                                        v12[76] = 61;
                                        v12[77] = function(arg1_27, ...)
local v121 = arg1_27;
                                            if not v121 v50 not v121.IsDescendantOf(v121, v120[v12[71]].PlayerGui) then
                                                return false;
                                            end;
                                            while not v121 do
                                                if v121 then
                                                    if v121.IsA(v121, "GuiObject") and not v121.Visible then
                                                        return false;
                                                    else
local v121 = arg1_27.Parent;
                                                    end;
                                                end;
                                                return true; 
                                            end;
local v28 = v121 ~= v120[v12[71]].PlayerGui; 
                                        end;
                                        v120[v12[76]] = v12[77];
                                        v12[81] = {
                                            v12[82],
                                            v12[83],
                                            v12[84]
                                        };
                                        v12[77] = 62;
                                        v120[v12[77]] = v12[78];
                                        v12[78] = 63;
                                        v12[82] = 64;
                                        v12[84] = "task";
                                        v120[v12[78]] = v12[79];
                                        v12[79] = {
                                            [v12[80]] = v12[81]
                                        };
                                        v12[80] = 65;
                                        v120[v12[80]] = v12[79];
                                        v12[79] = 66;
                                        v12[81] = function(arg1_28, ...)
local v126 = v120[v12[71]];
local v118 = v126.FindFirstChild(v126, "PlayerGui");
local v118 = v118 and v118.FindFirstChild(v118, "Interface");
local v118 = v118 and v118.FindFirstChild(v118, "Rewards");
local v118 = v118 and v118.FindFirstChild(v118, "Main");
local v118 = v118 and v118.FindFirstChild(v118, "Info");
local v118 = v118 and v118.FindFirstChild(v118, "Main");
local v118 = v118 and v118.FindFirstChild(v118, "Items");
                                            if v118 then
local v129 = v45[3];
                                                for v129, v43 v44 v45[1], ipairs(v120[v12[80]][arg1_28] v50 ) do
local v9 = v118.GetChildren;
local v42 = v9[2];
local v39 = v9[3];
                                                    for v39, v9 v44 ipairs(v9(v118)) do
local v51 = v39;
                                                        if v9.Name == v43 then
local v123 = v9.GetDescendants;
local v13 = v123[3];
                                                            for v13, v123 v44 v123[1], pairs(v123(v9)) do
local v25 = v13;
local v126 = v123.IsA(v123, "TextLabel");
                                                                if v126 then
local v126 = v123.Text;
local v37 = v126.match(v126, "[%d,.]+");
                                                                    if v37 then
local v37 = v37.gsub(v37, ",", "");
local v33 = tonumber(v37);
                                                                        if v33 then
local v22 = v126 + v33;
                                                                        end;
                                                                    end;
                                                                end; 
                                                            end;
                                                        end; 
                                                    end; 
                                                end;
                                            end;
                                            return tostring(0); 
                                        end;
                                        v120[v12[79]] = v12[81];
                                        v12[81] = nil;
                                        v120[v12[82]] = v12[81];
                                        v12[83] = Env[v12[84]];
                                        v12[84] = "spawn";
                                        v12[81] = v12[83][v12[84]];
                                        v12[84] = function(...)
                                            while true do
local v118 = v120[v12[76]](v120[v12[77]]());
local v28 = v118;
                                                if v118 then
local v28 = v54.Webhook.Enabled and v54.Webhook.URL ~= "";
local v126 = true;
                                                end;
                                                if v28 then
local v121 = v120[v12[78]]("Interface.Rewards.Main.Info.Main.Stats.Time_Taken.Amount");
                                                    if v121 ~= "0" and v121 ~= v120[v12[82]] then
                                                        v120[v12[82]] = v121;
local v43 = v120[v12[78]]("Interface.Rewards.Main.Info.Main.Stats.Damage_Dealt.Amount");
local v126 = v121;
local v111 = {
                                                            ["username"] = v54.Webhook.DisplayUsername and v120[v12[71]].Name .. " (ZeldHub)" v50 "ZeldHub",
                                                            ["avatar_url"] = v120[v12[75]],
                                                            ["embeds"] = {
                                                                {
                                                                    ["title"] = "AOT:R Rewards",
                                                                    ["color"] = 12104036,
                                                                    ["thumbnail"] = {
                                                                        ["url"] = v120[v12[75]]
                                                                    },
                                                                    ["fields"] = {
                                                                        {
                                                                            ["name"] = "**Stats:**",
                                                                            ["value"] = string.format("%s Time Taken\n%s Damage Dealt\n%s Titan Kills\n%s Critical Hits", v121, v120[v12[74]](v43.gsub(v43, ",", "")), v120[v12[78]]("Interface.Rewards.Main.Info.Main.Stats.Titans_Killed.Amount"), v120[v12[78]]("Interface.Rewards.Main.Info.Main.Stats.Critical_Hits.Amount")),
                                                                            ["inline"] = true
                                                                        },
                                                                        {
                                                                            ["name"] = "**Rewards:**",
                                                                            ["value"] = string.format("%s Gold\n%s XP\n%s Gems", v120[v12[74]](v120[v12[79]]("Gold")), v120[v12[74]](v120[v12[79]]("XP")), v120[v12[74]](v120[v12[79]]("Gems"))),
                                                                            ["inline"] = true
                                                                        },
                                                                        {
                                                                            ["name"] = "**Drops:**",
                                                                            ["value"] = string.format("Battle Bass XP: %s\nCommon Perks: %s\nRare Perks: %s\nEpic Perks: %s\nLegendary Perks: %s\nPrestige Scroll: %s", v120[v12[74]](v120[v12[79]]("BP_XP")), v120[v12[74]](v120[v12[79]]("Common_Perk")), v120[v12[74]](v120[v12[79]]("Rare_Perk")), v120[v12[74]](v120[v12[79]]("Epic_Perk")), v120[v12[74]](v120[v12[79]]("Legendary_Perk")), v120[v12[74]](v120[v12[79]]("Prestige_Scroll"))),
                                                                            ["inline"] = true
                                                                        },
                                                                        {
                                                                            ["name"] = "**Special Rewards:**",
                                                                            ["value"] = string.format("Serum: %s\nMythical Perk: %s\nScarf: %s", v120[v12[74]](v120[v12[79]]("Serum")), v120[v12[74]](v120[v12[79]]("Secret_Perk")), v120[v12[74]](v120[v12[79]]("Scarf"))),
                                                                            ["inline"] = false
                                                                        }
                                                                    },
                                                                    ["footer"] = {
                                                                        ["text"] = "Sent at: " .. os.date("%d-%b-%Y %I:%M %p")
                                                                    }
                                                                }
                                                            }
                                                        };
local v123 = {
                                                            pcall(function(...)
local v126 = v120[v12[68]];
local v17 = v120[v12[68]];
                                                                v126.RequestAsync(v126, {
                                                                    ["Url"] = v54.Webhook.URL,
                                                                    ["Method"] = "POST",
                                                                    ["Headers"] = {
                                                                        ["Content-Type"] = "application/json"
                                                                    },
                                                                    ["Body"] = v17.JSONEncode(v17, v111)
                                                                });
                                                                return; 
                                                            end)
                                                        };
                                                        if not pcall(function(...)
local v126 = v120[v12[68]];
local v17 = v120[v12[68]];
                                                            v126.RequestAsync(v126, {
                                                                ["Url"] = v54.Webhook.URL,
                                                                ["Method"] = "POST",
                                                                ["Headers"] = {
                                                                    ["Content-Type"] = "application/json"
                                                                },
                                                                ["Body"] = v17.JSONEncode(v17, v111)
                                                            });
                                                            return; 
                                                        end) then
                                                            warn("Failed to send webhook:", v123[2]);
                                                        end;
                                                    end;
                                                end;
                                                task.wait(1); 
                                            end;
                                            return; 
                                        end;
                                        v12[83] = v12[81](v12[84]);
                                        v12[83] = "game";
                                        v12[81] = Env[v12[83]];
                                        v12[84] = "ReplicatedStorage";
                                        v12[83] = "GetService";
                                        v12[83] = v12[81][v12[83]];
                                        v12[83] = v12[83](v12[81], v12[84]);
                                        v12[81] = 67;
                                        v12[88] = function(...)
local v126 = v120[v12[81]];
local v28 = v126.WaitForChild(v126, "Modules", 5);
local v126 = v28.WaitForChild(v28, "Storage", 5);
                                            return v126.WaitForChild(v126, "Skill", 5); 
                                        end;
                                        v120[v12[81]] = v12[83];
                                        v12[86] = v120[v12[81]];
                                        v12[85] = v12[86][v12[87]];
                                        v12[86] = "Remotes";
                                        v12[84] = v12[85][v12[86]];
                                        v12[85] = "GET";
                                        v12[83] = v12[84][v12[85]];
                                        v12[85] = 68;
                                        v12[84] = 69;
                                        v12[86] = "pcall";
                                        v120[v12[84]] = v12[83];
                                        v12[83] = nil;
                                        v120[v12[85]] = v12[83];
                                        v12[83] = Env[v12[86]];
                                        v12[89] = {
                                            v12[83](v12[88])
                                        };
                                        v12[86] = v12[89][1];
                                        v12[88] = v12[55];
                                        v12[87] = v12[89][2];
                                        v12[83] = v12[86];
                                        if v12[86] then
                                            v12[83] = v12[87];
                                        end;
local v126 = v12[88];
                                        if v12[83] then
                                            v12[88] = "require";
                                            v12[83] = Env[v12[88]];
                                            v12[88] = v12[83](v12[87]);
                                            v120[v12[85]] = v12[88];
                                        else
                                            v12[83] = {};
                                            v120[v12[85]] = v12[83];
                                        end;
                                        v12[93] = "lastUsed";
                                        v12[92] = "General";
                                        v12[91] = v54;
                                        v12[90] = v12[91][v12[92]];
                                        v12[91] = "TitanRipper";
                                        v12[89] = v12[90][v12[91]];
                                        v12[96] = 0;
                                        v12[95] = "initialDelay";
                                        v12[94] = 0;
                                        v12[91] = "14";
                                        v12[92] = {
                                            [v12[93]] = v12[94],
                                            [v12[95]] = v12[96]
                                        };
                                        v12[95] = "lastUsed";
                                        v12[97] = "initialDelay";
                                        v12[93] = "23";
                                        v12[98] = .4;
                                        v12[96] = 0;
                                        v12[94] = {
                                            [v12[95]] = v12[96],
                                            [v12[97]] = v12[98]
                                        };
                                        v12[90] = {
                                            [v12[91]] = v12[92],
                                            [v12[93]] = v12[94]
                                        };
                                        v12[92] = "pairs";
                                        v12[91] = Env[v12[92]];
                                        v12[95] = {
                                            v12[91](v12[90])
                                        };
                                        v12[94] = v12[95][3];
                                        v12[93] = v12[95][2];
                                        v12[92] = v12[95][1];
                                        v12[94], v12[95] = v12[92](v12[93], v12[94]);
                                        while v12[94] do
                                            v12[91] = v12[94];
                                            v12[96] = 101;
                                            v120[v12[96]] = v12[91];
                                            v12[98] = "task";
                                            v12[91] = v12[96];
                                            v12[96] = 102;
                                            v120[v12[96]] = v12[95];
                                            v12[97] = Env[v12[98]];
                                            v12[98] = "spawn";
                                            v12[95] = v12[96];
                                            v12[96] = v12[97][v12[98]];
                                            v12[98] = function(...)
                                                task.wait(v120[v12[95]].initialDelay);
                                                while true do
                                                    task.wait(.1);
                                                    if v54.General.TitanRipper then
local v118 = typeof(v120[v12[85]]) == "table" and v120[v12[85]][v120[v12[91]]];
                                                        if v118 then
local v28 = v118.Cooldown;
                                                        end;
                                                        if v118 then
                                                            if tick() - v120[v12[95]].lastUsed >= v118.Cooldown then
local v124 = pcall(function(...)
local v126 = v120[v12[84]];
                                                                    v126.InvokeServer(v126, "S_Skills", "Usage", v120[v12[91]], false);
                                                                    return; 
                                                                end);
                                                                if v124 then
                                                                    v120[v12[95]].lastUsed = tick();
                                                                end;
                                                            end;
                                                        end;
                                                    end; 
                                                end;
                                                return; 
                                            end;
                                            v12[91] = nil;
                                            v12[97] = v12[96](v12[98]);
                                            v12[95] = nil; 
                                        end;
                                        v12[91] = 13379208636;
                                        v12[95] = "game";
                                        v12[94] = Env[v12[95]];
                                        v12[95] = "PlaceId";
                                        v12[93] = v12[94][v12[95]];
                                        v12[92] = v12[93] == v12[91];
                                        if v12[92] then
                                        end;
                                        v12[54] = nil;
                                        v12[30] = nil;
                                        v12[43] = nil;
                                        v12[25] = nil;
                                        v12[37] = nil;
                                        v12[76] = nil;
                                        v12[8] = nil;
                                        v12[50] = nil;
                                        v12[40] = nil;
                                        v12[65] = nil;
                                        v12[64] = nil;
                                        v12[58] = nil;
                                        v12[62] = nil;
                                        v12[7] = nil;
                                        v12[3] = nil;
                                        v12[49] = nil;
                                        v12[21] = nil;
                                        v12[48] = nil;
                                        v12[46] = nil;
                                        v12[47] = nil;
                                        v12[53] = nil;
                                        v12[42] = nil;
                                        v12[71] = nil;
                                        v12[89] = nil;
                                        v12[13] = nil;
                                        v12[77] = nil;
                                        v12[5] = nil;
                                        v12[15] = nil;
                                        v12[31] = nil;
                                        v12[4] = nil;
                                        v12[66] = nil;
                                        v12[72] = nil;
                                        v12[38] = nil;
                                        v12[80] = nil;
                                        v12[81] = nil;
                                        v12[45] = nil;
                                        v12[28] = nil;
                                        v12[10] = nil;
                                        v12[52] = nil;
                                        v12[51] = nil;
                                        v12[84] = nil;
                                        v12[32] = nil;
                                        v12[35] = nil;
                                        v12[67] = nil;
                                        v12[34] = nil;
                                        v12[29] = nil;
                                        v12[44] = nil;
                                        v12[70] = nil;
                                        v12[20] = nil;
                                        v12[2] = nil;
                                        v12[68] = nil;
                                        v12[85] = nil;
                                        v12[14] = nil;
                                        v12[41] = nil;
                                        v12[23] = nil;
                                        v12[61] = nil;
                                        v12[63] = nil;
                                        v12[79] = nil;
                                        v12[36] = nil;
                                        v12[87] = nil;
                                        v12[86] = nil;
                                        v12[82] = nil;
                                        v12[59] = nil;
                                        v12[74] = nil;
                                        v12[75] = nil;
                                        v12[55] = nil;
                                        v12[12] = nil;
                                        v12[73] = nil;
                                        v12[90] = nil;
                                        v12[56] = nil;
                                        v12[78] = nil;
                                        v12[57] = nil;
                                        v12[69] = nil;
                                        v12[9] = nil;
                                        v12[39] = nil;
                                        v12[24] = nil;
                                        v12[33] = nil;
                                        v12[22] = nil;
                                        v12[60] = nil;
                                        v12[91] = nil;
                                        v12[17] = nil;
                                        return;
                                    end;
                                end;
                            end;
                        else
                            v12[16] = "CharacterAdded";
                            v12[15] = v12[11][v12[16]];
                            v12[16] = "Wait";
                            v12[16] = v12[15][v12[16]];
                            v12[16] = v12[16](v12[15]);
                            v12[13] = v12[16];
                        end;
                    else
                        if v12[10] then
                            v12[11] = "Disconnect";
                            v12[11] = v12[10][v12[11]];
                            v12[11] = v12[11](v12[10]);
                            v12[11] = nil;
                            v12[10] = v12[11];
                        end;
                    end;
                end;
            else
local v19 = v11.CharacterAdded;
local v27 = v19.Wait(v19);
            end;
        else
local v15 = v65.CharacterAdded;
local v28 = v15.Wait(v15);
        end;
    else
local v45 = v65.CharacterAdded;
local v28 = v45.Wait(v45);
    end;
end;