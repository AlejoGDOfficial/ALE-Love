local ALEDrawable = require('ale.ALEDrawable')

local ALESprite = ALEClass.extend(ALEDrawable)

function ALESprite:new(x, y, graphic)
    local this = ALEDrawable.new(self, x, y)

    if graphic then
        this:loadGraphic(graphic)
    else
        this:makeGraphic(100, 100, { r = 255, g = 0, b = 255 })
    end

    return this
end

function ALESprite:makeGraphic(width, height, color)
    color = color or { r = 255, g = 255, b = 255 }

    local imgData = love.image.newImageData(width, height)

    imgData:mapPixel(
        function(x, y, r, g, b, a)
            return color.r / 255, color.g / 255, color.b / 255, 1
        end
    )

    self.graphic = love.graphics.newImage(imgData)

    self:updateHitbox()
end

function ALESprite:loadGraphic(target)
    self.graphic = ALEPaths.image(target)

    self:updateHitbox()
end

return ALESprite
