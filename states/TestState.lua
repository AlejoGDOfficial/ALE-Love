local ExtSpr = ALESprite:extend()

function ExtSpr:new()
    self.super:new(0, 0, 'dni')

    self.scale:set(0.25, 0.25)

    self.x = 100

    return self
end

local TestState = ALEState:extend()

local spr = ExtSpr:new()

function TestState:load()
    self:add(spr)
end

function TestState:draw()
    print('State Draw')

    self.super:draw()
end

return TestState
