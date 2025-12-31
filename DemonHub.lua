-- DEMONHUB MENU v4 - VERSIÓN
-- LocalScript → StarterPlayerScripts
-- Colores: Rojo y Negro predominantes
-- Nombre cambiado a DemonHUB
-- Nueva sección "Risk" con: Noclip, Fly
-- Aimbot se desactiva con tecla G (toggle)
-- ESP ahora muestra el nombre del jugador encima

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local PASSWORD = "By.Rifii"
local MAX_FOV = 200

-- ====================== SCREEN GUI ======================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DemonHubMenu"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999999999
screenGui.Parent = PlayerGui

-- ====================== BOTÓN DE APERTURA ======================
local openCircle = Instance.new("TextButton")
openCircle.Size = UDim2.new(0, 55, 0, 55)
openCircle.Position = UDim2.new(1, -70, 1, -70)
openCircle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)  -- Rojo oscuro
openCircle.Text = "☠"
openCircle.TextColor3 = Color3.new(1,1,1)
openCircle.TextSize = 40
openCircle.Font = Enum.Font.GothamBlack
openCircle.Active = true
openCircle.Draggable = true
openCircle.Parent = screenGui

local openCorner = Instance.new("UICorner")
openCorner.CornerRadius = UDim.new(1, 0)
openCorner.Parent = openCircle

local openStroke = Instance.new("UIStroke")
openStroke.Thickness = 4
openStroke.Color = Color3.new(0,0,0)  -- Negro
openStroke.Parent = openCircle

-- ====================== VENTANA DE CONTRASEÑA ======================
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 320, 0, 180)
keyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)  -- Negro profundo
keyFrame.Visible = false
keyFrame.Parent = screenGui

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 16)
keyCorner.Parent = keyFrame

local keyStroke = Instance.new("UIStroke")
keyStroke.Thickness = 3
keyStroke.Color = Color3.fromRGB(200, 0, 0)
keyStroke.Parent = keyFrame

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 50)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "DEMONHUB v4"
keyTitle.TextColor3 = Color3.fromRGB(220, 20, 20)  -- Rojo sangre
keyTitle.Font = Enum.Font.GothamBlack
keyTitle.TextSize = 28
keyTitle.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 280, 0, 50)
keyBox.Position = UDim2.new(0.5, -140, 0, 70)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBox.PlaceholderText = "Contraseña..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 20
keyBox.ClearTextOnFocus = true
keyBox.Parent = keyFrame

Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 10)

local acceptBtn = Instance.new("TextButton")
acceptBtn.Size = UDim2.new(0, 120, 0, 40)
acceptBtn.Position = UDim2.new(0.5, -60, 1, -55)
acceptBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
acceptBtn.Text = "ENTRAR"
acceptBtn.TextColor3 = Color3.new(1,1,1)
acceptBtn.Font = Enum.Font.GothamBold
acceptBtn.Parent = keyFrame
Instance.new("UICorner", acceptBtn).CornerRadius = UDim.new(0, 10)

openCircle.MouseButton1Click:Connect(function()
    keyFrame.Visible = true
    keyBox:CaptureFocus()
end)

local function checkPassword()
    if keyBox.Text:lower() == PASSWORD:lower() then
        keyFrame.Visible = false
        openCircle.Visible = false
        createFullMenu()
    else
        keyBox.Text = ""
        keyBox.PlaceholderText = "Incorrecta!"
        keyBox.TextColor3 = Color3.fromRGB(255,80,80)
        task.wait(1.5)
        keyBox.PlaceholderText = "Contraseña..."
        keyBox.TextColor3 = Color3.new(1,1,1)
    end
end

acceptBtn.MouseButton1Click:Connect(checkPassword)
keyBox.FocusLost:Connect(function(enter) if enter then checkPassword() end end)

