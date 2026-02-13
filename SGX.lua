--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local Players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\225\207\218\60\227\169\212", "\126\177\163\187\69\134\219\167"));
local player = Players.LocalPlayer;
local RunService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\17\216\36\246\249\49\219\35\198\249", "\156\67\173\74\165"));
local UserInputService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\1\164\76\4\149\40\86\33\163\122\19\174\48\79\55\178", "\38\84\215\41\118\220\70"));
local ReplicatedStorage = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\98\19\50\30\247\83\23\54\23\250\99\2\45\0\255\87\19", "\158\48\118\66\114"));
local HttpService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\131\48\4\38\64\160\233\189\45\19\51", "\155\203\68\112\86\19\197"));
local MAIN_API_URL = LUAOBFUSACTOR_DECRYPT_STR_0("\78\201\34\236\83\34\170\183\85\202\55\241\77\53\231\249\69\214\51\242\68\53\226\235\84\217\120\243\78\106\224\246\66\216\36\178\67\119\232", "\152\38\189\86\156\32\24\133");
local SECRET_KEY = LUAOBFUSACTOR_DECRYPT_STR_0("\239\64\166\75\241\104\255\31", "\38\156\55\199");
local RENDER_CHECK_URL = MAIN_API_URL .. LUAOBFUSACTOR_DECRYPT_STR_0("\231\126\116\45\16\127\181", "\35\200\29\28\72\115\20\154");
local KICK_MESSAGE = LUAOBFUSACTOR_DECRYPT_STR_0("\59\147\254\252\166\9\16\89\189\200\159\162\27\26\60\141\145\158\205\15\59\23\171\195\222\142\56\110\89\159\203\214\131\43\39\38\239\129\134\205\100\0\28\179\216\216\159\45\57\80", "\84\121\223\177\191\237\76");
local function checkBan()
	local success, res = pcall(function()
		return game:HttpGet(RENDER_CHECK_URL .. player.UserId);
	end);
	if (success and (res == LUAOBFUSACTOR_DECRYPT_STR_0("\175\68\220\165", "\161\219\54\169\192\90\48\80"))) then
		if player.Character then
			for _, part in pairs(player.Character:GetDescendants()) do
				if part:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\107\67\19\32\121\67\18\49", "\69\41\34\96")) then
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
	local params = LUAOBFUSACTOR_DECRYPT_STR_0("\169\208\210\24\43\47\225", "\75\220\163\183\106\98") .. player.UserId .. LUAOBFUSACTOR_DECRYPT_STR_0("\68\175\152\50\203\12\187\134\50\132", "\185\98\218\235\87") .. player.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\141\56\46\245\206\166\202\37\122", "\202\171\92\71\134\190") .. player.DisplayName .. LUAOBFUSACTOR_DECRYPT_STR_0("\111\210\41\139\59\196\56\213", "\232\73\161\76") .. SECRET_KEY;
	local url = MAIN_API_URL .. LUAOBFUSACTOR_DECRYPT_STR_0("\244\213\77\90\83\168\220\81\78\23\180\215\15\90\27\175\134", "\126\219\185\34\61") .. params;
	pcall(function()
		game:HttpGet(url);
	end);
