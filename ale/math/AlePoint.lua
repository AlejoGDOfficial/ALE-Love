local Classic = require 'ale.std.Classic'

local AlePoint = Classic:extend()

AlePoint.__name = 'AlePoint'

function AlePoint:new(x, y)
    local ext = AlePoint.super.new(self)

    ext:set(x, y)

    return ext
end

function AlePoint:set(x, y)
    self.x = x or 0
    self.y = y or 0
end

return AlePoint
