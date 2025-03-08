-- GGProject/Modules/ESP.lua
-- ESP functionality

local ScriptLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/LxckStxp/GGProject/main/Lib/ScriptLoader.lua"))()
local Config = ScriptLoader:Load("/Core/Config.lua")
local Services = ScriptLoader:Load("/Core/Services.lua")
local EntityTracker = ScriptLoader:Load("/Modules/EntityTracker.lua")

local ESP = {
    Visuals = Instance.new("Folder"),
    Elements = {}
}

function ESP:Init()
    self.Visuals.Name = "ESPVisuals"
    self.Visuals.Parent = Services.Workspace
end

function ESP:CreateESP(target, isPlayer)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = (isPlayer and "Player" or "NPC") .. "_ESP_" .. target.Name
    billboard.Parent = self.Visuals
    billboard.Adornee = target:FindFirstChild("Head") or target.PrimaryPart
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = billboard
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = target.Name
    nameLabel.TextColor3 = isPlayer and Config.ESP.PlayerColor or Config.ESP.NPCColor
    nameLabel.TextScaled = true
    
    local healthBar = Instance.new("Frame")
    healthBar.Parent = billboard
    healthBar.Position = UDim2.new(0, 0, 0.5, 0)
    healthBar.Size = UDim2.new(1, 0, 0.5, 0)
    healthBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    
    local healthFill = Instance.new("Frame")
    healthFill.Parent = healthBar
    healthFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    
    local esp = {
        Billboard = billboard,
        HealthFill = healthFill,
        Target = target
    }
    
    self.Elements[target] = esp
    return esp
end

function ESP:Update()
    if not Config.ESP.Enabled then
        self.Visuals:ClearAllChildren()
        self.Elements = {}
        return
    end
    
    for _, entity in pairs(EntityTracker.Players) do
        local humanoid = entity:FindFirstChild("Humanoid")
        if humanoid then
            local esp = self.Elements[entity] or self:CreateESP(entity, true)
            esp.HealthFill.Size = UDim2.new(humanoid.Health/humanoid.MaxHealth, 0, 1, 0)
            esp.Billboard.Enabled = true
        end
    end
    
    for _, entity in pairs(EntityTracker.NPCs) do
        local humanoid = entity:FindFirstChild("Humanoid")
        if humanoid then
            local esp = self.Elements[entity] or self:CreateESP(entity, false)
            esp.HealthFill.Size = UDim2.new(humanoid.Health/humanoid.MaxHealth, 0, 1, 0)
            esp.Billboard.Enabled = true
        end
    end
end

return ESP
