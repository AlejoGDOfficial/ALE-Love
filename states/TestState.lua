local TestState = ALEState:extend()

local spr = ALESprite:new(0, 0, 'dni')
spr.scale.x, spr.scale.y = 0.5, 0.5
spr:screenCenter()

function TestState:load()
    self.super:load()

    self:add(spr)
end

local curTime = 0

function TestState:update(elapsed)
    curTime = curTime + elapsed

    self.super:update(elapsed)
end

return TestState
