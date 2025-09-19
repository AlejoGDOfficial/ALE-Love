local ALEMath = {}

function ALEMath:new()
    local variables = {}

    self.__index = self

    return setmetatable(variables, self)
end

function ALEMath.fpsLerp(v1, v2, ratio, elapsed)
    return v1 + (v2 - v1) * ALEMath.fpsRatio(ratio, elapsed)
end

function ALEMath.fpsRatio(ratio, elapsed)
    local value = ratio * elapsed * 60

    return value < 0 and 0 or value > 1 and 1 or value
end

return ALEMath
