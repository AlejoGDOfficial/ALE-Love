local StateManager = {}

function StateManager:new()
    local obj = {
        current = nil
    }

    self.__index = self

    return setmetatable(obj, self)
end

function StateManager:switch(newState)
    self.current = newState:new()

    if self.current.load then
        self.current:load()
    end
end

function StateManager:update(elapsed)
    if self.current then
        self.current:update(elapsed)
    end
end

function StateManager:draw()
    if self.current then
        self.current:draw()
    end
end

return StateManager
