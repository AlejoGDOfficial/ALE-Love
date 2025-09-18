local StateManager = require('backend.StateManager')

local MainState = require('MainState')

function love.load()
    stateManager = StateManager:new()

    stateManager:switch(MainState)
end

function love.update(elapsed)
    stateManager:update(elapsed)
end

function love.draw()
    stateManager:draw(elapsed)
end
