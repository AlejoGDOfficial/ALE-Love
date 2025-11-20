local Paths = {
    assets   = 'assets',
    images   = 'images',
    sounds   = 'sounds',
    music    = 'music',

    imageExt = '.png',
    audioExt = '.ogg'
}

function Paths.getPath(file)
    return Paths.assets .. '/' .. file
end

function Paths.image(file)
    return Paths.getPath(Paths.images .. '/' .. file .. Paths.imageExt)
end

return Paths
