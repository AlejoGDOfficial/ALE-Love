local ALEBasic = require('ale.ALEBasic')

local ALEStateManager = ALEBasic:extend()

function ALEStateManager:new(initialState)
    self.super:new()

    self.current = initialState

    return self
end

function ALEStateManager:load()
    self.current:load()
end

function ALEStateManager:draw()
    if self.current.draw then
        self.current:draw()
    end
end

function ALEStateManager:update(elapsed)
    if self.current.update then
        self.current:update(elapsed)
    end
end

function ALEStateManager:switch(nextState)
    self.current = nextState

    if self.current.load then
        self.current:load()
    end
end

return ALEStateManager
