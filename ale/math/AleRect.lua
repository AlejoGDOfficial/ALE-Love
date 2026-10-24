local Classic = require 'ale.std.Classic'

local AleRect = Classic:extend()

AleRect.__name = 'AleRect'

function AleRect:new(x, y, w, h)
    local ext = AleRect.super.new(self)

    ext:set(x, y, w, h)

    return ext
end

function AleRect:set(x, y, w, h)
    self.x = x or 0
    self.y = y or 0
    self.width = w or 0
    self.height = h or 0
end

return AleRect
