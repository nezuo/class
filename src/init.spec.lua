--< Services >--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--< Test >--
return function()
    local Class = require(ReplicatedStorage.Class)

    describe("Class", function()
        it("should have a constructor", function()
            local Example = Class()

            expect(Example.new()).to.be.ok()
        end)

        it("should call constructor", function()
            local Example = Class()

            function Example:Construct()
                self.Called = true
            end

            expect(Example.new().Called).to.equal(true)
        end)

        it("should extend parent", function()
            local Parent = Class()
            
            function Parent:Method() end

            local Child = Parent:Extend()

            expect(function()
                Child:Method()
            end).never.to.throw()
        end)

        it("should call parent constructor", function()
            local Parent = Class()
            
            function Parent:Construct()
                self.Constructed = true
            end

            local Child = Parent:Extend()

            function Child:Construct()
                self.Super()
            end

            expect(Child.new().Constructed).to.equal(true)
        end)

        it("should call parent constructors", function()
            local Ancestor = Class()

            function Ancestor:Construct()
                self.AncestorCalled = true
            end

            local Parent = Ancestor:Extend()

            function Parent:Construct()
                self.Super()

                self.ParentCalled = true
            end

            local Child = Parent:Extend()

            function Child:Construct()
                self.Super()

                self.ChildCalled = true
            end

            local Object = Child.new()

            expect(Object.AncestorCalled and Object.ParentCalled and Object.ChildCalled).to.equal(true)
        end)

        it("should call parent method", function()
            local Parent = Class()

            function Parent:Method()
                return true
            end

            local Child = Parent:Extend()

            function Child:Method()
                return self.Super.Method(self)
            end

            expect(function()
                local Result = Child.new():Method()

                expect(Result).to.equal(true)
            end).never.to.throw()
        end)
    end)
end