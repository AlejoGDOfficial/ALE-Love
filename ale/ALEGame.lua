local ALEKeysFrontEnd = require('ale.frontEnds.ALEKeysFrontEnd')
local ALESoundFrontEnd = require('ale.frontEnds.ALESoundFrontEnd')
local ALECameraFrontEnd = require('ale.frontEnds.ALECameraFrontEnd')

local ALEGame = ALEBasic.extend()

function ALEGame:new(initialState)
    local this = ALEBasic.new(self)

    this.keys = ALEKeysFrontEnd:new()

    this.sound = ALESoundFrontEnd:new()

    this.cameras = ALECameraFrontEnd:new()

    this.cameras:add(ALECamera:new())

    this.state = initialState:new()

    return this
end

function ALEGame:load()
    self.state:load()

    self.cameras:load()
end

function ALEGame:update(elapsed)
    self.keys:update()

    self.cameras:update(elapsed)

    self.state:update(elapsed)
end

function ALEGame:draw()
    self.state:draw()

    self.cameras:draw()
end

function ALEGame:justPressedKey(key)
    self.keys:justPressedKey(key)
end

function ALEGame:justReleasedKey(key)
    self.keys:justReleasedKey(key)
end

return ALEGame
