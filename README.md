# Class
A simple OOP library for Roblox.

Creating a class:
```lua
local class = require(...)

local Pet = class()

function Pet:construct(name) -- Construct defines the constructor.
    self.name = name
end

function Pet:method() end -- Define a method.
```

Creating a subclass:
```lua
local Dog = Pet:extend()

function Dog:construct(name, breed) -- Overwrite constructor.
    Pet.construct(self, name) -- Call the parent class's constructor.

    self.breed = breed
end

function Dog:method2()
    Pet.method(self) -- Call the parent class's method.
    self:method() -- Alternatively, you can do this as long as this class doesn't define it.
end
```

Instancing an object:
```lua
local myPet = Dog.new("Charlie", "German Shepard")
```
