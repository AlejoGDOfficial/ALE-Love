local ALEStateManager = require('ale.ALEStateManager')

local ALEGame = {}

function ALEGame:new(initialState)
    local variables = {
        stateManager = ALEStateManager:new(initialState)
    }

    self.__index = self

    return setmetatable(variables, self)
end

function ALEGame:load()
    self.stateManager:load()
end

function ALEGame:draw()
    self.stateManager:draw()
end

function ALEGame:update(elapsed)
    self.stateManager:update(elapsed)
end

return ALEGame
