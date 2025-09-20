local ALEBasic = require('ale.ALEBasic')

local ALEGroup = ALEBasic:extend()

function ALEGroup:new()
    self.super:new()

    self.members = {}

    return self
end

function ALEGroup:load()
    self.super:load()

    for _, obj in ipairs(self.members) do
        obj:load()
    end
end

function ALEGroup:draw()
    self.super:draw()

    for _, obj in ipairs(self.members) do
        obj:draw()
    end
end

function ALEGroup:update(elapsed)
    self.super:update(elapsed)

    for _, obj in ipairs(self.members) do
        obj:update(elapsed)
    end
end

function ALEGroup:add(obj)
    table.insert(self.members, obj)
end

function ALEGroup:remove(obj)
    for index, object in ipairs(self.members) do
        if object == obj then
            table.remove(self.members, index)
        end
    end
end

return ALEGroup
