local AleGroup = require 'ale.groups.AleGroup'
local AleArrayUtil = require 'ale.util.AleArrayUtil'

local AleCamerasManager = AleGroup:extend()

AleCamerasManager.__name = 'AleCamerasManager'

function AleCamerasManager:new()
    local ext = AleCamerasManager.super.new(self)

    ext.members = {}

    return ext
end

function AleCamerasManager:clear()
    AleArrayUtil.forEach(self.members, function(cam)
        cam:destroy()
    end, true)

    self.members = {}
end

return AleCamerasManager
