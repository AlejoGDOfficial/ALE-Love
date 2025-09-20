local ALEState = require('ale.ALEState')

local Sprite = require('objects.Sprite')

local TestState = ALEState:extend()

local spr = Sprite:new(0, 0)

function TestState:load()
    self.super:load()

    self:add(spr)
end

local curTime = 0

function TestState:update(elapsed)
    curTime = curTime + elapsed

    spr.angle = math.sin(curTime) * 10
end

return TestState
