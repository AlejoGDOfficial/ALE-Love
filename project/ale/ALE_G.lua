local ALEGame = require('ale.ALEGame')

local ALE_G = {
    elapsed = 0,
    keys = nil,
    game = nil,
    sound = nil
}

function ALE_G.init(initialState)
    ALEPaths.init()

    ALE_G.keys = ALEKeyManager:new()

    ALE_G.game = ALEGame:new(initialState:new())
end

function ALE_G.load()
    ALE_G.game:load()
end

function ALE_G.update(elapsed)
    ALE_G.elapsed = elapsed

    ALE_G.game:update(elapsed)

    ALE_G.keys:update()
end

function ALE_G.draw()
    ALE_G.game:draw()
end

function ALE_G.justPressedKey(key)
    ALE_G.keys:justPressedKey(key)
end

function ALE_G.justReleasedKey(key)
    ALE_G.keys:justReleasedKey(key)
end

setmetatable(ALE_G, {
    __index = function(_, key)
        return rawget(ALE_G, key) or ALE_G.game[key]
    end
})

return ALE_G
