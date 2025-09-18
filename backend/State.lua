local State = {}

function State:new()
    local obj = {
        members = {}
    }

    self.__index = self

    return setmetatable(obj, self)
end

function State:add(obj)
    table.insert(self.members, obj)
end

function State:remove(obj)
    for i, v in ipairs(self.members) do
        if v == obj then
            table.remove(self.members, i)
        end
    end
end

function State:update(elapsed)
    for _, obj in ipairs(self.members) do
        if obj.update then
            obj:update(elapsed)
        end
    end
end

function State:draw()
    for _, obj in ipairs(self.members) do
        if obj.draw then
            obj:draw(elapsed)
        end
    end
end

return State
