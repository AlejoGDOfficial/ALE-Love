local TestState = ALEState:extend()

local spr = ALESprite:new(0, 0, 'dni')
spr.scale.x, spr.scale.y = 0.25, 0.25
spr:screenCenter()

function TestState:load()
    self.super:load()

    self:add(spr)
end

return TestState
