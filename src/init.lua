--< Classes >--
local BaseClass = {}
BaseClass.__index = BaseClass

function BaseClass:Construct() end

function BaseClass:Extend()
    local Class = setmetatable({}, self)
    Class.__index = Class

    Class.new = function(...)
        local Object = setmetatable({}, Class)

        Object:Construct(...)

        return Object
    end

    return Class
end

--< Module >--
local function Class()
    return BaseClass:Extend()
end

return Class