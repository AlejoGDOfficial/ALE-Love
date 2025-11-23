local TestState = require('states.TestState')

function love.load()
    ALE_G.init(TestState)

    ALE_G.load()
end

function love.update(elapsed)
    ALE_G.update()
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
