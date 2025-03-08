-- GGProject/Modules/EntityTracker.lua
-- Robust entity tracking without relying on GetPlayers

local EntityTracker = {}
local Config = require(script.Parent.Parent.Core.Config)
local Services = require(script.Parent.Parent.Core.Services)

EntityTracker.Players = {}
EntityTracker.NPCs = {}
EntityTracker.LocalPlayer = nil

function EntityTracker:Start()
    -- Find local player through character detection
    local function findLocalPlayer()
        for _, humanoid in pairs(Services.Workspace:GetDescendants()) do
            if humanoid:IsA("Humanoid") and humanoid.Parent then
                local root = humanoid.Parent:FindFirstChild("HumanoidRootPart")
                if root and root:FindFirstChild("LocalPlayer") then -- Custom check for local player
                    self.LocalPlayer = humanoid.Parent
                    break
                end
            end
        end
    end
    
    findLocalPlayer()
    if not self.LocalPlayer then
        self.LocalPlayer = Services.Players.LocalPlayer -- Fallback
    end
end

function EntityTracker:Update()
    self.Players = {}
    self.NPCs = {}
    
    -- Scan workspace for entities
    for _, obj in pairs(Services.Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj ~= self.LocalPlayer then
            local humanoid = obj:FindFirstChild("Humanoid")
            local root = obj:FindFirstChild("HumanoidRootPart")
            if humanoid and root then
                -- Determine if it's a player or NPC
                local isPlayer = false
                if Services.Players:GetPlayerFromCharacter(obj) then
                    isPlayer = true
                elseif obj:FindFirstChild("PlayerTag") then -- Custom tag check
                    isPlayer = true
                end
                
                if isPlayer then
                    table.insert(self.Players, obj)
                else
                    table.insert(self.NPCs, obj)
                end
            end
        end
    end
end

return EntityTracker
