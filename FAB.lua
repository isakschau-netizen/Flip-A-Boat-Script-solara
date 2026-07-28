

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
    Name = "Flip A Boat Script",
    LoadingTitle = "Loading Script...",
    LoadingSubtitle = "by Isak123",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LUADEVScript",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})


player.CharacterAdded:Connect(function(char)
    character = char
    humanoid = char:WaitForChild("Humanoid")
    hrp = char:WaitForChild("HumanoidRootPart")
end)


local function getPlotPosition()
    local markers = workspace:FindFirstChild("Markers")
    if markers then
        local yourPlotMarker = markers:FindFirstChild("YourPlot")
        if yourPlotMarker then
            if yourPlotMarker:IsA("BasePart") then
                return yourPlotMarker.Position
            elseif yourPlotMarker:IsA("Model") and yourPlotMarker.PrimaryPart then
                return yourPlotMarker.PrimaryPart.Position
            else
                for _, part in ipairs(yourPlotMarker:GetDescendants()) do
                    if part:IsA("BasePart") then
                        return part.Position
                    end
                end
            end
        end
    end
    
    local plots = workspace:FindFirstChild("Plots")
    if plots then
        local playerPlots = plots:FindFirstChild("PlayerPlots")
        if playerPlots then
            for _, plot in ipairs(playerPlots:GetChildren()) do
                local owner = plot:GetAttribute("Owner") or plot:GetAttribute("Player")
                if owner == player.Name or owner == player.UserId then
                    if plot:IsA("BasePart") then
                        return plot.Position
                    elseif plot:IsA("Model") and plot.PrimaryPart then
                        return plot.PrimaryPart.Position
                    end
                end
                local ownerValue = plot:FindFirstChild("Owner") or plot:FindFirstChild("Player")
                if ownerValue and ownerValue:IsA("ObjectValue") and ownerValue.Value == player then
                    if plot:IsA("BasePart") then
                        return plot.Position
                    elseif plot:IsA("Model") and plot.PrimaryPart then
                        return plot.PrimaryPart.Position
                    end
                end
            end
            local firstPlot = playerPlots:FindFirstChild("Plot")
            if firstPlot then
                if firstPlot:IsA("BasePart") then
                    return firstPlot.Position
                elseif firstPlot:IsA("Model") and firstPlot.PrimaryPart then
                    return firstPlot.PrimaryPart.Position
                end
            end
        end
    end
    
    return nil
end


local TeleportTab = Window:CreateTab("Teleport", "navigation")

local PresetSection = TeleportTab:CreateSection("Preset Locations")


TeleportTab:CreateButton({
    Name = "Teleport to Marine Store",
    Callback = function()
        if hrp then
            local targetPos = Vector3.new(31, 6, 530)
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
            tween:Play()
            
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Arrived at Marine Store",
                Duration = 3,
                Image = "anchor",
            })
        end
    end,
})

TeleportTab:CreateButton({
    Name = "Teleport to Fuel and part runs Spawn",
    Callback = function()
        if hrp then
            local targetPos = Vector3.new(-23, 6, 560)
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
            tween:Play()
            
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Arrived at Fuel and Parts",
                Duration = 3,
                Image = "anchor",
            })
        end
    end,
})


TeleportTab:CreateButton({
    Name = "Teleport to part runs boat Spawn",
    Callback = function()
        if hrp then
            local targetPos = Vector3.new(7258, 29, 953)
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
            tween:Play()
            
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Boat",
                Duration = 3,
                Image = "anchor",
            })
        end
    end,
})


local DropdownSection = TeleportTab:CreateSection("Quick Teleport Locations")
TeleportTab:CreateButton({
    Name = "Teleport to Your Plot",
    Callback = function()
        if hrp then
            local plotPos = getPlotPosition()
            
            if plotPos then
                local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(plotPos + Vector3.new(0, 5, 0))})
                tween:Play()
                
                Rayfield:Notify({
                    Title = "Teleported!",
                    Content = "Arrived at Your Plot",
                    Duration = 3,
                    Image = "home",
                })
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Could not find your plot location",
                    Duration = 3,
                    Image = "x",
                })
            end
        end
    end,
})

-- ==================== CUSTOM TELEPORT BUTTONS ====================
-- Standalone section - paste after Window is created

local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Function to get current character parts
local function getHRP()
    local character = player.Character
    if character then
        return character:FindFirstChild("HumanoidRootPart")
    end
    return nil
end

-- Create section (change "TeleportTab" to whatever tab you want)
local CustomSection = TeleportTab:CreateSection("Custom Locations")

