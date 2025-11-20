local ALEPaths = {
    assets   = 'assets',
    images   = 'images',
    sounds   = 'sounds',
    music    = 'music',

    imageExt = '.png',
    audioExt = '.ogg'
}

function ALEPaths.getPath(file)
    return love.graphics.newImage(ALEPaths.assets .. '/' .. file)
end

function ALEPaths.image(file)
    return ALEPaths.getPath(ALEPaths.images .. '/' .. file .. ALEPaths.imageExt)
end

return ALEPaths
