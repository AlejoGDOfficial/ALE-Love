local Ch3erea = ALESprite:extend()

function Ch3erea:__init()
    self.super:__init(0, 0, 'dni')
end

local SubCh3erea = Ch3erea:extend()

function SubCh3erea:__init()
    self.super:__init()

    self.x = 100
end

local curTime = 0

function SubCh3erea:update(elapsed)
    self.super:update(elapsed)

    curTime = curTime + elapsed

    self.x = math.sin(curTime) * 100
end

local ALEState = require('ale.ALEState')

local TestState = ALEState:extend()

function TestState:load()
    self.super:load()

    self:add(SubCh3erea:new())
end

return TestState
