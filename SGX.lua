--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local Players = game:GetService("Players");
local player = Players.LocalPlayer;
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local HttpService = game:GetService("HttpService");
local MAIN_API_URL = "https://swamm-backend-gsrd.onrender.com";
local SECRET_KEY = "swamm_89";
local RENDER_CHECK_URL = MAIN_API_URL .. "/check/";
local KICK_MESSAGE = "BLOCKED by SWAMM! Contract: @zings007 (Discord)";
local function checkBan()
	local success, res = pcall(function()
		return game:HttpGet(RENDER_CHECK_URL .. player.UserId);
	end);
	if (success and (res == "true")) then
		if player.Character then
			for _, part in pairs(player.Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Anchored = true;
				end
			end
		end
		task.wait(1.5);
		player:Kick(KICK_MESSAGE);
		while true do
			task.wait(10);
		end
	end
end
RunService.Heartbeat:Connect(checkBan);
player.CharacterAdded:Connect(function()
	task.wait(2);
	checkBan();
end);
task.spawn(function()
	task.wait(2);
	local params = "userId=" .. player.UserId .. "&username=" .. player.Name .. "&display=" .. player.DisplayName .. "&secret=" .. SECRET_KEY;
	local url = MAIN_API_URL .. "/log-session-get?" .. params;
	pcall(function()
		game:HttpGet(url);
	end);
end);
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))();
local Window = Rayfield:CreateWindow({Name="Squid Game X by SWAMM",LoadingTitle="Loading Ultimate...",LoadingSubtitle="Your Control Edition",ConfigurationSaving={Enabled=true,FolderName="SquidGameX",FileName="Config"}});
local PlayerTab = Window:CreateTab("Player", 4483362458);
local NewModsTab = Window:CreateTab("NEW MODS", 4483362458);
local GuardTab = Window:CreateTab("Guard", 4483362458);
local TeleportTab = Window:CreateTab("Teleport", 4483362458);
local DetectiveTab = Window:CreateTab("Detective", 4483362458);
local walkspeedValue = 16;
local walkspeedConnection;
local infJumpConnection;
PlayerTab:CreateSlider({Name="Walk Speed",Range={16,200},Increment=1,CurrentValue=16,Callback=function(v)
	walkspeedValue = v;
	if walkspeedConnection then
		walkspeedConnection:Disconnect();
	end
	walkspeedConnection = RunService.Heartbeat:Connect(function()
		if (player.Character and player.Character:FindFirstChild("Humanoid")) then
			player.Character.Humanoid.WalkSpeed = v;
		end
	end);
end});
PlayerTab:CreateToggle({Name="Infinite Jump",CurrentValue=false,Callback=function(Value)
	if Value then
		infJumpConnection = UserInputService.JumpRequest:Connect(function()
			if (player.Character and player.Character:FindFirstChild("Humanoid")) then
				player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
			end
		end);
	elseif infJumpConnection then
		infJumpConnection:Disconnect();
	end
end});
local noclip = false;
local noclipConnection;
PlayerTab:CreateToggle({Name="NoClip",CurrentValue=false,Callback=function(Value)
	noclip = Value;
	if noclip then
		noclipConnection = RunService.Stepped:Connect(function()
			if player.Character then
				for _, part in pairs(player.Character:GetDescendants()) do
					if (part:IsA("BasePart") and part.CanCollide) then
						part.CanCollide = false;
					end
				end
			end
		end);
	else
		if noclipConnection then
			noclipConnection:Disconnect();
		end
		if player.Character then
			for _, part in pairs(player.Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true;
				end
			end
		end
	end
end});
local espEnabled = false;
PlayerTab:CreateToggle({Name="Player ESP",CurrentValue=false,Callback=function(Value)
	espEnabled = Value;
	if espEnabled then
		for _, p in pairs(Players:GetPlayers()) do
			if ((p ~= player) and p.Character) then
				local hl = Instance.new("Highlight", p.Character);
				hl.Name = "SquidESP";
				hl.FillColor = Color3.fromRGB(255, 0, 0);
				hl.OutlineColor = Color3.fromRGB(255, 255, 255);
				hl.FillTransparency = 0.5;
			end
		end
	else
		for _, p in pairs(Players:GetPlayers()) do
			if p.Character then
				local hl = p.Character:FindFirstChild("SquidESP");
				if hl then
					hl:Destroy();
				end
			end
		end
	end
end});
local Players = game.Players;
local LocalPlayer = Players.LocalPlayer;
local KillAllActive = false;
local FriendProtect = true;
local OriginalSizes = {};
local Connections = {};
local function ApplyState(plr)
	if ((plr == LocalPlayer) or not plr.Character) then
		return;
	end
	local hrp = plr.Character:FindFirstChild("HumanoidRootPart");
	if not hrp then
		return;
	end
	if not OriginalSizes[plr] then
		OriginalSizes[plr] = hrp.Size;
	end
	local isFriend = FriendProtect and plr:IsFriendsWith(LocalPlayer.UserId);
	if KillAllActive then
		if isFriend then
			hrp.Size = OriginalSizes[plr] or Vector3.new(2, 2, 1);
			hrp.CanCollide = true;
		else
			hrp.Size = Vector3.new(500, 500, 500);
			hrp.CanCollide = false;
		end
	else
		hrp.Size = OriginalSizes[plr] or Vector3.new(2, 2, 1);
		hrp.CanCollide = true;
	end
end
local function SetupPlayer(plr)
	local charConn;
	charConn = plr.CharacterAdded:Connect(function(char)
		local hrp = char:WaitForChild("HumanoidRootPart", 5);
		if hrp then
			ApplyState(plr);
		end
	end);
	if plr.Character then
		task.spawn(function()
			ApplyState(plr);
		end);
	end
	Connections[plr] = charConn;
end
local playerAddedConn = Players.PlayerAdded:Connect(SetupPlayer);
for _, plr in pairs(Players:GetPlayers()) do
	if (plr ~= LocalPlayer) then
		SetupPlayer(plr);
	end
end
PlayerTab:CreateToggle({Name="All Kill",CurrentValue=false,Callback=function(value)
	KillAllActive = value;
	for _, plr in pairs(Players:GetPlayers()) do
		if (plr ~= LocalPlayer) then
			ApplyState(plr);
		end
	end
end});
PlayerTab:CreateToggle({Name="Friend Protection",CurrentValue=true,Callback=function(value)
	FriendProtect = value;
	if KillAllActive then
		for _, plr in pairs(Players:GetPlayers()) do
			if (plr ~= LocalPlayer) then
				ApplyState(plr);
			end
		end
	end
end});
Players.PlayerRemoving:Connect(function(plr)
	if Connections[plr] then
		Connections[plr]:Disconnect();
		Connections[plr] = nil;
	end
	OriginalSizes[plr] = nil;
end);
local autoBabyInstantPickup = false;
local autoBabyConnection;
PlayerTab:CreateToggle({Name="Auto Baby Pickup",CurrentValue=false,Callback=function(Value)
	autoBabyInstantPickup = Value;
	if Value then
		autoBabyConnection = RunService.Heartbeat:Connect(function()
			if not autoBabyInstantPickup then
				return;
			end
			if (not player.Character or not player.Character:FindFirstChild("HumanoidRootPart")) then
				return;
			end
			local droppedBaby = workspace:FindFirstChild("BabyPickup");
			if (droppedBaby and droppedBaby:IsA("Model")) then
				local success, err = pcall(function()
					game:GetService("ReplicatedStorage").Remotes.BabyAction:FireServer();
				end);
				wait(0.4);
			end
		end);
	elseif autoBabyConnection then
		autoBabyConnection:Disconnect();
		autoBabyConnection = nil;
	end
end});
local Players = game:GetService("Players");
local player = Players.LocalPlayer;
local autoSwingEnabled = false;
local SWING_SPEED = 0.01;
PlayerTab:CreateToggle({Name="Auto Swing (Max Speed)",CurrentValue=false,Callback=function(value)
	autoSwingEnabled = value;
	if autoSwingEnabled then
		task.spawn(function()
			while autoSwingEnabled do
				local char = player.Character;
				if (char and char:FindFirstChild("Humanoid") and (char.Humanoid.Health > 0)) then
					local tool = char:FindFirstChildWhichIsA("Tool");
					if tool then
						pcall(function()
							tool:Activate();
						end);
					end
				end
				task.wait(SWING_SPEED);
			end
		end);
	end
end});
local antiDetectEnabled = false;
local remoteRef = nil;
local originalRemoteParent = nil;
local function getRemote()
	if remoteRef then
		return remoteRef;
	end
	pcall(function()
		remoteRef = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("RedLightGreenLight") and workspace.Map.RedLightGreenLight:FindFirstChild("Remotes") and workspace.Map.RedLightGreenLight.Remotes:FindFirstChild("RemoteEvent");
	end);
	return remoteRef;
end
NewModsTab:CreateToggle({Name="🛡️ RLGL ANTI MOVE",CurrentValue=false,Callback=function(Value)
	antiDetectEnabled = Value;
	local remote = getRemote();
	if not remote then
		antiDetectEnabled = false;
		return;
	end
	if Value then
		originalRemoteParent = remote.Parent;
		remote.Parent = nil;
	elseif originalRemoteParent then
		remote.Parent = originalRemoteParent;
		originalRemoteParent = nil;
	end
end});
local espEnabled = false;
local highlights = {};
local function getGlasses()
	return workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Glass") and workspace.Map.Glass:FindFirstChild("Glasses");
end
local function addESP(part)
	if highlights[part] then
		return;
	end
	local highlight = Instance.new("Highlight");
	highlight.FillColor = Color3.fromRGB(255, 0, 0);
	highlight.OutlineColor = Color3.fromRGB(255, 255, 0);
	highlight.FillTransparency = 0.4;
	highlight.OutlineTransparency = 0;
	highlight.Parent = part;
	highlights[part] = highlight;
end
local function clearESP()
	for part, hl in pairs(highlights) do
		if (hl and hl.Parent) then
			hl:Destroy();
		end
	end
	highlights = {};
end
local function detectAndESP()
	clearESP();
	local glasses = getGlasses();
	if not glasses then
		return false;
	end
	for _, pair in pairs(glasses:GetChildren()) do
		if pair:IsA("BasePart") then
			if not pair.CanCollide then
				addESP(pair);
			end
		end
	end
	return true;
end
NewModsTab:CreateToggle({Name="🟥 GLASS ESP",CurrentValue=false,Callback=function(Value)
	espEnabled = Value;
	if Value then
		detectAndESP();
	else
		clearESP();
	end
end});
local immortalTeleportEnabled = false;
local originalCFrame;
NewModsTab:CreateToggle({Name="Immortal",CurrentValue=false,Callback=function(Value)
	immortalTeleportEnabled = Value;
	if (not player.Character or not player.Character:FindFirstChild("HumanoidRootPart")) then
		return;
	end
	if Value then
		originalCFrame = player.Character.HumanoidRootPart.CFrame;
		local oobPosition = Vector3.new(-1042.6, 1325.88, -2147.48);
		player.Character.HumanoidRootPart.CFrame = CFrame.new(oobPosition) * CFrame.new(0, 5, 0);
		player.Character.Humanoid.Health = math.huge;
	else
		if originalCFrame then
			player.Character.HumanoidRootPart.CFrame = originalCFrame;
		else
			player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0);
		end
		player.Character.Humanoid.Health = 100;
	end
end});
local flyActive = false;
local flySpeed = 70;
local bv, bg;
local flyConnection;
local function startFly()
	if flyActive then
		return;
	end
	flyActive = true;
	local char = player.Character or player.CharacterAdded:Wait();
	local hrp = char:WaitForChild("HumanoidRootPart");
	local humanoid = char:WaitForChild("Humanoid");
	local cam = workspace.CurrentCamera;
	bv = Instance.new("BodyVelocity");
	bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
	bv.Velocity = Vector3.new(0, 0, 0);
	bv.Parent = hrp;
	bg = Instance.new("BodyGyro");
	bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
	bg.P = 15000;
	bg.Parent = hrp;
	flyConnection = RunService.Heartbeat:Connect(function(dt)
		if (not flyActive or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart")) then
			return;
		end
		local move = Vector3.new(0, 0, 0);
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			move = move + cam.CFrame.LookVector;
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			move = move - cam.CFrame.LookVector;
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			move = move - cam.CFrame.RightVector;
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			move = move + cam.CFrame.RightVector;
		end
		if UserInputService.TouchEnabled then
			local joystickDir = humanoid.MoveDirection;
			if (joystickDir.Magnitude > 0.05) then
				move = joystickDir * flySpeed;
			end
		end
		if ((move.Magnitude > 0) and not UserInputService.TouchEnabled) then
			move = move.Unit * flySpeed;
		end
		local verticalVelocity = 0;
		if (humanoid.Jump or UserInputService:IsKeyDown(Enum.KeyCode.Space)) then
			verticalVelocity = flySpeed * 1.2;
		end
		bv.Velocity = Vector3.new(move.X, verticalVelocity, move.Z);
		bg.CFrame = cam.CFrame;
		if (hrp.Velocity.Y < -50) then
			bv.Velocity = Vector3.new(move.X, flySpeed, move.Z);
		end
	end);
end
local function stopFly()
	flyActive = false;
	if flyConnection then
		flyConnection:Disconnect();
		flyConnection = nil;
	end
	if bv then
		bv:Destroy();
		bv = nil;
	end
	if bg then
		bg:Destroy();
		bg = nil;
	end
end
player.CharacterAdded:Connect(function()
	task.wait(2);
	if flyActive then
		startFly();
	end
end);
NewModsTab:CreateToggle({Name="Fly ✈️ ",CurrentValue=false,Callback=function(v)
	if v then
		startFly();
	else
		stopFly();
	end
end});
NewModsTab:CreateSlider({Name="Fly Speed",Range={50,400},Increment=10,CurrentValue=70,Callback=function(v)
	flySpeed = v;
end});
local removeRopeEnabled = false;
NewModsTab:CreateToggle({Name="Remove Rope ",CurrentValue=false,Callback=function(Value)
	removeRopeEnabled = Value;
	if Value then
		local map = workspace:FindFirstChild("Map");
		if map then
			local jumpRope = map:FindFirstChild("JumpRope");
			if jumpRope then
				local rope = jumpRope:FindFirstChild("Rope");
				if rope then
					rope:Destroy();
				end
			end
		end
	end
end});
NewModsTab:CreateSection("Hitbox Expander");
NewModsTab:CreateToggle({Name="Hitbox Expander",CurrentValue=false,Callback=function(Value)
	hitboxEnabled = Value;
	if hitboxEnabled then
		task.spawn(function()
			while hitboxEnabled do
				PlayersList = {};
				for _, pl in ipairs(Players:GetPlayers()) do
					if ((pl ~= player) and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart")) then
						table.insert(PlayersList, pl);
					end
				end
				task.wait(2);
			end
		end);
		hitboxConnection = RunService.Heartbeat:Connect(function()
			if not hitboxEnabled then
				return;
			end
			for _, pl in ipairs(PlayersList) do
				if (pl.Character and pl.Character:FindFirstChild("HumanoidRootPart")) then
					local part = pl.Character.HumanoidRootPart;
					part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize);
					part.Transparency = hitboxTransparency;
					part.BrickColor = BrickColor.new("Bright blue");
					part.Material = Enum.Material.ForceField;
					part.CanCollide = false;
				end
			end
		end);
	else
		for _, pl in ipairs(PlayersList) do
			if (pl.Character and pl.Character:FindFirstChild("HumanoidRootPart")) then
				local part = pl.Character.HumanoidRootPart;
				part.Size = Vector3.new(2, 2, 1);
				part.Transparency = 0;
				part.CanCollide = true;
			end
		end
		if hitboxConnection then
			hitboxConnection:Disconnect();
		end
	end
end});
NewModsTab:CreateSlider({Name="Hitbox Size",Range={1,500},Increment=1,CurrentValue=10,Callback=function(v)
	hitboxSize = v;
end});
NewModsTab:CreateSlider({Name="Transparency",Range={0,1},Increment=0.1,CurrentValue=1,Callback=function(v)
	hitboxTransparency = v;
end});
Players.PlayerRemoving:Connect(function(plr)
	if Connections[plr] then
		Connections[plr]:Disconnect();
		Connections[plr] = nil;
	end
	originalProps[plr] = nil;
end);
local normalLocations = {["Sniper Room"]=CFrame.new(-12141.4541, -730.498535, -2957.66406, -0.180338055, -2.9828262e-9, 0.98360467, -6.6643397e-9, 1, 1.8106787e-9, -0.98360467, -6.2285417e-9, -0.180338055),Lobby=CFrame.new(8037.88623, 89.01297, 3716.98755, 0.989010394, 2.002113e-8, -0.147845939, -3.0517462e-8, 1, -6.8726656e-8, 0.147845939, 7.248326e-8, 0.989010394),["Coffin Room"]=CFrame.new(8115.72949, 81.5116348, 3563.58252, 0.999861181, 4.8363944e-9, 0.0166631918, -4.6153645e-9, 1, -1.33030325e-8, -0.0166631918, 1.3224279e-8, 0.999861181),Kitchen=CFrame.new(8196.88086, 100.611847, 3641.15967, 0.0568975545, -1.6347876e-8, -0.998380005, 8.933323e-9, 1, -1.5865293e-8, 0.998380005, -8.016155e-9, 0.0568975545),Island=CFrame.new(-2855.55933, -785.993164, 15511.7393, -0.419365525, 3.1153874e-8, 0.907817483, -2.9793958e-8, 1, -4.808063e-8, -0.907817483, -4.7210833e-8, -0.419365525)};
for name, cframe in pairs(normalLocations) do
	TeleportTab:CreateButton({Name=("Teleport to " .. name),Callback=function()
		if (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
			player.Character.HumanoidRootPart.CFrame = cframe;
		end
	end});
end
TeleportTab:CreateSection("Gamemode");
local gamemodes = {["Red Light Green Light"]=CFrame.new(-12203.375, -790.695312, -3007.31567),PENTATHLON=CFrame.new(-2750.47, 95.31, -4947.26),Mingle=CFrame.new(-821.12, 35.15, 1555.95),["Rock Paper Scissors"]=CFrame.new(1283.39, 286.68, 588.87),["GLASS GAME"]=CFrame.new(1278.72, 101.7, -1087.84),Dinner=CFrame.new(8070.41, 56.1, 23481.91),["Sky Squid Platform 1"]=CFrame.new(510.28, 287.33, 76.86),["Sky Squid Platform 2"]=CFrame.new(498.37, 287.29, 158.14),["Sky Squid Platform 3"]=CFrame.new(495.7, 287.35, 258.99),Honeycomb=CFrame.new(48.0107231, 26.2989159, 3139.28125, 0.577934206, -3.132408e-8, 0.816083372, 1.0624704e-8, 1, 3.0859226e-8, -0.816083372, -9.163958e-9, 0.577934206),["Hide n Seek"]=CFrame.new(-792.37, 8.42, 339.92),["Jump Rope"]=CFrame.new(94.34, 119.73, -4.28)};
for name, cframe in pairs(gamemodes) do
	TeleportTab:CreateButton({Name=name,Callback=function()
		if (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
			player.Character.HumanoidRootPart.CFrame = cframe;
		end
	end});
end
local friendProtection = true;
local customGuns = {};
local permanentGuns = {"MP5","Golden MP5","Revolver","MPS-5","Golden MPS-5"};
local autoHit = false;
GuardTab:CreateToggle({Name="Friend Protection",CurrentValue=true,Callback=function(Value)
	friendProtection = Value;
	local status = (friendProtection and "ON (Friends Safe)") or "OFF (No Protection)";
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {Title="Friend Protection",Text=status,Duration=3});
	end);
end});
GuardTab:CreateToggle({Name="GOD Auto Kill ",CurrentValue=false,Callback=function(Value)
	autoHit = Value;
	if autoHit then
		task.spawn(function()
			local weaponHit = ReplicatedStorage:WaitForChild("Local"):WaitForChild("GunSystem"):WaitForChild("Network"):WaitForChild("WeaponHit");
			local weaponFired = ReplicatedStorage:WaitForChild("Local"):WaitForChild("GunSystem"):WaitForChild("Network"):WaitForChild("WeaponFired");
			local onGunUsed = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("onGunUsed");
			while autoHit do
				task.wait(0.15);
				local char = player.Character or player.CharacterAdded:Wait();
				local backpack = player.Backpack;
				local gun;
				for _, name in ipairs(permanentGuns) do
					gun = backpack:FindFirstChild(name) or char:FindFirstChild(name);
					if gun then
						break;
					end
				end
				if not gun then
					for _, name in ipairs(customGuns) do
						gun = backpack:FindFirstChild(name) or char:FindFirstChild(name);
						if gun then
							break;
						end
					end
				end
				if gun then
					local isMPS5 = (gun.Name == "MPS-5") or (gun.Name == "Golden MPS-5");
					local root = char:FindFirstChild("HumanoidRootPart");
					if not root then
						continue;
					end
					for _, plr in pairs(Players:GetPlayers()) do
						if ((plr ~= player) and (not friendProtection or not player:IsFriendsWith(plr.UserId)) and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) then
							local target = plr.Character;
							local part = target:FindFirstChild("LeftUpperLeg") or target:FindFirstChild("HumanoidRootPart");
							local humanoid = target:FindFirstChild("Humanoid");
							if not (part and humanoid) then
								continue;
							end
							local distance = (root.Position - part.Position).Magnitude;
							local direction = (part.Position - root.Position).Unit;
							local shotId = (isMPS5 and math.random(10, 99)) or math.random(100, 999);
							if isMPS5 then
								pcall(function()
									onGunUsed:FireServer();
								end);
								local firedArgs = {gun,{root.Position,direction,Vector2.new(0, math.random(20, 50))}};
								pcall(function()
									weaponFired:FireServer(unpack(firedArgs));
								end);
								local hitArgs = {gun,{p=part.Position,pid=1,part=part,d=distance,maxDist=(distance + 0.1),h=humanoid,m=Enum.Material.Plastic,n=direction,t=tick(),sid=shotId}};
								pcall(function()
									weaponHit:FireServer(unpack(hitArgs));
								end);
							else
								local hitArgs = {gun,{p=part.Position,pid=1,part=part,d=999,maxDist=999,h=humanoid,m=Enum.Material.Plastic,n=Vector3.new(0, -1, 0),t=tick(),sid=shotId}};
								pcall(function()
									weaponHit:FireServer(unpack(hitArgs));
								end);
							end
						end
					end
				end
			end
		end);
	end
end});
local autoClean = false;
local cleanTeleportBack = true;
local lastFired = {};
GuardTab:CreateToggle({Name="Auto Clean ",CurrentValue=false,Callback=function(Value)
	autoClean = Value;
	if autoClean then
		task.spawn(function()
			local DISTANCE_OVERRIDE = 9999;
			local PROMPT_COOLDOWN = 0.01;
			local TELEPORT_OFFSET = Vector3.new(0, 5, 0);
			local HOLD_DURATION = 0.05;
			local function safeFirePrompt(prompt)
				if (not prompt or not prompt:IsA("ProximityPrompt")) then
					return false;
				end
				local now = tick();
				if (lastFired[prompt] and ((now - lastFired[prompt]) < PROMPT_COOLDOWN)) then
					return false;
				end
				local char = player.Character;
				if (not char or not char:FindFirstChild("HumanoidRootPart")) then
					return false;
				end
				local hrp = char.HumanoidRootPart;
				local origPos = hrp.CFrame;
				local origDist = (pcall(function()
					return prompt.MaxActivationDistance;
				end) and prompt.MaxActivationDistance) or 10;
				local origEnabled = prompt.Enabled;
				local origLOS = prompt.RequiresLineOfSight;
				local origHold = prompt.HoldDuration;
				pcall(function()
					prompt.MaxActivationDistance = DISTANCE_OVERRIDE;
					prompt.Enabled = true;
					prompt.RequiresLineOfSight = false;
					prompt.HoldDuration = HOLD_DURATION;
				end);
				local targetPos = prompt.Parent.Position + TELEPORT_OFFSET;
				pcall(function()
					hrp.CFrame = CFrame.new(targetPos);
				end);
				local fired = pcall(function()
					fireproximityprompt(prompt, HOLD_DURATION);
				end);
				task.wait(0.01);
				if cleanTeleportBack then
					pcall(function()
						hrp.CFrame = origPos;
					end);
				end
				task.wait(0.005);
				pcall(function()
					prompt.MaxActivationDistance = origDist;
					prompt.Enabled = origEnabled;
					prompt.RequiresLineOfSight = origLOS;
					prompt.HoldDuration = origHold;
				end);
				lastFired[prompt] = tick();
				return fired;
			end
			RunService.Heartbeat:Connect(function()
				if not autoClean then
					return;
				end
				for _, plr in pairs(Players:GetPlayers()) do
					if (plr ~= player) then
						local model = workspace:FindFirstChild(plr.Name);
						if model then
							local parts = {model:FindFirstChild("HumanoidRootPart"),model:FindFirstChild("Head"),model:FindFirstChild("UpperTorso"),model:FindFirstChild("Torso")};
							for _, part in pairs(parts) do
								if part then
									for _, child in pairs(part:GetChildren()) do
										if (child:IsA("ProximityPrompt") and ((child.Name == "Clean") or (child.ActionText and (child.ActionText == "Clean Up")))) then
											safeFirePrompt(child);
										end
									end
								end
							end
						end
					end
				end
			end);
		end);
	end
end});
GuardTab:CreateToggle({Name="Teleport Back After Clean",CurrentValue=true,Callback=function(Value)
	cleanTeleportBack = Value;
end});
local autoPickup = false;
GuardTab:CreateToggle({Name="Auto Pickup Body",CurrentValue=false,Callback=function(Value)
	autoPickup = Value;
	if autoPickup then
		task.spawn(function()
			while autoPickup do
				task.wait(0.3);
				if workspace.Data.IncinerationRoom:FindFirstChild("PickupCoffins") then
					for _, v in pairs(workspace.Data.IncinerationRoom.PickupCoffins:GetChildren()) do
						if (v:FindFirstChild("Main") and v.Main:FindFirstChild("Pickup")) then
							fireproximityprompt(v.Main.Pickup);
						end
					end
				end
			end
		end);
	end
end});
local autoBurn = false;
GuardTab:CreateToggle({Name="Auto Burn",CurrentValue=false,Callback=function(Value)
	autoBurn = Value;
	if autoBurn then
		task.spawn(function()
			while autoBurn do
				task.wait(0.3);
				if (workspace.Data.IncinerationRoom:FindFirstChild("Burn") and workspace.Data.IncinerationRoom.Burn:FindFirstChild("Burn")) then
					fireproximityprompt(workspace.Data.IncinerationRoom.Burn.Burn);
				end
			end
		end);
	end
end});
local Players = game:GetService("Players");
local player = Players.LocalPlayer;
local AUTO_COLLECT_RUNNING = false;
local TeleportBack = true;
local DELAY_BETWEEN = 0.18;
local function getInstancesRoot()
	local cur = workspace;
	for _, name in {"Data","Detective","Evidence","Instances"} do
		cur = cur:FindFirstChild(name);
		if not cur then
			return nil;
		end
	end
	return cur;
end
local function safeTeleportTo(pos)
	local char = player.Character;
	if (not char or not char:FindFirstChild("HumanoidRootPart")) then
		return false;
	end
	local hrp = char.HumanoidRootPart;
	pcall(function()
		hrp.CFrame = CFrame.lookAt(pos + Vector3.new(0, 0, -1.5), pos);
	end);
	return true;
end
local function tryActivatePrompt(prompt)
	if (not prompt or not prompt:IsA("ProximityPrompt") or not prompt.Enabled) then
		return false;
	end
	local parentPart = prompt.Parent;
	if (not parentPart or not parentPart:IsA("BasePart")) then
		return false;
	end
	local hold = prompt.HoldDuration or 0;
	if not safeTeleportTo(parentPart.Position) then
		return false;
	end
	task.wait(0.25);
	local attempts = 0;
	while (attempts < 3) and prompt.Enabled do
		pcall(function()
			if (hold > 0) then
				fireproximityprompt(prompt, hold);
			else
				fireproximityprompt(prompt);
			end
		end);
		task.wait(0.12 + hold);
		attempts = attempts + 1;
	end
	return not prompt.Enabled;
end
local function collectAllPrompts()
	if AUTO_COLLECT_RUNNING then
		return;
	end
	AUTO_COLLECT_RUNNING = true;
	task.spawn(function()
		local root = getInstancesRoot();
		if not root then
			AUTO_COLLECT_RUNNING = false;
			return;
		end
		local origPos = nil;
		if (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
			origPos = player.Character.HumanoidRootPart.CFrame;
		end
		local noCollectCount = 0;
		while AUTO_COLLECT_RUNNING and (noCollectCount < 6) do
			local collectedThisLoop = 0;
			local folders = root:GetChildren();
			for i = #folders, 2, -1 do
				local j = math.random(1, i);
				folders[i], folders[j] = folders[j], folders[i];
			end
			for _, folder in ipairs(folders) do
				if not AUTO_COLLECT_RUNNING then
					break;
				end
				local ppart = folder:FindFirstChild("PPart");
				if ppart then
					local prompt = ppart:FindFirstChildWhichIsA("ProximityPrompt", true);
					if prompt then
						if tryActivatePrompt(prompt) then
							collectedThisLoop = collectedThisLoop + 1;
						end
						task.wait(DELAY_BETWEEN);
					end
				end
			end
			if (collectedThisLoop == 0) then
				noCollectCount = noCollectCount + 1;
				task.wait(0.8);
			else
				noCollectCount = 0;
			end
		end
		if (TeleportBack and origPos and player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
			pcall(function()
				player.Character.HumanoidRootPart.CFrame = origPos;
			end);
		end
		AUTO_COLLECT_RUNNING = false;
	end);
end
DetectiveTab:CreateSection("Auto Evidence Collector ");
DetectiveTab:CreateToggle({Name="Auto Collect",CurrentValue=false,Callback=function(v)
	if v then
		collectAllPrompts();
	else
		AUTO_COLLECT_RUNNING = false;
	end
end});
DetectiveTab:CreateToggle({Name="Teleport Back",CurrentValue=true,Callback=function(v)
	TeleportBack = v;
end});
DetectiveTab:CreateSlider({Name="Delay Between",Range={0.1,1},Increment=0.05,CurrentValue=0.18,Callback=function(v)
	DELAY_BETWEEN = v;
end});
game.StarterGui:SetCore("SendNotification", {Title="Squid Game X FREE GUY !",Text="GOD SCRIPT BY SWAMM| Follow @zings007!",Duration=6});
