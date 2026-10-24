local AleBasic = require 'ale.AleBasic'
local AleArrayUtil = require 'ale.util.AleArrayUtil'

local AleGroup = AleBasic:extend()

AleGroup.__name = 'AleGroup'

function AleGroup:new()
    local ext = AleGroup.super.new(self)

    ext.members = {}

    return ext
end

function AleGroup:add(obj)
    table.insert(self.members, obj)

    return obj
end

function AleGroup:insert(index, obj)
    table.insert(self.members, index, obj)

    return obj
end

function AleGroup:remove(obj, splice)
    return AleArrayUtil.remove(self.members, obj, splice)
end

function AleGroup:clear()
    self.members = {}
end

function AleGroup:update(elapsed)
    AleGroup.super.update(self, elapsed)

    AleArrayUtil.forEach(self.members, function(obj)
        obj:update(elapsed)
    end, true)
end

function AleGroup:draw()
    AleGroup.super.draw(self)

    AleArrayUtil.forEach(self.members, function(obj)
        obj:draw()
    end, true)
end

function AleGroup:destroy()
    AleGroup.super.destroy(self)

    AleArrayUtil.forEach(self.members, function(obj)
        obj:destroy()
    end, true)
end

return AleGroup
