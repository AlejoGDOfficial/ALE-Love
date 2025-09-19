local ALEState = {}

function ALEState:new()
    local variables = {
        members = {}
    }

    self.__index = self

    return setmetatable(variables, self)
end

function ALEState:load()
    for index, object in ipairs(self.members) do
        if object.load then
            object:load()
        end
    end
end

function ALEState:draw()
    for index, object in ipairs(self.members) do
        if object.draw then
            object:draw()
        end
    end
end

function ALEState:update(elapsed)
    for index, object in ipairs(self.members) do
        if object.update then
            object:update(elapsed)
        end
    end
end

function ALEState:add(object)
    table.insert(self.members, object)
end

return ALEState
