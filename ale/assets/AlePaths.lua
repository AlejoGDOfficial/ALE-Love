local AleG = require 'ale.AleG'

local AlePaths = {}

function AlePaths.image(file, persists, missingPrint)
    return AleG.assets:get('image', file, persists, missingPrint)
end

return AlePaths
