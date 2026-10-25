local AleState = require 'ale.AleState'
local AleSprite = require 'ale.AleSprite'
local AleText = require 'ale.text.AleText'
local AleG = require 'ale.AleG'
local AleMath = require 'ale.math.AleMath'

local TestState = AleState:extend()

function TestState:create()
    TestState.super.create(self)

    self.text = AleText:new(50, 50, '', 50)
    self:add(self.text)

    self.text:setText 'mercadolibre'
end

local fps = 0

function TestState:update(elapsed)
    TestState.super.update(self, elapsed)

    fps = AleMath.elapsedLerp(fps, 1 / elapsed, 0.1)

    self.text:setText(AleMath.roundDecimal(fps, 2))
end

return TestState
