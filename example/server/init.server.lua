local ServerScriptService = game:GetService("ServerScriptService")

local Pet = require(ServerScriptService.Pet)
local Dog = require(ServerScriptService.Dog)

local pet = Pet.new("Chuck", 6)
pet:sayHi()

local dog = Dog.new("Annie", 7)
dog:sayHi()
dog:bark()