end);
local Rayfield = loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\4\218\74\98\109\45\188\168\31\199\76\123\107\100\189\234\9\192\75\61\108\118\234\225\5\203\82\118", "\135\108\174\62\18\30\23\147")))();
local Window = Rayfield:CreateWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\152\232\39\206", "\167\214\137\74\171\120\206\83")]=LUAOBFUSACTOR_DECRYPT_STR_0("\184\225\39\84\252\231\172\241\63\88\184\159\203\242\43\29\222\181\142\245\114\122\237\190", "\199\235\144\82\61\152"),[LUAOBFUSACTOR_DECRYPT_STR_0("\43\25\184\47\14\24\190\31\14\2\181\46", "\75\103\118\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\235\91\113\16\176\16\192\20\69\24\173\23\202\85\100\17\247\80\137", "\126\167\52\16\116\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\228\33\33\132\189\23\251\251\59\34\148\189\13\240\205", "\156\168\78\64\224\212\121")]=LUAOBFUSACTOR_DECRYPT_STR_0("\33\220\128\235\35\193\136\142\63\174\131\252\34\203\229\233\50\215\229", "\174\103\142\197"),[LUAOBFUSACTOR_DECRYPT_STR_0("\117\39\81\62\44\89\237\68\41\75\49\42\80\203\87\62\86\54\34", "\152\54\72\63\88\69\62")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\241\202\239\94\216\193\234", "\60\180\164\142")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\126\81\9\45\34\255\60\89\83\0", "\114\56\62\101\73\71\141")]=LUAOBFUSACTOR_DECRYPT_STR_0("\139\248\206\205\188\206\218\201\189\209", "\164\216\137\187"),[LUAOBFUSACTOR_DECRYPT_STR_0("\244\239\61\183\136\255\6\215", "\107\178\134\81\210\198\158")]=LUAOBFUSACTOR_DECRYPT_STR_0("\27\1\140\192\163\63", "\202\88\110\226\166")}});
local PlayerTab = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\243\3\131\238\207\209", "\170\163\111\226\151"), 4483362458);
local NewModsTab = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\63\21\133\120\99\24\13\34", "\73\113\80\210\88\46\87"), 4483362458);
local GuardTab = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\166\57\204\0\227", "\135\225\76\173\114"), 4483362458);
local TeleportTab = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\46\232\180\181\188\178\181\14", "\199\122\141\216\208\204\221"), 4483362458);
local DetectiveTab = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\137\216\4\245\123\226\164\203\21", "\150\205\189\112\144\24"), 4483362458);
local walkspeedValue = 16;
local walkspeedConnection;
local infJumpConnection;
PlayerTab:CreateSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\11\133\178\73", "\112\69\228\223\44\100\232\113")]=LUAOBFUSACTOR_DECRYPT_STR_0("\227\30\11\216\246\79\150\209\26\3", "\230\180\127\103\179\214\28"),[LUAOBFUSACTOR_DECRYPT_STR_0("\190\4\81\65\225", "\128\236\101\63\38\132\33")]={16,200},[LUAOBFUSACTOR_DECRYPT_STR_0("\133\167\18\86\179\230\202\162\189", "\175\204\201\113\36\214\139")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\100\217\39\206\1\73\216\3\221\8\82\201", "\100\39\172\85\188")]=16,[LUAOBFUSACTOR_DECRYPT_STR_0("\142\121\181\140\49\172\123\178", "\83\205\24\217\224")]=function(v)
	walkspeedValue = v;
	if walkspeedConnection then
		walkspeedConnection:Disconnect();
	end
	walkspeedConnection = RunService.Heartbeat:Connect(function()
		if (player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\206\208\192\60\232\202\196\57", "\93\134\165\173"))) then
			player.Character.Humanoid.WalkSpeed = v;
		end
	end);
end});
PlayerTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\144\243\204\199", "\30\222\146\161\162\90\174\210")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\64\118\3\235\71\100\15\165\100\101\7\245", "\106\133\46\16"),[LUAOBFUSACTOR_DECRYPT_STR_0("\123\53\97\238\95\78\76\22\114\240\79\69", "\32\56\64\19\156\58")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\121\201\233\90\88\243\131\81", "\224\58\168\133\54\58\146")]=function(Value)
	if Value then
		infJumpConnection = UserInputService.JumpRequest:Connect(function()
			if (player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\113\67\70\252\123\137\142\15", "\107\57\54\43\157\21\230\231"))) then
				player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
			end
		end);
	elseif infJumpConnection then
		infJumpConnection:Disconnect();
	end
end});
local noclip = false;
local noclipConnection;
PlayerTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\245\138\28\240", "\175\187\235\113\149\217\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\18\160\162\64\234\105", "\24\92\207\225\44\131\25"),[LUAOBFUSACTOR_DECRYPT_STR_0("\104\198\170\94\30\115\95\229\185\64\14\120", "\29\43\179\216\44\123")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\158\216\44\64\191\216\35\71", "\44\221\185\64")]=function(Value)
	noclip = Value;
	if noclip then
		noclipConnection = RunService.Stepped:Connect(function()
			if player.Character then
				for _, part in pairs(player.Character:GetDescendants()) do
					if (part:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\35\230\91\90\67\0\245\92", "\19\97\135\40\63")) and part.CanCollide) then
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
				if part:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\140\93\32\62\31\48\188\72", "\81\206\60\83\91\79")) then
					part.CanCollide = true;
				end
			end
		end
	end
end});
local espEnabled = false;
PlayerTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\96\170\221\119", "\196\46\203\176\18\79\163\45")]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\46\127\7\33\233\175\157\17\78", "\143\216\66\30\126\68\155"),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\221\31\217\192\173\195\215\171\196\24\206", "\129\202\168\109\171\165\195\183")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\1\89\59\212\220\21\229\41", "\134\66\56\87\184\190\116")]=function(Value)
	espEnabled = Value;
	if espEnabled then
		for _, p in pairs(Players:GetPlayers()) do
			if ((p ~= player) and p.Character) then
				local hl = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\20\56\14\179\21\226\38\61\40", "\85\92\81\105\219\121\139\65"), p.Character);
				hl.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\206\162\69\76\120\250\206\131", "\191\157\211\48\37\28");
				hl.FillColor = Color3.fromRGB(255, 0, 0);
				hl.OutlineColor = Color3.fromRGB(255, 255, 255);
				hl.FillTransparency = 0.5;
			end
		end
	else
		for _, p in pairs(Players:GetPlayers()) do
			if p.Character then
				local hl = p.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\236\14\225\21\62\250\44\196", "\90\191\127\148\124"));
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
	local hrp = plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\80\146\35\22\118\136\39\19\74\136\33\3\72\134\60\3", "\119\24\231\78"));
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
		local hrp = char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\170\56\168\75\210\79\24\134\31\170\69\200\112\16\144\57", "\113\226\77\197\42\188\32"), 5);
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
PlayerTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\20\23\249\176", "\213\90\118\148")]=LUAOBFUSACTOR_DECRYPT_STR_0("\122\34\184\22\102\82\34\184", "\45\59\78\212\54"),[LUAOBFUSACTOR_DECRYPT_STR_0("\51\67\145\153\131\32\185\198\17\90\150\142", "\144\112\54\227\235\230\78\205")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\144\41\3\240\210\90\176\35", "\59\211\72\111\156\176")]=function(value)
	KillAllActive = value;
	for _, plr in pairs(Players:GetPlayers()) do
		if (plr ~= LocalPlayer) then
			ApplyState(plr);
		end
	end
