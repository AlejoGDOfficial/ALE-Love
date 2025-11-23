local TestState = ALEClass.extend(ALEState)

function TestState:load()
    self.ch3erea = ALESprite:new(100, 100, 'dni')
    self.ch3erea.scale:set(0.1, 0.1)
    self.ch3erea:updateHitbox()

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

    if ALE_G.keys.justPressed['space'] then
        self.ch3erea.angle = self.ch3erea.angle > 0 and -10 or 10
    end

    self.ch3erea.angle = ALEMath.fpsLerp(self.ch3erea.angle, 0, 0.1)
end

return TestState
