local BaseClass = {}
BaseClass.__index = BaseClass

function BaseClass:construct() end

function BaseClass:extend()
    local Class = setmetatable({}, self)
    Class.__index = Class

    Class.new = function(...)
        local object = setmetatable({}, Class)

        object:construct(...)

        return object
    end

    return Class
end

local function class()
    return BaseClass:extend()
end

return class