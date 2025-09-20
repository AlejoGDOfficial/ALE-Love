local ALEBasic = require('ale.ALEBasic')

local ALEStateManager = ALEBasic:extend()

function ALEStateManager:new(initialState)
    self.super:new()

    self.current = initialState

    return self
end

function ALEStateManager:load()
    self.super:load()

    self.current:load()
end

function ALEStateManager:draw()
    self.super:draw()

    self.current:draw()
end

function ALEStateManager:update(elapsed)
    self.super:update(elapsed)

    self.current:update(elapsed)
end

function ALEStateManager:switch(nextState)
    self.current = nextState

    self.current:load()
end

return ALEStateManager
