local ALEPaths = {
    assets   = 'assets',
    images   = 'images',
    sounds   = 'sounds',
    music    = 'music',

    imageExt = '.png',
    audioExt = '.ogg',

    cachedImages = {}
}

function ALEPaths.getPath(file)
    return ALEPaths.assets .. '/' .. file
end

function ALEPaths.image(file)
    local path =  ALEPaths.getPath(ALEPaths.images .. '/' .. file .. ALEPaths.imageExt)

    if not ALEPaths.cachedImages[file] then
        ALEPaths.cachedImages[file] = love.graphics.newImage(path)
    end

    return ALEPaths.cachedImages[file]
end

return ALEPaths
