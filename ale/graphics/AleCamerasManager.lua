local Classic = require 'ale.std.Classic'
local AleArrayUtil = require 'ale.util.AleArrayUtil'

local AleCamerasManager = Classic:extend()

function AleCamerasManager:new()
    local ext = AleCamerasManager.super.new(self)

    ext.members = {}

    return ext
end

function AleCamerasManager:draw()
    AleArrayUtil.forEach(members, function(cam)
        cam:draw()
    end, true)
end

return AleCamerasManager