-- Button 1: 3175, 9, 3323
TeleportTab:CreateButton({
    Name = "Teleport to Fuel Location 1 (3175, 9, 3323)",
    Callback = function()
        local hrp = getHRP()
        if hrp then
            local targetPos = Vector3.new(3175, 9, 3323)
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
            tween:Play()
            
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Arrived at Fuel Location 1",
                Duration = 3,
                Image = "map-pin",
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Character not found",
                Duration = 3,
                Image = "x",
            })
        end
    end,
})

-- Button 2: -853, 19, -6086
TeleportTab:CreateButton({
    Name = "Teleport to Fuel Location 2 (-853, 19, -6086)",
    Callback = function()
        local hrp = getHRP()
        if hrp then
            local targetPos = Vector3.new(-853, 19, -6086)
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
            tween:Play()
            
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Arrived at Fuel Location 2",
                Duration = 3,
                Image = "map-pin",
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Character not found",
                Duration = 3,
                Image = "x",
            })
        end
    end,
})

-- Button 3: 5886, 20, -3009
TeleportTab:CreateButton({
    Name = "Teleport to Fuel Location 3 (5886, 20, -3009)",
    Callback = function()
        local hrp = getHRP()
        if hrp then
            local targetPos = Vector3.new(5886, 20, -3009)
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
            tween:Play()
            
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Arrived at Fuel Location 3",
                Duration = 3,
                Image = "map-pin",
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Character not found",
                Duration = 3,
                Image = "x",
            })
        end
    end,
})

-- Button 4: -3580, 12, 2457
TeleportTab:CreateButton({
    Name = "Teleport to Fuel Location 4 (-3580, 12, 2457)",
    Callback = function()
        local hrp = getHRP()
        if hrp then
            local targetPos = Vector3.new(-3580, 12, 2457)
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(targetPos)})
            tween:Play()
            
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "Arrived at Fuel Location 4",
                Duration = 3,
                Image = "map-pin",
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Character not found",
                Duration = 3,
                Image = "x",
            })
        end
    end,
})

local NoclipTab = Window:CreateTab("Noclip", "ghost")

local NoclipSection = NoclipTab:CreateSection("Collision Settings")

local noclip = false
local noclipConnection

