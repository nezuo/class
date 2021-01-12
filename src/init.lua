local BaseClass = {}
BaseClass.__index = BaseClass

function BaseClass:construct()

end

function BaseClass:extend(typeSpecifier)
	local Class = setmetatable({}, { __index = self })
	Class.__index = Class
	Class.__type = typeSpecifier

	Class.new = function(...)
		local object = setmetatable({}, Class)

		object:construct(...)

		return object
	end

	return Class
end

local function class(typeSpecifier)
	return BaseClass:extend(typeSpecifier)
end

return class
