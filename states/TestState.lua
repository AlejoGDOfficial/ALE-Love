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

    self.text = ALEText:new(5, 5, 'oso', 50)
    self:add(self.text)

    self.vid = ALEVideo:new(0, 0, 'video')
    --self:add(self.vid)
    --self.vid:play()
end

local curFPS = 0

local curTime = 0

function TestState:update(elapsed)
    ALEState.update(self, elapsed)

    curFPS = ALEMath.fpsLerp(curFPS, 1 / elapsed, 0.3)

    self.text.text = 'FPS: ' .. math.ceil(curFPS)

    curTime = curTime + elapsed

    self.ch3erea.velocity.x = 0
    self.ch3erea.velocity.y = 0

    if ALE_G.keys['up'] then
        self.ch3erea.velocity.y = -100
    end

    if ALE_G.keys['down'] then
        self.ch3erea.velocity.y = 100
    end

    if ALE_G.keys['left'] then
        self.ch3erea.velocity.x = -100
    end

    if ALE_G.keys['right'] then
        self.ch3erea.velocity.x = 100
    end

    self.ch3erea.angle = self.ch3erea.angle + 300 * elapsed
end

return TestState
