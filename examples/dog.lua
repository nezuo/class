--< Services >--
local ServerScriptService = game:GetService("ServerScriptService")

--< Modules >--
local Pet = require(ServerScriptService.Pet)

--< Class >--
local Dog = Pet:Extend()

function Dog:Construct(name, age)
    Pet.Construct(self, name, age)
end

function Dog:Bark()
    Pet.SayHi(self)

    print("Bark!")
end

return Dog