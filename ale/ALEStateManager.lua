local ALEStateManager = {}

function ALEStateManager:new(initialState)
    local variables = {
        current = initialState
    }

    self.__index = self

    return setmetatable(variables, self)
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
