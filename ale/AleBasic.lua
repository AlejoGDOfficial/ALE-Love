local Classic = require 'ale.std.Classic'
local AleArrayUtil = require 'ale.util.AleArrayUtil'

local AleBasic = Classic:extend()

AleBasic.__name = 'AleBasic'

function AleBasic:new()
    local ext = AleBasic.super.new(self)

    ext.active = true
    ext.alive = true
    ext.visible = true
    ext.exists = true

    ext.cameras = {}

    return ext
end

function AleBasic:update(elapsed) end

function AleBasic:draw()
    AleArrayUtil.forEach(self.cameras, function(cam)
        cam.queue(self)
    end, true)
end

function AleBasic:drawComplex() end

function AleBasic:destroy() end

return AleBasic
