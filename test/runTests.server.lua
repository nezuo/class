local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TestService = game:GetService("TestService")

local TestEZ = require(TestService.TestEZ)

TestEZ.TestBootstrap:run({
    ReplicatedStorage.class,
})
