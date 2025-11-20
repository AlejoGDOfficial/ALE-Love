local ALEGame = require('ale.ALEGame')

local ALE_G = {}

ALE_G.elapsed = 0

setmetatable(ALE_G, {
    __index = function(_, key)
        if key == 'camera' then
            return ALEGame.instance and ALEGame.instance.cameras.members[1] or nil
        end

        if key == 'cameras' then
            return ALEGame.instance and ALEGame.instance.cameras or nil
        end

        if key == 'game' then
            return ALEGame.instance
        end

        return rawget(ALE_G, key)
    end
})

return ALE_G
