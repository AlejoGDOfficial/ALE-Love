local TestState = ALEClass.extend(ALEState)

local curTime = 0

function TestState:update(elapsed)
    ALEState.update(self, elapsed)

    if ALE_G.keys.justPressed['up'] then
        print('oso')
    end

    if ALE_G.keys.pressed['up'] then
        print('osoooo')
    end

    if ALE_G.keys.justReleased['up'] then
        print('no mas oso')
    end
end

return TestState
