local ALEStateManager = require('ale.ALEStateManager')

local ALEBasic = require('ale.ALEBasic')

local ALEGame = ALEBasic:extend()

function ALEGame:new(initialState)
    self.super:new()

    self.stateManager = ALEStateManager:new(initialState)

    return self
end

function ALEGame:load()
    self.super:load()

    self.stateManager:load()
end

function ALEGame:draw()
    self.super:draw()

    self.stateManager:draw()
end

function ALEGame:update(elapsed)
    self.super:update(elapsed)

    self.stateManager:update(elapsed)
end

return ALEGame
