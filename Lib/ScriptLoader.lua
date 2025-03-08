-- GGProject/Lib/ScriptLoader.lua
-- Utility module for loading scripts

local ScriptLoader = {}

local BASE_URL = "https://raw.githubusercontent.com/LxckStxp/GGProject/main"

function ScriptLoader:Load(path)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(BASE_URL .. path))()
    end)
    if not success then
        warn("Failed to load script: " .. path .. " - " .. result)
        return nil
    end
    return result
end

return ScriptLoader
