-- GGProject/UI/Interface.lua
-- UI setup and controls

return function(Config, Censura)
    local Interface = {}

    function Interface:SetupUI()
        local GUI = Censura.new("GGProject")
        
        GUI:CreateToggle("ESP Enabled", false, function(state)
            Config.ESP.Enabled = state
        end)
        
        GUI:CreateToggle("Aimbot Enabled", false, function(state)
            Config.Aimbot.Enabled = state
        end)
        
        GUI:CreateSlider("Aimbot FOV", 50, 500, 200, function(value)
            Config.Aimbot.FOV = value
        end)
        
        GUI:CreateButton("Target: Players", function()
            Config.Aimbot.TargetMode = "Players"
        end)
        
        GUI:CreateButton("Target: NPCs", function()
            Config.Aimbot.TargetMode = "NPCs"
        end)
        
        GUI:CreateButton("Target: Both", function()
            Config.Aimbot.TargetMode = "Both"
        end)
    end

    return Interface
end
