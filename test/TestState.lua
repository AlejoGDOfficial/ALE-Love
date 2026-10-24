local TestState = AleState:extend()

local image = nil

function TestState:create()
    TestState.super.create(self)

    image = AlePaths.image('examples') or AlePaths.image('example')
end

function TestState:draw()
    TestState.super.draw(self)

    if image then
        love.graphics.draw(image)
    end
end

return TestState
