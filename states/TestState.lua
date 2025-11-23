local TestState = ALEClass.extend(ALEState)

local curTime = 0

function TestState:load()
    self.ch3erea = ALESprite:new(100, 100, 'dni')
    self.ch3erea.scale:set(0.1, 0.1)
    self.ch3erea.acceleration.y = 100

    self:add(self.ch3erea)
end

function TestState:update(elapsed)
    ALEState.update(self, elapsed)
end

return TestState
