--< Services >--
local ServerScriptService = game:GetService("ServerScriptService")

--< Modules >--
local Pet = require(ServerScriptService.Pet)
local Dog = require(ServerScriptService.Dog)

--< Start >--
local MyPet = Pet.new("Chuck", 6)
MyPet:SayHi()

local MyDog = Dog.new("Annie", 7)
MyDog:SayHi()
MyDog:Bark()

MyPet:Bark()