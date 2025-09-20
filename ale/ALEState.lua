local ALEBasic = require('ale.ALEBasic')

local ALEState = ALEBasic:extend()

function ALEState:new()
    self.super:new()

    self.members = {}

    return self
end

function ALEState:load()
    self.super:load()

    for _, obj in ipairs(self.members) do
        obj:load()
    end
end

function ALEState:draw()
    self.super:draw()

    for _, obj in ipairs(self.members) do
        obj:draw()
    end
end

function ALEState:update(elapsed)
    self.super:update(elapsed)

    for _, obj in ipairs(self.members) do
        obj:update(elapsed)
    end
end

function ALEState:add(obj)
    table.insert(self.members, obj)
end

function ALEState:remove(obj)
    for index, object in ipairs(self.members) do
        if object == obj then
            table.remove(self.members, index)
        end
    end
end

return ALEState
