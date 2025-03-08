-- GGProject/Core/Config.lua
-- Configuration settings

local Config = {
    ESP = {
        Enabled = false,
        PlayerColor = Color3.fromRGB(100, 200, 100),
        NPCColor = Color3.fromRGB(200, 100, 100)
    },
    Aimbot = {
        Enabled = false,
        TargetMode = "Players", -- "Players", "NPCs", "Both"
        FOV = 200,
        Smoothing = 0.1
    },
    UI = {
        ToggleKey = Enum.KeyCode.RightAlt
    }
}

return Config
