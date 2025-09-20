local ALEBasic = require('ale.ALEBasic')

local Player = ALEBasic:extend()

function Player:new(x, y, size)
    self.super:new()

    self.x = x or 0
    self.y = y or 0
    self.size = size or 0
    self.color = {
        red = 255,
        green = 255,
        blue = 255
    }

    return self
end

function Player:draw()
    self.super:draw()

    love.graphics.setColor(self.color.red / 255, self.color.green / 255, self.color.blue / 255)

    love.graphics.rectangle('fill', self.x, self.y, self.size, self.size)
end

function Player:screenCenter()
    local sw, sh = love.graphics.getDimensions()

    self.x = sw / 2 - self.size / 2
    self.y = sh / 2 - self.size / 2
end

return Player
