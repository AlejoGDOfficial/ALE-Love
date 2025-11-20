local TestState = ALEClass.extend(ALEState)

local Ch3erea = ALEClass.extend(ALESprite)

function Ch3erea:new()
    local obj = ALESprite.new(self, 200, 200, 'dni')

    obj.scale.x = 0.25
    obj.scale.y = 0.25
    obj:updateHitbox()

    return obj
end

local ch3erea0 = Ch3erea:new()

function TestState:load()
    self:add(ch3erea0)
end

return TestState
