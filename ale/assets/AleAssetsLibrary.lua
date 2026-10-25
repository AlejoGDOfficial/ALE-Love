local Classic = require 'ale.std.Classic'

local AleAssetsLibrary = Classic:extend()

AleAssetsLibrary.__name = 'AleAssetsLibrary'

function AleAssetsLibrary:new(roots)
    local ext = AleAssetsLibrary.super.new(self)

    ext.roots = roots

    return ext
end

function AleAssetsLibrary:getPath(uPath)
    for _, root in ipairs(self.roots) do
        local path = root .. '/' .. uPath

        if love.filesystem.getInfo(path) then
            return path
        end
    end

    return nil
end

function AleAssetsLibrary:exists(uPath)
    return self:getPath(uPath) ~= nil
end

function AleAssetsLibrary:image(id)
    local path = self:getPath(id)

    return path and love.graphics.newImage(path) or nil
end

function AleAssetsLibrary:font(id, size)
    size = size or 16

    local path = self:getPath(id)

    return path and love.graphics.newFont(path, size) or nil
end

return AleAssetsLibrary
