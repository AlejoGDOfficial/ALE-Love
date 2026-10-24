local AleState = require 'ale.AleState'
local AleSprite = require 'ale.AleSprite'
local AleG = require 'ale.AleG'

local TestState = AleState:extend()

function TestState:create()
    TestState.super.create(self)

    self.spr = AleSprite:new(0, 0, 'example')
    self:add(self.spr)
end

function TestState:update(elapsed)
    TestState.super.update(self, elapsed)

    self.spr.scale.y = math.sin(AleG.time)
    self.spr.scale.x = math.cos(AleG.time)
end

return TestState
