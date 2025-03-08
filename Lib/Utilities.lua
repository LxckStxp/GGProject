-- GGProject/Lib/Utilities.lua
-- General utility functions

local Utilities = {}

function Utilities:Lerp(a, b, t)
    return a + (b - a) * t
end

return Utilities
