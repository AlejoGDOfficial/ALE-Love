local TestState = ALEClass.extend(ALEState)

local ALESound = require('ale.sound.ALESound')

local ALEGroup = require('ale.group.ALEGroup')

function TestState:load()
    self.sound = ALESound:new('music')
    self.sound:play()
    self.sound:pause()

    self.che3ereas = ALEGroup:new()
    self:add(self.che3ereas)
end

local timer = 0

local curTime = 0

function TestState:update(elapsed)
    ALEState.update(self, elapsed)

    timer = timer + elapsed

    if timer > 0.05 then
        local ch3erea = ALESprite:new(100, 100, 'dni')
        ch3erea.scale:set(0.1, 0.1)
        ch3erea:updateHitbox()
        ch3erea.velocity.x = 1000
        ch3erea.angle = #self.che3ereas.members * 12.5

        self.che3ereas:add(ch3erea)

        print(#self.che3ereas.members)

        timer = 0
    end

    curTime = curTime + elapsed

    for i, ch3erea in ipairs(self.che3ereas.members) do
        ch3erea.y = 200 + math.sin(curTime + i) * 50
        ch3erea.angle = ch3erea.angle + 10 * elapsed
    end
end

return TestState
