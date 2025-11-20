local TestState = ALEClass.extend(ALEState)

function TestState:load()
    self.myCam = ALECamera:new()

    ALE_G.cameras:add(self.myCam)

    self.ch3erea = ALESprite:new(100, 100, 'dni')
    self.ch3erea.scale.x, self.ch3erea.scale.y = 0.25, 0.25

    table.insert(self.ch3erea.cameras, self.myCam)

    self:add(self.ch3erea)
end

function TestState:update(elapsed)
    ALEState.update(self, elapsed)

    self.myCam.zoom = ALEMath.fpsLerp(self.myCam.zoom, 0.5, 0.05)
end

return TestState