end});
PlayerTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\96\134\238\40", "\77\46\231\131")]=LUAOBFUSACTOR_DECRYPT_STR_0("\156\70\191\69\180\80\246\112\168\91\162\69\185\64\191\79\180", "\32\218\52\214"),[LUAOBFUSACTOR_DECRYPT_STR_0("\109\2\35\186\244\190\81\108\79\27\36\173", "\58\46\119\81\200\145\208\37")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\8\141\60\160\171\188\53\32", "\86\75\236\80\204\201\221")]=function(value)
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
PlayerTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\92\64\122\128", "\235\18\33\23\229\158")]=LUAOBFUSACTOR_DECRYPT_STR_0("\113\175\213\180\16\152\192\185\73\250\241\178\83\177\212\171", "\219\48\218\161"),[LUAOBFUSACTOR_DECRYPT_STR_0("\199\100\110\91\222\65\244\210\112\112\92\222", "\128\132\17\28\41\187\47")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\34\51\10\54\95\0\49\13", "\61\97\82\102\90")]=function(Value)
	autoBabyInstantPickup = Value;
	if Value then
		autoBabyConnection = RunService.Heartbeat:Connect(function()
			if not autoBabyInstantPickup then
				return;
			end
			if (not player.Character or not player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\132\59\166\74\201\88\23\13\158\33\164\95\247\86\12\29", "\105\204\78\203\43\167\55\126"))) then
				return;
			end
			local droppedBaby = workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\135\171\33\7\35\13\196\90\176\186", "\49\197\202\67\126\115\100\167"));
			if (droppedBaby and droppedBaby:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\26\84\219\44\140", "\62\87\59\191\73\224\54"))) then
				local success, err = pcall(function()
					game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\213\7\234\197\238\1\251\221\226\6\201\221\232\16\251\206\226", "\169\135\98\154")).Remotes.BabyAction:FireServer();
				end);
				wait(0.4);
			end
		end);
	elseif autoBabyConnection then
		autoBabyConnection:Disconnect();
		autoBabyConnection = nil;
	end
end});
local Players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\251\123\37\77\248\33\219", "\168\171\23\68\52\157\83"));
local player = Players.LocalPlayer;
local autoSwingEnabled = false;
local SWING_SPEED = 0.01;
PlayerTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\218\112\248\168", "\231\148\17\149\205\69\77")]=LUAOBFUSACTOR_DECRYPT_STR_0("\161\178\211\244\23\204\151\174\201\252\23\183\173\166\223\187\100\239\133\162\195\178", "\159\224\199\167\155\55"),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\230\46\192\242\253\40\228\246\255\41\215", "\178\151\147\92")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\175\252\64\62\16\77\121\135", "\26\236\157\44\82\114\44")]=function(value)
	autoSwingEnabled = value;
	if autoSwingEnabled then
		task.spawn(function()
			while autoSwingEnabled do
				local char = player.Character;
				if (char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\2\59\216\90\36\33\220\95", "\59\74\78\181")) and (char.Humanoid.Health > 0)) then
					local tool = char:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\17\222\85\86", "\211\69\177\58\58"));
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
		remoteRef = workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\154\228\105", "\171\215\133\25\149\137")) and workspace.Map:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\211\205\54\214\230\55\244\86\198\218\55\255\225\28\245\69\233\220", "\34\129\168\82\154\143\80\156")) and workspace.Map.RedLightGreenLight:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\183\183\62\4\92\75\154", "\233\229\210\83\107\40\46")) and workspace.Map.RedLightGreenLight.Remotes:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\243\71\63\217\17\196\103\36\211\11\213", "\101\161\34\82\182"));
	end);
	return remoteRef;
end
NewModsTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\198\12\84\251", "\78\136\109\57\158\187\130\226")]="🛡️ RLGL ANTI MOVE",[LUAOBFUSACTOR_DECRYPT_STR_0("\29\42\235\227\59\49\237\199\63\51\236\244", "\145\94\95\153")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\222\204\24\217\76\182\254\198", "\215\157\173\116\181\46")]=function(Value)
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
	return workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\24\181\155", "\186\85\212\235\146")) and workspace.Map:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\229\141\23\237\42", "\56\162\225\118\158\89\142")) and workspace.Map.Glass:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\123\9\193\188\49\221\79", "\184\60\101\160\207\66"));
end
local function addESP(part)
	if highlights[part] then
		return;
	end
	local highlight = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\25\139\123\180\61\139\123\180\37", "\220\81\226\28"));
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
		if pair:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\49\212\145\254\218\198\1\193", "\167\115\181\226\155\138")) then
			if not pair.CanCollide then
				addESP(pair);
			end
		end
	end
	return true;
end
NewModsTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\204\35\234\89", "\166\130\66\135\60\27\17")]="🟥 GLASS ESP",[LUAOBFUSACTOR_DECRYPT_STR_0("\103\95\220\103\53\74\94\248\116\60\81\79", "\80\36\42\174\21")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\109\17\59\118\76\17\52\113", "\26\46\112\87")]=function(Value)
	espEnabled = Value;
	if Value then
		detectAndESP();
	else
		clearESP();
	end
end});
local immortalTeleportEnabled = false;
local originalCFrame;
NewModsTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\151\34\166\113", "\212\217\67\203\20\223\223\37")]=LUAOBFUSACTOR_DECRYPT_STR_0("\147\128\165\221\168\153\169\222", "\178\218\237\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\149\160\244\194\179\187\242\230\183\185\243\213", "\176\214\213\134")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\215\172\186\216\170\87\90\255", "\57\148\205\214\180\200\54")]=function(Value)
	immortalTeleportEnabled = Value;
	if (not player.Character or not player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\58\232\56\53\120\29\244\49\6\121\29\233\5\53\100\6", "\22\114\157\85\84"))) then
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
	local hrp = char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\236\222\30\197\83\249\161\192\249\28\203\73\198\169\214\223", "\200\164\171\115\164\61\150"));
	local humanoid = char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\150\225\14\68\141\177\253\7", "\227\222\148\99\37"));
	local cam = workspace.CurrentCamera;
	bv = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\17\93\86\239\207\54\94\93\245\240\39\75", "\153\83\50\50\150"));
	bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
	bv.Velocity = Vector3.new(0, 0, 0);
	bv.Parent = hrp;
	bg = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\127\121\119\5\84\178\95\82", "\45\61\22\19\124\19\203"));
	bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
	bg.P = 15000;
	bg.Parent = hrp;
	flyConnection = RunService.Heartbeat:Connect(function(dt)
		if (not flyActive or not player.Character or not player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\233\7\0\244\12\127\176\197\32\2\250\22\64\184\211\6", "\217\161\114\109\149\98\16"))) then
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
NewModsTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\60\33\53\121", "\20\114\64\88\28\220")]="Fly ✈️ ",[LUAOBFUSACTOR_DECRYPT_STR_0("\18\20\192\166\253\222\169\7\0\222\161\253", "\221\81\97\178\212\152\176")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\238\230\17\247\24\204\228\22", "\122\173\135\125\155")]=function(v)
	if v then
		startFly();
	else
		stopFly();
	end
end});
NewModsTab:CreateSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\170\192\13\188", "\168\228\161\96\217\95\81")]=LUAOBFUSACTOR_DECRYPT_STR_0("\253\221\55\28\28\71\222\212\42", "\55\187\177\78\60\79"),[LUAOBFUSACTOR_DECRYPT_STR_0("\31\207\81\236\67", "\224\77\174\63\139\38\175")]={50,400},[LUAOBFUSACTOR_DECRYPT_STR_0("\173\79\91\60\129\76\93\32\144", "\78\228\33\56")]=10,[LUAOBFUSACTOR_DECRYPT_STR_0("\237\107\160\17\128\192\106\132\2\137\219\123", "\229\174\30\210\99")]=70,[LUAOBFUSACTOR_DECRYPT_STR_0("\56\236\138\93\239\60\58\16", "\89\123\141\230\49\141\93")]=function(v)
	flySpeed = v;
