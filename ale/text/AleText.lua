local AleSprite = require 'ale.AleSprite'
local AlePaths = require 'ale.assets.AlePaths'

local AleText = AleSprite:extend()

AleText.__name = 'AleText'

function AleText:new(x, y, text, size, font)
    local ext = AleText.super.new(self, x, y)

    ext:setFont(font, size)
    ext:setText(text)

    return ext
end

function AleText:setFont(font, size)
    local f = type(font) == 'string' and AlePaths.font(font, size) or font == nil and love.graphics.newFont(size) or font

    if self.graphic == nil then
        self:loadGraphic(love.graphics.newText(f, ''))
    else
        self.graphic:setFont(f)
    end

    return f
end

function AleText:setText(text)
    self.graphic:set(text)

    self:updateSize()
    self:updateHitbox()
end

return AleText
