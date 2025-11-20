local ALEGame = require('ale.ALEGame')

local game = ALEGame:new()

function love.load()
    game:load()
end

function love.update(elapsed)
    game:update(elapsed)
end

function love.draw()
    game:draw()
end
