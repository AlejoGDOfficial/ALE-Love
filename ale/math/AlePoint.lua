local Classic = require 'ale.std.Classic'

local AlePoint = Classic:extend()

AlePoint.__name = 'AlePoint'

function AlePoint:new(x, y)
    local ext = AlePoint.super.new(self)

    ext.x = x or 0
    ext.y = y or 0

    return ext
end

return AlePoint
