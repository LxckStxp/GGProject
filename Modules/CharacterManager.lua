-- GGProject/Modules/CharacterManager.lua
-- Character event handling

local CharacterManager = {}
local Services = require(script.Parent.Parent.Core.Services)

function CharacterManager:Init()
    Services.Workspace.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("Model") and descendant:FindFirstChild("Humanoid") then
            local tracker = require(script.Parent.EntityTracker)
            tracker:Update()
        end
    end)
    
    Services.Workspace.DescendantRemoving:Connect(function(descendant)
        if descendant:IsA("Model") and descendant:FindFirstChild("Humanoid") then
            local tracker = require(script.Parent.EntityTracker)
            tracker:Update()
        end
    end)
end

return CharacterManager
