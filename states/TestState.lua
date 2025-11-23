local TestState = ALEClass.extend(ALEState)

function TestState:load()
    for i = 1, 100 do
        local spr = ALESprite:new(100, 100, 'dni')
        spr.scale.x, spr.scale.y = 0.15, 0.15
        spr:updateHitbox()
        self:add(spr)
    end
end

local curTime = 0

function TestState:update(elapsed)
    ALEState.update(self, elapsed)

    curTime = curTime + elapsed

    for i, members in ipairs(self.members) do
        members.x = math.sin(curTime + i) * 100 + 200
        members.y = math.cos(curTime + i) * 100 + 200

        members.angle = members.angle + 10 * elapsed
    end
end

return TestState
