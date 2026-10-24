local TestState = AleState:extend()

function TestState:draw()
    TestState.super.draw(self)

    love.graphics.draw(AlePaths.image('example'))
end

return TestState