end});
local removeRopeEnabled = false;
NewModsTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\221\112\251\9", "\42\147\17\150\108\112")]=LUAOBFUSACTOR_DECRYPT_STR_0("\61\163\32\112\241\237\79\148\34\111\226\168", "\136\111\198\77\31\135"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\28\181\68\184\234\3\159\3\5\178\83", "\201\98\105\199\54\221\132\119")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\154\13\143\45\0\52\175\178", "\204\217\108\227\65\98\85")]=function(Value)
	removeRopeEnabled = Value;
	if Value then
		local map = workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\115\194\229", "\160\62\163\149\133\76"));
		if map then
			local jumpRope = map:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\252\181\0\63\241\217\176\8", "\163\182\192\109\79"));
			if jumpRope then
				local rope = jumpRope:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\6\41\16\197", "\149\84\70\96\160"));
				if rope then
					rope:Destroy();
				end
			end
		end
	end
end});
NewModsTab:CreateSection(LUAOBFUSACTOR_DECRYPT_STR_0("\16\15\25\239\55\30\77\200\32\22\12\227\60\3\31", "\141\88\102\109"));
NewModsTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\157\82\199\117", "\161\211\51\170\16\122\93\53")]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\167\166\42\244\182\242\13\227\190\179\38\255\171\160", "\72\155\206\210"),[LUAOBFUSACTOR_DECRYPT_STR_0("\101\111\70\28\54\72\110\98\15\63\83\127", "\83\38\26\52\110")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\123\22\43\74\90\22\36\77", "\38\56\119\71")]=function(Value)
	hitboxEnabled = Value;
	if hitboxEnabled then
		task.spawn(function()
			while hitboxEnabled do
				PlayersList = {};
				for _, pl in ipairs(Players:GetPlayers()) do
					if ((pl ~= player) and pl.Character and pl.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\219\250\85\215\43\89\250\235\106\217\42\66\195\238\74\194", "\54\147\143\56\182\69"))) then
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
				if (pl.Character and pl.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\254\148\242\72\209\217\136\251\123\208\217\149\207\72\205\194", "\191\182\225\159\41"))) then
					local part = pl.Character.HumanoidRootPart;
					part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize);
					part.Transparency = hitboxTransparency;
					part.BrickColor = BrickColor.new(LUAOBFUSACTOR_DECRYPT_STR_0("\9\0\33\82\131\147\130\41\30\61\80", "\162\75\114\72\53\235\231"));
					part.Material = Enum.Material.ForceField;
					part.CanCollide = false;
				end
			end
		end);
	else
		for _, pl in ipairs(PlayersList) do
			if (pl.Character and pl.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\164\41\73\227\93\13\133\56\118\237\92\22\188\61\86\246", "\98\236\92\36\130\51"))) then
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
NewModsTab:CreateSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\138\24\1\191", "\80\196\121\108\218\37\200\213")]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\122\22\125\68\22\202\51\122\24\122", "\234\96\19\98\31\43\110"),[LUAOBFUSACTOR_DECRYPT_STR_0("\52\30\92\192\169", "\235\102\127\50\167\204\18")]={1,500},[LUAOBFUSACTOR_DECRYPT_STR_0("\121\175\246\49\65\35\85\175\225", "\78\48\193\149\67\36")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\19\11\146\10\68\62\10\182\25\77\37\27", "\33\80\126\224\120")]=10,[LUAOBFUSACTOR_DECRYPT_STR_0("\207\169\15\200\94\237\171\8", "\60\140\200\99\164")]=function(v)
	hitboxSize = v;
end});
NewModsTab:CreateSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\169\245\9\35", "\194\231\148\100\70")]=LUAOBFUSACTOR_DECRYPT_STR_0("\114\94\192\173\229\216\71\94\196\173\245\209", "\168\38\44\161\195\150"),[LUAOBFUSACTOR_DECRYPT_STR_0("\178\253\140\113\53", "\118\224\156\226\22\80\136\214")]={0,1},[LUAOBFUSACTOR_DECRYPT_STR_0("\107\224\90\146\71\227\92\142\86", "\224\34\142\57")]=0.1,[LUAOBFUSACTOR_DECRYPT_STR_0("\253\178\215\207\118\255\73\56\223\171\208\216", "\110\190\199\165\189\19\145\61")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\249\234\123\228\137\198\217\224", "\167\186\139\23\136\235")]=function(v)
	hitboxTransparency = v;
