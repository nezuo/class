local ServerScriptService = game:GetService("ServerScriptService")

local Pet = require(ServerScriptService.Pet)

local Dog = Pet:extend()

function Dog:construct(name, age)
    Pet.construct(self, name, age)
end

function Dog:bark()
    Pet.sayHi(self)

    print("Bark!")
end

return Dog