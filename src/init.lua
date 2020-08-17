local function Class()
    local NewClass = {}
    NewClass.__index = NewClass

    return NewClass
end

--[[
local Dog = Class()

function Dog:Constructor()
    
end

return Dg
--]]