noclipConnection = RunService.Stepped:Connect(function()
    if noclip and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

NoclipTab:CreateToggle({
    Name = "Enable Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        noclip = Value
        
        if noclip then
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
            
            Rayfield:Notify({
                Title = "Noclip Enabled",
                Content = "You can now walk through walls",
                Duration = 3,
                Image = "ghost",
            })
        else
            if character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            
            Rayfield:Notify({
                Title = "Noclip Disabled",
                Content = "Collisions restored",
                Duration = 3,
                Image = "shield",
            })
        end
    end,
})


player.CharacterAdded:Connect(function(char)
    character = char
    humanoid = char:WaitForChild("Humanoid")
    hrp = char:WaitForChild("HumanoidRootPart")
    
    if noclip then
        task.wait(0.5)
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)


Rayfield:Notify({
    Title = "Script Loaded!",
    Content = "Teleport and Noclip ready",
    Duration = 5,
    Image = "check",
})


local BoatsTab = Window:CreateTab("Boats", "ship")

BoatsTab:CreateSection("Boat ESP")   
BoatsTab:CreateSection("Boat Teleporter")

local boatESPEnabled = false
local boatHighlights = {}
local boatList = {}
local lastBoatCount = 0

local function getAllBoats()
    local boats = {}
    local boatYard = workspace:FindFirstChild("boatYard")
    if boatYard then
        local spawned = boatYard:FindFirstChild("spawnedBoats")
        if spawned then
            for _, boat in ipairs(spawned:GetChildren()) do
                if boat:IsA("Model") then
                    table.insert(boats, boat)
                end
            end
        end
    end
    return boats
end

local function getBoatTarget(boat)
    local preferred = {"Hull", "Body", "Center", "Root", "Main", "Seat", "DriverSeat", "VehicleSeat", "Base"}
    for _, name in ipairs(preferred) do
        local part = boat:FindFirstChild(name, true)
        if part and part:IsA("BasePart") then
            return part
        end
    end
    for _, part in ipairs(boat:GetDescendants()) do
        if part:IsA("BasePart") then
            return part
        end
    end
    return nil
end

local function clearBoatESP()
    for _, data in pairs(boatHighlights) do
        if data.Highlight then data.Highlight:Destroy() end
        if data.Billboard then data.Billboard:Destroy() end
    end
    table.clear(boatHighlights)
end

local function updateBoatESP()
    if not boatESPEnabled then return end

    local boats = getAllBoats()
    local current = {}

    for _, boat in ipairs(boats) do
        current[boat] = true

        if not boatHighlights[boat] then
            local target = getBoatTarget(boat)
            if not target then continue end

            local highlight = Instance.new("Highlight")
            highlight.Adornee = boat
            highlight.FillColor = Color3.fromRGB(0, 170, 255)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.55
            highlight.OutlineTransparency = 0
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = boat

            local billboard = Instance.new("BillboardGui")
            billboard.Adornee = target
            billboard.Size = UDim2.new(0, 220, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 6, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = boat

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextStrokeTransparency = 0.25
            label.Font = Enum.Font.GothamBold
            label.TextSize = 15
            label.Text = boat.Name
            label.Parent = billboard

            boatHighlights[boat] = {
                Highlight = highlight,
                Billboard = billboard,
                Label = label
            }
        end

        local data = boatHighlights[boat]
        if data and data.Label and hrp then
            local target = getBoatTarget(boat)
            if target then
                local dist = math.floor((hrp.Position - target.Position).Magnitude)
                data.Label.Text = boat.Name .. "\n[" .. dist .. " studs]"
            end
        end
    end

    for boat, data in pairs(boatHighlights) do
        if not current[boat] then
            if data.Highlight then data.Highlight:Destroy() end
            if data.Billboard then data.Billboard:Destroy() end
            boatHighlights[boat] = nil
        end
    end
end

BoatsTab:CreateToggle({
    Name = "Boat ESP only Works when close",
    CurrentValue = false,
    Flag = "BoatESP",
    Callback = function(Value)
        boatESPEnabled = Value
        if Value then
            updateBoatESP()
            Rayfield:Notify({Title = "Boat ESP", Content = "Enabled", Duration = 3, Image = "eye"})
        else
            clearBoatESP()
            Rayfield:Notify({Title = "Boat ESP", Content = "Disabled", Duration = 3, Image = "eye-off"})
        end
    end,
})

local function refreshBoatList()
    boatList = {}
    local boats = getAllBoats()

    for _, boat in ipairs(boats) do
        local target = getBoatTarget(boat)
        local dist = 99999
        if target and hrp then
            dist = math.floor((hrp.Position - target.Position).Magnitude)
        end
        table.insert(boatList, {
            Display = boat.Name .. "  (" .. dist .. " studs)",
            Boat = boat,
            Distance = dist
        })
    end

    table.sort(boatList, function(a, b)
        return a.Distance < b.Distance
    end)

    return #boats
end

local BoatDropdown = BoatsTab:CreateDropdown({
    Name = "Teleport to Boat",
    Options = {"Click Refresh first"},
    CurrentOption = {"Click Refresh first"},
    MultipleOptions = false,
    Flag = "BoatTP",
    Callback = function(Options)
        local selected = Options[1]
        if not selected or selected == "Click Refresh first" or selected == "No boats found (go closer to Junkyard)" then return end

        for _, entry in ipairs(boatList) do
            if entry.Display == selected then
                local target = getBoatTarget(entry.Boat)
                if target and hrp then
                    local tweenInfo = TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    TweenService:Create(hrp, tweenInfo, {
                        CFrame = CFrame.new(target.Position + Vector3.new(0, 8, 0))
                    }):Play()

                    Rayfield:Notify({
                        Title = "Teleported!",
                        Content = "Arrived at " .. entry.Boat.Name,
                        Duration = 3,
                        Image = "ship"
                    })
                end
                break
            end
        end
    end,
})

local function updateDropdown()
    local count = refreshBoatList()
    local options = {}

    for _, entry in ipairs(boatList) do
        table.insert(options, entry.Display)
    end

    if #options == 0 then
        options = {"No boats found (go closer to Junkyard)"}
    end

    BoatDropdown:Refresh(options, true)
    lastBoatCount = count
end

BoatsTab:CreateButton({
    Name = "Refresh Boat List",
    Callback = function()
        updateDropdown()
        Rayfield:Notify({
            Title = "Boats",
            Content = lastBoatCount > 0 and ("Found " .. lastBoatCount .. " boats") or "No boats loaded - go closer to Junkyard",
            Duration = 3,
            Image = "refresh-cw"
        })
    end,
})


task.spawn(function()
    while true do
        task.wait(2.5)
        if boatESPEnabled then
            updateBoatESP()
        end
        local currentCount = #getAllBoats()
        if currentCount ~= lastBoatCount then
            updateDropdown()
        end
    end
end)



local ContractsTab = Window:CreateTab("Contracts", "clipboard-list")

ContractsTab:CreateSection("Contract Board")

local contractList = {}
local selectedContract = nil


local function forceClick(button)
    if not button then return false end

    local success = false

  
    pcall(function()
        local signals = {
            button.MouseButton1Click,
            button.Activated,
            button.MouseButton1Down,
            button.MouseButton1Up
        }

        for _, signal in pairs(signals) do
            local connections = getconnections(signal)
            if connections then
                for _, conn in pairs(connections) do
                    if type(conn.Function) == "function" then
                        conn:Fire()
                        success = true
                    elseif type(conn.fire) == "function" then
                        conn:fire()
                        success = true
                    end
                end
            end
        end
    end)

    if success then return true end

    
    pcall(function()
        firesignal(button.MouseButton1Click)
        firesignal(button.Activated)
        success = true
    end)

    if success then return true end

    
    pcall(function()
        local VIM = game:GetService("VirtualInputManager")
        local pos = button.AbsolutePosition
        local size = button.AbsoluteSize
        local x = pos.X + (size.X / 2)
        local y = pos.Y + (size.Y / 2)

        VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)  
        task.wait(0.04)
        VIM:SendMouseButtonEvent(x, y, 0, false, game, 0) 
        success = true
    end)

    return success
end

local function getContractScrollingFrame()
    local pg = player:FindFirstChild("PlayerGui")
    if not pg then return nil end

    local main = pg:FindFirstChild("MainGUI")
    if main then
        local board = main:FindFirstChild("ContractBoard")
        if board then
            return board:FindFirstChild("ScrollingFrame")
        end
    end

    
    for _, obj in ipairs(pg:GetDescendants()) do
        if obj:IsA("ScrollingFrame") and obj.Parent and obj.Parent.Name == "ContractBoard" then
            return obj
        end
    end
    return nil
end

local function refreshContracts()
    contractList = {}
    local scrolling = getContractScrollingFrame()
    if not scrolling then return 0 end

    for _, item in ipairs(scrolling:GetChildren()) do
        if item:IsA("TextButton") and item.Name:find("Mission_") then
            local displayName = item.Name:gsub("Mission_", ""):gsub("_%d+$", ""):gsub("_", " ")

            
            for _, desc in ipairs(item:GetDescendants()) do
                if desc:IsA("TextLabel") and desc.Text and #desc.Text > 3 then
                    local t = desc.Text
                    if t:find("Delivery") or t:find("Tow") or t:find("Run") or t:find("Recovery") or t:find("Haul") then
                        displayName = t
                        break
                    end
                end
            end

            table.insert(contractList, {
                Display = displayName,
                Button = item
            })
        end
    end

    return #contractList
end

local ContractDropdown = ContractsTab:CreateDropdown({
    Name = "Select Contract",
    Options = {"Refresh first"},
    CurrentOption = {"Refresh first"},
    MultipleOptions = false,
    Flag = "ContractSelect",
    Callback = function(Options)
        selectedContract = Options[1]
    end,
})

ContractsTab:CreateButton({
    Name = "Refresh Contracts",
    Callback = function()
        local count = refreshContracts()

        local options = {}
        for _, entry in ipairs(contractList) do
            table.insert(options, entry.Display)
        end

        if #options == 0 then
            options = {"No contracts found - open the board"}
        end

        ContractDropdown:Refresh(options)

        Rayfield:Notify({
            Title = "Contracts",
            Content = count > 0 and ("Found " .. count .. " contracts") or "No contracts found",
            Duration = 3,
            Image = "refresh-cw"
        })
    end,
})

ContractsTab:CreateButton({
    Name = "Accept Selected Contract",
    Callback = function()
        if not selectedContract or selectedContract == "Refresh first" or selectedContract == "No contracts found - open the board" then
            Rayfield:Notify({Title = "Error", Content = "Select a contract first", Duration = 3, Image = "x"})
            return
        end

        for _, entry in ipairs(contractList) do
            if entry.Display == selectedContract then
                local success = forceClick(entry.Button)

                Rayfield:Notify({
                    Title = success and "Success" or "Failed",
                    Content = success and ("Accepted: " .. entry.Display) or "Could not click the button",
                    Duration = 3,
                    Image = success and "check" or "x"
                })
                break
            end
        end
    end,
})



print("Rayfield GUI Script Loaded Successfully! Enjoy this script")