local AleBasic = require 'ale.AleBasic'
local AlePoint = require 'ale.math.AlePoint'

local AleObject = AleBasic:extend()

AleObject.__name = 'AleObject'

function AleObject:new(x, y, width, height)
    local ext = AleObject.super.new(self)

    ext.x = x or 0
    ext.y = y or 0
    ext.width = width or 0
    ext.height = height or 0
    ext.angle = 0
    ext.scrollFactor = AlePoint:new(1, 1)

    return ext
end

return AleObject
