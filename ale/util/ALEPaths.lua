local ALEPaths = {}

function ALEPaths.init()
    ALEPaths.config = {
        image = {
            path = 'images/',
            extension = '.png',
            method = love.graphics.newImage,
            cache = {}
        },
        sound = {
            path = 'sounds/',
            extension = '.ogg',
            method = love.audio.newSource,
            cache = {}
        },
        music = {
            path = 'music/',
            extension = '.ogg',
            method = love.audio.newSource,
            cache = {}
        }
    }
end

local function cachePath(file, id)
    local data = ALEPaths.config[id]

    local path = ALEPaths.getPath(data.path .. file .. data.extension)

    if not data.cache[file] then
        data.cache[file] = data.method(path)
    end

    return data.cache[file]
end

function ALEPaths.getPath(file)
    return 'assets/' .. file
end

function ALEPaths.image(file)
    return cachePath(file, 'image')
end

function ALEPaths.sound(file)
    return cachePath(file, 'sound')
end

function ALEPaths.music(file)
    return cachePath(file, 'music')
end

return ALEPaths
