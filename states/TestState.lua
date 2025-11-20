local TestState = ALEClass.extend(ALEState)

local Ch3erea = ALEClass.extend(ALESprite)

function Ch3erea:new()
    local obj = ALESprite.new(self, 200, 200, 'dni')

    obj.scale.x = 0.25
    obj.scale.y = 0.25
    obj:updateHitbox()

    obj.curTime = 0

    return obj
end

function Ch3erea:update(elapsed)
    ALESprite.update(self, elapsed)

    self.curTime = self.curTime + elapsed

    self.x = math.sin(self.curTime) * 100 + 100
end

local ch3erea0 = Ch3erea:new()

function TestState:load()
    self:add(ch3erea0)
end

return TestState
