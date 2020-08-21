--< Services >--
local ServerScriptService = game:GetService("ServerScriptService")

--< Modules >--
local Pet = require(ServerScriptService.Pet)

--< Class >--
local Dog = Pet:Extend()

function Dog:Construct(name, age)
    self.Super(name, age)
end

function Dog:Bark()
    self.Super.SayHi(self)

    print("Bark!")
end

return Dog