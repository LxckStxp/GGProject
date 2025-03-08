-- GGProject/Modules/CharacterManager.lua
-- Character event handling

local ScriptLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/LxckStxp/GGProject/main/Lib/ScriptLoader.lua"))()
local Services = ScriptLoader:Load("/Core/Services.lua")
local EntityTracker = ScriptLoader:Load("/Modules/EntityTracker.lua")

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
