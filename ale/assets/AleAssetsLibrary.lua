local Classic = require 'ale.std.Classic'

local AleAssetsLibrary = Classic:extend()

function AleAssetsLibrary:new(roots)
    local ext = AleAssetsLibrary.super.new(self)

    ext.roots = roots

    return ext
end

return AleAssetsLibrary
