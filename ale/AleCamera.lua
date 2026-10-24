local AleBasic = require 'ale.AleBasic'
local AleArrayUtil = require 'ale.util.AleArrayUtil'

local AleCamera = AleBasic:extend()

AleCamera.__name = 'AleCamera'

function AleCamera:new()
    local ext = AleCamera.super.new(self)

    ext.members = {}

    return ext
end

function AleCamera:queue(obj)
    table.insert(self.members, obj)
end

function AleCamera:draw()
    AleArrayUtil.forEach(self.members, function(obj)
        obj:drawComplex()
    end, true)
end

return AleCamera
