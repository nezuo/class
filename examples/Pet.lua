--< Services >--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--< Modules >--
local Class = require(ReplicatedStorage.Class)

--< Class >--
local Pet = Class()
Pet.Type = "Pet"

function Pet:Construct(name, age)
    self.Name = name
    self.Age = age
end

function Pet:SayHi()
    print("Hello my name is " .. self.Name .. " and I am " .. self.Age .. " years old.")
end

return Pet