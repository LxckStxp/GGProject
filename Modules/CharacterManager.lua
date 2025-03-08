-- GGProject/Modules/CharacterManager.lua
-- Character event handling

return function(Services, EntityTracker)
    local CharacterManager = {}

    function CharacterManager:Init()
        Services.Workspace.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("Model") and descendant:FindFirstChild("Humanoid") then
                EntityTracker:Update()
            end
        end)
        
        Services.Workspace.DescendantRemoving:Connect(function(descendant)
            if descendant:IsA("Model") and descendant:FindFirstChild("Humanoid") then
                EntityTracker:Update()
            end
        end)
    end

    return CharacterManager
end
