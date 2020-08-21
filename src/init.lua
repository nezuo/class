--< Functions >--
local function DeepCopy(tbl)
    local Copy = {}

    for key,value in pairs(tbl) do
        if type(value) == "table" and key ~= "__index" and key ~= "__newindex" then
            Copy[key] = DeepCopy(value)
        else
            Copy[key] = value
        end
    end

    return Copy
end

--< Classes >--
local BaseClass = {}

function BaseClass:Construct() end

function BaseClass:Extend()
    local Class = DeepCopy(self)
    Class.__index = Class
    
    Class.new = function(...)
        local Object = {}

        setmetatable(Object, Class)

        local Super = {}
        Super.__index = self
        Super.__call = function(_, ...)
            if self.Construct then
                self.Construct(Object, ...)
            end
        end

        Object.Super = setmetatable({}, Super)

        if Object.Construct then
            Object:Construct(...)
        end

        return Object
    end

    return Class
end

--< Module >--
local function Class()
    return BaseClass:Extend()
end

return Class