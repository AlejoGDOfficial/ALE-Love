local ALECameraFrontEnd = require('ale.frontEnds.ALECameraFrontEnd')

local ALEGame = ALEBasic.extend()

function ALEGame:new(initialState)
    local obj = ALEBasic.new(self)

    self.cameras = ALECameraFrontEnd:new()

    self.cameras:add(ALECamera:new())

    obj.state = initialState:new()

    return obj
end

function ALEGame:load()
    self.state:load()

    self.cameras:load()
end

function ALEGame:update(elapsed)
    self.state:update(elapsed)

    self.cameras:update(elapsed)
end

function ALEGame:draw()
    self.state:draw()

    self.cameras:draw()
end

return ALEGame
