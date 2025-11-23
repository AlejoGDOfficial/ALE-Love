local ALEGame = require('ale.ALEGame')

local ALEKeyManager = require('ale.input.ALEKeyManager')

local ALE_G = {
    elapsed = 0,
    keys = nil,
    game = nil
}

function ALE_G.init(initialState)
    ALE_G.keys = ALEKeyManager:new()

    ALE_G.game = ALEGame:new(initialState)
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
        if key == 'camera' then
            return ALEGame.instance and ALEGame.instance.cameras.members[1] or nil
        end

        if key == 'cameras' then
            return ALEGame.instance and ALEGame.instance.cameras or nil
        end

        return rawget(ALE_G, key)
    end
})

return ALE_G
