local TestState = ALEClass.extend(ALEState)

local ALESound = require('ale.sound.ALESound')

function TestState:load()
    self.sound = ALESound:new('music')
    self.sound:play()

    self.ch3erea = ALESprite:new(0, 0, 'dni')
    self:add(self.ch3erea)
    self.ch3erea.color.b = 0

    ALE_G.camera.zoom = 2
end

local curTime = 0

function TestState:update(elapsed)
    ALEState.update(self, elapsed)

    curTime = curTime + elapsed

    local vel = 300 * elapsed

    if ALE_G.keys.pressed['up'] then
        ALE_G.camera.scroll.y = ALE_G.camera.scroll.y - vel
    end

    if ALE_G.keys.pressed['down'] then
        ALE_G.camera.scroll.y = ALE_G.camera.scroll.y + vel
    end

    if ALE_G.keys.pressed['left'] then
        ALE_G.camera.scroll.x = ALE_G.camera.scroll.x - vel
    end

    if ALE_G.keys.pressed['right'] then
        ALE_G.camera.scroll.x = ALE_G.camera.scroll.x + vel
    end

    if ALE_G.keys.pressed['q'] then
        ALE_G.camera.zoom = ALE_G.camera.zoom - 0.25
    end

    if ALE_G.keys.pressed['e'] then
        ALE_G.camera.zoom = ALE_G.camera.zoom + 0.25
    end

    self.ch3erea.angle = self.ch3erea.angle + 300 * elapsed
end

return TestState
