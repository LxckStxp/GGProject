-- GGProject/Modules/Aimbot.lua
-- Aimbot functionality

local Aimbot = {}
local Config = require(script.Parent.Parent.Core.Config)
local Services = require(script.Parent.Parent.Core.Services)

function Aimbot:Init()
    -- Initial setup
end

function Aimbot:GetNearestTarget()
    local camera = Services.Workspace.CurrentCamera
    local mousePos = Services.UserInputService:GetMouseLocation()
    local tracker = require(script.Parent.EntityTracker)
    local nearest, nearestDist = nil, Config.Aimbot.FOV
    
    local function checkTarget(target)
        local root = target:FindFirstChild("HumanoidRootPart")
        local humanoid = target:FindFirstChild("Humanoid")
        if root and humanoid and humanoid.Health > 0 then
            local screenPos, onScreen = camera:WorldToViewportPoint(root.Position)
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                if dist < nearestDist then
                    nearest = target
                    nearestDist = dist
                end
            end
        end
    end
    
    if Config.Aimbot.TargetMode == "Players" or Config.Aimbot.TargetMode == "Both" then
        for _, entity in pairs(tracker.Players) do
            checkTarget(entity)
        end
    end
    
    if Config.Aimbot.TargetMode == "NPCs" or Config.Aimbot.TargetMode == "Both" then
        for _, entity in pairs(tracker.NPCs) do
            checkTarget(entity)
        end
    end
    
    return nearest
end

function Aimbot:Update()
    if not Config.Aimbot.Enabled or not tracker.LocalPlayer then return end
    
    local target = self:GetNearestTarget()
    if target then
        local camera = Services.Workspace.CurrentCamera
        local targetPos = target:FindFirstChild("HumanoidRootPart").Position
        local newCFrame = CFrame.new(camera.CFrame.Position, targetPos)
        camera.CFrame = camera.CFrame:Lerp(newCFrame, Config.Aimbot.Smoothing)
    end
end

return Aimbot
