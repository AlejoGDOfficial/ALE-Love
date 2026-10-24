local AleState = require 'ale.AleState'
local AleAssets = require 'ale.assets.AleAssets'

local AleMeta = {
    title = 'ALE Love',

    width = 1280,
    height = 720,

    console = true,

    state = AleState,
    assets = AleAssets
}

return AleMeta
