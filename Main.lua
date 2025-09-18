local Player = require("Player")

function love.load()
    player = Player:new(100, 100, 100)
end

function love.draw()
    print('oso')
end

function love.draw()
    player:draw()
end
