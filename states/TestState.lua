local TestState = ALEClass.extend(ALEState)

local ALESound = require('ale.sound.ALESound')

local ALEGroup = require('ale.group.ALEGroup')

function TestState:load()
    self.sound = ALESound:new('music')
    self.sound:play()

    self.ch3erea = ALESprite:new(0, 0, 'dni')
    self.ch3erea.scale:set(0.1, 0.1)
    self.ch3erea:updateHitbox()
    self.ch3erea:screenCenter()
    self:add(self.ch3erea)

    self.staticCh3erea = ALESprite:new(0, 0, 'dni')
    self.staticCh3erea.scale:set(0.1, 0.1)
    self.staticCh3erea:updateHitbox()
    self.staticCh3erea.scrollFactor:set(0.5, 0.5)
    self:add(self.staticCh3erea)
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
end

return TestState
