local ALEGame = require('ale.ALEGame')

local MainState = require('states.MainState')

local game = ALEGame:new(MainState:new())

function love.load()
    game:load()
end

function love.update(elapsed)
    game:update(elapsed)
end

function love.draw()
    game:draw(elapsed)
end
