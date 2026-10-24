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
    return love.graphics.newImage(self:getPath(id))
end

return AleAssetsLibrary
