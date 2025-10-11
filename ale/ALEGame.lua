local ALEBasic = require('ale.ALEBasic')

local ALEGame = ALEBasic:extend()

function ALEGame:__init(initialState)
    self.super:__init()

    self.state = initialState
end

function ALEGame:load()
    self.super:load()

    self.state:load()
end

function ALEGame:update(elapsed)
    self.super:update(elapsed)

    self.state:update(elapsed)
end

function ALEGame:draw()
    self.super:draw()

    self.state:draw()
end

return ALEGame