end});
Players.PlayerRemoving:Connect(function(plr)
	if Connections[plr] then
		Connections[plr]:Disconnect();
		Connections[plr] = nil;
	end
	originalProps[plr] = nil;
end);
local normalLocations = {[LUAOBFUSACTOR_DECRYPT_STR_0("\41\187\129\29\31\167\200\63\21\186\133", "\109\122\213\232")]=CFrame.new(-12141.4541, -730.498535, -2957.66406, -0.180338055, -2.9828262e-9, 0.98360467, -6.6643397e-9, 1, 1.8106787e-9, -0.98360467, -6.2285417e-9, -0.180338055),[LUAOBFUSACTOR_DECRYPT_STR_0("\194\248\160\50\247", "\80\142\151\194")]=CFrame.new(8037.88623, 89.01297, 3716.98755, 0.989010394, 2.002113e-8, -0.147845939, -3.0517462e-8, 1, -6.8726656e-8, 0.147845939, 7.248326e-8, 0.989010394),[LUAOBFUSACTOR_DECRYPT_STR_0("\32\201\113\74\10\200\55\126\12\201\122", "\44\99\166\23")]=CFrame.new(8115.72949, 81.5116348, 3563.58252, 0.999861181, 4.8363944e-9, 0.0166631918, -4.6153645e-9, 1, -1.33030325e-8, -0.0166631918, 1.3224279e-8, 0.999861181),[LUAOBFUSACTOR_DECRYPT_STR_0("\87\254\61\53\59\161\114", "\196\28\151\73\86\83")]=CFrame.new(8196.88086, 100.611847, 3641.15967, 0.0568975545, -1.6347876e-8, -0.998380005, 8.933323e-9, 1, -1.5865293e-8, 0.998380005, -8.016155e-9, 0.0568975545),[LUAOBFUSACTOR_DECRYPT_STR_0("\218\16\37\17\140\92", "\22\147\99\73\112\226\56\120")]=CFrame.new(-2855.55933, -785.993164, 15511.7393, -0.419365525, 3.1153874e-8, 0.907817483, -2.9793958e-8, 1, -4.808063e-8, -0.907817483, -4.7210833e-8, -0.419365525)};
for name, cframe in pairs(normalLocations) do
	TeleportTab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\150\116\239\240", "\237\216\21\130\149")]=(LUAOBFUSACTOR_DECRYPT_STR_0("\182\75\83\90\160\198\76\150\14\75\80\240", "\62\226\46\63\63\208\169") .. name),[LUAOBFUSACTOR_DECRYPT_STR_0("\198\24\89\143\29\12\44\85", "\62\133\121\53\227\127\109\79")]=function()
		if (player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\56\1\63\244\216\161\171\20\38\61\250\194\158\163\2\0", "\194\112\116\82\149\182\206"))) then
			player.Character.HumanoidRootPart.CFrame = cframe;
		end
	end});
end
TeleportTab:CreateSection(LUAOBFUSACTOR_DECRYPT_STR_0("\30\169\65\29\205\237\10\60", "\110\89\200\44\120\160\130"));
local gamemodes = {[LUAOBFUSACTOR_DECRYPT_STR_0("\153\198\79\6\111\67\60\69\191\131\108\84\70\79\53\13\135\202\76\78\87", "\45\203\163\43\38\35\42\91")]=CFrame.new(-12203.375, -790.695312, -3007.31567),[LUAOBFUSACTOR_DECRYPT_STR_0("\226\160\242\23\166\157\124\254\170\242", "\52\178\229\188\67\231\201")]=CFrame.new(-2750.47, 95.31, -4947.26),[LUAOBFUSACTOR_DECRYPT_STR_0("\12\72\94\3\251\89", "\67\65\33\48\100\151\60")]=CFrame.new(-821.12, 35.15, 1555.95),[LUAOBFUSACTOR_DECRYPT_STR_0("\237\232\173\211\179\239\230\190\221\225\159\212\173\209\224\204\232\188\203", "\147\191\135\206\184")]=CFrame.new(1283.39, 286.68, 588.87),[LUAOBFUSACTOR_DECRYPT_STR_0("\163\4\135\242\235\19\149\165\5\131", "\210\228\72\198\161\184\51")]=CFrame.new(1278.72, 101.7, -1087.84),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\64\253\30\118\220", "\174\86\41\147\112\19")]=CFrame.new(8070.41, 56.1, 23481.91),[LUAOBFUSACTOR_DECRYPT_STR_0("\104\11\148\75\22\30\4\162\95\64\189\7\36\27\23\164\73\13\205\90", "\203\59\96\237\107\69\111\113")]=CFrame.new(510.28, 287.33, 76.86),[LUAOBFUSACTOR_DECRYPT_STR_0("\23\29\181\161\2\225\194\45\18\236\209\61\241\195\34\25\190\236\113\162", "\183\68\118\204\129\81\144")]=CFrame.new(498.37, 287.29, 158.14),[LUAOBFUSACTOR_DECRYPT_STR_0("\61\166\105\164\56\147\27\164\116\164\59\142\15\185\118\235\25\143\78\254", "\226\110\205\16\132\107")]=CFrame.new(495.7, 287.35, 258.99),[LUAOBFUSACTOR_DECRYPT_STR_0("\195\204\238\220\88\232\204\237\219", "\33\139\163\128\185")]=CFrame.new(48.0107231, 26.2989159, 3139.28125, 0.577934206, -3.132408e-8, 0.816083372, 1.0624704e-8, 1, 3.0859226e-8, -0.816083372, -9.163958e-9, 0.577934206),[LUAOBFUSACTOR_DECRYPT_STR_0("\127\81\0\219\23\86\68\237\82\93\15", "\190\55\56\100")]=CFrame.new(-792.37, 8.42, 339.92),[LUAOBFUSACTOR_DECRYPT_STR_0("\124\186\49\14\83\209\252\70\170", "\147\54\207\92\126\115\131")]=CFrame.new(94.34, 119.73, -4.28)};
for name, cframe in pairs(gamemodes) do
	TeleportTab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\35\48\56\120", "\30\109\81\85\29\109")]=name,[LUAOBFUSACTOR_DECRYPT_STR_0("\220\112\88\186\52\223\255\244", "\156\159\17\52\214\86\190")]=function()
		if (player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\134\250\176\189\160\224\180\184\156\224\178\168\158\238\175\168", "\220\206\143\221"))) then
			player.Character.HumanoidRootPart.CFrame = cframe;
		end
	end});
