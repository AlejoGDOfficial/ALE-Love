local ALEGame = require('ale.ALEGame')

local TestState = require('states.TestState')

local game = ALEGame:new(TestState:new())

function love.load()
    game:load()
end

function love.update(elapsed)
    game:update(elapsed)
end

function love.draw()
    game:draw()
end
