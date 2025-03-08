-- GGProject/Core/Services.lua
-- Service definitions

local Services = {
    RunService = game:GetService("RunService"),
    UserInputService = game:GetService("UserInputService"),
    Workspace = game:GetService("Workspace"),
    Players = game:GetService("Players") -- Fallback, may not always work
}

return Services
