local AleG = require 'ale.AleG'

local AleMath = {}

function AleMath.roundDecimal(val, precision)
    local mult = 10 ^ precision

    local scaled = val * mult

    local rounded = scaled >= 0 and math.floor(scaled + 0.5) or math.ceil(scaled - 0.5)

    return rounded / mult
end

function AleMath.bound(value, min, max)
    return math.max(min, math.min(value, max))
end

function AleMath.lerp(a, b, ratio)
    return a + ratio * (b - a)
end

function AleMath.elapsedLerp(a, b, ratio, elapsed)
    return AleMath.lerp(a, b, AleMath.elapsedRatio(ratio, elapsed))
end

function AleMath.elapsedRatio(ratio, elapsed)
    return AleMath.bound(ratio * (elapsed or (AleG.elapsed * 60)), 0, 1)
end

function AleMath.quantize(val, snap)
    return AleMath.fround(val * snap) / snap
end

return AleMath
