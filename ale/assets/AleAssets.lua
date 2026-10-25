local Classic = require 'ale.std.Classic'
local AleAssetsLibrary = require 'ale.assets.AleAssetsLibrary'
local AleG = require 'ale.AleG'

local AleAssets = Classic:extend()

AleAssets.__name = 'AleAssets'

function AleAssets:new()
    local ext = AleAssets.super.new(self)

    ext.config = {}

    ext:init()

    return ext
end

function AleAssets:init()
    self.library = AleAssetsLibrary:new({ 'assets' })

    self:addType('image', {
        prefix = 'images/',
        suffix = '.png',
        get = function(id)
            return self.library:image(id)
        end
    })

    self:addType('font', {
        prefix = 'fonts/',
        get = function(id, size)
            return self.library:font(id, size)
        end
    })

    self:addType('audio', {
        suffix = '.ogg',
        get = function(id)
            return self.library:sound(id)
        end
    })
end

function AleAssets:addType(id, data)
    data.prefix = data.prefix or ''
    data.suffix = data.suffix or ''
    data.check = data.check or true
    data.cache = data.cache or {}

    self.config[id] = data

    return data
end

function AleAssets:get(type, file, persists, missingPrint, cache, ...)
    missingPrint = missingPrint or true
    cache = cache or true

    local data = self.config[type]

    if not data then
        return nil
    end

    local path = data.prefix .. file .. data.suffix

    if data.cache[path] then
        return data.cache[path].content
    end

    if data.cache and not self.library:exists(path) then
        if missingPrint then
            AleG.logs:print(path, 'missing_file')
        end

        return nil
    end

    local res = data.get(path, ...)

    if cache and res then
        data.cache[path] = {
            content = res,
            persists = persists
        }
    end

    return res
end

return AleAssets
