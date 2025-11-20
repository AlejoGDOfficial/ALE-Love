local ALEGroup = ALEClass.extend(ALEBasic)

function ALEGroup:new()
    local obj = ALEBasic.new(self)

    obj.members = {}

    return obj
end

function ALEGroup:load()
    for i, obj in ipairs(self.members) do
        obj:load()
    end
end

function ALEGroup:update(elapsed)
    for i, obj in ipairs(self.members) do
        obj:update(elapsed)
    end
end

function ALEGroup:draw()
    for i, obj in ipairs(self.members) do
        obj:draw()
    end
end

function ALEGroup:add(obj)
    table.insert(self.members, obj)
end

function ALEGroup:insert(index, obj)
    table.insert(self.members, index, obj)
end

function ALEGroup:remove(newObj)
    for i, obj in ipairs(self.members) do
        if obj == newObj then
            table.remove(self.members, i)
        end
    end
end

return ALEGroup