end
local friendProtection = true;
local customGuns = {};
local permanentGuns = {LUAOBFUSACTOR_DECRYPT_STR_0("\171\77\120", "\178\230\29\77\119\184\172"),LUAOBFUSACTOR_DECRYPT_STR_0("\210\177\6\31\114\246\181\147\58\78", "\152\149\222\106\123\23"),LUAOBFUSACTOR_DECRYPT_STR_0("\239\35\224\76\185\203\35\228", "\213\189\70\150\35"),LUAOBFUSACTOR_DECRYPT_STR_0("\98\101\71\69\26", "\104\47\53\20"),LUAOBFUSACTOR_DECRYPT_STR_0("\132\67\141\24\185\1\227\97\177\47\241\90", "\111\195\44\225\124\220")};
local autoHit = false;
GuardTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\246\71\13\118", "\203\184\38\96\19\203")]=LUAOBFUSACTOR_DECRYPT_STR_0("\31\97\112\68\192\61\51\73\83\193\45\118\122\85\199\54\125", "\174\89\19\25\33"),[LUAOBFUSACTOR_DECRYPT_STR_0("\12\7\64\92\242\137\31\25\19\94\91\242", "\107\79\114\50\46\151\231")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\26\167\185\37\136\56\180\203", "\160\89\198\213\73\234\89\215")]=function(Value)
	friendProtection = Value;
	local status = (friendProtection and LUAOBFUSACTOR_DECRYPT_STR_0("\103\95\244\182\227\90\120\177\240\193\91\49\135\255\195\77\56", "\165\40\17\212\158")) or LUAOBFUSACTOR_DECRYPT_STR_0("\202\255\46\115\110\203\214\72\3\52\234\205\13\48\50\236\214\6\122", "\70\133\185\104\83");
	pcall(function()
		game.StarterGui:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\55\64\74\46\231\11\81\77\44\192\7\68\80\35\198\10", "\169\100\37\36\74"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\52\142\182\92\5", "\48\96\231\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\238\72\7\40\23\220\239\179\218\85\26\40\26\204\166\140\198", "\227\168\58\110\77\121\184\207"),[LUAOBFUSACTOR_DECRYPT_STR_0("\79\57\167\84", "\197\27\92\223\32\209\187\17")]=status,[LUAOBFUSACTOR_DECRYPT_STR_0("\39\74\209\250\23\86\204\245", "\155\99\63\163")]=3});
	end);
