local AleState = require 'ale.AleState'
local AleSound = require 'ale.sound.AleSound'

local TestState = AleState:extend()

function TestState:create()
    TestState.super.create(self)

    self.snd = AleSound:new('example')
    self.snd:play()
    self.snd:setPitch(0.75)
end

function TestState:update(elapsed)
    TestState.super.update(self, elapsed)
end

return TestState
