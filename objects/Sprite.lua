local ALEBasic = require('ale.ALEBasic')

local Sprite = ALEBasic:extend()

function Sprite:new(x, y, graphic)
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

    return self
end

function Sprite:makeGraphic(width, height, color)
    color = color or {
        r = 255,
        g = 255,
        b = 255
    }

    self.graphic = love.graphics.newCanvas(width, height)
    love.graphics.setCanvas(self.graphic)
    love.graphics.clear(0, 0, 0, 0)
    love.graphics.setColor(color.r / 255, color.g / 255, color.b / 255, 1)
    love.graphics.rectangle('fill', 0, 0, width, height)
    love.graphics.setCanvas()

    self:updateHitbox()
end

function Sprite:loadGraphic(objective)
    self.graphic = love.graphics.newImage('assets/images/' .. objective .. '.png')

    self:updateHitbox()
end

function Sprite:updateHitbox()
    self.origin:set(self.graphic:getWidth() * self.scale.x / 2, self.graphic:getHeight() * self.scale.y / 2)
end

function Sprite:draw()
    self.super:draw()

    love.graphics.draw(self.graphic, self.x + self.origin.x, self.y + self.origin.y, self.angle * math.pi / 180,
        self.scale.x,
        self.scale.y, self.origin.x / self.scale.y, self.origin.y / self.scale.y)
end

function Sprite:update(elapsed)
    self.super:update(elapsed)

    self.velocity.y = self.velocity.y + self.acceleration.y

    self.y = self.y + self.velocity.y * elapsed
end

function Sprite:screenCenter()
    local sw, sh = love.graphics.getDimensions()

    self.x = sw / 2 - self:getWidth() / 2
    self.y = sh / 2 - self:getHeight() / 2
end

function Sprite:getWidth()
    return self.graphic:getWidth() * self.scale.x
end

function Sprite:getHeight()
    return self.graphic:getHeight() * self.scale.y
end

return Sprite
