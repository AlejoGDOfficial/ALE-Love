local AleObject = require 'ale.AleObject'
local AlePaths = require 'ale.assets.AlePaths'

local AleSprite = AleObject:extend()

function AleSprite:new(x, y, img)
    local ext = AleSprite.super.new(self, x, y)

    ext.graphic = nil

    if img then
        ext:loadGraphic(img)
    end

    return ext
end

function AleSprite:loadGraphic(img)
    self.graphic = type(img) == 'string' and AlePaths.image(img) or img
end

function AleSprite:drawComplex()
    print('oso')
end

return AleSprite
