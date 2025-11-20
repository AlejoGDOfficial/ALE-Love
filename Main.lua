local ALEGame = require('ale.ALEGame')

local TestState = require('states.TestState')

local game = ALEGame:new(TestState)

function love.load()
    game:load()
end

function love.update(elapsed)
    ALE_G.elapsed = elapsed

    game:update(elapsed)
end

function love.draw()
    game:draw()
end
