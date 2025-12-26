local ALEMath = {}

function ALEMath.fpsLerp(v1, v2, ratio)
    return v1 + (v2 - v1) * ALEMath.fpsRatio(ratio)
end

function ALEMath.fpsRatio(ratio)
    return ALEMath.bound(ratio * ALE_G.elapsed * 60, 0, 1)
end

function ALEMath.bound(val, min, max)
    return val < min and min or val > max and max or val
end

return ALEMath
