local AleG = require 'ale.AleG'

local AlePaths = {}

function AlePaths.image(file, persists, missingPrint)
    return AleG.assets:get('image', file, persists, missingPrint)
end

function AlePaths.font(file, size, persists, missingPrint)
    return AleG.assets:get('font', file, persists, missingPrint, nil, size)
end

function AlePaths.sound(file, persists, missingPrint)
    return AleG.assets:get('audio', 'sounds/' .. file, persists, missingPrint)
end

function AlePaths.music(file, persists, missingPrint)
    return AleG.assets:get('audio', 'music/' .. file, persists, missingPrint)
end

return AlePaths
