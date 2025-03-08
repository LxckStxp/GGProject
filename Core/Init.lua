-- GGProject/Core/Init.lua
-- Main initialization script

local BASE_URL = "https://raw.githubusercontent.com/yourusername/GGProject/main"

-- Load Core
local Config = loadstring(game:HttpGet(BASE_URL .. "/Core/Config.lua"))()
local Services = loadstring(game:HttpGet(BASE_URL .. "/Core/Services.lua"))()

-- Load Modules
local EntityTracker = loadstring(game:HttpGet(BASE_URL .. "/Modules/EntityTracker.lua"))()
local ESP = loadstring(game:HttpGet(BASE_URL .. "/Modules/ESP.lua"))()
local Aimbot = loadstring(game:HttpGet(BASE_URL .. "/Modules/Aimbot.lua"))()
local CharacterManager = loadstring(game:HttpGet(BASE_URL .. "/Modules/CharacterManager.lua"))()

-- Load UI
local Censura = loadstring(game:HttpGet(BASE_URL .. "/UI/CensuraLoader.lua"))()
local Interface = loadstring(game:HttpGet(BASE_URL .. "/UI/Interface.lua"))()

-- Load Utilities
local Utilities = loadstring(game:HttpGet(BASE_URL .. "/Lib/Utilities.lua"))()

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
