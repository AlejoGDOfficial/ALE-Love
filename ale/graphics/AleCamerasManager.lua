local Classic = require 'ale.std.Classic'
local AleArrayUtil = require 'ale.util.AleArrayUtil'

local AleCamerasManager = Classic:extend()

AleCamerasManager.__name = 'AleCamerasManager'

function AleCamerasManager:new()
    local ext = AleCamerasManager.super.new(self)

    ext.members = {}

    return ext
end

function AleCamerasManager:draw()
    AleArrayUtil.forEach(self.members, function(cam)
        cam:draw()
    end, true)
end

function AleCamerasManager:add(obj)
    table.insert(self.members, obj)

    return obj
end

function AleCamerasManager:insert(index, obj)
    table.insert(self.members, index, obj)

    return obj
end

function AleCamerasManager:remove(obj, splice)
    return AleArrayUtil.remove(self.members, obj, splice)
end

function AleCamerasManager:clear()
    AleArrayUtil.forEach(self.members, function(cam)
        cam:destroy()
    end, true)

    self.members = {}
end

return AleCamerasManager
