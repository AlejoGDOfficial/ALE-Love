local Player = require("Player")

local debugText = 'Test'

function love.load()
    player = Player:new(100, 100, 100)
end

function love.update(elapsed)
    debugText = elapsed

    player:update(elapsed)
end

function love.draw()
    player:draw()
    
    love.graphics.print(debugText, 10, 10)
end
