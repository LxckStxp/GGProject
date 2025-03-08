-- GGProject/Core/Init.lua
-- Main initialization script

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GGProject = {}

-- Load Core
GGProject.Config = require(script.Parent.Config)
GGProject.Services = require(script.Parent.Services)

-- Load Modules
GGProject.EntityTracker = require(script.Parent.Parent.Modules.EntityTracker)
GGProject.ESP = require(script.Parent.Parent.Modules.ESP)
GGProject.Aimbot = require(script.Parent.Parent.Modules.Aimbot)
GGProject.CharacterManager = require(script.Parent.Parent.Modules.CharacterManager)

-- Load UI
GGProject.Censura = require(script.Parent.Parent.UI.CensuraLoader)
GGProject.Interface = require(script.Parent.Parent.UI.Interface)

-- Load Utilities
GGProject.Utilities = require(script.Parent.Parent.Lib.Utilities)

-- Initialize
function GGProject:Init()
    self.EntityTracker:Start()
    self.ESP:Init()
    self.Aimbot:Init()
    self.CharacterManager:Init()
    self.Interface:SetupUI()
    
    -- Main loop
    self.Services.RunService.RenderStepped:Connect(function()
        self.EntityTracker:Update()
        self.ESP:Update()
        self.Aimbot:Update()
    end)
end

GGProject:Init()
return GGProject
