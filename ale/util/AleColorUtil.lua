local bit = require("bit")

local AleColorUtil = {
    transparent = 0x00000000,
    white = 0xFFFFFFFF,
    gray = 0xFF808080,
    black = 0xFF000000,
    green = 0xFF008000,
    lime = 0xFF00FF00,
    yellow = 0xFFFFFF00,
    orange = 0xFFFFA500,
    red = 0xFFFF0000,
    purple = 0xFF800080,
    blue = 0xFF0000FF,
    brown = 0xFF8B4513,
    pink = 0xFFFFC0CB,
    magenta = 0xFFFF00FF,
    cyan = 0xFF00FFFF
}

function AleColorUtil.fromRGB(r, g, b, a)
    r = r or 0
    g = g or 0
    b = b or 0
    a = a or 255

    return bit.bor(bit.lshift(a, 24), bit.lshift(r, 16), bit.lshift(g, 8), b)
end

function AleColorUtil.getRed(color)
    return bit.band(bit.rshift(color, 16), 0xFF)
end

function AleColorUtil.getGreen(color)
    return bit.band(bit.rshift(color, 8), 0xFF)
end

function AleColorUtil.getBlue(color)
    return bit.band(color, 0xFF)
end

function AleColorUtil.getAlpha(color)
    return bit.band(bit.rshift(color, 24), 0xFF)
end

function AleColorUtil.getRGB(color)
    return AleColorUtil.getRed(color), AleColorUtil.getGreen(color), AleColorUtil.getBlue(color),
        AleColorUtil.getAlpha(color)
end

function AleColorUtil.getNormalizedRGB(color)
    local r, g, b, a = AleColorUtil.getRGB(color)

    return r / 255, g / 255, b / 255, a / 255
end

function AleColorUtil.toAnsi(text, color)
    return AleColorUtil.rgbToAnsi(text, AleColorUtil.getRGB(color))
end

function AleColorUtil.rgbToAnsi(text, r, g, b)
    return '\x1b[38;2;' .. r .. ';' .. g .. ';' .. b .. 'm' .. text .. '\x1b[0m'
end

return AleColorUtil
