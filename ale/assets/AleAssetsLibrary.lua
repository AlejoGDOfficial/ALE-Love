local Classic = require 'ale.std.Classic'

local AleAssetsLibrary = Classic:extend()

AleAssetsLibrary.__name = 'AleAssetsLibrary'

function AleAssetsLibrary:new(roots)
    local ext = AleAssetsLibrary.super.new(self)

    ext.roots = roots

    return ext
end

return AleAssetsLibrary
