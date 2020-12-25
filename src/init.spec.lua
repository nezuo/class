local ReplicatedStorage = game:GetService("ReplicatedStorage")

return function()
    local class = require(ReplicatedStorage.class)

    describe("Class", function()
        it("should have a constructor", function()
            local Example = class()

            expect(Example.new()).to.be.ok()
        end)

        it("should call constructor", function()
            local Example = class()

            function Example:construct()
                self.called = true
            end

            expect(Example.new().called).to.equal(true)
        end)

        it("should extend parent", function()
            local Parent = class()

            function Parent:method() end

            local Child = Parent:extend()

            expect(function()
                Child:method()
            end).never.to.throw()
        end)

        it("should call parent constructor", function()
            local Parent = class()

            function Parent:construct()
                self.constructed = true
            end

            local Child = Parent:extend()

            function Child:construct()
                Parent.construct(self)
            end

            expect(Child.new().constructed).to.equal(true)
        end)

        it("should call parent constructors", function()
            local Ancestor = class()

            function Ancestor:construct()
                self.ancestorCalled = true
            end

            local Parent = Ancestor:extend()

            function Parent:construct()
                Ancestor.construct(self)

                self.parentCalled = true
            end

            local Child = Parent:extend()

            function Child:construct()
                Parent.construct(self)

                self.childCalled = true
            end

            local object = Child.new()

            expect(object.ancestorCalled and object.parentCalled and object.childCalled).to.equal(true)
        end)

        it("should call parent method", function()
            local Parent = class()

            function Parent:method()
                return true
            end

            local Child = Parent:extend()

            function Child:method()
                return Parent.method(self)
            end

            expect(function()
                local result = Child.new():method()

                expect(result).to.equal(true)
            end).never.to.throw()
        end)

        it("should call ancestor method", function()
            local Ancestor = class()

            function Ancestor:method()
                return true
            end

            local Parent = Ancestor:extend()

            function Parent:method()
                return true
            end

            local Child = Parent:extend()

            function Child:method()
                return Ancestor.method(self)
            end

            expect(function()
                local result = Child.new():method()

                expect(result).to.equal(true)
            end).never.to.throw()
        end)

        it("shouldn't affect class", function()
            local Example = class()

            function Example:construct()
                self.constructed = true
            end

            Example.new()

            expect(Example.constructed).never.to.equal(true)
        end)

        it("shouldn't affect parent class (constructor)", function()
            local Parent = class()

            function Parent:construct()
                self.constructed = true
            end

            local Child = Parent:extend()

            function Child:construct()
                Parent.construct(self)
            end

            Child.new()

            expect(Parent.constructed).never.to.equal(true)
        end)

        it("shouldn't affect parent class (method)", function()
            local Parent = class()

            function Parent:method()
                self.called = true
            end

            local Child = Parent:extend()

            function Child:method()
                Parent.method(self)
            end

            Child.new():method()

            expect(Parent.called).never.to.equal(true)
        end)
    end)
end