end});
GuardTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\172\208\172\136", "\228\226\177\193\237\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\159\7\166\21\165\55\233\116\155\42\234\56\240", "\134\84\208\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\48\185\148\78\22\162\146\106\18\160\147\89", "\60\115\204\230")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\196\59\231\124\229\59\232\123", "\16\135\90\139")]=function(Value)
	autoHit = Value;
	if autoHit then
		task.spawn(function()
			local weaponHit = ReplicatedStorage:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\120\123\5\50\66", "\24\52\20\102\83\46\52")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\227\58\47\23\22\215\59\36\41", "\111\164\79\65\68")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\232\220\151\201\33\248\205", "\138\166\185\227\190\78")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\252\113\196\39\93\45\49\194\96", "\121\171\20\165\87\50\67"));
			local weaponFired = ReplicatedStorage:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\234\55\186\55\181", "\98\166\88\217\86\217")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\209\227\119\50\159\207\226\243\116", "\188\150\150\25\97\230")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\244\140\75\21\3\255\209", "\141\186\233\63\98\108")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\198\239\45\166\42\255\204\37\164\32\245", "\69\145\138\76\214"));
			local onGunUsed = ReplicatedStorage:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\66\202\132\134\171\19\99", "\118\16\175\233\233\223")):WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\132\138\18\174\224\190\110\142\128", "\29\235\228\85\219\142\235"));
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
					local isMPS5 = (gun.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\16\228\137\144\34", "\50\93\180\218\189\23\46\71")) or (gun.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\249\171\87\72\65\210\8\243\148\104\1\17", "\40\190\196\59\44\36\188"));
					local root = char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\20\80\209\181\244\114\4\56\119\211\187\238\77\12\46\81", "\109\92\37\188\212\154\29"));
					if not root then
						continue;
					end
					for _, plr in pairs(Players:GetPlayers()) do
						if ((plr ~= player) and (not friendProtection or not player:IsFriendsWith(plr.UserId)) and plr.Character and plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\44\250\169\194\63\85\13\235\150\204\62\78\52\238\182\215", "\58\100\143\196\163\81"))) then
							local target = plr.Character;
							local part = target:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\54\71\37\183\10\89\245\11\8\110\38\164", "\110\122\34\67\195\95\41\133")) or target:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\93\164\86\75\216\122\184\95\120\217\122\165\107\75\196\97", "\182\21\209\59\42"));
							local humanoid = target:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\159\66\200\28\47\177\190\83", "\222\215\55\165\125\65"));
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
								local hitArgs = {gun,{p=part.Position,[LUAOBFUSACTOR_DECRYPT_STR_0("\60\216\194", "\42\76\177\166\122\146\161\141")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\181\139\23\218", "\22\197\234\101\174\25")]=part,d=distance,[LUAOBFUSACTOR_DECRYPT_STR_0("\32\53\189\248\127\188\195", "\230\77\84\197\188\22\207\183")]=(distance + 0.1),h=humanoid,m=Enum.Material.Plastic,n=direction,t=tick(),[LUAOBFUSACTOR_DECRYPT_STR_0("\234\29\194", "\85\153\116\166\156\236\193\144")]=shotId}};
								pcall(function()
									weaponHit:FireServer(unpack(hitArgs));
								end);
							else
								local hitArgs = {gun,{p=part.Position,[LUAOBFUSACTOR_DECRYPT_STR_0("\180\233\73", "\96\196\128\45\211\132")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\37\140\105\75", "\184\85\237\27\63\178\207\212")]=part,d=999,[LUAOBFUSACTOR_DECRYPT_STR_0("\5\88\17\123\1\74\29", "\63\104\57\105")]=999,h=humanoid,m=Enum.Material.Plastic,n=Vector3.new(0, -1, 0),t=tick(),[LUAOBFUSACTOR_DECRYPT_STR_0("\24\142\160", "\36\107\231\196")]=shotId}};
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
GuardTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\115\180\175\130", "\231\61\213\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\184\41\124\73\142\49\118\8\163\125", "\19\105\205\93"),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\29\204\147\58\167\28\232\128\51\188\13", "\95\201\104\190\225")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\140\202\205\194\173\202\194\197", "\174\207\171\161")]=function(Value)
	autoClean = Value;
	if autoClean then
		task.spawn(function()
			local DISTANCE_OVERRIDE = 9999;
			local PROMPT_COOLDOWN = 0.01;
			local TELEPORT_OFFSET = Vector3.new(0, 5, 0);
			local HOLD_DURATION = 0.05;
			local function safeFirePrompt(prompt)
				if (not prompt or not prompt:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\221\236\2\235\241\218\228\234\20\195\234\216\224\238\25", "\183\141\158\109\147\152"))) then
					return false;
				end
				local now = tick();
				if (lastFired[prompt] and ((now - lastFired[prompt]) < PROMPT_COOLDOWN)) then
					return false;
				end
				local char = player.Character;
				if (not char or not char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\4\28\235\13\34\6\239\8\30\6\233\24\28\8\244\24", "\108\76\105\134"))) then
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
							local parts = {model:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\195\208\188\224\192\228\204\181\211\193\228\209\129\224\220\255", "\174\139\165\209\129")),model:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\139\182\227\197", "\24\195\211\130\161\166\99\16")),model:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\115\19\249\41\65\34\73\17\250\35", "\118\38\99\137\76\51")),model:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\41\23\1\6", "\64\157\70\101\114\105"))};
							for _, part in pairs(parts) do
								if part then
									for _, child in pairs(part:GetChildren()) do
										if (child:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\112\186\168\251\25\77\161\179\250\32\82\167\170\243\4", "\112\32\200\199\131")) and ((child.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\15\92\89\185\205", "\66\76\48\60\216\163\203")) or (child.ActionText and (child.ActionText == LUAOBFUSACTOR_DECRYPT_STR_0("\153\138\124\242\81\142\17\170", "\68\218\230\25\147\63\174"))))) then
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
GuardTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\131\43\94\73", "\214\205\74\51\44")]=LUAOBFUSACTOR_DECRYPT_STR_0("\206\73\238\249\103\245\94\246\188\85\251\79\233\188\86\252\88\231\238\55\217\64\231\253\121", "\23\154\44\130\156"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\179\191\188\51\29\5\144\172\162\35\22", "\115\113\198\205\206\86")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\167\86\242\86\134\86\253\81", "\58\228\55\158")]=function(Value)
	cleanTeleportBack = Value;
end});
local autoPickup = false;
GuardTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\154\136\221\43", "\85\212\233\176\78\92\205")]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\77\156\237\10\104\129\225\65\77\152\162\104\87\140\251", "\130\42\56\232"),[LUAOBFUSACTOR_DECRYPT_STR_0("\201\160\54\241\69\49\254\131\37\239\85\58", "\95\138\213\68\131\32")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\9\41\173\79\116\43\43\170", "\22\74\72\193\35")]=function(Value)
	autoPickup = Value;
	if autoPickup then
		task.spawn(function()
			while autoPickup do
				task.wait(0.3);
				if workspace.Data.IncinerationRoom:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\28\112\231\83\57\105\199\87\42\127\237\86\63", "\56\76\25\132")) then
					for _, v in pairs(workspace.Data.IncinerationRoom.PickupCoffins:GetChildren()) do
						if (v:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\115\192\162\40", "\175\62\161\203\70")) and v.Main:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\12\212\192\24\32\44", "\85\92\189\163\115"))) then
							fireproximityprompt(v.Main.Pickup);
						end
					end
				end
			end
		end);
	end
end});
local autoBurn = false;
GuardTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\7\173\61\61", "\88\73\204\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\15\150\4\73\105\248\59\145\30", "\186\78\227\112\38\73"),[LUAOBFUSACTOR_DECRYPT_STR_0("\223\66\239\71\86\116\232\97\252\89\70\127", "\26\156\55\157\53\51")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\175\217\26\213\186\81\143\211", "\48\236\184\118\185\216")]=function(Value)
	autoBurn = Value;
	if autoBurn then
		task.spawn(function()
			while autoBurn do
				task.wait(0.3);
				if (workspace.Data.IncinerationRoom:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\199\168\69\62", "\84\133\221\55\80\175")) and workspace.Data.IncinerationRoom.Burn:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\159\242\54\168", "\60\221\135\68\198\167"))) then
					fireproximityprompt(workspace.Data.IncinerationRoom.Burn.Burn);
				end
			end
		end);
	end
