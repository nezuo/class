local ReplicatedStorage = game:GetService("ReplicatedStorage")

local class = require(ReplicatedStorage.class)

local Pet = class()

function Pet:construct(name, age)
    self.name = name
    self.age = age
end

function Pet:sayHi()
    print("Hello my name is " .. self.name .. " and I am " .. self.age .. " years old.")
end

return Pet