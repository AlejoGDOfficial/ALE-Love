local Player = {}

function Player:new(x, y, size)
    local obj = {
        x = x,
        y = y,
        size = size or 100,
        speed = 500,
        color = {
            red = 255,
            green = 255,
            blue = 255
        }
    }

    self.__index = self

    return setmetatable(obj, self)
end

function Player:draw()
    love.graphics.setColor(self.color.red / 255, self.color.green / 255, self.color.blue / 255)

    love.graphics.rectangle('fill', self.x, self.y, self.size, self.size)
end

local curTime = 0

function Player:update(elapsed)
    curTime = curTime + elapsed

    if true then
        return
    end

    local factor = self.speed * elapsed

    if love.keyboard.isDown('right') then
        self.x = self.x + factor
    end

    if love.keyboard.isDown('left') then
        self.x = self.x - factor
    end

    if love.keyboard.isDown('up') then
        self.y = self.y - factor
    end

    if love.keyboard.isDown('down') then
        self.y = self.y + factor
    end
end

function Player:screenCenter()
    local sw, sh = love.graphics.getDimensions()

    self.x = sw / 2 - self.size / 2
    self.y = sh / 2 - self.size / 2
end

return Player