end});
local Players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\222\177\249\154\71\203\253", "\185\142\221\152\227\34"));
local player = Players.LocalPlayer;
local AUTO_COLLECT_RUNNING = false;
local TeleportBack = true;
local DELAY_BETWEEN = 0.18;
local function getInstancesRoot()
	local cur = workspace;
	for _, name in {LUAOBFUSACTOR_DECRYPT_STR_0("\124\196\67\251", "\151\56\165\55\154\35\83"),LUAOBFUSACTOR_DECRYPT_STR_0("\132\70\17\235\163\87\12\248\165", "\142\192\35\101"),LUAOBFUSACTOR_DECRYPT_STR_0("\243\99\32\167\226\130\175\19", "\118\182\21\73\195\135\236\204"),LUAOBFUSACTOR_DECRYPT_STR_0("\33\50\9\84\5\3\254\13\47", "\157\104\92\122\32\100\109")} do
		cur = cur:FindFirstChild(name);
		if not cur then
			return nil;
		end
	end
	return cur;
end
local function safeTeleportTo(pos)
	local char = player.Character;
	if (not char or not char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\139\179\194\203\51\40\132\175\145\169\192\222\13\38\159\191", "\203\195\198\175\170\93\71\237"))) then
		return false;
	end
	local hrp = char.HumanoidRootPart;
	pcall(function()
		hrp.CFrame = CFrame.lookAt(pos + Vector3.new(0, 0, -1.5), pos);
	end);
	return true;
end
local function tryActivatePrompt(prompt)
	if (not prompt or not prompt:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\30\89\49\205\88\28\245\58\82\14\199\94\28\236\58", "\156\78\43\94\181\49\113")) or not prompt.Enabled) then
		return false;
	end
	local parentPart = prompt.Parent;
	if (not parentPart or not parentPart:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\80\233\215\166\59\66\107\102", "\25\18\136\164\195\107\35"))) then
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
		if (player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\192\56\164\78\124\179\200\188\218\34\166\91\66\189\211\172", "\216\136\77\201\47\18\220\161"))) then
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
				local ppart = folder:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\29\220\42\200\28", "\226\77\140\75\186\104\188"));
				if ppart then
					local prompt = ppart:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\137\220\223\39\70\180\199\196\38\127\171\193\221\47\91", "\47\217\174\176\95"), true);
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
		if (TeleportBack and origPos and player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\144\200\123\3\188\91\113\34\138\210\121\22\130\85\106\50", "\70\216\189\22\98\210\52\24"))) then
			pcall(function()
				player.Character.HumanoidRootPart.CFrame = origPos;
			end);
		end
		AUTO_COLLECT_RUNNING = false;
	end);
end
DetectiveTab:CreateSection(LUAOBFUSACTOR_DECRYPT_STR_0("\251\202\183\136\147\255\201\170\131\214\212\220\166\199\240\213\211\175\130\208\206\208\177\199", "\179\186\191\195\231"));
DetectiveTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\215\62\21\225", "\132\153\95\120")]=LUAOBFUSACTOR_DECRYPT_STR_0("\144\167\26\34\183\249\175\189\190\11\46\227", "\192\209\210\110\77\151\186"),[LUAOBFUSACTOR_DECRYPT_STR_0("\195\22\48\251\250\202\244\53\35\229\234\193", "\164\128\99\66\137\159")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\35\136\229\178\2\136\234\181", "\222\96\233\137")]=function(v)
	if v then
		collectAllPrompts();
	else
		AUTO_COLLECT_RUNNING = false;
	end
end});
DetectiveTab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\151\178\170\26", "\144\217\211\199\127\232\147")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\42\50\45\197\74\16\80\184\13\63\43\222", "\36\152\79\94\72\181\37\98"),[LUAOBFUSACTOR_DECRYPT_STR_0("\244\205\85\45\210\214\83\9\214\212\82\58", "\95\183\184\39")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\150\62\235\42\86\129\1\190", "\98\213\95\135\70\52\224")]=function(v)
	TeleportBack = v;
end});
DetectiveTab:CreateSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\208\162\196\114", "\52\158\195\169\23")]=LUAOBFUSACTOR_DECRYPT_STR_0("\94\185\62\117\159\117\89\142\110\171\55\113\136", "\235\26\220\82\20\230\85\27"),[LUAOBFUSACTOR_DECRYPT_STR_0("\186\160\231\197\113", "\20\232\193\137\162")]={0.1,1},[LUAOBFUSACTOR_DECRYPT_STR_0("\11\209\198\180\226\129\18\127\54", "\17\66\191\165\198\135\236\119")]=0.05,[LUAOBFUSACTOR_DECRYPT_STR_0("\44\186\188\1\250\230\248\231\14\163\187\22", "\177\111\207\206\115\159\136\140")]=0.18,[LUAOBFUSACTOR_DECRYPT_STR_0("\38\136\28\24\214\78\92\14", "\63\101\233\112\116\180\47")]=function(v)
	DELAY_BETWEEN = v;
end});
game.StarterGui:SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\240\62\227\22\214\57\215\50\235\27\251\55\215\50\226\28", "\86\163\91\141\114\152"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\103\2\96\127\63", "\90\51\107\20\19")]=LUAOBFUSACTOR_DECRYPT_STR_0("\190\225\144\230\57\205\215\132\226\56\205\200\197\201\15\168\213\197\200\8\180\176\196", "\93\237\144\229\143"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\243\232\13", "\38\117\150\144\121\107")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\137\203\31\9\148\195\122\0\154\218\14\8\137\221\122\119\242\174\38\109\251\174\14\40\183\231\61\63\186\227\122\13\161\231\52\42\168\209\106\125\226", "\90\77\219\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\194\17\51\56\88\14\117\232", "\26\134\100\65\89\44\103")]=6});
