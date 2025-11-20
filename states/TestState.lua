local TestState = ALEClass.extend(ALEState)

function TestState:load()
    for i = 1, 10 do
        local spr = ALESprite:new(100, 100, 'dni')
        spr.scale.x, spr.scale.y = 0.25, 0.25
        spr:updateHitbox()
        self:add(spr)
    end
end

local curTime = 0

function TestState:update(elapsed)
    ALEState.update(self, elapsed)

    curTime = curTime + elapsed * 100

    for i, members in ipairs(self.members) do
        members.x = math.sin(curTime + i) * 100
    end
end

return TestState
