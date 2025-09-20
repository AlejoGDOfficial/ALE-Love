local ALEBasic = require('ale.ALEBasic')

local ALESprite = ALEBasic:extend()

function ALESprite:new(x, y, graphic)
    self.super:new()

    self.x = x or 0

    self.y = y or 0

    self.velocity = {
        x = 0,
        y = 0
    }
    self.acceleration = {
        x = 0,
        y = 0
    }

    self.angle = 0

    self.color = {
        r = 255,
        g = 255,
        b = 255
    }

    self.scale = {
        x = 1,
        y = 1,
        set = function(s, sX, sY)
            s.x = sX or s.x
            s.y = sY or s.y
        end
    }

    self.origin = {
        x = 0,
        y = 0,
        set = function(s, sX, sY)
            s.x = sX or s.x
            s.y = sY or s.y
        end
    }

    self.graphic = nil

    if graphic then
        self:loadGraphic(graphic)
    else
        self:makeGraphic(100, 100, { r = 255, g = 0, b = 255 })
    end

    self.visible = true

    return self
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

function ALESprite:loadGraphic(objective)
    self.graphic = love.graphics.newImage('assets/images/' .. objective .. '.png')

    self:updateHitbox()
end

function ALESprite:updateHitbox()
    self.origin:set(self.graphic:getWidth() * self.scale.x / 2, self.graphic:getHeight() * self.scale.y / 2)
end

function ALESprite:draw()
    self.super:draw()

    if self.visible == false then
        return
    end

    love.graphics.setColor(self.color.r / 255, self.color.g / 255, self.color.b / 255, self.alpha)

    love.graphics.draw(self.graphic, self.x + self.origin.x, self.y + self.origin.y, self.angle * math.pi / 180,
        self.scale.x, self.scale.y, self.origin.x / self.scale.x, self.origin.y / self.scale.y)
end

function ALESprite:update(elapsed)
    self.super:update(elapsed)

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
