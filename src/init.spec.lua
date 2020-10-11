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
                Parent.Construct(self)
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
                Ancestor.Construct(self)

                self.ParentCalled = true
            end

            local Child = Parent:Extend()

            function Child:Construct()
                Parent.Construct(self)

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
                return Parent.Method(self)
            end

            expect(function()
                local Result = Child.new():Method()

                expect(Result).to.equal(true)
            end).never.to.throw()
        end)

        it("should call ancestor method", function()
            local Ancestor = Class()

            function Ancestor:Method()
                return true
            end

            local Parent = Ancestor:Extend()

            function Parent:Method()
                return true
            end

            local Child = Parent:Extend()

            function Child:Method()
                return Ancestor.Method(self)
            end

            expect(function()
                local Result = Child.new():Method()

                expect(Result).to.equal(true)
            end).never.to.throw()
        end)

        it("shouldn't affect class", function()
            local Example = Class()

            function Example:Construct()
                self.Constructed = true
            end

            Example.new()

            expect(Example.Constructed).never.to.equal(true)
        end)

        it("shouldn't affect parent class (constructor)", function()
            local Parent = Class()

            function Parent:Construct()
                self.Constructed = true
            end

            local Child = Parent:Extend()

            function Child:Construct()
                Parent.Construct(self)
            end

            Child.new()

            expect(Parent.Constructed).never.to.equal(true)
        end)

        it("shouldn't affect parent class (method)", function()
            local Parent = Class()

            function Parent:Method()
                self.Called = true
            end

            local Child = Parent:Extend()

            function Child:Method()
                Parent.Method(self)
            end

            Child.new():Method()

            expect(Parent.Called).never.to.equal(true)
        end)
    end)
end