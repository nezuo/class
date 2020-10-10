# Class
A simple OOP library for Roblox.

Creating a class:
```lua
local Class = require(...)

local Pet = Class()

function Pet:Construct(name) -- Construct defines the constructor
    self.Name = name
end

function Pet:Method() end -- Define a method
```

Creating a subclass: 
```lua
local Dog = Pet:Extend()

function Dog:Construct(name, breed) -- Overwrite constructor 
    self.Super(name) -- Call the parent class's constructor
    
    self.Breed = breed
end

function Dog:Method2()
    self.Super.Method(self) -- Call the parent class's method
end
```
