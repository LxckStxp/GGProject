-- GGProject/Core/Init.lua
-- Main initialization script

local BASE_URL = "https://raw.githubusercontent.com/LxckStxp/GGProject/main"
local ScriptLoader = loadstring(game:HttpGet(BASE_URL .. "/Lib/ScriptLoader.lua"))()

-- Load Core
local Config = ScriptLoader:Load("/Core/Config.lua")
local Services = ScriptLoader:Load("/Core/Services.lua")

-- Load Modules
local EntityTracker = ScriptLoader:Load("/Modules/EntityTracker.lua")
local ESP = ScriptLoader:Load("/Modules/ESP.lua")
local Aimbot = ScriptLoader:Load("/Modules/Aimbot.lua")
local CharacterManager = ScriptLoader:Load("/Modules/CharacterManager.lua")

-- Load UI
local Censura = ScriptLoader:Load("/UI/CensuraLoader.lua")
local Interface = ScriptLoader:Load("/UI/Interface.lua")

-- Load Utilities
local Utilities = ScriptLoader:Load("/Lib/Utilities.lua")

-- Framework Object
local GGProject = {
    Config = Config,
    Services = Services,
    EntityTracker = EntityTracker,
    ESP = ESP,
    Aimbot = Aimbot,
    CharacterManager = CharacterManager,
    Censura = Censura,
    Interface = Interface,
    Utilities = Utilities
}

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
