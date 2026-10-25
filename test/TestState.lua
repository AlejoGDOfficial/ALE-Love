local AleState = require 'ale.AleState'
local AleSprite = require 'ale.AleSprite'
local AleText = require 'ale.text.AleText'
local AleG = require 'ale.AleG'

local TestState = AleState:extend()

function TestState:create()
    TestState.super.create(self)

    self.text = AleText:new(50, 50, '', 50, 'komik.ttf')
    self:add(self.text)

    self.text:setText 'mercadolibre'
end

function TestState:update(elapsed)
    TestState.super.update(self, elapsed)
end

return TestState
