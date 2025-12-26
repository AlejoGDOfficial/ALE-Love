local ALEPaths = {}

function ALEPaths.init()
    ALEPaths.config = {
        image = {
            path = 'images/',
            extension = '.png',
            method = love.graphics.newImage,
            cache = {}
        },
        video = {
            path = 'videos/',
            extension = '.ogv',
            method = love.graphics.newVideo,
            cache = {}
        },
        sound = {
            path = 'sounds/',
            extension = '.ogg',
            method = function(file)
                return love.sound.newDecoder(file)
            end,
            cache = {}
        },
        music = {
            path = 'music/',
            extension = '.ogg',
            method = function(file)
                return love.sound.newDecoder(file)
            end,
            cache = {}
        },
        font = {
            path = 'fonts/',
            extension = '',
            method = love.graphics.newFont,
            cache = {}
        }
    }
end

local function cachePath(file, id, addArgs)
    local data = ALEPaths.config[id]

    local path = ALEPaths.getPath(data.path .. file .. data.extension)

    local args = { path }

    if addArgs then
        for _, arg in ipairs(addArgs) do
            table.insert(args, arg)
        end
    end

    if not data.cache[file] then
        data.cache[file] = data.method(unpack(args))
    end

    return data.cache[file]
end

function ALEPaths.getPath(file)
    return 'assets/' .. file
end

function ALEPaths.image(file)
    return cachePath(file, 'image')
end

function ALEPaths.video(file)
    return cachePath(file, 'video')
end

function ALEPaths.sound(file)
    return cachePath(file, 'sound')
end

function ALEPaths.music(file)
    return cachePath(file, 'music')
end

function ALEPaths.font(file, size)
    return cachePath(file, 'font', { size })
end

return ALEPaths
