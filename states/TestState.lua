local TestState = ALEClass.extend(ALEState)

local curTime = 0

function TestState:load()
    self.ch3erea = ALESprite:new(100, 100, 'dni')
    self.ch3erea.scale:set(0.1, 0.1)

    self:add(self.ch3erea)
end

function TestState:update(elapsed)
    ALEState.update(self, elapsed)

    self.ch3erea.velocity.x = 0
    self.ch3erea.velocity.y = 0

    if ALE_G.keys.pressed['up'] then
        self.ch3erea.velocity.y = -100
    end

    if ALE_G.keys.pressed['down'] then
        self.ch3erea.velocity.y = 100
    end

    if ALE_G.keys.pressed['left'] then
        self.ch3erea.velocity.x = -100
    end

    if ALE_G.keys.pressed['right'] then
        self.ch3erea.velocity.x = 100
    end
end

return TestState
