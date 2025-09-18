local Player = {}

function Player:new(x, y, size)
    local obj = {
        x = x,
        y = y,
        size = size or 50
    }

    self.__index = self

    return setmetatable(obj, self)
end

function Player:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', self.x, self.y, self.size, self.size)
end

function Player:update(elapsed)
    if love.keyboard.isDown('right') then
        player.x = player.x + 100 * elapsed
    end
end

return Player
