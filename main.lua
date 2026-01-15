-- ts file was generated at discord.gg/25ms

local v1 = loadstring(game:HttpGet('https://raw.githubusercontent.com/OopssSorry/LuaU-Free-Key-System-UI/main/source.lua'))()
local u2 = false
local _Init = v1.Init
local v5 = {
    Debug = false,
    Title = "Goth's Da Hood Autofarm",
    Description = nil,
    Link = 'https://link-target.net/1362252/GZSSqGWgfU4V',
    Discord = 'test',
    SaveKey = false,
    Verify = function(p4)
        if p4 ~= '0191kva81nd71mt9' then
            return false
        end

        u2 = true

        return true
    end,
    GuiParent = game:GetService('CoreGui'),
}

if _Init(v1, v5) and u2 then
    if not _G.EXC or _G.EXC ~= '@inf_v12' then
        _G.EXC = '@inf_v12'

        if not game:IsLoaded() then
            game.Loaded:Wait()
        end

        local _Players = game:GetService('Players')
        local _RunService = game:GetService('RunService')
        local _UserInputService = game:GetService('UserInputService')
        local _CoreGui = game:GetService('CoreGui')
        local _LocalPlayer = _Players.LocalPlayer

        if not _LocalPlayer then
            _Players.PlayerAdded:Wait()

            _LocalPlayer = _Players.LocalPlayer
        end

        local _Cashiers = workspace.Cashiers
        local _CurrentCamera = workspace.CurrentCamera
        local u13 = false
        local _Value = _LocalPlayer.DataFolder.Currency.Value
        local u15 = os.time()
        local u16 = 0
        local u17 = nil
        local u18 = nil

        local function u20(p19)
            print(os.date('%X') .. " | infusade's da hood autofarm - " .. p19)
        end
        local function u22(p21)
            return tostring(p21):reverse():gsub('(...)', '%1,'):reverse():gsub('^,', '')
        end
        local function u24(p23)
            if p23 and _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('Head') then
                return (p23.Position - _LocalPlayer.Character.Head.Position).Magnitude
            else
                return math.huge
            end
        end
        local function u89(p25)
            if p25 then
                u20('Character loaded. Initializing autofarm.')

                if u17 then
                    u17:Disconnect()

                    u17 = nil
                end

                local _Humanoid = p25:WaitForChild('Humanoid')
                local _HumanoidRootPart = p25:WaitForChild('HumanoidRootPart')
                local u28 = {}

                if u18 then
                    u18:Destroy()
                end

                u18 = Instance.new('Highlight', p25)
                u18.FillColor = Color3.fromRGB(255, 0, 0)
                u18.OutlineColor = Color3.fromRGB(0, 0, 0)
                u18.FillTransparency = 0.5
                u18.OutlineTransparency = 0
                u18.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

                if _G.IkuFarmCashierMap then
                    u20('Persistent ATM map found. Applying names...')

                    local v29 = _Cashiers
                    local v30, v31, v32 = ipairs(v29:GetChildren())

                    while true do
                        local v33, v34 = v30(v31, v32)

                        if v33 == nil then
                            break
                        end

                        v32 = v33

                        if v34.Name == 'CA$HIER' and v34:FindFirstChild('Head') then
                            local _Position = v34.Head.Position
                            local _d_d_d = string.format('%d_%d_%d', math.round(_Position.X), math.round(_Position.Y), math.round(_Position.Z))

                            if _G.IkuFarmCashierMap[_d_d_d] then
                                v34.Name = _G.IkuFarmCashierMap[_d_d_d]
                            end
                        end
                    end

                    u20('Existing names applied.')
                else
                    _G.IkuFarmCashierMap = {}

                    u20('First run in this server: Generating persistent ATM map.')

                    local v37 = _Cashiers
                    local v38, v39, v40 = ipairs(v37:GetChildren())
                    local v41 = {}
                    local v42 = {}

                    while true do
                        local v43

                        v40, v43 = v38(v39, v40)

                        if v40 == nil then
                            break
                        end
                        if v43.Name == 'CA$HIER' and v43:FindFirstChild('Head') then
                            local _Position2 = v43.Head.Position
                            local _d_d_d2 = string.format('%d_%d_%d', math.round(_Position2.X), math.round(_Position2.Y), math.round(_Position2.Z))

                            v41[_d_d_d2] = v43

                            table.insert(v42, _d_d_d2)
                        end
                    end

                    table.sort(v42)

                    local v46, v47, v48 = ipairs(v42)

                    while true do
                        local v49

                        v48, v49 = v46(v47, v48)

                        if v48 == nil then
                            break
                        end

                        local v50 = 'atm' .. v48

                        _G.IkuFarmCashierMap[v49] = v50
                        v41[v49].Name = v50

                        u20('Mapped ' .. v49 .. ' to ' .. v50)
                    end

                    u20('Cashier mapping complete.')
                end

                _Humanoid.Seated:Connect(function(p51)
                    if p51 then
                        _Humanoid.Sit = false
                    end
                end)
                _RunService.Heartbeat:Connect(function()
                    if p25 and (_Humanoid and _Humanoid.Health > 0) then
                        local _BodyEffects = p25:FindFirstChild('BodyEffects')

                        if _BodyEffects then
                            _BodyEffects = p25.BodyEffects:FindFirstChild('K.O')
                        end
                        if _Humanoid.Health < 30 or _BodyEffects and _BodyEffects.Value then
                            _Humanoid.Health = 0

                            antiStompConnection:Disconnect()
                        end
                    else
                        antiStompConnection:Disconnect()
                    end
                end)

                local function u53()
                    return (not p25 or (not _Humanoid or _Humanoid.Health <= 0)) and true or false
                end
                local function u62()
                    local _huge = math.huge
                    local v55 = _Cashiers
                    local v56, v57, v58 = pairs(v55:GetChildren())
                    local v59 = nil

                    while true do
                        local v60

                        v58, v60 = v56(v57, v58)

                        if v58 == nil then
                            break
                        end
                        if v60:IsA('Model') and (v60.Name:match('^atm') and (v60:FindFirstChild('Humanoid') and (v60.Humanoid.Health > 0 and not table.find(u28, v60.Name)))) then
                            local v61 = u24(v60.Head)

                            if v61 < _huge then
                                v59 = v60
                                _huge = v61
                            end
                        end
                    end

                    return v59
                end
                local function u64()
                    if u53() then
                        return
                    else
                        local v63 = p25:FindFirstChild('Combat') or _LocalPlayer.Backpack:FindFirstChild('Combat')

                        if v63 then
                            if v63.Parent == _LocalPlayer.Backpack then
                                v63.Parent = p25

                                task.wait(0.5)
                            end

                            v63:Activate()

                            if tonumber(_G.AutofarmSettings.AttackMode) == 1 then
                                task.wait()
                                v63:Deactivate()
                            end
                        end
                    end
                end

                task.spawn(function()
                    while not (u53() or u13) do
                        if u17 then
                            u17:Disconnect()

                            u17 = nil
                        end

                        local u65 = u62()

                        if not u65 then
                            _CurrentCamera.CameraSubject = _Humanoid
                            u17 = _RunService.Heartbeat:Connect(function()
                                if u62() or (u53() or u13) then
                                    if u17 then
                                        u17:Disconnect()

                                        u17 = nil
                                    end
                                else
                                    pcall(function()
                                        _HumanoidRootPart.CFrame = CFrame.new(math.random(-9000000000, 9000000000), math.random(500, 99000), math.random(-9000000000, 9000000000))
                                    end)
                                end
                            end)

                            repeat
                                task.wait(0.5)
                            until not u17 or (u53() or u13)

                            if u53() or u13 then
                                break
                            end

                            u65 = u62()
                        end

                        local v66, v67, v68 = ipairs(u65:GetDescendants())
                        local v69 = -6.5

                        while true do
                            local v70

                            v68, v70 = v66(v67, v68)

                            if v68 == nil then
                                break
                            end
                            if v70:IsA('Part') and v70:FindFirstChild('Decal') then
                                u20('Decal found, using lower Y-offset.')

                                v69 = -10.4

                                break
                            end
                        end

                        local v71 = _G.AutofarmSettings.CustomOffsets[u65.Name] or CFrame.new()
                        local u72 = os.time()
                        local u73 = false
                        local u74 = u65.Head.CFrame * v71 * CFrame.new(0, v69, 0.8) * CFrame.Angles(math.rad(90), 0, math.rad(90))

                        _CurrentCamera.CameraType = Enum.CameraType.Custom
                        _CurrentCamera.CameraSubject = u65.Head
                        u17 = _RunService.Heartbeat:Connect(function()
                            if u65 and (pcall(function()
                                return u65.Humanoid.Health
                            end) and (u65.Humanoid.Health > 0 and not (u53() or u13))) then
                                if os.time() - u72 <= 15 or (not u65 or u65.Humanoid.Health <= 0) then
                                    pcall(function()
                                        _HumanoidRootPart.CFrame = u74
                                    end)
                                else
                                    u20(u65.Name .. ' timed out, adding to blacklist.')
                                    table.insert(u28, u65.Name)

                                    u73 = true
                                end
                            else
                                u73 = true

                                return
                            end
                        end)

                        local u75 = u74

                        while not (u73 or u13) do
                            u64()
                            task.wait(0.15)
                        end

                        if u53() or u13 then
                            if u17 then
                                u17:Disconnect()

                                u17 = nil
                            end
                        end
                        if u65 and u65.Humanoid.Health <= 0 then
                            u16 = u16 + 1

                            local _Position3 = u65.Head.Position
                            local v77 = tick()

                            while tick() - v77 < 0.7 and not (u53() or u13) do
                                pcall(function()
                                    _HumanoidRootPart.CFrame = u75
                                end)
                                _RunService.Heartbeat:Wait()
                            end

                            if u17 then
                                u17:Disconnect()

                                u17 = nil
                            end

                            local v78, v79, v80 = pairs(workspace.Ignored.Drop:GetChildren())
                            local v81 = {}

                            while true do
                                local v82

                                v80, v82 = v78(v79, v80)

                                if v80 == nil then
                                    break
                                end
                                if v82.Name == 'MoneyDrop' and (v82:FindFirstChild('ClickDetector') and (v82.Position - _Position3).Magnitude < 25) then
                                    table.insert(v81, v82)
                                end
                            end

                            if #v81 > 0 then
                                local v83, v84, v85 = ipairs(v81)

                                while true do
                                    local v86

                                    v85, v86 = v83(v84, v85)

                                    if v85 == nil or (not v86 or (not v86.Parent or (u53() or u13))) then
                                        break
                                    end

                                    local v87 = tick()

                                    _CurrentCamera.CameraSubject = v86

                                    while v86.Parent and (tick() - v87 < 15 and not (u53() or u13)) do
                                        local u88 = CFrame.new(v86.Position - Vector3.new(0, 15, 0)) * CFrame.Angles(math.rad(90), 0, 0)

                                        pcall(function()
                                            _HumanoidRootPart.CFrame = u88
                                        end)
                                        fireclickdetector(v86.ClickDetector)
                                        _RunService.Heartbeat:Wait()
                                    end

                                    if v86.Parent then
                                        u20('Warning: Failed to collect a cash drop, skipping.')
                                    end
                                end
                            end
                        end

                        _CurrentCamera.CameraSubject = _Humanoid
                    end

                    u20('Autofarm loop stopped.')
                end)
            end
        end

        _LocalPlayer.CharacterAdded:Connect(function(p90)
            _CurrentCamera.CameraType = Enum.CameraType.Custom

            if u18 then
                u18:Destroy()
            end

            u89(p90)
        end)

        if _LocalPlayer.Character then
            u89(_LocalPlayer.Character)
        end

        _RunService.Heartbeat:Connect(function()
            if _UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and (_UserInputService:IsKeyDown(Enum.KeyCode.L) and not u13) then
                u20('Shutdown sequence initiated.')

                u13 = true

                if u17 then
                    u17:Disconnect()
                end
                if u18 then
                    u18:Destroy()
                end

                local v91 = _CurrentCamera
                local _Character = _LocalPlayer.Character

                if _Character then
                    _Character = _LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                end

                v91.CameraSubject = _Character
                _CurrentCamera.CameraType = Enum.CameraType.Custom
            end
        end)
        task.spawn(function()
            local v93 = loadstring(game:HttpGet('https://raw.githubusercontent.com/applless/RandomScripts/main/Webhookk'))()

            while not u13 do
                task.wait((_G.AutofarmSettings.LogInterval or 15) * 60)

                local v94 = '| Wallet - $' .. u22(_LocalPlayer.DataFolder.Currency.Value)
                local v95 = '| Profit - $' .. u22(_LocalPlayer.DataFolder.Currency.Value - _Value)
                local v96 = '| Passed - ' .. os.date('!%H:%M:%S', os.time() - u15)
                local v97 = '| ATMs - ' .. tostring(u16)

                pcall(v93, _G.AutofarmSettings.Webhook, {
                    _LocalPlayer.Name,
                    _LocalPlayer.UserId,
                    v94,
                    v95,
                    v96,
                    v97,
                    '| Da Hood autofarm by infusade',
                })
            end
        end)

        if _G.AutofarmSettings.disableScreen then
            u20('Stats UI Initialized.')
            _RunService:Set3dRenderingEnabled(false)

            local _ScreenGui = Instance.new('ScreenGui')

            _ScreenGui.Name = 'StatsGUI'
            _ScreenGui.Parent = _CoreGui
            _ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
            _ScreenGui.DisplayOrder = 999999999
            _ScreenGui.ResetOnSpawn = false
            _ScreenGui.IgnoreGuiInset = true

            local _Frame = Instance.new('Frame')

            _Frame.Name = 'Background'
            _Frame.Parent = _ScreenGui
            _Frame.BackgroundColor3 = Color3.new(0, 0, 0)
            _Frame.Size = UDim2.new(1, 0, 1, 0)

            local _Frame2 = Instance.new('Frame')

            _Frame2.Name = 'StarsContainer'
            _Frame2.Parent = _Frame
            _Frame2.BackgroundTransparency = 1
            _Frame2.Size = UDim2.new(1, 0, 1, 0)

            local u101 = u16

            for _ = 1, 50 do
                local _Frame3 = Instance.new('Frame')

                _Frame3.Parent = _Frame2
                _Frame3.BackgroundColor3 = Color3.fromRGB(180, 180, 220)
                _Frame3.BorderSizePixel = 0

                local v103 = math.random(1, 3)

                _Frame3.Size = UDim2.fromOffset(v103, v103)
                _Frame3.Position = UDim2.new(math.random(), 0, math.random(), 0)

                local _UICorner = Instance.new('UICorner')

                _UICorner.CornerRadius = UDim.new(1, 0)
                _UICorner.Parent = _Frame3

                task.spawn(function()
                    while _ScreenGui.Parent do
                        local v105 = math.random(20, 40)
                        local v106 = game:GetService('TweenService'):Create(_Frame3, TweenInfo.new(v105, Enum.EasingStyle.Linear), {
                            Position = UDim2.new(math.random(), 0, math.random(), 0),
                        })

                        v106:Play()
                        v106.Completed:Wait()
                    end
                end)
            end

            local _Frame4 = Instance.new('Frame')

            _Frame4.Name = 'MainFrame'
            _Frame4.Parent = _Frame
            _Frame4.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
            _Frame4.BorderSizePixel = 0
            _Frame4.Size = UDim2.new(0, 380, 0, 170)
            _Frame4.AnchorPoint = Vector2.new(0.5, 0.5)
            _Frame4.Position = UDim2.new(0.5, 0, 0.5, 0)

            local _UIGradient = Instance.new('UIGradient')

            _UIGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 20, 80)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 30, 80)),
            })
            _UIGradient.Rotation = 90
            _UIGradient.Parent = _Frame4

            local _UICorner2 = Instance.new('UICorner')

            _UICorner2.CornerRadius = UDim.new(0, 12)
            _UICorner2.Parent = _Frame4

            local _UIStroke = Instance.new('UIStroke')

            _UIStroke.Color = Color3.fromRGB(80, 50, 140)
            _UIStroke.Thickness = 1.5
            _UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            _UIStroke.Parent = _Frame4

            local _TextLabel = Instance.new('TextLabel')

            _TextLabel.Name = 'Title'
            _TextLabel.Parent = _Frame4
            _TextLabel.BackgroundTransparency = 1
            _TextLabel.Size = UDim2.new(1, 0, 0, 45)
            _TextLabel.Font = Enum.Font.SourceSansSemibold
            _TextLabel.Text = 'Farm Stats'
            _TextLabel.TextColor3 = Color3.new(1, 1, 1)
            _TextLabel.TextSize = 20
            _TextLabel.TextWrapped = true

            local _Frame5 = Instance.new('Frame')

            _Frame5.Name = 'Separator'
            _Frame5.Parent = _Frame4
            _Frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame5.BackgroundTransparency = 0.8
            _Frame5.BorderSizePixel = 0
            _Frame5.Size = UDim2.new(0.9, 0, 0, 1)
            _Frame5.Position = UDim2.new(0.5, 0, 0, 45)
            _Frame5.AnchorPoint = Vector2.new(0.5, 0)

            local _Frame6 = Instance.new('Frame')

            _Frame6.Name = 'StatsContainer'
            _Frame6.Parent = _Frame4
            _Frame6.BackgroundTransparency = 1
            _Frame6.Size = UDim2.new(1, -40, 0, 100)
            _Frame6.Position = UDim2.new(0.5, 0, 0, 60)
            _Frame6.AnchorPoint = Vector2.new(0.5, 0)

            local _UIListLayout = Instance.new('UIListLayout')

            _UIListLayout.Parent = _Frame6
            _UIListLayout.FillDirection = Enum.FillDirection.Vertical
            _UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            _UIListLayout.Padding = UDim.new(0, 10)
            _UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

            local function v121(p115, p116, p117)
                local _Frame7 = Instance.new('Frame')

                _Frame7.Name = p116 .. 'Frame'
                _Frame7.Parent = _Frame6
                _Frame7.BackgroundTransparency = 1
                _Frame7.Size = UDim2.new(1, 0, 0, 25)
                _Frame7.LayoutOrder = p117
                p115.Parent = _Frame7

                local _TextLabel2 = Instance.new('TextLabel')

                _TextLabel2.Name = 'Label'
                _TextLabel2.Parent = _Frame7
                _TextLabel2.BackgroundTransparency = 1
                _TextLabel2.Size = UDim2.new(0.5, 0, 1, 0)
                _TextLabel2.Position = UDim2.new(0, 35, 0, 0)
                _TextLabel2.Font = Enum.Font.SourceSans
                _TextLabel2.Text = p116 .. ':'
                _TextLabel2.TextColor3 = Color3.fromRGB(210, 210, 220)
                _TextLabel2.TextSize = 16
                _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left

                local _TextLabel3 = Instance.new('TextLabel')

                _TextLabel3.Name = 'Value'
                _TextLabel3.Parent = _Frame7
                _TextLabel3.BackgroundTransparency = 1
                _TextLabel3.Size = UDim2.new(0.5, -35, 1, 0)
                _TextLabel3.Position = UDim2.new(1, 0, 0, 0)
                _TextLabel3.AnchorPoint = Vector2.new(1, 0)
                _TextLabel3.Font = Enum.Font.SourceSansBold
                _TextLabel3.Text = '0'
                _TextLabel3.TextColor3 = Color3.new(1, 1, 1)
                _TextLabel3.TextSize = 16
                _TextLabel3.TextXAlignment = Enum.TextXAlignment.Right

                return _TextLabel3
            end

            local u124 = v121((function()
                local _Frame8 = Instance.new('Frame')

                _Frame8.BackgroundTransparency = 1
                _Frame8.Size = UDim2.new(0, 25, 1, 0)
                _Frame8.AnchorPoint = Vector2.new(0, 0.5)
                _Frame8.Position = UDim2.new(0, 0, 0.5, 0)

                local _TextLabel4 = Instance.new('TextLabel')

                _TextLabel4.Parent = _Frame8
                _TextLabel4.BackgroundTransparency = 1
                _TextLabel4.Size = UDim2.new(1, 0, 1, 0)
                _TextLabel4.Font = Enum.Font.SourceSansBold
                _TextLabel4.Text = '$'
                _TextLabel4.TextColor3 = Color3.fromRGB(180, 180, 220)
                _TextLabel4.TextSize = 24

                return _Frame8
            end)(), 'Profit', 1)
            local u130 = v121((function()
                local _Frame9 = Instance.new('Frame')

                _Frame9.BackgroundTransparency = 1
                _Frame9.Size = UDim2.new(0, 25, 0, 25)
                _Frame9.AnchorPoint = Vector2.new(0, 0.5)
                _Frame9.Position = UDim2.new(0, 0, 0.5, 0)

                local _Frame10 = Instance.new('Frame')

                _Frame10.Parent = _Frame9
                _Frame10.BackgroundTransparency = 1
                _Frame10.Size = UDim2.new(0.8, 0, 0.6, 0)
                _Frame10.Position = UDim2.new(0.5, 0, 0.5, 0)
                _Frame10.AnchorPoint = Vector2.new(0.5, 0.5)

                local _UIStroke2 = Instance.new('UIStroke')

                _UIStroke2.Color = Color3.fromRGB(180, 180, 220)
                _UIStroke2.Thickness = 1.5
                _UIStroke2.Parent = _Frame10

                local _Frame11 = Instance.new('Frame')

                _Frame11.Parent = _Frame10
                _Frame11.BackgroundColor3 = Color3.fromRGB(180, 180, 220)
                _Frame11.BorderSizePixel = 0
                _Frame11.Size = UDim2.new(0.4, 0, 0.1, 0)
                _Frame11.Position = UDim2.new(0.3, 0, 0.3, 0)
                _Frame11.AnchorPoint = Vector2.new(0.5, 0.5)

                local _Frame12 = Instance.new('Frame')

                _Frame12.Parent = _Frame10
                _Frame12.BackgroundColor3 = Color3.fromRGB(180, 180, 220)
                _Frame12.BackgroundTransparency = 0.5
                _Frame12.BorderSizePixel = 0
                _Frame12.Size = UDim2.new(0.6, 0, 0.1, 0)
                _Frame12.Position = UDim2.new(0.6, 0, 0.65, 0)
                _Frame12.AnchorPoint = Vector2.new(0.5, 0.5)

                return _Frame9
            end)(), 'ATMs Broken', 2)
            local u136 = v121((function()
                local _Frame13 = Instance.new('Frame')

                _Frame13.BackgroundTransparency = 1
                _Frame13.Size = UDim2.new(0, 25, 1, 0)
                _Frame13.AnchorPoint = Vector2.new(0, 0.5)
                _Frame13.Position = UDim2.new(0, 0, 0.5, 0)

                local _Frame14 = Instance.new('Frame')

                _Frame14.Parent = _Frame13
                _Frame14.BackgroundColor3 = Color3.fromRGB(180, 180, 220)
                _Frame14.Size = UDim2.new(0.8, 0, 0.8, 0)
                _Frame14.Position = UDim2.new(0.5, 0, 0.5, 0)
                _Frame14.AnchorPoint = Vector2.new(0.5, 0.5)

                local _UICorner3 = Instance.new('UICorner')

                _UICorner3.CornerRadius = UDim.new(1, 0)
                _UICorner3.Parent = _Frame14

                local _Frame15 = Instance.new('Frame')

                _Frame15.Parent = _Frame14
                _Frame15.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
                _Frame15.Size = UDim2.new(0.08, 0, 0.4, 0)
                _Frame15.Position = UDim2.new(0.5, 0, 0.5, 0)
                _Frame15.AnchorPoint = Vector2.new(0.5, 1)
                _Frame15.Rotation = 0

                local _Frame16 = Instance.new('Frame')

                _Frame16.Parent = _Frame14
                _Frame16.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
                _Frame16.Size = UDim2.new(0.08, 0, 0.2, 0)
                _Frame16.Position = UDim2.new(0.5, 0, 0.5, 0)
                _Frame16.AnchorPoint = Vector2.new(0.5, 1)
                _Frame16.Rotation = 70

                return _Frame13
            end)(), 'Time Elapsed', 3)

            task.spawn(function()
                while _ScreenGui.Parent do
                    local v137 = os.time() - u15

                    u124.Text = '$' .. u22(_LocalPlayer.DataFolder.Currency.Value - _Value)
                    u130.Text = tostring(u101)
                    u136.Text = os.date('!%H:%M:%S', v137)

                    task.wait(1)
                end
            end)
        end

        setfpscap(tonumber(_G.AutofarmSettings.Fps))
        pcall(function()
            UserSettings().GameSettings.MasterVolume = 0
        end)
        pcall(function()
            settings().Rendering.QualityLevel = 'Level01'
        end)
        u20('Initial setup complete. Waiting for character.')
        game:GetService('Players').LocalPlayer.Idled:Connect(function()
            game:GetService('VirtualUser'):CaptureController()
            game:GetService('VirtualUser'):ClickButton2(Vector2.new())
        end)
    end
else
    return
end
