local InitialState = require('states.TestState')

function love.load()
    ALE_G.init(InitialState)

    ALE_G.load()
end

function love.update(elapsed)
    ALE_G.update(elapsed)
end

function love.draw()
    ALE_G.draw()
end

function love.keypressed(key)
    ALE_G.justPressedKey(key)
end

function love.keyreleased(key)
    ALE_G.justReleasedKey(key)
end