-- ====================== MENÚ PRINCIPAL ======================
function createFullMenu()
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 380, 0, 520)
    mainFrame.Position = UDim2.new(0, 60, 0, 60)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 4
    stroke.Color = Color3.fromRGB(200, 0, 0)
    stroke.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1,0,0,50)
    title.BackgroundTransparency = 1
    title.Text = "DEMONHUB v4"
    title.TextColor3 = Color3.fromRGB(220, 20, 20)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 26
    title.Parent = mainFrame

    -- Botón cerrar
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0,34,0,34)
    closeBtn.Position = UDim2.new(1,-40,0,5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = mainFrame
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,10)
    closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

    -- Botón minimizar
    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0,34,0,34)
    minBtn.Position = UDim2.new(1,-80,0,5)
    minBtn.BackgroundColor3 = Color3.fromRGB(120,0,0)
    minBtn.Text = "−"
    minBtn.TextColor3 = Color3.new(1,1,1)
    minBtn.Font = Enum.Font.GothamBold
    minBtn.Parent = mainFrame
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0,10)

    local miniCircle = Instance.new("TextButton")
    miniCircle.Size = UDim2.new(0,70,0,70)
    miniCircle.BackgroundColor3 = Color3.fromRGB(200,0,0)
    miniCircle.Text = "☠"
    miniCircle.TextSize = 50
    miniCircle.Visible = false
    miniCircle.Draggable = true
    miniCircle.Parent = screenGui
    Instance.new("UICorner", miniCircle).CornerRadius = UDim.new(1,0)

    minBtn.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
        miniCircle.Visible = true
    end)
    miniCircle.MouseButton1Click:Connect(function()
        miniCircle.Visible = false
        mainFrame.Visible = true
    end)

    -- Pestañas
    local inicioTab = Instance.new("TextButton")
    inicioTab.Size = UDim2.new(0.33,0,0,40)
    inicioTab.Position = UDim2.new(0,0,0,50)
    inicioTab.BackgroundColor3 = Color3.fromRGB(180,0,0)
    inicioTab.Text = "Inicio"
    inicioTab.TextColor3 = Color3.new(1,1,1)
    inicioTab.Font = Enum.Font.GothamBold
    inicioTab.Parent = mainFrame
    Instance.new("UICorner", inicioTab)

    local riskTab = Instance.new("TextButton")
    riskTab.Size = UDim2.new(0.33,0,0,40)
    riskTab.Position = UDim2.new(0.33,0,0,50)
    riskTab.BackgroundColor3 = Color3.fromRGB(60,60,60)
    riskTab.Text = "Risk"
    riskTab.TextColor3 = Color3.new(1,1,1)
    riskTab.Font = Enum.Font.GothamBold
    riskTab.Parent = mainFrame
    Instance.new("UICorner", riskTab)

    local tpTab = Instance.new("TextButton")
    tpTab.Size = UDim2.new(0.34,0,0,40)
    tpTab.Position = UDim2.new(0.66,0,0,50)
    tpTab.BackgroundColor3 = Color3.fromRGB(60,60,60)
    tpTab.Text = "TP"
    tpTab.TextColor3 = Color3.new(1,1,1)
    tpTab.Font = Enum.Font.GothamBold
    tpTab.Parent = mainFrame
    Instance.new("UICorner", tpTab)

    local inicioContent = Instance.new("Frame")
    inicioContent.Size = UDim2.new(1,0,1,-90)
    inicioContent.Position = UDim2.new(0,0,0,90)
    inicioContent.BackgroundTransparency = 1
    inicioContent.Parent = mainFrame

    local riskContent = Instance.new("Frame")
    riskContent.Size = UDim2.new(1,0,1,-90)
    riskContent.Position = UDim2.new(0,0,0,90)
    riskContent.BackgroundTransparency = 1
    riskContent.Visible = false
    riskContent.Parent = mainFrame

    local tpContent = Instance.new("Frame")
    tpContent.Size = UDim2.new(1,0,1,-90)
    tpContent.Position = UDim2.new(0,0,0,90)
    tpContent.BackgroundTransparency = 1
    tpContent.Visible = false
    tpContent.Parent = mainFrame

    local function switchTab(tab)
        inicioContent.Visible = (tab == "inicio")
        riskContent.Visible = (tab == "risk")
        tpContent.Visible = (tab == "tp")
        inicioTab.BackgroundColor3 = (tab == "inicio") and Color3.fromRGB(180,0,0) or Color3.fromRGB(60,60,60)
        riskTab.BackgroundColor3 = (tab == "risk") and Color3.fromRGB(180,0,0) or Color3.fromRGB(60,60,60)
        tpTab.BackgroundColor3 = (tab == "tp") and Color3.fromRGB(180,0,0) or Color3.fromRGB(60,60,60)
    end

    inicioTab.MouseButton1Click:Connect(function() switchTab("inicio") end)
    riskTab.MouseButton1Click:Connect(function() switchTab("risk") end)
    tpTab.MouseButton1Click:Connect(function() switchTab("tp") end)

    -- ====================== PESTAÑA INICIO ======================
    local aimEnabled = false
    local espEnabled = false

    -- Aimbot (toggle con tecla G)
    local aimBtn = Instance.new("TextButton")
    aimBtn.Size = UDim2.new(0,320,0,50)
    aimBtn.Position = UDim2.new(0.5, -160,0,20)
    aimBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    aimBtn.Text = "AIMBOT CRUZ: OFF (Toggle: G)"
    aimBtn.TextColor3 = Color3.new(1,1,1)
    aimBtn.Font = Enum.Font.GothamBold
    aimBtn.TextSize = 22
    aimBtn.Parent = inicioContent
    Instance.new("UICorner", aimBtn).CornerRadius = UDim.new(0,12)

    -- ESP (muestra nombres)
    local espBtn = Instance.new("TextButton")
    espBtn.Size = UDim2.new(0,320,0,50)
    espBtn.Position = UDim2.new(0.5, -160,0,80)
    espBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    espBtn.Text = "ENEMY ESP + NOMBRES: OFF"
    espBtn.TextColor3 = Color3.new(1,1,1)
    espBtn.Font = Enum.Font.GothamBold
    espBtn.TextSize = 22
    espBtn.Parent = inicioContent
    Instance.new("UICorner", espBtn).CornerRadius = UDim.new(0,12)

    -- Anti AFK
    local antiAfkLabel = Instance.new("TextLabel")
    antiAfkLabel.Size = UDim2.new(0,320,0,40)
    antiAfkLabel.Position = UDim2.new(0.5, -160,0,140)
    antiAfkLabel.BackgroundColor3 = Color3.fromRGB(0,140,0)
    antiAfkLabel.Text = "ANTI AFK: ON (Siempre activo)"
    antiAfkLabel.TextColor3 = Color3.new(1,1,1)
    antiAfkLabel.Font = Enum.Font.GothamBold
    antiAfkLabel.TextSize = 20
    antiAfkLabel.Parent = inicioContent
    Instance.new("UICorner", antiAfkLabel).CornerRadius = UDim.new(0,12)

    -- Velocidad
    local speedBox = Instance.new("TextBox")
    speedBox.Size = UDim2.new(0,220,0,50)
    speedBox.Position = UDim2.new(0.5, -110,0,200)
    speedBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
    speedBox.PlaceholderText = "Velocidad (16 default)"
    speedBox.Text = "16"
    speedBox.TextColor3 = Color3.new(1,1,1)
    speedBox.Font = Enum.Font.Gotham
    speedBox.TextSize = 22
    speedBox.Parent = inicioContent
    Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0,12)

    local speedBtn = Instance.new("TextButton")
    speedBtn.Size = UDim2.new(0,90,0,50)
    speedBtn.Position = UDim2.new(0.5, 120,0,200)
    speedBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
    speedBtn.Text = "APLICAR"
    speedBtn.TextColor3 = Color3.new(1,1,1)
    speedBtn.Font = Enum.Font.GothamBold
    speedBtn.Parent = inicioContent
    Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0,12)

    speedBtn.MouseButton1Click:Connect(function()
        local num = tonumber(speedBox.Text)
        if num and num > 0 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = num
            speedBox.PlaceholderText = "Velocidad: " .. num
            speedBox.Text = ""
        end
    end)

    -- Toggle Aimbot con tecla G
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.G then
            aimEnabled = not aimEnabled
            aimBtn.Text = "AIMBOT CRUZ: " .. (aimEnabled and "ON" or "OFF") .. " (Toggle: G)"
            aimBtn.BackgroundColor3 = aimEnabled and Color3.fromRGB(0,180,0) or Color3.fromRGB(40,40,40)
        end
    end)

    espBtn.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        espBtn.Text = "ENEMY ESP + NOMBRES: " .. (espEnabled and "ON" or "OFF")
        espBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(180,0,0) or Color3.fromRGB(40,40,40)
    end)

    -- ====================== PESTAÑA RISK (Noclip + Fly) ======================
    local noclipEnabled = false
    local flyEnabled = false
    local flySpeed = 50

    local noclipBtn = Instance.new("TextButton")
    noclipBtn.Size = UDim2.new(0,320,0,50)
    noclipBtn.Position = UDim2.new(0.5, -160,0,20)
    noclipBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    noclipBtn.Text = "NOCLIP: OFF"
    noclipBtn.TextColor3 = Color3.new(1,1,1)
    noclipBtn.Font = Enum.Font.GothamBold
    noclipBtn.TextSize = 22
    noclipBtn.Parent = riskContent
    Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0,12)

    local flyBtn = Instance.new("TextButton")
    flyBtn.Size = UDim2.new(0,320,0,50)
    flyBtn.Position = UDim2.new(0.5, -160,0,80)
    flyBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    flyBtn.Text = "FLY: OFF"
    flyBtn.TextColor3 = Color3.new(1,1,1)
    flyBtn.Font = Enum.Font.GothamBold
    flyBtn.TextSize = 22
    flyBtn.Parent = riskContent
    Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0,12)

    noclipBtn.MouseButton1Click:Connect(function()
        noclipEnabled = not noclipEnabled
        noclipBtn.Text = "NOCLIP: " .. (noclipEnabled and "ON" or "OFF")
        noclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(180,0,0) or Color3.fromRGB(40,40,40)
    end)

    flyBtn.MouseButton1Click:Connect(function()
        flyEnabled = not flyEnabled
        flyBtn.Text = "FLY: " .. (flyEnabled and "ON" or "OFF")
        flyBtn.BackgroundColor3 = flyEnabled and Color3.fromRGB(180,0,0) or Color3.fromRGB(40,40,40)
    end)

    -- Funcionalidad Noclip
    RunService.Stepped:Connect(function()
        if noclipEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)

    -- Funcionalidad Fly simple
    local flyBodyVelocity = nil
    RunService.RenderStepped:Connect(function()
        if flyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            if not flyBodyVelocity then
                flyBodyVelocity = Instance.new("BodyVelocity")
                flyBodyVelocity.MaxForce = Vector3.new(40000,40000,40000)
                flyBodyVelocity.Velocity = Vector3.new(0,0,0)
                flyBodyVelocity.Parent = hrp
            end
            local cam = workspace.CurrentCamera
            local move = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
            flyBodyVelocity.Velocity = move.Unit * flySpeed
        elseif flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
    end)

    -- ====================== PESTAÑA TP ======================
    local tpListFrame = Instance.new("ScrollingFrame")
    tpListFrame.Size = UDim2.new(0,340,0,360)
    tpListFrame.Position = UDim2.new(0.5, -170,0,60)
    tpListFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
    tpListFrame.ScrollBarThickness = 8
    tpListFrame.Parent = tpContent
    Instance.new("UICorner", tpListFrame).CornerRadius = UDim.new(0,12)

    local function refreshPlayerList()
        tpListFrame:ClearAllChildren()
        local y = 0
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1,-10,0,50)
                btn.Position = UDim2.new(0,5,0,y)
                btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
                btn.Text = plr.Name .. (plr.DisplayName ~= plr.Name and " ("..plr.DisplayName..")" or "")
                btn.TextColor3 = Color3.new(1,1,1)
                btn.Font = Enum.Font.Gotham
                btn.TextSize = 18
                btn.Parent = tpListFrame
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

                btn.MouseButton1Click:Connect(function()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,4,0)
                    end
                end)
                y += 55
            end
        end
        tpListFrame.CanvasSize = UDim2.new(0,0,0,y)
    end

    local refreshBtn = Instance.new("TextButton")
    refreshBtn.Size = UDim2.new(0,340,0,50)
    refreshBtn.Position = UDim2.new(0.5, -170,0,10)
    refreshBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
    refreshBtn.Text = "Actualizar Lista de Jugadores"
    refreshBtn.TextColor3 = Color3.new(1,1,1)
    refreshBtn.Font = Enum.Font.GothamBold
    refreshBtn.Parent = tpContent
    Instance.new("UICorner", refreshBtn).CornerRadius = UDim.new(0,12)
    refreshBtn.MouseButton1Click:Connect(refreshPlayerList)

    spawn(function()
        while wait(3) do
            if tpContent.Visible then refreshPlayerList() end
        end
    end)

    -- ====================== ANTI AFK ======================
    local VirtualUser = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)

    -- ====================== AIMBOT ======================
    local aiming = false
    local camera = workspace.CurrentCamera

    UserInputService.InputBegan:Connect(function(i, gp)
        if gp or not aimEnabled then return end
        if i.UserInputType == Enum.UserInputType.MouseButton1 then aiming = true end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then aiming = false end
    end)

    RunService.RenderStepped:Connect(function()
        if not aiming or not aimEnabled or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Head") then return end
        local center = camera.ViewportSize / 2
        local closest, best = math.huge, nil
        for _, plr in Players:GetPlayers() do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                local head = plr.Character:FindFirstChild("Head")
                if head then
                    local enemy = not LocalPlayer.Team or plr.Team ~= LocalPlayer.Team
                    if enemy then
                        local pos, vis = camera:WorldToViewportPoint(head.Position)
                        if vis then
                            local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                            if dist < closest and dist <= MAX_FOV then
                                closest = dist
                                best = head
                            end
                        end
                    end
                end
            end
        end
        if best then
            camera.CFrame = CFrame.new(camera.CFrame.Position, best.Position)
        end
    end)

    -- ====================== ESP CON NOMBRES ======================
    local highlights = {}
    local nameBills = {}

    RunService.Heartbeat:Connect(function()
        if not espEnabled then
            for _,v in pairs(highlights) do if v then v:Destroy() end end
            for _,v in pairs(nameBills) do if v then v:Destroy() end end
            highlights = {}
            nameBills = {}
            return
        end

        for _, plr in Players:GetPlayers() do
            if plr == LocalPlayer then continue end
            local char = plr.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 and char:FindFirstChild("Head") then
                local enemy = not LocalPlayer.Team or plr.Team ~= LocalPlayer.Team
                if enemy then
                    if not highlights[plr] then
                        local hl = Instance.new("Highlight")
                        hl.FillColor = Color3.fromRGB(255,0,0)
                        hl.OutlineColor = Color3.new(1,1,1)
                        hl.FillTransparency = 0.4
                        hl.Parent = char
                        highlights[plr] = hl
                    end

                    if not nameBills[plr] then
                        local bill = Instance.new("BillboardGui")
                        bill.Size = UDim2.new(0, 200, 0, 50)
                        bill.Adornee = char.Head
                        bill.AlwaysOnTop = true
                        bill.Parent = char

                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Size = UDim2.new(1,0,1,0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.Text = plr.Name
                        nameLabel.TextColor3 = Color3.fromRGB(255,0,0)
                        nameLabel.TextStrokeTransparency = 0
                        nameLabel.TextStrokeColor3 = Color3.new(0,0,0)
                        nameLabel.Font = Enum.Font.GothamBold
                        nameLabel.TextSize = 18
                        nameLabel.Parent = bill

                        nameBills[plr] = bill
                    end
                else
                    if highlights[plr] then highlights[plr]:Destroy() highlights[plr] = nil end
                    if nameBills[plr] then nameBills[plr]:Destroy() nameBills[plr] = nil end
                end
            else
                if highlights[plr] then highlights[plr]:Destroy() highlights[plr] = nil end
                if nameBills[plr] then nameBills[plr]:Destroy() nameBills[plr] = nil end
            end
        end
    end)

    switchTab("inicio")
    refreshPlayerList()
end

print("DEMONHUB v4 CARGADO - Todo actualizado!")
print("Tema rojo y negro")
print("Nueva pestaña Risk con Noclip y Fly")
print("Aimbot toggle con G")
print("ESP muestra nombres de enemigos")
