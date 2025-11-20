local ALEBasic = require('ale.ALEBasic')

local ALESprite = ALEClass.extend(ALEBasic)

function ALESprite:new(x, y, graphic)
    local obj = ALEBasic.new(self)

    obj.x = x or 0

    obj.y = y or 0

    obj.velocity = {
        x = 0,
        y = 0
    }
    obj.acceleration = {
        x = 0,
        y = 0
    }

    obj.alpha = 1

    obj.angle = 0

    obj.color = {
        r = 255,
        g = 255,
        b = 255
    }

    obj.scale = {
        x = 1,
        y = 1,
        set = function(s, sX, sY)
            s.x = sX or s.x
            s.y = sY or s.y
        end
    }

    obj.origin = {
        x = 0,
        y = 0,
        set = function(s, sX, sY)
            s.x = sX or s.x
            s.y = sY or s.y
        end
    }

    obj.graphic = nil

    if graphic then
        obj:loadGraphic(graphic)
    else
        obj:makeGraphic(100, 100, { r = 255, g = 0, b = 255 })
    end

    obj.visible = true

    return obj
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

function ALESprite:updateHitbox()
    self.origin:set(self.graphic:getWidth() * self.scale.x / 2, self.graphic:getHeight() * self.scale.y / 2)
end

function ALESprite:draw()
    if self.visible == false then
        return
    end

    love.graphics.setColor(self.color.r / 255, self.color.g / 255, self.color.b / 255, self.alpha)

    love.graphics.draw(self.graphic, self.x + self.origin.x, self.y + self.origin.y, self.angle * math.pi / 180,
        self.scale.x, self.scale.y, self.origin.x / self.scale.x, self.origin.y / self.scale.y)
end

function ALESprite:update(elapsed)
    self.velocity.y = self.velocity.y + self.acceleration.y

    self.y = self.y + self.velocity.y * elapsed
end

function ALESprite:screenCenter()
    local sw, sh = love.graphics.getDimensions()

    self.x = sw / 2 - self:getWidth() / 2
    self.y = sh / 2 - self:getHeight() / 2
end

function ALESprite:getWidth()
    return self.graphic:getWidth() * self.scale.x
end

function ALESprite:getHeight()
    return self.graphic:getHeight() * self.scale.y
end

return ALESprite
